package kr.co.brownie.notice.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import kr.co.brownie.notice.service.NoticeService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/notice")
public class NoticeController {
    @Resource(name = "noticeService")
    NoticeService noticeService;

    @GetMapping("/add")
    public String noticeAdd() {
        return "notice/noticeAdd"; // 공지 글쓰기
    }

    @GetMapping("/noticeDetail")
    public String detail() {
        return "notice/noticeDetail"; // 공지 디테일화면
    }

    @GetMapping("/noticeList")
    public String noticeList() {
        return "notice/noticeList"; //공지 리스트
    }

    @GetMapping
    public String main() {
        return noticeList();
    }
}
