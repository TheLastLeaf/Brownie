package kr.co.brownie.user.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.brownie.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource(name="userService")
	UserService userService;
	
	@GetMapping("/userInfo")
	public String userInfo() {
		return "user/userInfo";
	}
	@GetMapping("/userSync")
	public String userSync() {
		return "user/userSync";
	}
	@GetMapping("/userComment")
	public String userComment() {
		return "user/userComment";
	}
	@GetMapping("/userModify")
	public String userModify() {
		return "user/userModify";
	}
	@GetMapping("/userDeclar")
	public String userDeclar() {
		return "user/userDeclar";
	}
	
	@GetMapping
	public String main() {
		return userInfo();
	}
}
