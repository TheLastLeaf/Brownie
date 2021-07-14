package kr.co.brownie.notice.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.brownie.notice.service.NoticeVO;
import org.springframework.stereotype.Controller;

import kr.co.brownie.notice.service.NoticeService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("/notice")
public class NoticeController {
    @Resource(name = "noticeService")
    NoticeService noticeService;

    @GetMapping("/add")
    public String noticeAdd(HttpSession session, Model model) {
        String id = (String) session.getAttribute("id");
        model.addAttribute("id", id);
        if (id == null) {
            return "redirect:/notice/list";
        }
        return "notice/noticeAdd"; // 공지 글쓰기
    }

    @PostMapping("/add")
    public String noticeAddPost(HttpServletRequest servletRequest) {
        String id = servletRequest.getParameter("inUserId");
        String title = servletRequest.getParameter("title");
        String content = servletRequest.getParameter("content");
        noticeService.insertNotice(id, title, content);
        return "redirect:" + servletRequest.getContextPath() + "/notice/list";
    }

    @GetMapping("/detail/{board_seq}")
    public String detail(Model model, HttpSession session, @PathVariable String board_seq) {
        try {
            int boardSeq = Integer.parseInt(board_seq);
            NoticeVO noticeVO = noticeService.getNotice(boardSeq);
            String id = (String) session.getAttribute("id");
            if (noticeVO == null) {
                throw new NullPointerException();
            }
            model.addAttribute("id", id);
            model.addAttribute("noticeVO", noticeVO);
        } catch (NullPointerException | NumberFormatException e) {
            return "error/404";
        }
        return "notice/noticeDetail"; // 공지 디테일화면
    }

    @GetMapping(path = {"", "/list"})
    public String noticeList(HttpServletRequest httpServletRequest, Model model) {
        String notice = httpServletRequest.getParameter("notice") == null ? "" : httpServletRequest.getParameter("notice");
        String keyword = httpServletRequest.getParameter("keyword") == null ? "" : httpServletRequest.getParameter("keyword");
        int currentPageNumber;
        try {
            currentPageNumber = Math.max(Integer.parseInt(httpServletRequest.getParameter("pageNum")), 1);
        } catch (NullPointerException | NumberFormatException e) {
            currentPageNumber = 1;
        }

        model.addAttribute("keyword", keyword);
        model.addAttribute("PagingVO", noticeService.selectList(notice, keyword, currentPageNumber));

        return "notice/list"; //공지 리스트
    }

    @GetMapping("/update/{board_seq}")
    public String update(Model model, HttpSession session,@PathVariable String board_seq) {
        try{
            int boardSeq = Integer.parseInt(board_seq);
            NoticeVO noticeVO = noticeService.getNotice(boardSeq);
            String id = (String) session.getAttribute("id");
            if(noticeVO==null){
                throw new NullPointerException();
            }
            model.addAttribute("id",id);
            model.addAttribute("noticeVO", noticeVO);
            if (session.getAttribute("id") == null) {
                return "redirect:/notice/detail?boardSeq=" + boardSeq;
            }
        }catch (NullPointerException| NumberFormatException e){
            return "error/404";
        }
        return "notice/noticeUpdate";
    }

    @PostMapping("/update/{board_seq}")
    public String updatePost(Model model,@PathVariable String board_seq,HttpServletRequest servletRequest) {
        int boardSeq = Integer.parseInt(board_seq);
        try{
            NoticeVO noticeVO = noticeService.getNotice(boardSeq);
            model.addAttribute("noticeVO", noticeVO);
            String id = servletRequest.getParameter("upUserId");
            String title = servletRequest.getParameter("title");
            String content = servletRequest.getParameter("content");
            int update = this.noticeService.updateNotice(id,title,content,boardSeq);
            if (update > 0) {
                return "redirect:/notice/detail/" + boardSeq;
            }
            if (this.noticeService.updateNotice(id,title,content,boardSeq) != 1) {
                throw new NullPointerException();
            }
        }catch (NullPointerException | NumberFormatException e) {
            return "error/404";
        }
        return "redirect:/notice/update/" + boardSeq;
    }

    @PostMapping("/delete")
    public String delete(@RequestParam Map<String, Object> map, Model model) {
        String a = map.get("boardSeq").toString();
        int b = Integer.parseInt(a);
        noticeService.deleteNotice(b);
        return "redirect:/notice/list";
    }
}
