package kr.co.brownie.notice.service.impl;

import javax.annotation.Resource;

import kr.co.brownie.notice.service.NoticeVO;
import org.springframework.stereotype.Service;

import kr.co.brownie.notice.service.NoticeService;

import java.util.List;
import java.util.Map;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {
	@Resource(name="noticeMapper")
	NoticeMapper noticeMapper;

	@Override
	public int insertNotice(Map<String, Object> map) {
		int boardSeq = noticeMapper.insert(map);
		return boardSeq;
	}

	@Override
	public List<NoticeVO> getNoticelist(Map<String, Object> map) {
		List<NoticeVO> noticeVo = noticeMapper.selectList(map);
		return noticeVo;
	}

	@Override
	public int deleteNotice(int boardSeq) {
		return noticeMapper.delete(boardSeq);
	}

	@Override
	public NoticeVO getNotice(int boardSeq) {
		NoticeVO noticeVo = noticeMapper.read(boardSeq);
		return noticeVo;
	}

	@Override
	public int updateNotice(Map<String, Object> map) {
		return noticeMapper.update(map);
	}

	@Override
	public int selectCount() {
		return noticeMapper.count();
	}

	@Override
	public int selectlevel() {
		System.out.println("a");
		return noticeMapper.level();
	}
}
