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
    public String noticeAdd(HttpSession session, Model model){
        String id = (String)session.getAttribute("id");
        model.addAttribute("id",id);
        if(id == null){
            return "redirect:/notice/list";
        }
        return "notice/noticeAdd"; // 공지 글쓰기
    }

    @PostMapping("/add")
    public String noticeAddPost(@RequestParam Map<String, Object> map,Model model,HttpSession session, HttpServletRequest servletRequest){
        String content = servletRequest.getParameter("content");
        map.put("content",content);
        noticeService.insertNotice(map);
        String id = (String)session.getAttribute("id");
        model.addAttribute("id",id);
        if(map.get("boardSeq")==null){
            return "redirect:/notice/list";
        }else{
            return "redirect:/notice/detail?boardSeq="+map.get("boardSeq");
        }
    }

    @GetMapping("/detail")
    public String detail(@RequestParam Map<String, Object> map, Model model, HttpSession session) {
        String a = map.get("boardSeq").toString();
        int boardSeq = Integer.parseInt(a);
        NoticeVO noticeVO = noticeService.getNotice(boardSeq);
        String usernick = noticeVO.getInUserId();
        String nickName = this.noticeService.selectnickname(usernick);
        model.addAttribute("nickName",nickName);
        String id = (String)session.getAttribute("id");
        model.addAttribute("id",id);
        model.addAttribute("noticeVO",noticeVO);
        return "notice/noticeDetail"; // 공지 디테일화면
    }

    @GetMapping(path={"", "/list"})
    public String noticeList(HttpServletRequest httpServletRequest, Model model) {
        String notice_ = httpServletRequest.getParameter("notice");
        String notice = "";
        if(notice_ != null && notice_.equals("")) {
            notice = notice_;
        }
        String keyword = httpServletRequest.getParameter("keyword") == null ? "" : httpServletRequest.getParameter("keyword");
        int currentPageNumber;
        try {
            currentPageNumber = Math.max(Integer.parseInt(httpServletRequest.getParameter("pageNum")), 1);
        } catch (NullPointerException | NumberFormatException e) {
            currentPageNumber = 1;
        }

        model.addAttribute("keyword", keyword);
        model.addAttribute("PagingVO", noticeService.selectList(notice,keyword, currentPageNumber));

        return "notice/list"; //공지 리스트
    }

    @GetMapping("/update")
    public String update(@RequestParam Map<String,Object> map, Model model,HttpSession session){
        String a = map.get("boardSeq").toString();
        int boardSeq = Integer.parseInt(a);
        NoticeVO noticeVO = noticeService.getNotice(boardSeq);
        model.addAttribute("noticeVO",noticeVO);
        if(session.getAttribute("id") == null){
            return "redirect:/notice/detail?boardSeq="+boardSeq;
        }
        return "notice/noticeUpdate";
    }

    @PostMapping("/update")
    public String updatePost(@RequestParam Map<String,Object> map, Model model){
        String a = map.get("boardSeq").toString();
        int boardSeq = Integer.parseInt(a);
        NoticeVO noticeVO = noticeService.getNotice(boardSeq);
        model.addAttribute("noticeVO",noticeVO);
        int update = this.noticeService.updateNotice(map);
        if(update>0){
            return "redirect:/notice/detail?boardSeq="+boardSeq;
        }else{
            return "redirect:/notice/update?boardSeq="+boardSeq;
        }
    }

    @PostMapping("/delete")
    public String delete(@RequestParam Map<String,Object> map, Model model){
        String a = map.get("boardSeq").toString();
        int b = Integer.parseInt(a);
        noticeService.deleteNotice(b);
        return "redirect:/notice/list";
    }
}
