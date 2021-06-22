package kr.co.brownie.tip.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.brownie.tip.service.TipService;

@Service("tipService")
public class TipServiceImpl implements TipService {
	@Resource(name = "tipDAO")
	TipDAO tipDAO;
}
