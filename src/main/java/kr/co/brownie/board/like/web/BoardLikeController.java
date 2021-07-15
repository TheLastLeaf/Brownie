package kr.co.brownie.board.like.web;

import kr.co.brownie.board.like.service.BoardLikeService;
import kr.co.brownie.board.like.service.BoardLikeVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
@RequestMapping("/board/like")
public class BoardLikeController {
    @Resource(name = "boardLikeService")
    BoardLikeService boardLikeService;

    @ResponseBody
    @PostMapping("/like")
    public String like() {
        return null;
    }

    @ResponseBody
    @PostMapping("/unlike")
    public String unlike() {
        return null;
    }
}
