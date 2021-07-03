package kr.co.brownie.user.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

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

	@GetMapping("/userInfo")
	public String userInfo(Model model, HttpSession httpSession) throws Exception{
		String id = (String)httpSession.getAttribute("id");
		System.out.println(id);
		UserVO userOneSelect = userService.userOneSelect(id); 
		model.addAttribute("userOneSelect", userOneSelect);
		
		System.out.println(userOneSelect);
		
		return "user/userInfo";
	}

	@PostMapping("/userInfo")
	@ResponseBody
	public String userName(@RequestParam Map<String, Object> map, HttpSession httpSession) {

		// 세션 아이디 -> map에 삽입
		String id = (String) httpSession.getAttribute("id");
		map.put("id", id);

		String nick = (String) map.get("nickNameBox");
		String top = (String) map.get("top");
		String jun = (String) map.get("jun");
		String mid = (String) map.get("mid");
		String bot = (String) map.get("bot");
		String sup = (String) map.get("sup");

		// 넣을때는 모든 정보를 넣고 가져올때 split() 사켜서 null이 아닌것만 jsp에 띄워주기
		String userPosition = top + "/" + jun + "/" + mid + "/" + bot + "/" + sup;
		map.put("userPosition", userPosition);

		System.out.println("id, nick, top, jun, mid, bot, sup : " + id + "/" + nick + "/" + top + "/" + jun + "/" + mid + "/" + bot + "/" + sup);
		userService.insertNick(map); // 스크립트로 가져와서 <script>??</script> 방법도 잇음

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

	//	@GetMapping
	//	public String main() {
	//		return userInfo();
	//	}
}
