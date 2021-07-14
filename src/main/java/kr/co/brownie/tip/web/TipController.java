package kr.co.brownie.tip.web;

import kr.co.brownie.leagueoflegends.champions.service.LeagueOfLegendsChampionsService;
import kr.co.brownie.tip.service.TipService;
import kr.co.brownie.tip.service.TipVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

@Controller
@RequestMapping("/tip")
public class TipController {
    @Resource(name = "tipService")
    TipService tipService;

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
                         @RequestParam Map<String, Object> map) {
        Assert.notNull(httpServletRequest.getSession().getAttribute("id"), "로그인이 필요합니다.");
        map.put("author", httpServletRequest.getSession().getAttribute("id").toString());
        tipService.insert(map);
        return "redirect:/" + httpServletRequest.getContextPath() + "tip/list";
    }

    @GetMapping({"", "/list"})
    public String list(Model model,
                       @RequestParam(defaultValue = "", required = false) String champion,
                       @RequestParam(defaultValue = "1", required = false) int currentPageNumber) {
        Map<String, Object> map = new HashMap<>();
        map.put("champion", champion);
        map.put("currentPageNumber", currentPageNumber);
        map.put("contentPerPage", tipService.CONTENT_PER_PAGE);

        model.addAttribute("leagueOfLegendsChampionsVOList", leagueOfLegendsChampionsService.selectRecentlyChampionsList());
        model.addAttribute("tipPagingVO", tipService.selectList(map));
        model.addAttribute("champion", champion);

        return "tip/list";
    }

    @GetMapping("/details/{board_seq}")
    public String details(@PathVariable int board_seq,
                          Model model,
                          HttpServletRequest httpServletRequest) {
        Map<String, Object> map = new HashMap<>();
        map.put("boardSeq", board_seq);
        model.addAttribute("tipVO", tipService.select(map));

        int totalReplyCount = ((TipVO) Objects.requireNonNull(model.getAttribute("tipVO"))).getReplyCnt();
        int currentReplyPageNumber;
        try {
            currentReplyPageNumber = Integer.parseInt(httpServletRequest.getParameter("currentReplyPageNumber"));
            if (currentReplyPageNumber < 1 || (totalReplyCount - 1) / tipService.REPLY_PER_PAGE + 1 < currentReplyPageNumber) {
                currentReplyPageNumber = (totalReplyCount - 1) / tipService.REPLY_PER_PAGE + 1;
            }
        } catch (NullPointerException | NumberFormatException e) {
            currentReplyPageNumber = (totalReplyCount - 1) / tipService.REPLY_PER_PAGE + 1;
        }

        map.put("replyPerPage", tipService.REPLY_PER_PAGE);
        map.put("currentReplyPageNumber", currentReplyPageNumber);
        map.put("totalReplyCount", totalReplyCount);

        model.addAttribute("tipReplyPagingVO", tipService.selectReplyList(map));
        return "tip/details";
    }

    @GetMapping("/modify/{board_seq}")
    public String modify(@PathVariable int board_seq,
                         Model model,
                         HttpServletRequest httpServletRequest) {
        Map<String, Object> map = new HashMap<>();
        Assert.notNull(httpServletRequest.getSession().getAttribute("id"), "로그인이 필요합니다.");
        String id = httpServletRequest.getSession().getAttribute("id").toString();
        map.put("boardSeq", board_seq);

        model.addAttribute("tipVO", tipService.select(map));
        Assert.state(((TipVO) Objects.requireNonNull(model.getAttribute("tipVO"))).getInUserId().equals(id), "작성자만 게시글을 수정할 수 있습니다.");

        model.addAttribute("leagueOfLegendsChampionsVOList",
                leagueOfLegendsChampionsService.selectRecentlyChampionsList());
        return "tip/modify";
    }

    @PostMapping("/modify/{board_seq}")
    public String update(HttpServletRequest httpServletRequest,
                         @PathVariable int board_seq,
                         @RequestParam Map<String, Object> map) {
        Assert.notNull(httpServletRequest.getSession().getAttribute("id"), "로그인이 필요합니다.");
        String author = httpServletRequest.getSession().getAttribute("id").toString();
        map.put("boardSeq", board_seq);
        map.put("author", author);

        TipVO tipVO = tipService.select(map);
        Assert.notNull(tipVO, "해당 글이 없습니다.");
        Assert.state(author.equals(tipVO.getInUserId()), "작성자만 게시글을 수정할 수 있습니다.");
        Assert.state(tipService.update(map) == 1, "수정에 실패했습니다.");

        return "redirect:/" + httpServletRequest.getContextPath() + "tip/list";
    }

    @GetMapping("/delete")
    public String delete(HttpServletRequest httpServletRequest,
                         @RequestParam Map<String, Object> map) {
        Assert.notNull(httpServletRequest.getSession().getAttribute("id"), "로그인이 필요합니다.");
        String author = httpServletRequest.getSession().getAttribute("id").toString();

        Assert.state(author.equals(tipService.select(map).getInUserId()), "작성자만 게시글을 수정할 수 있습니다.");
        Assert.state(tipService.update(map) == 1, "삭제에 실패했습니다.");

        return "redirect:/tip/list";
    }

    @PostMapping("/details/{board_seq}")
    public String writeReply(HttpServletRequest httpServletRequest,
                             @PathVariable int board_seq,
                             @RequestParam String message,
                             @RequestParam(defaultValue = "", required = false) String headReplySeq) {
        Map<String, Object> map = new HashMap<>();
        Assert.notNull(httpServletRequest.getSession().getAttribute("id"), "로그인이 필요합니다.");
        String author = httpServletRequest.getSession().getAttribute("id").toString();
        message = message.trim();

        Assert.state(message.length() != 0, "댓글을 입력해주세요.");

        map.put("boardSeq", board_seq);
        map.put("author", author);
        map.put("message", message);
        map.put("headReplySeq", headReplySeq);

        Assert.state(tipService.insertReply(map) == 1, "댓글 등록 중 문제가 발생했습니다.");

        return "redirect:/" + httpServletRequest.getContextPath() + "tip/details/" + board_seq;
    }

    @GetMapping("/details/{board_seq}/delete/{reply_seq}")
    public String deleteReply(HttpServletRequest httpServletRequest,
                              @PathVariable int board_seq,
                              @PathVariable int reply_seq) {
        Map<String, Object> map = new HashMap<>();
        Assert.notNull(httpServletRequest.getSession().getAttribute("id"), "로그인이 필요합니다.");
        String id = httpServletRequest.getSession().getAttribute("id").toString();

        map.put("boardSeq", board_seq);
        map.put("replySeq", reply_seq);

        Assert.state(id.equals(tipService.selectReply(map).getInUserId()), "작성자만 댓글을 삭제할 수 있습니다.");
        Assert.state(tipService.deleteReply(map) == 1, "댓글 삭제 중 문제가 발생했습니다.");

        return "redirect:/" + httpServletRequest.getContextPath() + "tip/details/" + board_seq;
    }
}
