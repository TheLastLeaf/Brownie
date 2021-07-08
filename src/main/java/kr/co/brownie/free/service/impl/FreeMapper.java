package kr.co.brownie.free.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.brownie.free.service.FreeVO;

@Repository("freeMapper")
public interface FreeMapper {
	List<FreeVO> selectList();

	List<FreeVO> selectFamous();
}
