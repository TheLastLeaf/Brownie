package kr.co.brownie.teamgame.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.brownie.teamgame.service.TeamgameService;

@Controller
public class TeamgameController {
	@Autowired
	TeamgameService teamgameService;
}
