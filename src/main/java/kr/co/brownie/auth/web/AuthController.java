package kr.co.brownie.auth.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import kr.co.brownie.auth.service.AuthService;

@Controller
public class AuthController {
	@Resource(name = "authService")
	AuthService authService;;
}
