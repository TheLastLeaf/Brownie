package kr.co.brownie.board.web;

import kr.co.brownie.board.hit.service.BoardHitService;
import kr.co.brownie.board.reply.service.ReplyService;
import kr.co.brownie.board.service.BoardService;
import kr.co.brownie.board.service.BoardVO;
import kr.co.brownie.leagueoflegends.champions.service.LeagueOfLegendsChampionsService;
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
@RequestMapping("/tip")
public class TipController {
    @Resource(name = "boardService")
    BoardService boardService;

    @Resource(name = "replyService")
    ReplyService replyService;

    @Resource(name="boardHitService")
    BoardHitService boardHitService;

    @Resource(name = "leagueOfLegendsChampionsService")
    LeagueOfLegendsChampionsService leagueOfLegendsChampionsService;

    @GetMapping("/write")
    public String write(HttpSession httpSession,
                        Model model) {
        Assert.notNull(httpSession.getAttribute("id"), "로그인이 필요합니다.");
        model.addAttribute("leagueOfLegendsChampionsVOList", this.leagueOfLegendsChampionsService.selectRecentlyChampionsList());

        return "tip/write";
    }

    @PostMapping("/write")
    public String create(HttpSession httpSession,
                         @RequestParam String champion,
                         @RequestParam String title,
                         @RequestParam String content) {
        Map<String, Object> map = new HashMap<>();
        Assert.notNull(httpSession.getAttribute("id"), "로그인이 필요합니다.");
        map.put("userId", httpSession.getAttribute("id").toString());
        map.put("title", title);
        map.put("content", content);
        map.put("boardKind", "tip");
        map.put("boardCategory", champion);
        Assert.state(this.boardService.insert(map) == 1, "글 작성에 실패하였습니다.");

        return "redirect:/tip/list";
    }

    @GetMapping({"", "/list"})
    public String list(HttpSession httpSession,
                       Model model,
                       @RequestParam(defaultValue = "", required = false) String champion,
                       @RequestParam(defaultValue = "1", required = false) int pageNum) {
        Map<String, Object> map = new HashMap<>();
        map.put("userId", httpSession.getAttribute("id"));
        map.put("boardKind", "tip");
        map.put("boardCategory", champion);
        map.put("pageNum", pageNum);
        map.put("contentPerPage", this.boardService.CONTENT_PER_PAGE);

        model.addAttribute("leagueOfLegendsChampionsVOList", this.leagueOfLegendsChampionsService.selectRecentlyChampionsList());
        model.addAttribute("boardPagingVO", boardService.selectPagingList(map));
        model.addAttribute("champion", champion);

        return "tip/list";
    }

    @GetMapping("/details/{boardSeq}")
    public String details(@PathVariable int boardSeq,
                          HttpServletRequest httpServletRequest,
                          Model model) {
        Map<String, Object> map = new HashMap<>();
        map.put("userId", httpServletRequest.getSession().getAttribute("id"));
        map.put("boardKind", "tip");
        map.put("boardSeq", boardSeq);
        map.put("ip", httpServletRequest.getRemoteAddr());

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

        return "tip/details";
    }

    @GetMapping("/modify/{boardSeq}")
    public String modify(@PathVariable int boardSeq,
                         HttpSession httpSession,
                         Model model) {
        Assert.notNull(httpSession.getAttribute("id"), "로그인이 필요합니다.");

        Map<String, Object> map = new HashMap<>();
        map.put("boardKind", "tip");
        map.put("boardSeq", boardSeq);

        BoardVO boardVO = this.boardService.select(map);
        Assert.notNull(boardVO, "해당 글이 없습니다.");
        Assert.state(httpSession.getAttribute("id").toString().equals(boardVO.getBoardInUserId()),
                "작성자만 게시글을 수정할 수 있습니다.");

        model.addAttribute("boardVO", boardVO);
        model.addAttribute("leagueOfLegendsChampionsVOList",
                this.leagueOfLegendsChampionsService.selectRecentlyChampionsList());

        return "tip/modify";
    }

    @PostMapping("/modify/{boardSeq}")
    public String update(@PathVariable int boardSeq,
                         HttpSession httpSession,
                         @RequestParam Map<String, Object> map) {
        Assert.notNull(httpSession.getAttribute("id"), "로그인이 필요합니다.");
        String userId = httpSession.getAttribute("id").toString();
        map.put("boardSeq", boardSeq);
        map.put("boardKind", "tip");
        map.put("userId", userId);

        BoardVO boardVO = this.boardService.select(map);
        Assert.notNull(boardVO, "해당 글이 없습니다.");
        Assert.state(userId.equals(boardVO.getBoardInUserId()), "작성자만 게시글을 수정할 수 있습니다.");
        Assert.state(this.boardService.update(map) == 1, "수정에 실패했습니다.");

        return "redirect:/tip/list";
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

        return "redirect:/tip/list";
    }

    @PostMapping("/details/{boardSeq}")
    public String writeReply(HttpSession httpSession,
                             @PathVariable int boardSeq,
                             @RequestParam String message,
                             @RequestParam(defaultValue = "", required = false) String headReplySeq) {
        Assert.notNull(httpSession.getAttribute("id"), "로그인이 필요합니다.");

        message = message.trim();
        Assert.state(message.length() != 0, "댓글을 입력해주세요.");

        Map<String, Object> map = new HashMap<>();
        map.put("boardSeq", boardSeq);
        map.put("userId", httpSession.getAttribute("id"));
        map.put("replyContent", message);
        map.put("headReplySeq", headReplySeq);

        Assert.state(this.replyService.insert(map) == 1, "댓글 등록 중 문제가 발생했습니다.");

        return String.format("redirect:/tip/details/%d", boardSeq);
    }

    @PostMapping("/details/{boardSeq}/reply/delete")
    public String deleteReply(@PathVariable int boardSeq,
                              HttpSession httpSession,
                              @RequestParam int replySeq) {
        Assert.notNull(httpSession.getAttribute("id"), "로그인이 필요합니다.");
        String id = httpSession.getAttribute("id").toString();

        Map<String, Object> map = new HashMap<>();
        map.put("boardSeq", boardSeq);
        map.put("replySeq", replySeq);

        Assert.state(id.equals(this.replyService.select(map).getReplyInUserId()), "작성자만 댓글을 삭제할 수 있습니다.");
        Assert.state(this.replyService.delete(map) == 1, "댓글 삭제 중 문제가 발생했습니다.");

        return String.format("redirect:/tip/details/%d", boardSeq);
    }
}
