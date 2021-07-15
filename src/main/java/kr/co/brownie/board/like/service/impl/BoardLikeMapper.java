package kr.co.brownie.board.like.service.impl;

import kr.co.brownie.board.like.service.BoardLikeCountVO;
import kr.co.brownie.board.like.service.BoardLikeVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Mapper
@Repository("boardLikeMapper")
public interface BoardLikeMapper {
    int insert(Map<String, Object> map);

    BoardLikeVO select(Map<String, Object> map);

    BoardLikeCountVO count(Map<String, Object> map);

    int delete(Map<String, Object> map);
}
