package kr.co.brownie.teamGame.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import kr.co.brownie.teamGame.service.TeamGameService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/teamGame")
public class TeamGameController {
	@Resource(name = "teamGameService")
	TeamGameService teamGameService;

	@GetMapping("/chatRoom")
	public String chatRoom() {
		return "teamGame/chatRoom";
	}

	@GetMapping("/makeRoom")
	public String makeRoom() {
		return "teamGame/makeRoom";
	}

	@GetMapping("/teamMaker")
	public String teamMaker() {
		return "teamGame/teamMaker";
	}

	@GetMapping
	public String main() {
		return teamMaker();
	}
}
