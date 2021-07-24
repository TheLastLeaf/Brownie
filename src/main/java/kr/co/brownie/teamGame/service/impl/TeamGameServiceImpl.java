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
    public List<TeamGameVO> selectTeamGameList(TeamGamePagingVO page) {
        return teamGameMapper.selectTeamGameList(page);
    }

    @Override
    public TeamGameVO selectTeamGamePosition(int positionSeq) {
        return teamGameMapper.selectTeamGamePosition(positionSeq);
    }

    @Override
    public void updateTeamGamePosition(Map<String, Object> map) {
        teamGameMapper.updateTeamGamePosition(map);
    }

    @Override
    public void insertMemberPosi(Map<String, Object> map) {
        teamGameMapper.insertMemberPosi(map);
    }

    @Override
    public List<TeamGameVO> selectLeader(int teamGameSeq) {
        return teamGameMapper.selectLeader(teamGameSeq);
    }

    @Override
    public List<TeamGameVO> selectRoomMember(int teamGameSeq) {
        return teamGameMapper.selectRoomMember(teamGameSeq);
    }

    @Override
    public void deleteTeamGamePosition(Map<String, Object> map) {
        teamGameMapper.deleteTeamGamePosition(map);
    }

    @Override
    public TeamGameVO checkStatus(Map<String, Object> map) {
        return teamGameMapper.checkStatus(map);
    }

    @Override
    public void updateStatus(Map<String, Object> map) {

    }

    @Override
    public TeamGameVO selectOne(Map<String, Object> map) {
        return teamGameMapper.selectOne(map);
    }

	@Override
	public int countAllRoom(TeamGamePagingVO page) {
		return teamGameMapper.countAllRoom(page);
	}
}
