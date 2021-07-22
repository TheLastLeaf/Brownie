package kr.co.brownie.teamGame.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface TeamGameService {
    void insertTeamGameRoom(Map<String, Object> map);

    List<TeamGameVO> selectTeamGameList();

    List<TeamGameVO> selectTeamGamePosition(int positionSeq);

    void updateTeamGamePosition(Map<String, Object> map);

    void insertMemberPosi(Map<String, Object> map);

    List<TeamGameVO> selectLeader(int teamGameSeq);

    List<TeamGameVO> selectRoomMember(int teamGameSeq);

    void deleteTeamGamePosition(Map<String, Object> map);

    TeamGameVO checkStatus(Map<String, Object> map);

    void updateStatus(Map<String, Object> map);

    TeamGameVO selectOne(Map<String, Object> map);
}
