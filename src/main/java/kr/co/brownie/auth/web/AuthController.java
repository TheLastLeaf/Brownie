package kr.co.brownie.auth.web;

import kr.co.brownie.auth.service.AuthService;
import kr.co.brownie.blackList.service.BlackUserService;
import kr.co.brownie.blackList.service.BlackUserVO;
import kr.co.brownie.fileUpload.service.FileService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping
public class AuthController {
    @Resource(name = "authService")
    AuthService authService;
}