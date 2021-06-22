package kr.co.brownie.common.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.brownie.common.service.CommonService;

@Service("commonService")
public class CommonServiceImpl implements CommonService {
	@Autowired
	CommonDAO commonDAO;
}
