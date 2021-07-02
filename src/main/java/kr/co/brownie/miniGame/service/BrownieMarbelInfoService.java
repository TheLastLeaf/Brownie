package kr.co.brownie.miniGame.service;

import java.util.List;
import java.util.Map;

import kr.co.brownie.notice.service.NoticeVO;

public interface BrownieMarbelInfoService {

	int insertMiniGame(Map<String, Object> map);

	List<NoticeVO> getMiniGameList(Map<String, Object> map);

	NoticeVO getMiniGame(int boardSeq);

	int updateMiniGame(Map<String, Object> map);

	int deleteMiniGame(int boardSeq);
}
