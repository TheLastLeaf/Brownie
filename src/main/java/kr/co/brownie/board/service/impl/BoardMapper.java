package kr.co.brownie.board.service.impl;

import kr.co.brownie.board.service.BoardVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository("boardMapper")
public interface BoardMapper {
    int insert(Map<String, Object> map);

    int count(Map<String, Object> map);

    List<BoardVO> selectList(Map<String, Object> map);

    BoardVO select(Map<String, Object> map);

    int update(Map<String, Object> map);

    int delete(Map<String, Object> map);
}
