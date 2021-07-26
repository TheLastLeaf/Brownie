package kr.co.brownie.board.web;

import kr.co.brownie.board.hit.service.BoardHitService;
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
@RequestMapping("/notice")
public class NoticeController {
    @Resource(name = "boardService")
    BoardService boardService;

    @Resource(name = "boardHitService")
    BoardHitService boardHitService;

    @GetMapping("/write")
    public String write(HttpSession httpSession,
                        Model model) {
        Assert.notNull(httpSession.getAttribute("id"), "로그인이 필요합니다.");
        model.addAttribute("boardKind", "notice");

        return "board/notice/write"; // 공지 글쓰기
    }

    @GetMapping(path = {"", "/list"})
    public String noticeList(HttpSession httpSession,
                             Model model,
                             @RequestParam(required = false) String keyword,
                             @RequestParam(defaultValue = "1", required = false) int pageNum,
                             @RequestParam(required = false) String type,
                             @RequestParam(required = false) String query) {
        Map<String, Object> map = new HashMap<>();
        map.put("userId", httpSession.getAttribute("id"));
        map.put("boardKind", "notice");
        map.put("title", keyword);
        map.put("pageNum", pageNum);
        map.put("contentPerPage", this.boardService.CONTENT_PER_PAGE);

        if (type != null && !"".equals(type) && query != null && !"".equals(query)) {
            map.put(type, query);

            model.addAttribute("type", type);
            model.addAttribute("query", query);
        }

        model.addAttribute("boardPagingVO", boardService.selectPagingList(map));

        return "board/notice/list"; //공지 리스트
    }

    @GetMapping("/details/{boardSeq}")
    public String detail(@PathVariable int boardSeq,
                         HttpServletRequest httpServletRequest,
                         Model model) {
        Map<String, Object> map = new HashMap<>();
        map.put("userId", httpServletRequest.getSession().getAttribute("id"));
        map.put("boardKind", "notice");
        map.put("boardSeq", boardSeq);
        map.put("ip", httpServletRequest.getRemoteAddr());

        this.boardHitService.merge(map);

        BoardVO boardVO = this.boardService.select(map);
        Assert.notNull(boardVO, "해당 글이 없습니다.");
        model.addAttribute("boardVO", boardVO);
        model.addAttribute("prevNextBoardVO", this.boardService.selectPrevNextList(map));

        return "board/notice/details"; // 공지 디테일화면
    }

    @GetMapping("/modify/{boardSeq}")
    public String modify(@PathVariable int boardSeq,
                         HttpSession httpSession,
                         Model model) {
        Assert.notNull(httpSession.getAttribute("id"), "로그인이 필요합니다.");

        Map<String, Object> map = new HashMap<>();
        map.put("boardKind", "notice");
        map.put("boardSeq", boardSeq);

        BoardVO boardVO = this.boardService.select(map);
        Assert.notNull(boardVO, "해당 글이 없습니다.");
        Assert.state(httpSession.getAttribute("id").toString().equals(boardVO.getBoardInUserId()),
                "작성자만 게시글을 수정할 수 있습니다.");

        model.addAttribute("boardVO", boardVO);

        return "board/notice/modify";
    }
}
