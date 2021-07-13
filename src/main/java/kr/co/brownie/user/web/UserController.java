package kr.co.brownie.user.web;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import kr.co.brownie.report.service.ReportService;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import kr.co.brownie.fileUpload.service.FileService;
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
	 * @author 박세웅
	 * @param model
	 * @param httpSession
	 * @return
	 * @throws Exception
	 */
	@GetMapping("/userInfo")
	public String userInfo(Model model, HttpSession httpSession, ReviewPagingVO page) throws Exception {
		String id = (String) httpSession.getAttribute("id");

		/* 로그인후 session in 되었을때 */
		if (id != null) {
			UserVO userOneSelect = userService.userOneSelect(id);
			System.out.println("userOneSelect: " + userOneSelect);

			// 경험치 select
			int exp = userService.selectExp(id);

			// 별카운트
			float starCnt = userService.starCntSelect(id);
			int fullStar = (int) starCnt / 1;
			float halfStar = starCnt - fullStar;
			if (halfStar >= 0.5) {
				halfStar = 1;
			}

			// 게시글 갯수, 댓글 갯수, 좋아요, 싫어요 초기값 세팅
			int boardTotalCnt = userService.boardTotalCnt(id);
			int replyTotalCnt = userService.replyTotalCnt(id);
			int likeReplyCnt = userService.likeReplyCnt(id);
			int hateReplyCnt = userService.hateReplyCnt(id);

			// 로그인한 사람의 최근 게시글 3개가져오기
			List<String> recentBoard = userService.recentBoard(id);

			// 후기 페이징
			page.setId(id);
			page.setTotalCount(reviewService.countAllReview(page));

			// 리뷰
			List<ReviewVO> reviewVOs = reviewService.selectReviewList(page);

			// model.addattribute
			model.addAttribute("userOneSelect", userOneSelect);
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

			return "user/userInfo";
		}
		return "user/userInfo";
	}

	@PostMapping("/userInfo")
	@ResponseBody // AJAX 사용시 써야함
	public String userName(MultipartFile[] uploadFile, @RequestParam Map<String, Object> map, HttpSession httpSession, HttpServletRequest request) throws IOException {
		// 세션 아이디 -> map에 삽입
		String id = (String) httpSession.getAttribute("id");
		map.put("id", id);
		
		// 내부경로로 저장
		//		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		//		String uploadFolder = contextRoot + "resources/static/img/userProfile/";
		
		// 파일 저장되는 경로
		String uploadFolder = "C:\\Users\\PC13\\git\\Brownie\\src\\main\\resources\\static\\img\\userProfile";
		String profilePath = "";

		for (MultipartFile multipartFile : uploadFile) {
			String originFileName = multipartFile.getOriginalFilename();
			// 진짜 파일 이름
			originFileName = originFileName.substring(originFileName.lastIndexOf("\\") + 1);
			// 내가 날짜_이름 으로 지어주는 이름
			profilePath = String.format("/%s_%s", System.currentTimeMillis(), originFileName); 
//			File savefileName = new File(uploadFolder, originFileName);
			File savefileName = new File(uploadFolder, profilePath);
			
			System.out.println("savefileName : " + savefileName);
			System.out.println("profile_img : " + profilePath);
			try {
				multipartFile.transferTo(savefileName);
				map.put("profilePath", profilePath);
				map.put("originFileName", originFileName);
				map.put("savefileName", savefileName);
				
				
			} catch (Exception e) {
				System.out.println("예외발생");
			}
		}
		
		fileService.insertPath(map);
		userService.insertNickPosition(map) ; // 스크립트로 가져와서 <script>??</script> 방법도 잇음
		
		return "/img/userProfile/" + profilePath;
	}

	@GetMapping("/userSync")
	public String userSync() {
		return "user/userSync";
	}

	@GetMapping("/userReview")
	public String userReview() {
		return "user/userReview";
	}

	@GetMapping("/userModify")
	public String userModify() {
		return "user/userModify";
	}

	@GetMapping("/userDeclar")
	public String userDeclar(HttpServletRequest request,Model model,HttpSession session) {
		String userId = request.getParameter("userId");
		String nickName = request.getParameter("nickName");
		model.addAttribute("userId",userId);
		model.addAttribute("nickName",nickName);
		return "user/userDeclar";
	}

	@ResponseBody
	@RequestMapping(value="/userReport", method = { RequestMethod.GET, RequestMethod.POST})
	public Object reportPost(Map<String,Object> map, HttpSession session, Model model, HttpServletRequest servletRequest){
		String id = (String)session.getAttribute("id");
		String content = servletRequest.getParameter("content");
		String[] reportName = servletRequest.getParameterValues("reportName");
		String userId = servletRequest.getParameter("userId");
		map.put("content",content);
		map.put("reportName",reportName);
		map.put("id",id);
		map.put("userId",userId);
		System.out.println(map);
		if(id==null){
			model.addAttribute("message", "<script>alert('로그인 후 이용가능한 서비스입니다.'); history.go(-1);</script>");
			return "common/message";
		}else{
			int cnt = reportService.insert(map);
			model.addAttribute("cnt",cnt);
			return cnt;
		}
	}

}
