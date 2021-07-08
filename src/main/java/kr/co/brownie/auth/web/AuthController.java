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

			/* 첫 로그인 세웅 */
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

			// 게시글 갯수, 댓글 갯수, 좋아요, 싫어요 초기값 세팅


			/* service 호출해서 집어넣기 */
			authService.insertUser(id, tempLolNick, tempBrownieNick, position);
			authService.insertReview(reviewSeq, id, starCnt, reply, writeUserId);

			/* 첫 로그인일 경우 권한 레벨 및 사이트 레벨 지정, 유저가 존재해야 삽입가능*/
			authService.insertPermitLevel(id);
			authService.insertExp(id, exp);

			/* 로그인 할 때 권한 레벨 세션에 넣어줘야 게시글 조회 시 사용 */
			int permitlevel = authService.permitLevel(id);
			httpSession.setAttribute("permit_level", permitlevel);

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