package kr.co.brownie.board.service.impl;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.brownie.board.service.BoardService;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	@Resource(name = "boardMapper")
	BoardMapper boardMapper;
}
