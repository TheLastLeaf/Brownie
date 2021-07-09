package kr.co.brownie.board.service.impl;

import org.springframework.stereotype.Repository;

import kr.co.brownie.board.service.BoardVO;

@Repository("boardMapper")
public interface BoardMapper {
	BoardVO likeHateCnt(int boardSeq);

	void updateLikeHate(int boardSeq, int kind, String userId);

}
