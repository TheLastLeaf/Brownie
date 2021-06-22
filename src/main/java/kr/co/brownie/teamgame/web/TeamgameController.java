package kr.co.brownie.teamgame.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import kr.co.brownie.teamgame.service.TeamgameService;

@Controller
public class TeamgameController {
	@Resource(name = "teamgameService")
	TeamgameService teamgameService;
}
