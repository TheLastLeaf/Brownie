package kr.co.brownie.teamGame.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.brownie.teamGame.service.TeamGameService;

@Service("teamGameService")
public class TeamGameServiceImpl implements TeamGameService {
	@Resource(name = "teamGameDAO")
	TeamGameDAO teamGameDAO;
}
