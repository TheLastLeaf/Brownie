package kr.co.brownie.miniGame.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.brownie.miniGame.service.BrownieMarbelInfoService;

@Controller
@RequestMapping("/miniGame")
public class MiniGameController {
	@Resource(name = "miniGameService")
	BrownieMarbelInfoService miniGameService;

	@GetMapping(path={"", "/blueMarvel"})
	public String list() {
		return "miniGame/blueMarvel";
	}
}
