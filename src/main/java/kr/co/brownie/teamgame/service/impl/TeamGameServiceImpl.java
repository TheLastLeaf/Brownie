package kr.co.brownie.teamgame.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.brownie.teamgame.service.TeamGameService;

@Service("teamGameService")
public class TeamGameServiceImpl implements TeamGameService {
	@Resource(name = "teamGameDAO")
	TeamGameDAO teamGameDAO;
}
