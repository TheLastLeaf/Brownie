package kr.co.brownie.board.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import kr.co.brownie.board.service.BoardService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Resource(name = "boardService")
    BoardService boardService;

    @GetMapping({"", "/freeBoardList"})
    public String freeBoardList() {
        return "board/freeBoardList"; // 자유게시판 리스트 화면
    }

    @GetMapping("/freeBoardDetail")
    public String freeBoardDetail() {
        return "board/freeBoardDetail"; // 자유게시판 리스트 디테일화면
    }

    @GetMapping("/freeBoardWrite")
    public String freeBoardWrite() {
        return "board/freeBoardWrite"; // 자유게시판 글쓰기 화면
    }
}
