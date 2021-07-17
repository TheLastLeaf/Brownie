package kr.co.brownie.miniGame.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public interface BrownieMarbelInfoService {

    int insertBrownieMarbel(Map<String, Object> map);

    List<BrownieMarbelInfoVO> getBrownieMarbelList(HashMap<String, Object> passmap);

    List<BrownieMarbelInfoVO> selectListPoint(List<Integer> list);

    BrownieMarbelInfoVO getBrownieMarbel(int boardSeq);

    BrownieMarbelVO selectPlayer(String userId);

    List<BrownieMarbelLogVO> selectLogs(HashMap<String, Object> map);

    int insertPlayer(HashMap<String, Object> map);

    int updatePlayer(HashMap<String, Object> map);

    int insertLog(HashMap<String, Object> map);

    int modifyBPoint(HashMap<String, Object> map);

    int modifyGamePoint(HashMap<String, Object> map);

    BrownieMarbelInfoVO selectInfo(int seq);
}
