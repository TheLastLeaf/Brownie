package kr.co.brownie.user.web;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.brownie.review.service.ReviewService;
import kr.co.brownie.review.service.ReviewVO;
import kr.co.brownie.user.service.UserService;
import kr.co.brownie.user.service.UserVO;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource(name = "userService")
	UserService userService;
	
	@Resource(name="reviewService")
	ReviewService reviewService;
	
	/**
	 * @author 박세웅
	 * @param model
	 * @param httpSession
	 * @return
	 * @throws Exception
	 */
	@GetMapping("/userInfo")
	public String userInfo(Model model, HttpSession httpSession) throws Exception {
		String id = (String) httpSession.getAttribute("id");

		/* 로그인후 session in 되었을때 */
		if (id != null) {
			UserVO userOneSelect = userService.userOneSelect(id);

			// 포지션 select
			String position = userOneSelect.getUserPosition();

			// 경험치 select
			int exp = userService.selectExp(id);
			// 별카운트
			float starCnt = userService.starCntSelect(id);
			int fullStar = (int) starCnt / 1;
			float halfStar = starCnt - fullStar;

			// 게시글 갯수, 댓글 갯수, 좋아요, 싫어요 초기값 세팅
			int boardTotalCnt = userService.boardTotalCnt(id);
			int replyTotalCnt = userService.replyTotalCnt(id);
			int likeReplyCnt = userService.likeReplyCnt(id);
			int hateReplyCnt = userService.hateReplyCnt(id);

			// 로그인한 사람의 최근 게시글 3개가져오기
			List<String> recentBoard = userService.recentBoard(id);

			// 남이 나에게 쓴 후기 보여주기
			List<ReviewVO> reviewVO = reviewService.selectReviewList(id);
			
			model.addAttribute("userOneSelect", userOneSelect);
			model.addAttribute("exp", exp);
			model.addAttribute("position", position);
			model.addAttribute("fullStar", fullStar);
			if (halfStar >= 0.5) {
				model.addAttribute("halfStar", halfStar);
			}
			model.addAttribute("boardTotalCnt", boardTotalCnt);
			model.addAttribute("replyTotalCnt", replyTotalCnt);
			model.addAttribute("likeReplyCnt", likeReplyCnt);
			model.addAttribute("hateReplyCnt", hateReplyCnt);
			model.addAttribute("recentBoard", recentBoard);
			model.addAttribute("reviewVO", reviewVO);
			
			System.out.println("userOneSelect: " + userOneSelect);
			System.out.println("sessionId: " + id);
			System.out.println("reviewVO값: " + reviewVO);

			return "user/userInfo";
		}
		return "user/userInfo";
	}

	@PostMapping("/userInfo")
	@ResponseBody // AJAX 사용시 써야함
	public String userName(@RequestParam Map<String, Object> map, HttpSession httpSession, HttpServletRequest request) {

		// 세션 아이디 -> map에 삽입
		String id = (String) httpSession.getAttribute("id");
		map.put("id", id);

		String nick = (String) map.get("nickNameBox");
		String[] positions = request.getParameterValues("positions");
		System.out.println(Arrays.toString(positions));

		// 넣을때는 모든 정보를 넣고 가져올때 split() 사켜서 null이 아닌것만 jsp에 띄워주기
		// String userPosition = top + "/" + jun + "/" + mid + "/" + bot + "/" + sup;
		// map.put("userPosition", userPosition);

		// System.out.println("id, nick, top, jun, mid, bot, sup : " + id + "/" + nick + "/" + top + "/" + jun + "/" + mid + "/" + bot + "/" + sup);
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
