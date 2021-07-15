package kr.co.brownie.blackList.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public int insert(String userId, String result, String id,int reasonSeq) {
		Map<String,Object> map = new HashMap<>();
		map.put("userId",userId);
		map.put("result",result);
		map.put("id",id);
		map.put("reasonSeq",reasonSeq);
		return blackListMapper.insert(map);
	}

}
