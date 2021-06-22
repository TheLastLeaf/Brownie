package kr.co.brownie.tip.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.brownie.tip.service.TipService;

@Service("tipService")
public class TipServiceImpl implements TipService {
	@Autowired
	TipDAO tipDAO;
}
