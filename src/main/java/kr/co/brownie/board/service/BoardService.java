package kr.co.brownie.board.service;

import java.util.List;
import java.util.Map;

public interface BoardService {
	int CONTENT_PER_PAGE = 10;

	int insert(Map<String, Object> map);

	BoardPagingVO selectPagingList(Map<String, Object> map);

	List<BoardVO> selectList(Map<String, Object> map);

	BoardVO select(Map<String, Object> map);

	int update(Map<String, Object> map);

	int delete(Map<String, Object> map);
}
