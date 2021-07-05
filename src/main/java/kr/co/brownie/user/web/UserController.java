package kr.co.brownie.user.web;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.brownie.user.service.UserService;
import kr.co.brownie.user.service.UserVO;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource(name = "userService")
	UserService userService;

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
		if (id != null) {
			UserVO userOneSelect = userService.userOneSelect(id);
			String position = userOneSelect.getUserPosition();
			int exp = userService.LvSelect(id);
			float starCnt = userService.starCntSelect();
			int fullStar = (int) starCnt / 1;
			float halfStar = starCnt - fullStar;

			model.addAttribute("userOneSelect", userOneSelect);
			model.addAttribute("position", position);
			model.addAttribute("exp", exp);
			model.addAttribute("fullStar", fullStar);
			if (halfStar >= 0.5) {
				model.addAttribute("halfStar", halfStar);
			}

			System.out.println("sessionId: " + id);
			System.out.println("userOneSelect: " + userOneSelect);
			System.out.println("exp: " + exp);
			System.out.println("share: " + fullStar + " / " + "reamin: " + halfStar);
			System.out.println("position: " + position);
			
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
		//		String userPosition = top + "/" + jun + "/" + mid + "/" + bot + "/" + sup;
		//		map.put("userPosition", userPosition);

		//		System.out.println("id, nick, top, jun, mid, bot, sup : " + id + "/" + nick + "/" + top + "/" + jun + "/" + mid + "/" + bot + "/" + sup);
		//		userService.insertNick(map); // 스크립트로 가져와서 <script>??</script> 방법도 잇음

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
