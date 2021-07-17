package kr.co.brownie.exp.web;

import kr.co.brownie.exp.service.ExpService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

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
