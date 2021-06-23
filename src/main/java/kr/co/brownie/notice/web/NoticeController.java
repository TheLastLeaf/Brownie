package kr.co.brownie.notice.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import kr.co.brownie.notice.service.NoticeService;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {
	@Resource(name = "noticeService")
	NoticeService noticeService;

	@RequestMapping(path = "/noticeAdd")
	public String noticeAdd() {
		return "notice/noticeAdd";
	}

	@RequestMapping(path = "/noticelist")
	public String noticelist() {
		return "notice/noticelist";
	}

	@RequestMapping(path = "/noticedetail")
	public String notice() {
		return "notice/noticedetail";
	}
}
