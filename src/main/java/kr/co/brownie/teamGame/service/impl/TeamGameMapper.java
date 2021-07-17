package kr.co.brownie.teamGame.service.impl;

import kr.co.brownie.teamGame.service.TeamGameVO;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("teamGameMapper")
public interface TeamGameMapper {
    void makeTeamGameRoom(Map<String, Object> map);

    List<TeamGameVO> selectTeamGameList();

}
