package kr.co.brownie.free.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.brownie.free.service.FreeService;

@Service("freeService")
public class FreeServiceImpl implements FreeService{
	@Resource(name = "freeMapper")
	FreeMapper freeMapper;



}
