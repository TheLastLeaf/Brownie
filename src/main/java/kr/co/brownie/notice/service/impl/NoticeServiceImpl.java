package kr.co.brownie.notice.service.impl;

import javax.annotation.Resource;

import kr.co.brownie.notice.service.NoticeVO;
import org.springframework.stereotype.Service;

import kr.co.brownie.notice.service.NoticeService;

import java.util.List;
import java.util.Map;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {
	@Resource(name = "noticeDAO")
	NoticeDAO noticeDAO;

	@Override
	public int insertNotice(Map<String, Object> map) {
		return 0;
	}

	@Override
	public List<NoticeVO> getNoticelist(Map<String, Object> map) {
		return null;
	}

	@Override
	public int deleteNotice(int boardSeq) {
		return 0;
	}

	@Override
	public NoticeVO getNotice(int boardSeq) {
		return null;
	}

	@Override
	public int updateNotice(Map<String, Object> map) {
		return 0;
	}

	@Override
	public int selectCount() {
		return 0;
	}
}
