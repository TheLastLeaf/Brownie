package kr.co.brownie.board.like.service.impl;

import kr.co.brownie.board.like.service.BoardLikeCountVO;
import kr.co.brownie.board.like.service.BoardLikeService;
import kr.co.brownie.board.like.service.BoardLikeVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

@Service("boardLikeService")
public class BoardLikeServiceImpl implements BoardLikeService {
    @Resource(name = "boardLikeMapper")
    BoardLikeMapper boardLikeMapper;

    @Override
    public int insert(Map<String, Object> map) {
        return this.boardLikeMapper.insert(map);
    }

    @Override
    public BoardLikeVO select(Map<String, Object> map) {
        return this.boardLikeMapper.select(map);
    }

    @Override
    public BoardLikeCountVO count(Map<String, Object> map) {
        return this.boardLikeMapper.count(map);
    }

    @Override
    public int delete(Map<String, Object> map) {
        return this.boardLikeMapper.delete(map);
    }
}
