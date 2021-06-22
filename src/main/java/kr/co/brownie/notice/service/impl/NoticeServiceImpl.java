package kr.co.brownie.notice.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.brownie.notice.service.NoticeService;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {
	@Resource(name = "noticeDAO")
	NoticeDAO noticeDAO;
}
