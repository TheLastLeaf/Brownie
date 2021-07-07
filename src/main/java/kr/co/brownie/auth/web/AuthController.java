package kr.co.brownie.auth.web;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.brownie.auth.service.AuthService;

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

			/* 첫 로그인 */
			// 소환사명 및 세팅
			String tempLolNick = "익명의소환사_" + (int) (Math.random() * 100 + 1);
			String tempBrownieNick = "커뮤닉_" + (int) (Math.random() * 100 + 1);
			String position = "[empty]";
			// 경험치 테이블 세팅
			int exp = 0;
			// REVIEW 테이블 세팅
			int reviewSeq = 1;
			int starCnt = 0;
			String reply = "empty";
			String writeUserId = "anonymous";

			// service 호출해서 집어넣기
			authService.insertUser(id, tempLolNick, tempBrownieNick, position);
			authService.insertExp(id, exp);
			authService.insertReview(reviewSeq, id, starCnt, reply, writeUserId);

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
