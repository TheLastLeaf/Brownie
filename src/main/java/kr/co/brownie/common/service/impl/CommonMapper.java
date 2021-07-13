package kr.co.brownie.common.service.impl;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("commonMapper")
public interface CommonMapper {
	int insertMember(Map<String,Object> map);
	
	int insertNoMem(Map<String,Object> map);
	
	int checkHit(int boardSeq);
}
