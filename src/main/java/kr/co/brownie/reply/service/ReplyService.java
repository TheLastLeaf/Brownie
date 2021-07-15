package kr.co.brownie.reply.service;

import java.util.List;
import java.util.Map;

public interface ReplyService {
	int CONTENT_PER_PAGE = 10;

	int insert(Map<String, Object> map);

	ReplyPagingVO selectPagingList(Map<String, Object> map);

	List<ReplyVO> selectList(Map<String, Object> map);

	ReplyVO select(Map<String, Object> map);

	int update(Map<String, Object> map);

	int delete(Map<String, Object> map);
}
