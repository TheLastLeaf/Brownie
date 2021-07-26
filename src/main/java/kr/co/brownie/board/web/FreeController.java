package kr.co.brownie.board.web;

import kr.co.brownie.board.hit.service.BoardHitService;
import kr.co.brownie.board.reply.service.ReplyService;
import kr.co.brownie.board.service.BoardService;
import kr.co.brownie.board.service.BoardVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/free")
public class FreeController {
    @Resource(name = "boardService")
    BoardService boardService;

    @Resource(name = "replyService")
    ReplyService replyService;

    @Resource(name = "boardHitService")
    BoardHitService boardHitService;


    @GetMapping("/write")
    public String write(HttpSession httpSession,
                        Model model) {
        Assert.notNull(httpSession.getAttribute("id"), "로그인이 필요합니다.");
        model.addAttribute("boardKind", "free");

        return "board/free/write";
    }

    @GetMapping(path = {"", "/list"})
    public String list(HttpSession httpSession,
                       Model model,
                       @RequestParam(defaultValue = "1", required = false) int pageNum,
                       @RequestParam(required = false) String type,
                       @RequestParam(required = false) String query) {
        Map<String, Object> map = new HashMap<>();
        map.put("userId", httpSession.getAttribute("id"));
        map.put("boardKind", "free");
        map.put("pageNum", pageNum);
        map.put("contentPerPage", this.boardService.CONTENT_PER_PAGE);
        map.put("days", 30);
        map.put("limit", 5);

        if (type != null && !"".equals(type) && query != null && !"".equals(query)) {
            map.put(type, query);

            model.addAttribute("type", type);
            model.addAttribute("query", query);
        }

        model.addAttribute("boardPagingVO", boardService.selectPagingList(map));
        model.addAttribute("boardVOListOrderByLike", boardService.selectListOrderByLike(map));

        return "board/free/list";
    }

    @GetMapping("/details/{boardSeq}")
    public String details(@PathVariable int boardSeq,
                          HttpServletRequest httpServletRequest,
                          Model model) {
        Map<String, Object> map = new HashMap<>();
        map.put("userId", httpServletRequest.getSession().getAttribute("id"));
        map.put("boardKind", "free");
        map.put("boardSeq", boardSeq);
        map.put("ip", httpServletRequest.getRemoteAddr());
        map.put("days", 30);
        map.put("limit", 5);

        this.boardHitService.merge(map);

        BoardVO boardVO = this.boardService.select(map);
        Assert.notNull(boardVO, "해당 글이 없습니다.");
        model.addAttribute("boardVO", boardVO);

        int totalContent = (boardVO.getReplyCnt());
        int pageNum;
        try {
            pageNum = Integer.parseInt(httpServletRequest.getParameter("pageNum"));
            if (pageNum < 1 || (totalContent - 1) / this.replyService.CONTENT_PER_PAGE + 1 < pageNum) {
                pageNum = (totalContent - 1) / this.replyService.CONTENT_PER_PAGE + 1;
            }
        } catch (NullPointerException | NumberFormatException e) {
            pageNum = (totalContent - 1) / this.replyService.CONTENT_PER_PAGE + 1;
        }

        map.put("contentPerPage", this.replyService.CONTENT_PER_PAGE);
        map.put("pageNum", pageNum);
        map.put("totalContent", totalContent);

        model.addAttribute("replyPagingVO", this.replyService.selectPagingList(map));
        model.addAttribute("prevNextBoardVO", this.boardService.selectPrevNextList(map));

        System.out.println(map);

        model.addAttribute("boardVOListOrderByLike", this.boardService.selectListOrderByLike(map));

        return "board/free/details";
    }

    @GetMapping("/modify/{boardSeq}")
    public String modify(@PathVariable int boardSeq,
                         HttpSession httpSession,
                         Model model) {
        Assert.notNull(httpSession.getAttribute("id"), "로그인이 필요합니다.");

        Map<String, Object> map = new HashMap<>();
        map.put("boardKind", "free");
        map.put("boardSeq", boardSeq);

        BoardVO boardVO = this.boardService.select(map);
        Assert.notNull(boardVO, "해당 글이 없습니다.");
        Assert.state(httpSession.getAttribute("id").toString().equals(boardVO.getBoardInUserId()),
                "작성자만 게시글을 수정할 수 있습니다.");

        model.addAttribute("boardVO", boardVO);

        return "board/free/modify";
    }
}
