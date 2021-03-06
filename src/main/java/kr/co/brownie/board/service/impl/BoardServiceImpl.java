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
        int totalContent = this.boardMapper.count(map);
        int contentPerPage = (int) map.get("contentPerPage");

        return BoardPagingVO.builder()
                .boardVOList(this.boardMapper.selectList(map))
                .contentPerPage(contentPerPage)
                .startPageNumber((pageNum - 1) / 10 + 1)
                .currentPageNumber(pageNum)
                .endPageNumber(Math.min((pageNum - 1) / 10 + 10, (totalContent - 1) / contentPerPage + 1))
                .totalPageNumber((totalContent - 1) / contentPerPage + 1)
                .build();
    }

    @Override
    public List<BoardVO> selectList(Map<String, Object> map) {
        return this.boardMapper.selectList(map);
    }

    @Override
    public List<BoardVO> selectListOrderByLike(Map<String, Object> map) {
        return this.boardMapper.selectListOrderByLike(map);
    }

    @Override
    public List<BoardVO> selectPrevNextList(Map<String, Object> map) {
        return this.boardMapper.selectPrevNextList(map);
    }

    @Override
    public BoardVO select(Map<String, Object> map) {
        return this.boardMapper.select(map);
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
