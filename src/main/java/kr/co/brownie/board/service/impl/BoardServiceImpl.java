package kr.co.brownie.board.service.impl;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.brownie.board.service.BoardService;
import kr.co.brownie.board.service.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	@Resource(name = "boardMapper")
	BoardMapper boardMapper;

	@Override
	public BoardVO likeHateCnt(int boardSeq) {
		return boardMapper.likeHateCnt(boardSeq);
	}

	@Override
	public void updateLikeHate(int boardSeq, int kind, String userId) {
		boardMapper.updateLikeHate(boardSeq, kind, userId);
	}
}
