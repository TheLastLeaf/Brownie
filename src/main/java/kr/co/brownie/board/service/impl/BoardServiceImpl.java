package kr.co.brownie.board.service.impl;

import java.util.Map;

import javax.annotation.Resource;

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
	public void updateLikeHate(Map<String, Object> map) {
		boardMapper.updateLikeHate(map);
	}

}
