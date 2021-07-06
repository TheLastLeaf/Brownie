package kr.co.brownie.exp.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.brownie.exp.service.ExpService;

@Controller
@RequestMapping
public class ExpController {
	@Resource(name = "expService")
	ExpService expService;
		
//	@GetMapping("/user/userInfo")
//	public String selectExp(Map<String,Object> map, HttpSession httpSession) {
//		String id = (String)httpSession.getAttribute("id");
//		int exp = expService.selectExp(id);
//		return "user/userInfo";
//	}
	
}
