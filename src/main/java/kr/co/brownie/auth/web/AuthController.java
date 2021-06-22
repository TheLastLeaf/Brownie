package kr.co.brownie.auth.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.brownie.auth.service.AuthService;

@Controller
public class AuthController {
	@Autowired
	AuthService authService;
}
