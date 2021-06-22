package kr.co.brownie.teamgame.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.brownie.teamgame.service.TeamgameService;

@Service("teamgameService")
public class TeamgameServiceImpl implements TeamgameService {
	@Resource(name = "teamgameDAO")
	TeamgameDAO teamgameDAO;
}
