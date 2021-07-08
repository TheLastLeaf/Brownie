package kr.co.brownie.notice.service.impl;

import javax.annotation.Resource;

import kr.co.brownie.notice.service.NoticeVO;
import kr.co.brownie.notice.service.PagingVO;
import org.springframework.stereotype.Service;

import kr.co.brownie.notice.service.NoticeService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {
	@Resource(name="noticeMapper")
	NoticeMapper noticeMapper;

	@Override
	public PagingVO selectList(String keyword, int currentPageNumber) {
		Map<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("contentPerPage", CONTENT_PER_PAGE);
		map.put("currentPageNumber", currentPageNumber);

		int total = noticeMapper.count(keyword);

		return PagingVO.builder()
				.noticeVOList(noticeMapper.selectList(map))
				.contentPerPage(CONTENT_PER_PAGE)
				.startPageNumber((currentPageNumber - 1) / CONTENT_PER_PAGE + 1)
				.currentPageNumber(currentPageNumber)
				.endPageNumber(Math.min((currentPageNumber - 1) / CONTENT_PER_PAGE + CONTENT_PER_PAGE, (total - 1) / CONTENT_PER_PAGE + 1))
				.totalPageNumber((total - 1) / CONTENT_PER_PAGE + 1)
				.build();
	}

	@Override
	public int count(String keyword) {
		return noticeMapper.count();
	}

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
	public String selectnickname(){
		return noticeMapper.nickname();
	}


}
