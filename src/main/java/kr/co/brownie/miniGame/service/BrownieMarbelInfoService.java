package kr.co.brownie.miniGame.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public interface BrownieMarbelInfoService {

	int insertBrownieMarbel(Map<String, Object> map);

	List<BrownieMarbelInfoVO> getBrownieMarbelList(HashMap<String, Object> passmap);

	BrownieMarbelInfoVO getBrownieMarbel(int boardSeq);

	int updateBrownieMarbel(Map<String, Object> map);

	int deleteBrownieMarbel(int boardSeq);
}
