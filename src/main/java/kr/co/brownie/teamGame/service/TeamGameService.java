package kr.co.brownie.teamGame.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface TeamGameService {
    void insertTeamGameRoom(Map<String, Object> map);

    List<TeamGameVO> selectTeamGameList();

    List<TeamGameVO> selectTeamGamePosition(int positionSeq);

    void updateTeamGamePosition(Map<String, Object> map);
}
