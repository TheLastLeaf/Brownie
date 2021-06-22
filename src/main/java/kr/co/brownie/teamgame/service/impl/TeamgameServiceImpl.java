package kr.co.brownie.teamgame.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.brownie.teamgame.service.TeamgameService;

@Service("teamgameService")
public class TeamgameServiceImpl implements TeamgameService {
	@Autowired
	TeamgameDAO teamgameDAO;
}
