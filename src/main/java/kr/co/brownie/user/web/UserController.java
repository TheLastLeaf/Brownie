package kr.co.brownie.user.web;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.co.brownie.report.service.ReportService;
import kr.co.brownie.review.service.ReviewService;
import kr.co.brownie.review.service.ReviewVO;
import kr.co.brownie.review.service.impl.ReviewPagingVO;
import kr.co.brownie.user.service.UserService;
import kr.co.brownie.user.service.UserVO;
import kr.co.brownie.userSearch.Service.LeagueEntryVO;
import kr.co.brownie.userSearch.Service.SummonerVO;
import kr.co.brownie.userSearch.config.VersionCheck;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource(name = "userService")
	UserService userService;

	@Resource(name = "reviewService")
	ReviewService reviewService;

	@Resource(name = "reportService")
	ReportService reportService;

	final static String API_KEY = "RGAPI-fd870f92-a75f-4d43-88b9-94a6457fe185";

	/**
	 * @param user_id: String
	 * @param model:   Model
	 * @param page:    ReviewPagingVO
	 * @return String
	 * @author ?????????
	 */
	@GetMapping("/info/{user_id}")
	public String userInfo(@PathVariable String user_id, Model model, ReviewPagingVO page, HttpSession httpsession) {
		Map<String, Object> map = new HashMap<>();
		map.put("userId", user_id);
		UserVO userOneSelect = userService.userOneSelect(user_id);
		// ????????????
		int permitLevel = userService.selectPermitLevel(user_id);
		if (userOneSelect == null) {
			model.addAttribute("message", "alert(\"???????????? ?????? ???????????????.\");history.go(-1);");
			return "common/message";
		}

		// ????????????
		float starCnt = userService.starCntSelect(user_id);
		int fullStar = (int) starCnt;
		float halfStar = starCnt - fullStar;
		if (halfStar >= 0.5) {
			halfStar = 1;
		}

		// ????????? ??????, ?????? ??????, ?????????, ????????? ????????? ??????
		int boardTotalCnt = userService.boardTotalCnt(user_id);
		int replyTotalCnt = userService.replyTotalCnt(user_id);
		int likeReplyCnt = userService.likeReplyCnt(user_id);
		int hateReplyCnt = userService.hateReplyCnt(user_id);

		// ???????????? ???????????? ????????????
		// ???????????? ????????? ?????? ????????? 3???????????????
		List<Map<String, Object>> recentBoard = userService.recentBoard(user_id);

		// ?????? ?????????
		page.setId(user_id);
		page.setTotalCount(reviewService.countAllReview(page));

		// ??????
		List<ReviewVO> reviewVOs = reviewService.selectReviewList(page);

		if (httpsession.getAttribute("id") != null) {
			Map<String, Object> reviewMap = new HashMap<String, Object>();
			reviewMap.put("user_id", user_id);
			reviewMap.put("sessionid", httpsession.getAttribute("id"));
			int reviewCnt = reviewService.selectReviewCnt(reviewMap);
			model.addAttribute("reviewCnt", reviewCnt);
		} else {
			model.addAttribute("reviewCnt", 1);			
		}
		
		// model.addattribute
		model.addAttribute("userOneSelect", userOneSelect);
		model.addAttribute("fullStar", fullStar);
		if (halfStar == 1) {
			model.addAttribute("halfStar", halfStar);
		}
		model.addAttribute("permitLevel", permitLevel);
		model.addAttribute("boardTotalCnt", boardTotalCnt);
		model.addAttribute("replyTotalCnt", replyTotalCnt);
		model.addAttribute("likeReplyCnt", likeReplyCnt);
		model.addAttribute("hateReplyCnt", hateReplyCnt);
		model.addAttribute("recentBoard", recentBoard);

		model.addAttribute("reviewVOs", reviewVOs);
		model.addAttribute("page", page);
		model.addAttribute("recentlyChatUserVOList", this.userService.recentlyChatUsers(map));

		return "user/info";
	}

	@PostMapping(path = "/info", produces = "application/text;charset=UTF-8")
	@ResponseBody // AJAX ????????? ?????????
	public String userName(HttpSession httpSession, @RequestParam(required = false) MultipartFile uploadFile, @RequestParam Map<String, Object> map)
			throws IOException {
		List<String> changed = new ArrayList<>();
		JsonObject jsonObject = new JsonObject();

		if (httpSession.getAttribute("id") == null) {
			jsonObject.addProperty("responseCode", "error");
			jsonObject.addProperty("message", "????????? ??? ???????????????.");
		} else {
			String id = httpSession.getAttribute("id").toString();
			map.put("id", id);

			UserVO userVO = userService.userOneSelect(id);
			if (!userVO.getNickName().equals(map.get("nickNameBox").toString())) {
				if (userService.dateChecking(id).equals("no")) {
					jsonObject.addProperty("responseCode", "error");
					jsonObject.addProperty("message", "30??? ????????? ????????? ??????????????????.");
					return jsonObject.toString();
				} else {
					userService.updateNick(map);
					changed.add("?????????");
				}
			}

			if (uploadFile != null) {
				// ?????? ???????????? ??????
				String fileRoot = "Z:\\upload\\profile\\images\\"; // ??????????????? ????????? ????????????.
				String profilePath = "/upload/profile/images/";

				String originalFileName = uploadFile.getOriginalFilename(); // ???????????? ?????????
				assert originalFileName != null;
				String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // ?????? ?????????
				String savedFileName = UUID.randomUUID() + extension; // ????????? ?????? ???

				File targetFile = new File(fileRoot + savedFileName);
				try {
					InputStream fileStream = uploadFile.getInputStream();
					FileUtils.copyInputStreamToFile(fileStream, targetFile); // ?????? ??????
					map.put("userId", id);
					map.put("image", profilePath + savedFileName);
					userService.updateImage(map);
					changed.add("??????");
				} catch (IOException e) {
					FileUtils.deleteQuietly(targetFile); // ????????? ?????? ??????
					jsonObject.addProperty("responseCode", "error");
					jsonObject.addProperty("message", "?????? ????????? ??????");
					e.printStackTrace();
				}
			}

			if (!userVO.getUserPosition().equals(map.get("positions").toString())) {
				userService.updatePosition(map);
				changed.add("?????????");
			}

			jsonObject.addProperty("responseCode", "success");
			if (changed.size() == 0) {
				jsonObject.addProperty("message", "????????? ????????? ????????????.");
			} else {
				String result = Arrays.toString(changed.toArray(new String[0]));
				jsonObject.addProperty("message", result + " ????????? ?????????????????????.");
			}
		}
		return jsonObject.toString();
	}

	@GetMapping("/modify/{user_id}")
	public String userModify(Model model, @PathVariable String user_id) throws IOException {
		UserVO userVO = userService.userOneSelect(user_id);
		model.addAttribute("userOneSelect", userVO);
		return "user/modify";
	}

	@PostMapping("/idCheck.ajax")
	@ResponseBody
	public String userPostModify(@RequestParam Map<String, Object> map) {
		String userNick = (String) map.get("userNickname");

		int checkValue = userService.validating(userNick);
		String msg;
		if (checkValue == 1) {
			// ????????? ??????
			msg = "ng";
		} else {
			msg = "ok";
		}
		return msg;
	}

	@GetMapping("/declare")
	public String userDeclare(HttpServletRequest request, Model model) {
		String userId = request.getParameter("userId");
		String nickName = userService.nickName(userId);
		String log = request.getParameter("log");

		model.addAttribute("userId", userId);
		model.addAttribute("log", log);
		model.addAttribute("nickName", nickName);

		return "user/declare";
	}

	@ResponseBody
	@PostMapping(path = "/report", produces = "application/text;charset=UTF-8")
	public Object reportPost(@RequestParam Map<String, Object> map, Model model, HttpServletRequest httpServletRequest) {
		String id = httpServletRequest.getSession().getAttribute("id").toString();
		JsonObject jsonObject = new JsonObject();
		map.put("id", id);
		int cnt = reportService.insert(map);
		if (cnt == 1) {
			jsonObject.addProperty("message", "success");
			return jsonObject.toString();
		} else {
			jsonObject.addProperty("message", "fail");
			return jsonObject.toString();
		}
	}

	@GetMapping("/review/{user_id}")
	public String userReview(Model model, @RequestParam Map<String, Object> map, HttpSession httpsession, @PathVariable String user_id) {
		String sessionId = (String) httpsession.getAttribute("id");
		// ?????? ????????? ?????? ???????????? VO
		UserVO userVO = userService.userOneSelect(sessionId);

		model.addAttribute("userVO", userVO);

		return "user/review";
	}

	@PostMapping("/review")
	@ResponseBody
	public String userPostReview(@RequestParam Map<String, Object> map, HttpSession httpsession) {
		String sessionId = (String) httpsession.getAttribute("id");
		map.put("sessionId", sessionId);
		if (map.get("rating") == null) {
			map.put("rating", 0);
		}

		reviewService.insertReview(map);

		return "<script>window.close();</script>";
	}

	@GetMapping(path = "/sync", produces = "application/text;charset=UTF-8")
	public String userSync(HttpSession httpSession, Model model) {
		UserVO userVO = userService.userOneSelect(httpSession.getAttribute("id").toString());
		if (userVO.getLolId() == null || "".equalsIgnoreCase(userVO.getLolId()) || userVO.getLolId().contains("_")) {
			Map<String, Object> map = new HashMap<>();
			map.put("userId", httpSession.getAttribute("id").toString());

			String token = String.valueOf(UUID.randomUUID());
			map.put("token", token);
			this.userService.saveToken(map);

			userVO = userService.userOneSelect(httpSession.getAttribute("id").toString());
		}
		model.addAttribute("userVO", userVO);

		return "user/sync";
	}

	@PostMapping("/search/{userId}")
	@ResponseBody
	public Map<String, Object> userPostSearch(@PathVariable String userId, Model model, HttpServletRequest httpServletRequest) {
		UserVO userVO = userService.userOneSelect(userId);
		String SummonerName = userVO.getLolId().toString();
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println(SummonerName);

		VersionCheck.checkVersion();
		BufferedReader br = null;

		SummonerVO temp = null;
		LeagueEntryVO[] leagueInfo = null;
		try {
			String urlstr = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/" + SummonerName.replace(" ", "") + "?api_key=" + API_KEY;
			URL url = new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8")); // ????????? ???????????? ????????????.
			String result = "";
			String line;
			while ((line = br.readLine()) != null) { // ??? ????????? ???????????? ?????? br?????? ???????????? ?????? ???????????????.
				result = result + line;
			}
			JsonParser jsonParser = new JsonParser();
			JsonObject k = (JsonObject) jsonParser.parse(result);
			int profileIconId = k.get("profileIconId").getAsInt();
			String name = k.get("name").getAsString();
			String puuid = k.get("puuid").getAsString();
			long summonerLevel = k.get("summonerLevel").getAsLong();
			long revisionDate = k.get("revisionDate").getAsLong();
			String id = k.get("id").getAsString();
			String accountId = k.get("accountId").getAsString();
			temp = new SummonerVO(profileIconId, name, puuid, summonerLevel, revisionDate, id, accountId);
			// ??????????????? ????????????
			map.put("name", name);
			map.put("summonerLevel", summonerLevel);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		String[] leagueName = null;
		try {
			String urlstr = "https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/" + temp.getId() + "?api_key=" + API_KEY;
			URL url = new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8")); // ????????? ???????????? ????????????.
			String result = "";
			String line;
			while ((line = br.readLine()) != null) { // ??? ????????? ???????????? ?????? br?????? ???????????? ?????? ???????????????.
				result = result + line;
			}
			JsonParser jsonParser = new JsonParser();
			JsonArray arr = (JsonArray) jsonParser.parse(result);
			leagueInfo = new LeagueEntryVO[arr.size()];
			leagueName = new String[arr.size()];
			for (int i = 0; i < arr.size(); i++) {
				JsonObject k = (JsonObject) arr.get(i);
				int wins = k.get("wins").getAsInt();
				int losses = k.get("losses").getAsInt();
				String rank = k.get("rank").getAsString();
				String tier = k.get("tier").getAsString();
				String queueType = k.get("queueType").getAsString();
				int leaguePoints = k.get("leaguePoints").getAsInt();
				String leagueId = k.get("leagueId").getAsString();
				System.out.println("tier: " + tier);

				leagueInfo[i] = new LeagueEntryVO(queueType, wins, losses, leagueId, rank, tier, leaguePoints);
				urlstr = "https://kr.api.riotgames.com/lol/league/v4/leagues/" + leagueInfo[i].getLeagueId() + "?api_key=" + API_KEY;
				url = new URL(urlstr);
				urlconnection = (HttpURLConnection) url.openConnection();
				urlconnection.setRequestMethod("GET");
				br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8")); // ????????? ???????????? ????????????.
				result = "";
				line = "";
				while ((line = br.readLine()) != null) { // ??? ????????? ???????????? ?????? br?????? ???????????? ?????? ???????????????.
					result = result + line;
				}
				jsonParser = new JsonParser();
				k = (JsonObject) jsonParser.parse(result);
				leagueName[i] = k.get("name").getAsString();
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		if (leagueInfo.length > 0) {
			System.out.print("leagueInfo[0]: " + leagueInfo[0]);
			model.addAttribute("leagueInfo", leagueInfo);
			model.addAttribute("tierImgURL", "img/emblems/Emblem_" + leagueInfo[0].getTier() + ".png");
			// userVO.setLolTier(leagueInfo[0].getTier());
			map.put("tier", leagueInfo[0].getTier());
		}

		model.addAttribute("profileImgURL",
				"http://ddragon.leagueoflegends.com/cdn/" + VersionCheck.profileiconVersion + "/img/profileicon/" + temp.getProfileIconId() + ".png");
		model.addAttribute("summoner", temp);
		model.addAttribute("leagueName", leagueName);

		System.out.println("temp: " + temp);
		if (map.get("tier") == null || map.get("tier").equals("")) {
			map.put("tier", "TBD");
		}

		userService.updateSummonerLv(map);
		return map;

	}
}
