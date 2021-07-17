package kr.co.brownie.teamGame.service.impl;

import javax.annotation.Resource;

import kr.co.brownie.teamGame.service.TeamGameVO;
import org.springframework.stereotype.Service;

import kr.co.brownie.teamGame.service.TeamGameService;

import java.util.List;
import java.util.Map;

@Service("teamGameService")
public class TeamGameServiceImpl implements TeamGameService {
	@Resource(name = "teamGameMapper")
    TeamGameMapper teamGameMapper;

    @Override
    public void insertTeamGameRoom(Map<String, Object> map) {
        System.out.println("service map : "+map);
        teamGameMapper.insertTeamGameRoom(map);
    }

    @Override
    public List<TeamGameVO> selectTeamGameList() {
        return teamGameMapper.selectTeamGameList();
    }

	@Override
	public List<TeamGameVO> selectTeamGamePosition(int positionSeq) {
		return teamGameMapper.selectTeamGamePosition(positionSeq);
	}
}
