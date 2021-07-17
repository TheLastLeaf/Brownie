package kr.co.brownie.board.web;

import kr.co.brownie.board.reply.service.ReplyService;
import kr.co.brownie.board.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Resource(name = "boardService")
    BoardService boardService;

    @Resource(name = "replyService")
    ReplyService replyService;
}
