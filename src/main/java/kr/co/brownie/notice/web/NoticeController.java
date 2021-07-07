package kr.co.brownie.notice.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.brownie.notice.service.NoticePage;
import kr.co.brownie.notice.service.NoticeVO;
import org.springframework.stereotype.Controller;

import kr.co.brownie.notice.service.NoticeService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/notice")
public class NoticeController {
    @Resource(name = "noticeService")
    NoticeService noticeService;

    private int size = 10;

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
    public String noticeAddPost(@RequestParam Map<String, Object> map,Model model,HttpSession session){
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
        String nickName = this.noticeService.selectnickname();
        model.addAttribute("nickName",nickName);
        String id = (String)session.getAttribute("id");
        model.addAttribute("id",id);
        model.addAttribute("noticeVO",noticeVO);
        return "notice/noticeDetail"; // 공지 디테일화면
    }

    @GetMapping(path={"", "/list"})
    public String noticeList(@RequestParam Map<String,Object> map, Model model,HttpSession session) {
        String id = (String)session.getAttribute("id");
        map.put("id",id);
        int total = this.noticeService.selectCount();
        String strPageNum = (String)map.get("pageNum")==null?"1":(String) map.get("pageNum");
        int pageNum = Integer.parseInt(strPageNum);
        map.put("pageNum", pageNum);
        int level = noticeService.selectlevel();
        model.addAttribute("level",level);
        String nickName = this.noticeService.selectnickname();
        List<NoticeVO> noticeVOList = this.noticeService.getNoticelist(map);
        model.addAttribute("noticeVOList",new NoticePage(total, pageNum ,size, noticeVOList));
        model.addAttribute("nickName",nickName);
        model.addAttribute("notice",map.get("notice"));
        model.addAttribute("keyword",map.get("keyword"));
        return "notice/noticeList"; //공지 리스트
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
