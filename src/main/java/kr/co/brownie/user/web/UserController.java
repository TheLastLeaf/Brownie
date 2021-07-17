package kr.co.brownie.user.web;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.brownie.fileUpload.service.FileService;
import kr.co.brownie.report.service.ReportService;
import kr.co.brownie.review.service.ReviewService;
import kr.co.brownie.review.service.ReviewVO;
import kr.co.brownie.review.service.impl.ReviewPagingVO;
import kr.co.brownie.user.service.UserService;
import kr.co.brownie.user.service.UserVO;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource(name = "userService")
	UserService userService;

	@Resource(name = "reviewService")
	ReviewService reviewService;

	@Resource(name = "fileService")
	FileService fileService;

	@Resource(name = "reportService")
	ReportService reportService;

	/**
	 * @param model
	 * @param httpSession
	 * @return
	 * @throws Exception
	 * @author 박세웅
	 */
	@GetMapping("/userInfo/{user_id}")
	public String userInfo(Model model, HttpSession httpSession, ReviewPagingVO page, @PathVariable String user_id) throws Exception {
		UserVO userOneSelect = userService.userOneSelect(user_id);
		if (userOneSelect == null) {
			model.addAttribute("message", "alert(\"등록되지 않은 유저입니다.\");history.go(-1);");
			return "common/message";
		}

		// 프로필 사진들고오기
		String selectProfile = fileService.selectProfile(user_id);

		// 경험치 select
		int exp = userService.selectExp(user_id);

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
		List<String> recentBoard = userService.recentBoard(user_id);

		// 후기 페이징
		page.setId(user_id);
		page.setTotalCount(reviewService.countAllReview(page));

		// 리뷰
		List<ReviewVO> reviewVOs = reviewService.selectReviewList(page);

		// model.addattribute
		model.addAttribute("userOneSelect", userOneSelect);
		model.addAttribute("selectProfile", selectProfile);
		model.addAttribute("exp", exp);
		model.addAttribute("fullStar", fullStar);
		if (halfStar == 1) {
			model.addAttribute("halfStar", halfStar);
		}
		model.addAttribute("boardTotalCnt", boardTotalCnt);
		model.addAttribute("replyTotalCnt", replyTotalCnt);
		model.addAttribute("likeReplyCnt", likeReplyCnt);
		model.addAttribute("hateReplyCnt", hateReplyCnt);
		model.addAttribute("recentBoard", recentBoard);

		model.addAttribute("reviewVOs", reviewVOs);
		model.addAttribute("page", page);
		
		System.out.println("UserController 111줄 호출: userOneSelect: " + userOneSelect);
		System.out.println("UserController 112줄 호출: reviewVOs" + reviewVOs);
		System.out.println();

		return "user/userInfo";
	}

	@PostMapping(path = "/userInfo", produces = "application/text;charset=UTF-8")
	@ResponseBody // AJAX 사용시 써야함
	public String userName(MultipartFile[] uploadFile, @RequestParam Map<String, Object> map, HttpServletRequest httpServletRequest)
			throws IOException {
		List<String> changed = new ArrayList<>();
		// 세션 아이디 -> map에 삽입
		String id = httpServletRequest.getSession().getAttribute("id").toString();
		map.put("id", id);

		UserVO userVO = userService.userOneSelect(id);

		// 파일 저장되는 경로
		String uploadFolder = "C:\\Users\\PC13\\git\\Brownie\\src\\main\\resources\\static\\img\\userProfile";
		String profilePath = "";

		if (uploadFile != null) {
			for (MultipartFile multipartFile : uploadFile) {
				String originFileName = multipartFile.getOriginalFilename();
				// 진짜 파일 이름
				originFileName = originFileName.substring(originFileName.lastIndexOf("\\") + 1);
				// 내가 날짜_이름 으로 지어주는 이름
				profilePath = String.format("/%s_%s", System.currentTimeMillis(), originFileName);
				File savefileName = new File(uploadFolder, profilePath);
				try {
					multipartFile.transferTo(savefileName);
					map.put("profilePath", profilePath);
					map.put("originFileName", originFileName);
					map.put("savefileName", savefileName);
				} catch (Exception e) {
					System.out.println("예외발생");
				}
				fileService.updateProfile(map);
			}
			changed.add("사진");
		}

		// 포지션 변경하는 서비스
		if (!map.get("positions").toString().equals(userVO.getUserPosition())) {
			userService.updatePosition(map);
			changed.add("포지션");
		}

		// 동의항목 체크했을때 31일 이내에 바꾼건지 확인하는 메서드
		String dateChecking = userService.dateChecking(id);
		
		// 닉네임 변경하는 서비스
		if (dateChecking.equals("no")) {
			if (map.get("nickNameBox").toString().equals(userVO.getNickName())) {
				return "아이디는 변경되지 않았습니다";
			}
			changed.add("31이내에 변경한 아이디이므로 바꿀수 없습니다!");
		}
		else if (dateChecking.equals("yes")) {
			if (!map.get("nickNameBox").toString().equals(userVO.getNickName())) {
				userService.updateNick(map);
				changed.add("닉네임");
			}
		}

		if (changed.size() == 0) {
			return "변경된 항목이 없습니다.";
		}

		String result = Arrays.toString(changed.toArray(new String[0]));
		return result + "이 변경되었습니다.";
	}

	@GetMapping("/userSync")
	public String userSync() {
		return "user/userSync";
	}

	@GetMapping("/userReview")
	public String userReview() {
		return "user/userReview";
	}

	@GetMapping("/userModify/{user_id}")
	public String userModify(Model model, @PathVariable String user_id) throws IOException {
		System.out.println("get");
		String selectProfile = fileService.selectProfile(user_id);
		UserVO userVO = userService.userOneSelect(user_id);
		model.addAttribute("userOneSelect", userVO);
		model.addAttribute("selectProfile", selectProfile);

		return "user/userModify";
	}

	@PostMapping("/userModify")
	@ResponseBody
	public String userPostModify(Model model, @RequestParam Map<String, Object> map, HttpServletRequest httpServletRequest) throws IOException {
		String userNick = (String) map.get("user_nick");
		System.out.println("기입한닉: " + userNick);
		int checkValue = userService.validating(userNick);
		String msg = "";
		if (checkValue == 1) {
			// 아이디 중복
			msg = "ng";
			return msg;
		} else {
			msg = "ok";
			return msg;
		}

//		return "ok";
	}

	@GetMapping("/userDeclar")
	public String userDeclar(HttpServletRequest request, Model model) {
		String userId = request.getParameter("userId");
		String nickName = userService.nickName(userId);
		String log = request.getParameter("log");
		model.addAttribute("userId", userId);
		model.addAttribute("log", log);
		model.addAttribute("nickName", nickName);
		return "user/userDeclar";
	}

	@ResponseBody
	@RequestMapping(value = "/userReport", method = { RequestMethod.GET, RequestMethod.POST })
	public Object reportPost(Model model, HttpServletRequest httpServletRequest) {
		Map<String, Object> map = new HashMap<>();
		String id = httpServletRequest.getSession().getAttribute("id").toString();
		String content = httpServletRequest.getParameter("content");
		String userId = httpServletRequest.getParameter("userId");
		String[] reportNameList = httpServletRequest.getParameterValues("reportName[]");
		String log = httpServletRequest.getParameter("log");
		map.put("id", id);
		map.put("content", content);
		map.put("userId", userId);
		map.put("reportName", Arrays.toString(reportNameList));
		map.put("log", log);
		int cnt = reportService.insert(map);
		model.addAttribute("cnt", cnt);
		return cnt;
	}

}
