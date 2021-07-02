package kr.co.brownie.auth.web;

import kr.co.brownie.auth.service.AuthService;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping
public class AuthController {
	@Resource(name = "authService")
	AuthService authService;

	@GetMapping("login")
	public String login() {
		return authService.getAuthorize();
	}

	@GetMapping("oauth")
	public String oauth(@RequestParam String code, HttpSession httpSession) {
		try {
			String access_token = authService.getToken(code);
			String id = authService.getUserInfoByToken(access_token);
			httpSession.setAttribute("id", id);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "redirect:/";
	}

	@GetMapping("logout")
	public String logout(HttpSession httpSession) {
		httpSession.invalidate();

		return "redirect:/index";
	}
}
