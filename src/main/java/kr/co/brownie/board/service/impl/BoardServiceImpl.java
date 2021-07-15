package kr.co.brownie.board.service.impl;

import kr.co.brownie.board.service.BoardPagingVO;
import kr.co.brownie.board.service.BoardService;
import kr.co.brownie.board.service.BoardVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	@Resource(name = "boardMapper")
	BoardMapper boardMapper;

	@Override
	public int insert(Map<String, Object> map) {
		return this.boardMapper.insert(map);
	}

	@Override
	public BoardPagingVO selectPagingList(Map<String, Object> map) {
		int pageNum = (int) map.get("pageNum");
		int totalContent = boardMapper.count(map);

		return BoardPagingVO.builder()
				.boardVOList(boardMapper.selectList(map))
				.contentPerPage(CONTENT_PER_PAGE)
				.startPageNumber((pageNum - 1) / CONTENT_PER_PAGE + 1)
				.currentPageNumber(pageNum)
				.endPageNumber(Math.min((pageNum - 1) / CONTENT_PER_PAGE + 10,(totalContent - 1) / CONTENT_PER_PAGE + 1))
				.totalPageNumber((totalContent - 1) / CONTENT_PER_PAGE + 1)
				.build();
	}

	@Override
	public List<BoardVO> selectList(Map<String, Object> map) {
		return this.boardMapper.selectList(map);
	}

	@Override
	public BoardVO select(Map<String, Object> map) {
		return null;
	}

	@Override
	public int update(Map<String, Object> map) {
		return this.boardMapper.update(map);
	}

	@Override
	public int delete(Map<String, Object> map) {
		return this.boardMapper.delete(map);
	}
}
