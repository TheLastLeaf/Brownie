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
@RequestMapping("/")
public class AuthController {
    @Resource(name = "authService")
    AuthService authService;

    @GetMapping
    public String main() {
        return "home";
    }

    @GetMapping("login")
    public String login() {
        return authService.getAuthorize();
    }

    @GetMapping("oauth")
    public String oauth(@RequestParam String code, HttpServletRequest httpServletRequest) {
        String access_token = null;
        try {
            access_token = authService.getToken(code);
            httpServletRequest.getSession().setAttribute("access_token", access_token);

            if (access_token != null) {
                String id = authService.getUserInfoByToken(access_token);
                httpServletRequest.getSession().setAttribute("id", id);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }


        return "redirect:/";
    }

    @GetMapping("logout")
    public String logout(HttpServletRequest httpServletRequest) {
        HttpSession httpSession = httpServletRequest.getSession();
        if (httpSession != null) {
            httpSession.invalidate();
        }

        return "redirect:/";
    }
}