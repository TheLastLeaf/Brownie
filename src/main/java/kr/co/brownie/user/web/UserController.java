package kr.co.brownie.user.web;

import java.io.File;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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

			//
			// 후기 페이징
			page.setId(id);
			page.setTotalCount(reviewService.countAllReview(page));
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
	public String userName(MultipartFile[] uploadFile, @RequestParam Map<String, Object> map, HttpSession httpSession, HttpServletRequest request) {

		String uploadFolder = "C:\\upload";

		for (MultipartFile multipartFile : uploadFile) {
			String uploadFileName = multipartFile.getOriginalFilename();
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			File savefile = new File(uploadFolder, uploadFileName);
			try {
				multipartFile.transferTo(savefile);
			} catch (Exception e) {
				System.out.println("예외발생");
			}
		}

		// 세션 아이디 -> map에 삽입
		String id = (String) httpSession.getAttribute("id");
		map.put("id", id);

		String nick = (String) map.get("nickNameBox");
		String[] positions = request.getParameterValues("positions");
		System.out.println("nick:" + nick);
		System.out.println(Arrays.toString(positions));

		// map.put("userPosition", userPosition);

		// userService.insertNick(map); // 스크립트로 가져와서 <script>??</script> 방법도 잇음

		return "msg";
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
	public String userDeclar() {
		return "user/userDeclar";
	}

}
