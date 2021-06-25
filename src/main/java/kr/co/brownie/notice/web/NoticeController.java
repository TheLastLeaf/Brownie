package kr.co.brownie.notice.web;

import javax.annotation.Resource;

import kr.co.brownie.gallery.service.GalleryService;
import org.springframework.stereotype.Controller;

import kr.co.brownie.notice.service.NoticeService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/notice")
public class NoticeController {
    @Resource(name = "galleryService")
    GalleryService galleryService;

    @GetMapping("/add")
    public String noticeAdd() {
        return "notice/add";
    }

    @GetMapping("/detail")
    public String detail() {
        return "notice/detail";
    }

    @GetMapping("/list")
    public String list() {
        return "notice/list";
    }

    @GetMapping
    public String main() {
        return list();
    }
}
