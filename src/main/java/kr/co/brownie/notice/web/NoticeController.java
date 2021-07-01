package kr.co.brownie.notice.web;

import javax.annotation.Resource;

import kr.co.brownie.notice.service.NoticeVO;
import org.springframework.stereotype.Controller;

import kr.co.brownie.notice.service.NoticeService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/notice")
public class NoticeController {
    @Resource(name = "noticeService")
    NoticeService noticeService;

    @GetMapping("/add")
    public String noticeAdd() {
        return "notice/noticeAdd"; // 공지 글쓰기
    }

    @GetMapping("/detail")
    public String detail(@RequestParam Map<String, Object> map, Model model) {

        return "notice/noticeDetail"; // 공지 디테일화면
    }

    @GetMapping(path={"", "/list"})
    public String noticeList(@RequestParam Map<String,Object> map, Model model) {
        List<NoticeVO> noticeVOList = this.noticeService.getNoticelist(map);
        model.addAttribute("noticeVOList",noticeVOList);
        return "notice/noticeList"; //공지 리스트
    }

    @PostMapping("/delete")
    public String delete(@RequestParam Map<String,Object> map, Model model){
        String a = map.get("boardSeq").toString();
        int b = Integer.parseInt(a);
        int boardSeq =  noticeService.deleteNotice(b);
        return "notice/noticeList";
    }
}
