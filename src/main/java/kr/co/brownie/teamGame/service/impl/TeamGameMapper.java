package kr.co.brownie.teamGame.service.impl;

import kr.co.brownie.teamGame.service.TeamGameVO;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository("teamGameMapper")
public interface TeamGameMapper {
    void insertTeamGameRoom(Map<String, Object> map);

    List<TeamGameVO> selectTeamGameList(TeamGamePagingVO page);

    TeamGameVO selectTeamGamePosition(int positionSeq);

    void updateTeamGamePosition(Map<String, Object> map);

    void insertMemberPosi(Map<String, Object> map);

    List<TeamGameVO> selectLeader(int teamGameSeq);

    List<TeamGameVO> selectRoomMember(int teamGameSeq);

    void deleteTeamGamePosition(Map<String, Object> map);

    TeamGameVO checkStatus(Map<String, Object> map);

    void updateStatus(Map<String, Object> map);

    TeamGameVO selectOne(Map<String, Object> map);

	int countAllRoom(TeamGamePagingVO page);

	void deleteTeamGame(Map<String, Object> map);
}
