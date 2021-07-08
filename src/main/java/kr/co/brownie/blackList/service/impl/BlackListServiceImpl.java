package kr.co.brownie.blackList.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.brownie.blackList.service.BlackListService;
import kr.co.brownie.blackList.service.BlackListVO;

@Service("blackListService")
public class BlackListServiceImpl implements BlackListService{

	@Resource(name = "blackListMapper")
	BlackListMapper blackListMapper;


	@Override
	public List<BlackListVO> selectBlackList() {
		return blackListMapper.selectBlackList();
	}

}
