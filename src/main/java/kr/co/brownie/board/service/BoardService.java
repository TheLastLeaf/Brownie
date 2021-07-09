package kr.co.brownie.board.service;

public interface BoardService {
	BoardVO likeHateCnt(int boardSeq);

	void updateLikeHate(int boardSeq, int kind, String userId);
}
