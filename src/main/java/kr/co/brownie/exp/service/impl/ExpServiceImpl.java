package kr.co.brownie.exp.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.brownie.exp.service.ExpService;

@Service("expService")
public class ExpServiceImpl implements ExpService{
	@Resource(name="expMapper")
	ExpMapper expMapper;

	@Override
	public int selectExp(String id) {
		int exp = expMapper.selectExp(id);
		return exp;
	}
	
	
}
