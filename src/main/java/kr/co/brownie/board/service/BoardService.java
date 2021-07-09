package kr.co.brownie.board.service;

import java.util.Map;

public interface BoardService {
	BoardVO likeHateCnt(int boardSeq);

	void updateLikeHate(Map<String, Object> map);
}
