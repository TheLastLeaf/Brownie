package kr.co.brownie.miniGame.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.brownie.miniGame.service.BrownieMarbelInfoService;
import kr.co.brownie.notice.service.NoticeVO;

@Service("miniGameService")
public class BrownieMarbelInfoServiceImpl implements BrownieMarbelInfoService {
	@Resource(name = "miniGameMapper")
	BrownieMarbelInfoMapper miniGameMapper;

	@Override
	public int insertMiniGame(Map<String, Object> map) {
		return miniGameMapper.insert(map);
	}

	@Override
	public List<NoticeVO> getMiniGameList(Map<String, Object> map) {
		List<NoticeVO> noticeVo = miniGameMapper.selectList();
		return noticeVo;
	}

	@Override
	public NoticeVO getMiniGame(int boardSeq) {
		NoticeVO noticeVo = miniGameMapper.read(boardSeq);
		return noticeVo;
	}

	@Override
	public int updateMiniGame(Map<String, Object> map) {
		return miniGameMapper.update(map);
	}

	@Override
	public int deleteMiniGame(int boardSeq) {
		return miniGameMapper.delete(boardSeq);
	}
}
