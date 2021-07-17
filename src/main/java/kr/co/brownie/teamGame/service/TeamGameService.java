package kr.co.brownie.teamGame.service;

import java.util.List;
import java.util.Map;

public interface TeamGameService {
    void makeTeamGameRoom(Map<String, Object> map);

    List<TeamGameVO> selectTeamGameList();

    List<TeamGameVO> selectTeamGamePosition(int positionSeq);
}
