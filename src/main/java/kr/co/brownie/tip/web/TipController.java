package kr.co.brownie.tip.web;

import kr.co.brownie.leagueoflegends.champions.service.LeagueOfLegendsChampionsService;
import kr.co.brownie.leagueoflegends.versions.service.LeagueOfLegendsVersionsService;
import kr.co.brownie.tip.service.TipReplyVO;
import kr.co.brownie.tip.service.TipService;
import kr.co.brownie.tip.service.TipVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/tip")
public class TipController {
    @Resource(name = "tipService")
    TipService tipService;

    @Resource(name = "leagueOfLegendsVersionsService")
    LeagueOfLegendsVersionsService leagueOfLegendsVersionsService;

    @Resource(name = "leagueOfLegendsChampionsService")
    LeagueOfLegendsChampionsService leagueOfLegendsChampionsService;

    @GetMapping("/write")
    public String write(Model model,
                        HttpServletRequest httpServletRequest) {
        if (httpServletRequest.getSession().getAttribute("id").toString() == null) {
            model.addAttribute("message",
                    "alert(\"로그인 후 작성할 수 있습니다.\")" +
                            "location.href=\"/" + httpServletRequest.getContextPath() + "tip/list\";");
            return "common/message";
        }
        model.addAttribute("leagueOfLegendsChampionsVOList", leagueOfLegendsChampionsService.selectRecentlyChampionsList());

        return "tip/write";
    }

    @PostMapping("/write")
    public String create(HttpServletRequest httpServletRequest) {
        String author = httpServletRequest.getSession().getAttribute("id").toString();
        String champion = httpServletRequest.getParameter("champion");
        String title = httpServletRequest.getParameter("title");
        String content = httpServletRequest.getParameter("content");

        tipService.insert(author, champion, title, content);

        return "redirect:/" + httpServletRequest.getContextPath() + "tip/list";
    }

    @GetMapping({"", "/list"})
    public String list(HttpServletRequest httpServletRequest,
                       Model model) {
        String champion = httpServletRequest.getParameter("champion") == null ? "" : httpServletRequest.getParameter("champion");
        int currentPageNumber;
        try {
            currentPageNumber = Math.max(Integer.parseInt(httpServletRequest.getParameter("currentPage")), 1);
        } catch (NullPointerException | NumberFormatException e) {
            currentPageNumber = 1;
        }

        model.addAttribute("leagueOfLegendsChampionsVOList",
                leagueOfLegendsChampionsService.selectRecentlyChampionsList());
        model.addAttribute("tipPagingVO", tipService.selectList(champion, currentPageNumber));
        model.addAttribute("champion", champion);

        return "tip/list";
    }

    @GetMapping("/details/{board_seq}")
    public String details(@PathVariable String board_seq,
                          Model model,
                          HttpServletRequest httpServletRequest) {

        int seq;
        TipVO tipVO;
        try {
            seq = Integer.parseInt(board_seq);

            tipVO = tipService.select(seq);
            if (tipVO == null) {
                throw new NullPointerException();
            }
            model.addAttribute("tipVO", tipVO);
        } catch (NullPointerException | NumberFormatException e) {
            return "error/404";
        }

        int totalReplyCount = tipVO.getReplyCnt();
        int currentReplyPageNumber;
        try {
            currentReplyPageNumber = Integer.parseInt(httpServletRequest.getParameter("currentReplyPageNumber"));
            if (currentReplyPageNumber < 1 || (totalReplyCount - 1) / tipService.REPLY_PER_PAGE + 1 < currentReplyPageNumber) {
                currentReplyPageNumber = (totalReplyCount - 1) / tipService.REPLY_PER_PAGE + 1;
            }
        } catch (NullPointerException | NumberFormatException e) {
            currentReplyPageNumber = (totalReplyCount - 1) / tipService.REPLY_PER_PAGE + 1;
        }

        model.addAttribute("tipReplyPagingVO", tipService.selectReplyList(seq, currentReplyPageNumber, totalReplyCount));
        return "tip/details";
    }

    @GetMapping("/modify/{board_seq}")
    public String modify(@PathVariable String board_seq,
                         Model model,
                         HttpServletRequest httpServletRequest) {
        try {
            int seq = Integer.parseInt(board_seq);
            String id = httpServletRequest.getSession().getAttribute("id").toString();

            TipVO tipVO = tipService.select(seq);
            if (tipVO == null) {
                throw new NullPointerException();
            } else if (!tipVO.getInUserId().equals(id)) {
                return "error/500";
            }
            model.addAttribute("leagueOfLegendsChampionsVOList",
                    leagueOfLegendsChampionsService.selectRecentlyChampionsList());
            model.addAttribute("tipVO", tipVO);
        } catch (NullPointerException | NumberFormatException e) {
            return "error/404";
        }
        return "tip/modify";
    }

    @PostMapping("/modify/{board_seq}")
    public String update(HttpServletRequest httpServletRequest,
                         @PathVariable String board_seq) {
        try {
            int seq = Integer.parseInt(board_seq);
            String author = httpServletRequest.getSession().getAttribute("id").toString();
            String champion = httpServletRequest.getParameter("champion");
            String title = httpServletRequest.getParameter("title");
            String content = httpServletRequest.getParameter("content");

            TipVO tipVO = tipService.select(seq);
            if (tipVO == null || !tipVO.getInUserId().equals(author)) {
                return "error/500";
            }

            if (tipService.update(seq, author, champion, title, content) != 1) {
                throw new NullPointerException();
            }
        } catch (NullPointerException | NumberFormatException e) {
            return "error/404";
        }
        return "redirect:/" + httpServletRequest.getContextPath() + "tip/list";
    }

    @GetMapping("/delete/{board_seq}")
    public String delete(Model model,
                         HttpServletRequest httpServletRequest,
                         @PathVariable String board_seq) {
        try {
            int seq = Integer.parseInt(board_seq);
            String author = httpServletRequest.getSession().getAttribute("id").toString();

            TipVO tipVO = tipService.select(seq);
            if (tipVO == null || !tipVO.getInUserId().equals(author)) {
                return "error/500";
            }

            if (tipService.delete(seq) != 1) {
                throw new NullPointerException();
            }
        } catch (NullPointerException | NumberFormatException e) {
            return "error/404";
        }
        model.addAttribute("message",
                "alert(\"삭제 완료\");" +
                        "location.href=\"/" + httpServletRequest.getContextPath() + "tip/list\";");
        return "common/message";
    }

    @PostMapping("/details/{board_seq}")
    public String writeReply(Model model,
                             HttpServletRequest httpServletRequest,
                             @PathVariable String board_seq) {
        String author = httpServletRequest.getSession().getAttribute("id").toString();
        int seq;
        try {
            seq = Integer.parseInt(board_seq);
        } catch (NullPointerException | NumberFormatException e) {
            return "error/404";
        }

        String message = httpServletRequest.getParameter("message").trim();
        if (message.length() == 0) {
            model.addAttribute("message", "alert(\"댓글을 입력해주세요.\");history.go(-1);");
            return "common/message";
        }
        String headReplySeq = httpServletRequest.getParameter("headReplySeq") == null ? "" : httpServletRequest.getParameter("headReplySeq");

        int result = tipService.insertReply(seq, author, message, headReplySeq);
        if (result != 1) {
            model.addAttribute("message", "alert(\"댓글 등록 중 문제가 발생했습니다.\");history.go(-1);");
            return "common/message";
        }

        return "redirect:/" + httpServletRequest.getContextPath() + "tip/details/" + board_seq;
    }

    @GetMapping("/details/{board_seq}/delete/{reply_seq}")
    public String deleteReply(Model model,
                              HttpServletRequest httpServletRequest,
                              @PathVariable String board_seq,
                              @PathVariable String reply_seq) {
        int boardSeq;
        int replySeq;
        if (httpServletRequest.getSession().getAttribute("id") != null) {
            try {
                boardSeq = Integer.parseInt(board_seq);
                replySeq = Integer.parseInt(reply_seq);
                String id = httpServletRequest.getSession().getAttribute("id").toString();

                TipReplyVO replyVO = tipService.selectReply(boardSeq, replySeq);
                
                if (id.equals(replyVO.getInUserId())) {
                    if (tipService.deleteReply(replySeq)== 1) {
                        return "redirect:/" + httpServletRequest.getContextPath() + "tip/details/" + board_seq;
                    }
                    model.addAttribute("message", "alert(\"삭제에 실패했습니다.\");history.go(-1);");
                    return "common/message";
                }
            } catch (NullPointerException | NumberFormatException e) {
                return "error/404";
            }
        }
        model.addAttribute("message", "alert(\"권한이 없습니다.\");history.go(-1);");
        return "common/message";
    }
}
