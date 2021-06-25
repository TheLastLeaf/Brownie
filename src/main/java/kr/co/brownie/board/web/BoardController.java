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

    @GetMapping("/categories-grid")
    public String categories_grid() {
        return "board/categories-grid";
    }

    @GetMapping
    public String main() {
        return list();
    }

    @GetMapping("/list")
    public String list() {
        return "board/list";
    }

    @GetMapping("/details-post-default")
    public String details_post_default() {
        return "board/details-post-default";
    }

    @GetMapping("/details-post-gallery")
    public String details_post_gallery() {
        return "board/details-post-gallery";
    }

    @GetMapping("/details-post-review")
    public String details_post_review() {
        return "board/details-post-review";
    }

    @GetMapping("/typography")
    public String typography() {
        return "board/typography";
    }
}
