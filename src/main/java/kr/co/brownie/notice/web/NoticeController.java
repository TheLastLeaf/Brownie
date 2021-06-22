package kr.co.brownie.notice.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.brownie.notice.service.NoticeService;

@Controller
public class NoticeController {
	@Autowired
	NoticeService noticeService;
}
