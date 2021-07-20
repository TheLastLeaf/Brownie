package kr.co.brownie.teamGame.service.impl;

import kr.co.brownie.teamGame.service.TeamGameService;
import kr.co.brownie.teamGame.service.TeamGameVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("teamGameService")
public class TeamGameServiceImpl implements TeamGameService {
    @Resource(name = "teamGameMapper")
    TeamGameMapper teamGameMapper;

    @Override
    public void insertTeamGameRoom(Map<String, Object> map) {
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

    @Override
    public void insertTeamGamePosition(HashMap<String, Object> map) {
        teamGameMapper.insertTeamGamePosition(map);
    }
}
