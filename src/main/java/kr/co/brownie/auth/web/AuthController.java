package kr.co.brownie.auth.web;

import kr.co.brownie.auth.service.AuthService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping
public class AuthController {
    @Resource(name = "authService")
    AuthService authService;
}