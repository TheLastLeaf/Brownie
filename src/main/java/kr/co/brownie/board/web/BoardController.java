package kr.co.brownie.board.web;

import javax.annotation.Resource;

import kr.co.brownie.board.reply.service.ReplyService;
import org.springframework.stereotype.Controller;

import kr.co.brownie.board.service.BoardService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Resource(name = "boardService")
    BoardService boardService;

    @Resource(name = "replyService")
    ReplyService replyService;


}
