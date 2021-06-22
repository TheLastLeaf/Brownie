package kr.co.brownie.board.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.brownie.board.service.BoardService;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	@Resource(name = "boardDAO")
	BoardDAO boardDAO;
}
