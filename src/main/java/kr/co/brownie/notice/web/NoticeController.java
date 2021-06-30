package kr.co.brownie.notice.web;

import javax.annotation.Resource;

import kr.co.brownie.notice.service.NoticeVO;
import org.springframework.stereotype.Controller;

import kr.co.brownie.notice.service.NoticeService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
public class NoticeController {
    @Resource(name = "noticeService")
    NoticeService noticeService;

    @RequestMapping("/notice")
    public String main(){
        return "notice/noticeList";
    }

    @GetMapping("/add")
    public String noticeAdd() {
        return "notice/noticeAdd"; // 공지 글쓰기
    }

    @GetMapping("/noticeDetail")
    public String detail() {
        return "notice/noticeDetail"; // 공지 디테일화면
    }

    @GetMapping("/noticeList")
    public ModelAndView noticeList(@RequestParam Map<String,Object> map, ModelAndView mav) {
        List<NoticeVO> noticeVo = this.noticeService.getNoticelist(map);
        mav.addObject("noticeVo",noticeVo);
        mav.setViewName("notice/noticeList");
        return mav; //공지 리스트
    }


}
