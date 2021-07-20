package kr.co.brownie.teamGame.service.impl;

import kr.co.brownie.teamGame.service.TeamGameVO;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository("teamGameMapper")
public interface TeamGameMapper {
    void insertTeamGameRoom(Map<String, Object> map);

    List<TeamGameVO> selectTeamGameList();

    List<TeamGameVO> selectTeamGamePosition(int positionSeq);

    void updateTeamGamePosition(Map<String, Object> map);
}
