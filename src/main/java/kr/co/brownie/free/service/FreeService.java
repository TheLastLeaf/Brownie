package kr.co.brownie.free.service;

import java.util.List;

public interface FreeService {
	List<FreeVO> selectList();

	List<FreeVO> selectFamous();

	FreeVO selectDetail(int boardSeq);

	List<FreeVO> selectRecent(int boardSeq);

	List<FreeVO> selectRecentForMenu();
}
