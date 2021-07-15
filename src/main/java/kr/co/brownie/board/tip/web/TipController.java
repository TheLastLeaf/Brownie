package kr.co.brownie.board.tip.web;

import kr.co.brownie.board.service.BoardService;
import kr.co.brownie.board.service.BoardVO;
import kr.co.brownie.leagueoflegends.champions.service.LeagueOfLegendsChampionsService;
import kr.co.brownie.board.reply.service.ReplyService;
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

    @Resource(name = "leagueOfLegendsChampionsService")
    LeagueOfLegendsChampionsService leagueOfLegendsChampionsService;

    @GetMapping("/write")
    public String write(Model model,
                        HttpServletRequest httpServletRequest) {
        Assert.notNull(httpServletRequest.getSession().getAttribute("id"), "로그인이 필요합니다.");
        model.addAttribute("leagueOfLegendsChampionsVOList", leagueOfLegendsChampionsService.selectRecentlyChampionsList());

        return "tip/write";
    }

    @PostMapping("/write")
    public String create(HttpServletRequest httpServletRequest,
                         @RequestParam String champion,
                         @RequestParam String title,
                         @RequestParam String content) {
        Map<String, Object> map = new HashMap<>();
        Assert.notNull(httpServletRequest.getSession().getAttribute("id"), "로그인이 필요합니다.");
        map.put("userId", httpServletRequest.getSession().getAttribute("id").toString());
        map.put("title", title);
        map.put("content", content);
        map.put("boardKind", "tip");
        map.put("boardCategory", champion);
        System.out.println(map);
        Assert.state(boardService.insert(map) == 1, "글 작성에 실패하였습니다.");

        return "redirect:/" + httpServletRequest.getContextPath() + "tip/list";
    }

    @GetMapping({"", "/list"})
    public String list(Model model,
                       @RequestParam(defaultValue = "", required = false) String champion,
                       @RequestParam(defaultValue = "1", required = false) int pageNum) {
        Map<String, Object> map = new HashMap<>();
        map.put("boardKind", "tip");
        map.put("boardCategory", champion);
        map.put("pageNum", pageNum);
        map.put("contentPerPage", boardService.CONTENT_PER_PAGE);

        model.addAttribute("leagueOfLegendsChampionsVOList", leagueOfLegendsChampionsService.selectRecentlyChampionsList());
        model.addAttribute("boardPagingVO", boardService.selectPagingList(map));
        model.addAttribute("champion", champion);

        return "tip/list";
    }

    @GetMapping("/details/{boardSeq}")
    public String details(@PathVariable int boardSeq,
                          Model model,
                          HttpServletRequest httpServletRequest) {
        Map<String, Object> map = new HashMap<>();
        map.put("boardKind", "tip");
        map.put("boardSeq", boardSeq);

        BoardVO boardVO = boardService.select(map);

        model.addAttribute("boardVO", boardVO);
        Assert.notNull(boardVO, "해당 글이 없습니다.");

        int totalContent = (boardVO.getReplyCnt());
        int pageNum;
        try {
            pageNum = Integer.parseInt(httpServletRequest.getParameter("pageNum"));
            if (pageNum < 1 || (totalContent - 1) / replyService.CONTENT_PER_PAGE + 1 < pageNum) {
                pageNum = (totalContent - 1) / replyService.CONTENT_PER_PAGE + 1;
            }
        } catch (NullPointerException | NumberFormatException e) {
            pageNum = (totalContent - 1) / replyService.CONTENT_PER_PAGE + 1;
        }

        map.put("contentPerPage", replyService.CONTENT_PER_PAGE);
        map.put("pageNum", pageNum);
        map.put("totalContent", totalContent);

        model.addAttribute("replyPagingVO", replyService.selectPagingList(map));
        return "tip/details";
    }

    @GetMapping("/modify/{boardSeq}")
    public String modify(@PathVariable int boardSeq,
                         Model model,
                         HttpServletRequest httpServletRequest) {
        Assert.notNull(httpServletRequest.getSession().getAttribute("id"), "로그인이 필요합니다.");
        String id = httpServletRequest.getSession().getAttribute("id").toString();

        Map<String, Object> map = new HashMap<>();
        map.put("boardKind", "tip");
        map.put("boardSeq", boardSeq);

        BoardVO boardVO = boardService.select(map);
        Assert.notNull(boardVO, "해당 글이 없습니다.");
        Assert.state(boardVO.getBoardInUserId().equals(id), "작성자만 게시글을 수정할 수 있습니다.");

        model.addAttribute("boardVO", boardVO);
        model.addAttribute("leagueOfLegendsChampionsVOList",
                leagueOfLegendsChampionsService.selectRecentlyChampionsList());

        return "tip/modify";
    }

    @PostMapping("/modify/{boardSeq}")
    public String update(HttpServletRequest httpServletRequest,
                         @PathVariable int boardSeq,
                         @RequestParam Map<String, Object> map) {
        Assert.notNull(httpServletRequest.getSession().getAttribute("id"), "로그인이 필요합니다.");
        String userId = httpServletRequest.getSession().getAttribute("id").toString();
        map.put("boardSeq", boardSeq);
        map.put("boardKind", "tip");
        map.put("userId", userId);

        System.out.println(map);

        BoardVO boardVO = boardService.select(map);
        Assert.notNull(boardVO, "해당 글이 없습니다.");
        Assert.state(userId.equals(boardVO.getBoardInUserId()), "작성자만 게시글을 수정할 수 있습니다.");
        Assert.state(boardService.update(map) == 1, "수정에 실패했습니다.");

        return "redirect:/" + httpServletRequest.getContextPath() + "tip/list";
    }

    @GetMapping("/delete")
    public String delete(HttpServletRequest httpServletRequest,
                         @RequestParam Map<String, Object> map) {
        Assert.notNull(httpServletRequest.getSession().getAttribute("id"), "로그인이 필요합니다.");
        String userId = httpServletRequest.getSession().getAttribute("id").toString();

        Assert.state(userId.equals(boardService.select(map).getBoardInUserId()), "작성자만 게시글을 삭제할 수 있습니다.");
        Assert.state(boardService.delete(map) == 1, "삭제에 실패했습니다.");

        return "redirect:/tip/list";
    }

    @PostMapping("/details/{boardSeq}")
    public String writeReply(HttpServletRequest httpServletRequest,
                             @PathVariable int boardSeq,
                             @RequestParam String message,
                             @RequestParam(defaultValue = "", required = false) String headReplySeq) {
        Map<String, Object> map = new HashMap<>();
        Assert.notNull(httpServletRequest.getSession().getAttribute("id"), "로그인이 필요합니다.");
        String userId = httpServletRequest.getSession().getAttribute("id").toString();
        message = message.trim();

        Assert.state(message.length() != 0, "댓글을 입력해주세요.");

        map.put("boardSeq", boardSeq);
        map.put("userId", userId);
        map.put("replyContent", message);
        map.put("headReplySeq", headReplySeq);

        Assert.state(replyService.insert(map) == 1, "댓글 등록 중 문제가 발생했습니다.");

        return "redirect:/" + httpServletRequest.getContextPath() + "tip/details/" + boardSeq;
    }

    @GetMapping("/details/{boardSeq}/delete/{replySeq}")
    public String deleteReply(HttpSession httpSession,
                              @PathVariable int boardSeq,
                              @PathVariable int replySeq) {
        Map<String, Object> map = new HashMap<>();
        Assert.notNull(httpSession.getAttribute("id"), "로그인이 필요합니다.");
        String id = httpSession.getAttribute("id").toString();

        map.put("boardSeq", boardSeq);
        map.put("replySeq", replySeq);

        Assert.state(id.equals(replyService.select(map).getReplyInUserId()), "작성자만 댓글을 삭제할 수 있습니다.");
        Assert.state(replyService.delete(map) == 1, "댓글 삭제 중 문제가 발생했습니다.");

        return "redirect:/" + httpSession.getServletContext().getContextPath() + "tip/details/" + boardSeq;
    }
}
