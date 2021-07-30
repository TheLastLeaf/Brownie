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
	 * @author 박세웅
	 */
	@GetMapping("/info/{user_id}")
	public String userInfo(@PathVariable String user_id, HttpSession httpSession, Model model, ReviewPagingVO page) {
		Map<String, Object> map = new HashMap<>();
		map.put("userId", httpSession.getAttribute("id"));
		UserVO userOneSelect = userService.userOneSelect(user_id);
		// 유저레벨
		int permitLevel = userService.selectPermitLevel(user_id);
		if (userOneSelect == null) {
			model.addAttribute("message", "alert(\"등록되지 않은 유저입니다.\");history.go(-1);");
			return "common/message";
		}

		// 별카운트
		float starCnt = userService.starCntSelect(user_id);
		int fullStar = (int) starCnt;
		float halfStar = starCnt - fullStar;
		if (halfStar >= 0.5) {
			halfStar = 1;
		}

		// 게시글 갯수, 댓글 갯수, 좋아요, 싫어요 초기값 세팅
		int boardTotalCnt = userService.boardTotalCnt(user_id);
		int replyTotalCnt = userService.replyTotalCnt(user_id);
		int likeReplyCnt = userService.likeReplyCnt(user_id);
		int hateReplyCnt = userService.hateReplyCnt(user_id);

		// 로그인한 사람의 최근 게시글 3개가져오기
		List<Map<String, Object>> recentBoard = userService.recentBoard(user_id);

		// 후기 페이징
		page.setId(user_id);
		page.setTotalCount(reviewService.countAllReview(page));

		// 리뷰
		List<ReviewVO> reviewVOs = reviewService.selectReviewList(page);

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
	@ResponseBody // AJAX 사용시 써야함
	public String userName(HttpSession httpSession, @RequestParam(required = false) MultipartFile uploadFile, @RequestParam Map<String, Object> map)
			throws IOException {
		List<String> changed = new ArrayList<>();
		JsonObject jsonObject = new JsonObject();

		if (httpSession.getAttribute("id") == null) {
			jsonObject.addProperty("responseCode", "error");
			jsonObject.addProperty("message", "로그인 후 이용하세요.");
		} else {
			String id = httpSession.getAttribute("id").toString();
			map.put("id", id);

			UserVO userVO = userService.userOneSelect(id);
			if (!userVO.getNickName().equals(map.get("nickNameBox").toString())) {
				if (userService.dateChecking(id).equals("no")) {
					jsonObject.addProperty("responseCode", "error");
					jsonObject.addProperty("message", "30일 이내에 변경된 아이디입니다.");
					return jsonObject.toString();
				} else {
					userService.updateNick(map);
					changed.add("닉네임");
				}
			}

			if (uploadFile != null) {
				// 파일 저장되는 경로
				String fileRoot = "Z:\\upload\\profile\\images\\"; // 외부경로로 저장을 희망할때.
				String profilePath = "/upload/profile/images/";

				String originalFileName = uploadFile.getOriginalFilename(); // 오리지날 파일명
				assert originalFileName != null;
				String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
				String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명

				File targetFile = new File(fileRoot + savedFileName);
				try {
					InputStream fileStream = uploadFile.getInputStream();
					FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
					map.put("userId", id);
					map.put("image", profilePath + savedFileName);
					userService.updateImage(map);
					changed.add("사진");
				} catch (IOException e) {
					FileUtils.deleteQuietly(targetFile); // 저장된 파일 삭제
					jsonObject.addProperty("responseCode", "error");
					jsonObject.addProperty("message", "파일 업로드 실패");
					e.printStackTrace();
				}
			}

			if (!userVO.getUserPosition().equals(map.get("positions").toString())) {
				userService.updatePosition(map);
				changed.add("포지션");
			}

			jsonObject.addProperty("responseCode", "success");
			if (changed.size() == 0) {
				jsonObject.addProperty("message", "변경된 항목이 없습니다.");
			} else {
				String result = Arrays.toString(changed.toArray(new String[0]));
				jsonObject.addProperty("message", result + " 항목이 변경되었습니다.");
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

		System.out.println(map);

		int checkValue = userService.validating(userNick);
		String msg;
		if (checkValue == 1) {
			// 아이디 중복
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
		// 현재 접속한 세션 아이디의 VO
		UserVO userVO = userService.userOneSelect(sessionId);

		model.addAttribute("userVO", userVO);

		return "user/review";
	}

	@PostMapping("/review")
	@ResponseBody
	public String userPostReview(@RequestParam Map<String, Object> map, HttpSession httpsession) {
		String sessionId = (String) httpsession.getAttribute("id");
		map.put("sessionId", sessionId);
		if(map.get("rating") == null) {
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
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8")); // 여기에 문자열을 받아와라.
			String result = "";
			String line;
			while ((line = br.readLine()) != null) { // 그 받아온 문자열을 계속 br에서 줄단위로 받고 출력하겠다.
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
			// 레벨정보를 넣어야함
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
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8")); // 여기에 문자열을 받아와라.
			String result = "";
			String line;
			while ((line = br.readLine()) != null) { // 그 받아온 문자열을 계속 br에서 줄단위로 받고 출력하겠다.
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
				br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8")); // 여기에 문자열을 받아와라.
				result = "";
				line = "";
				while ((line = br.readLine()) != null) { // 그 받아온 문자열을 계속 br에서 줄단위로 받고 출력하겠다.
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
