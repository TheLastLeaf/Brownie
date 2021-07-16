package kr.co.brownie.teamGame.service.impl;

import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository("teamGameMapper")
public interface TeamGameMapper {
    void makeTeamGameRoom(Map<String, Object> map);

}
