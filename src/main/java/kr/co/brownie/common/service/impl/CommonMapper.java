package kr.co.brownie.common.service.impl;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Mapper
@Repository("commonMapper")
public interface CommonMapper {
    int insertMember(Map<String, Object> map);

    int insertNoMem(Map<String, Object> map);

    int checkHit(int boardSeq);
}
