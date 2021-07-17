package kr.co.brownie.miniGame.service.impl;

import kr.co.brownie.miniGame.service.BrownieMarbelInfoVO;
import kr.co.brownie.miniGame.service.BrownieMarbelLogVO;
import kr.co.brownie.miniGame.service.BrownieMarbelVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
@Repository("brownieMarbelInfoMapper")
public interface BrownieMarbelInfoMapper {
    int insert(Map<String, Object> map);

    List<BrownieMarbelInfoVO> selectList(HashMap<String, Object> passmap);

    List<BrownieMarbelInfoVO> selectListPoint(List<Integer> list);

    BrownieMarbelInfoVO read(int boardSeq);

    BrownieMarbelVO selectPlayer(String userId);

    List<BrownieMarbelLogVO> selectLogs(HashMap<String, Object> map);

    int insertPlayer(HashMap<String, Object> map);

    int updatePlayer(HashMap<String, Object> map);

    int insertLog(HashMap<String, Object> map);

    int updateBPoint(HashMap<String, Object> map);

    int updateGamePoint(HashMap<String, Object> map);

    BrownieMarbelInfoVO selectInfo(int seq);
}