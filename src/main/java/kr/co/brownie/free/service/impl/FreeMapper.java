package kr.co.brownie.free.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.co.brownie.free.service.FreeVO;

@Repository("freeMapper")
public interface FreeMapper {
	List<FreeVO> selectList();

	List<FreeVO> selectFamous();

	FreeVO selectDetail(int boardSeq);

	List<FreeVO> selectRecent(int boardSeq);

	List<FreeVO> selectRecentForMenu();

	void insertFree(Map<String, Object> map);
}
