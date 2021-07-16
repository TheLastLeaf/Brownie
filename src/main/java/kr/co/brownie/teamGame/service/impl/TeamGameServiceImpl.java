package kr.co.brownie.teamGame.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.brownie.teamGame.service.TeamGameService;

import java.util.Map;

@Service("teamGameService")
public class TeamGameServiceImpl implements TeamGameService {
	@Resource(name = "teamGameMapper")
    TeamGameMapper teamGameMapper;

    @Override
    public void makeTeamGameRoom(Map<String, Object> map) {
        teamGameMapper.makeTeamGameRoom(map);
    }
}
