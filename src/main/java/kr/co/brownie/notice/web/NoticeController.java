package kr.co.brownie.notice.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import kr.co.brownie.notice.service.NoticeService;

@Controller
public class NoticeController {
	@Resource(name = "noticeService")
	NoticeService noticeService;
}
