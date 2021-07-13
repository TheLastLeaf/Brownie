package kr.co.brownie.common.service;

import java.util.Map;

public interface CommonService {
	int insertMember(Map<String, Object> map);

	int insertNoMem(Map<String, Object> map);
	
	int checkHit(int boardSeq);
}
