package kr.co.brownie.free.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.brownie.free.service.FreeService;
import kr.co.brownie.free.service.FreeVO;

@Service("freeService")
public class FreeServiceImpl implements FreeService{
	@Resource(name = "freeMapper")
	FreeMapper freeMapper;

	@Override
	public List<FreeVO> selectList() {
		return freeMapper.selectList();
	}

	@Override
	public List<FreeVO> selectFamous() {
		return freeMapper.selectFamous();
	}

	@Override
	public FreeVO selectDetail(int boardSeq) {
		return freeMapper.selectDetail(boardSeq);
	}

	@Override
	public List<FreeVO> selectRecent(int boardSeq) {
		return freeMapper.selectRecent(boardSeq);
	}

	@Override
	public List<FreeVO> selectRecentForMenu() {
		return freeMapper.selectRecentForMenu();
	}

	@Override
	public void insertFree(Map<String, Object> map) {
		freeMapper.insertFree(map);
	}

}
