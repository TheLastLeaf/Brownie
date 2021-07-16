package kr.co.brownie.board.web;

import kr.co.brownie.board.hit.service.BoardHitService;
import kr.co.brownie.board.service.BoardService;
import kr.co.brownie.board.service.BoardVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.*;

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
    public String write(HttpSession httpSession) {
        Assert.notNull(httpSession.getAttribute("id"), "로그인이 필요합니다.");

        return "board/notice/write"; // 공지 글쓰기
    }

    @PostMapping("/write")
    public String create(HttpSession httpSession,
                         @RequestParam String title,
                         @RequestParam String content) {
        Assert.notNull(httpSession.getAttribute("id"), "로그인이 필요합니다.");

        Map<String, Object> map = new HashMap<>();
        map.put("userId", httpSession.getAttribute("id"));
        map.put("title", title);
        map.put("content", content);
        map.put("boardKind", "notice");
        Assert.state(this.boardService.insert(map) == 1, "글 작성에 실패하였습니다.");

        return "redirect:/notice/list";
    }

    @GetMapping(path = {"", "/list"})
    public String noticeList(HttpSession httpSession,
                             Model model,
                             @RequestParam(required = false) String keyword,
                             @RequestParam(defaultValue = "1", required = false) int pageNum) {
        Map<String, Object> map = new HashMap<>();
        map.put("userId", httpSession.getAttribute("id"));
        map.put("boardKind", "notice");
        map.put("keyword", keyword);
        map.put("pageNum", pageNum);
        map.put("contentPerPage", this.boardService.CONTENT_PER_PAGE);

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

    @PostMapping("/modify/{boardSeq}")
    public String update(@PathVariable int boardSeq,
                         HttpSession httpSession,
                         @RequestParam Map<String, Object> map) {
        Assert.notNull(httpSession.getAttribute("id"), "로그인이 필요합니다.");
        String userId = httpSession.getAttribute("id").toString();

        map.put("userId", userId);
        map.put("boardSeq", boardSeq);
        map.put("boardKind", "notice");

        BoardVO boardVO = this.boardService.select(map);
        Assert.notNull(boardVO, "해당 글이 없습니다.");
        Assert.state(userId.equals(boardVO.getBoardInUserId()), "작성자만 게시글을 수정할 수 있습니다.");
        Assert.state(this.boardService.update(map) == 1, "수정에 실패했습니다.");

        return "redirect:/notice/list";
    }

    @PostMapping("/delete")
    public String delete(HttpSession httpSession,
                         @RequestParam int boardSeq) {
        Assert.notNull(httpSession.getAttribute("id"), "로그인이 필요합니다.");
        String userId = httpSession.getAttribute("id").toString();

        Map<String, Object> map = new HashMap<>();
        map.put("boardSeq", boardSeq);

        Assert.state(userId.equals(this.boardService.select(map).getBoardInUserId()), "작성자만 게시글을 삭제할 수 있습니다.");
        Assert.state(this.boardService.delete(map) == 1, "삭제에 실패했습니다.");

        return "redirect:/notice/list";
    }
}
