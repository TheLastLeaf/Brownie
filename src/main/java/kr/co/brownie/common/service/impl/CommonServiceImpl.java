package kr.co.brownie.common.service.impl;

import org.springframework.stereotype.Service;

import kr.co.brownie.common.service.CommonService;

import java.util.Map;

import javax.annotation.Resource;

@Service("commonService")
public class CommonServiceImpl implements CommonService {
    @Resource(name = "commonMapper")
    CommonMapper commonMapper;

	@Override
	public int insertMember(Map<String, Object> map) {
		return commonMapper.insertMember(map);
	}

	@Override
	public int insertNoMem(Map<String, Object> map) {
		return commonMapper.insertNoMem(map);
	}

	@Override
	public int checkHit(int boardSeq) {
		return commonMapper.checkHit(boardSeq);
	}
    
}
