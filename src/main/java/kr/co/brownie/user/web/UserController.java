package kr.co.brownie.user.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
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
	public String userInfo() {
		return "user/userInfo";
	}

	@PostMapping("/userInfo")
	@ResponseBody
	public void userName(@RequestParam Map<String, Object> map, HttpSession session, HttpServletRequest req) {
		String x = (String) map.get("nickNameBox");
		String y = (String) map.get("top");
		String z = (String) map.get("jun");
		String w = (String) map.get("mid");
		String e = (String) map.get("bot");
		String t = (String) map.get("sup");
		System.out.println("nick, top, jun, mid, bot, sup : " + x + "/" + y + "/" + z + "/" + w + "/" + e + "/"+ t + "/");

		return;
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
