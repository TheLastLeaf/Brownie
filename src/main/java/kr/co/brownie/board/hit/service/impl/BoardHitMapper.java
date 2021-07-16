package kr.co.brownie.board.hit.service.impl;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Mapper
@Repository("boardHitMapper")
public interface BoardHitMapper {
    int merge(Map<String, Object> map);
}
