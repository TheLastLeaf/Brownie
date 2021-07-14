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
            model.addAttribute("message","alert('로그인 후 이용가능합니다.'); location.href='/notice/list';");
            return "common/message";
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
    public String detail(@PathVariable int board_seq,Model model, HttpSession session) {
        try {
            NoticeVO noticeVO = noticeService.getNotice(board_seq);
            String id = (String) session.getAttribute("id");
            if (noticeVO == null) {
                throw new NullPointerException();
            }
            model.addAttribute("id", id);
            model.addAttribute("noticeVO", noticeVO);
        } catch (NullPointerException | NumberFormatException e) {
            return "redirect:notice/noticeDetail/"+board_seq;
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
        model.addAttribute("notice",notice);
        model.addAttribute("keyword", keyword);
        model.addAttribute("PagingVO", noticeService.selectList(notice, keyword, currentPageNumber));

        return "notice/list"; //공지 리스트
    }

    @GetMapping("/update/{board_seq}")
    public String update(@PathVariable int board_seq,Model model, HttpSession session) {
        try{
            NoticeVO noticeVO = noticeService.getNotice(board_seq);
            String id = (String) session.getAttribute("id");
            if(noticeVO==null){
                throw new NullPointerException();
            }
            model.addAttribute("id",id);
            model.addAttribute("noticeVO", noticeVO);
            if (session.getAttribute("id") == null) {
                return "redirect:/notice/detail/" + board_seq;
            }
        }catch (NullPointerException| NumberFormatException e){
            return "notice/list";
        }
        return "notice/noticeUpdate";
    }

    @PostMapping("/update/{board_seq}")
    public String updatePost(Model model,@PathVariable int board_seq,HttpServletRequest servletRequest) {
        try{
            NoticeVO noticeVO = noticeService.getNotice(board_seq);
            model.addAttribute("noticeVO", noticeVO);
            String id = servletRequest.getParameter("upUserId");
            String title = servletRequest.getParameter("title");
            String content = servletRequest.getParameter("content");
            int update = this.noticeService.updateNotice(id,title,content,board_seq);
            if (update > 0) {
                return "redirect:/notice/detail/" + board_seq;
            }
            if (update != 1) {
                throw new NullPointerException();
            }
        }catch (NullPointerException | NumberFormatException e) {
            return "redirect:/notice/update/" + board_seq;
        }
        return "redirect:/notice/update/" + board_seq;
    }

    @PostMapping("/delete/{board_seq}")
    public String delete(@PathVariable int board_seq) {
        noticeService.deleteNotice(board_seq);
        return "redirect:/notice/list";
    }
}
