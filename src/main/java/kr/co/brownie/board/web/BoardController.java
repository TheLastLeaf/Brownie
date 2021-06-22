package kr.co.brownie.board.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import kr.co.brownie.board.service.BoardService;

@Controller
public class BoardController {
	@Resource(name = "boardService")
	BoardService boardService;
}
