package kr.co.brownie.common.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.brownie.common.service.CommonService;

@Service("commonService")
public class CommonServiceImpl implements CommonService {
	@Resource(name = "commonDAO")
	CommonDAO commonDAO;
}
