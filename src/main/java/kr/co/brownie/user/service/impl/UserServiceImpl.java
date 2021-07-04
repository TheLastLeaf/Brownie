package kr.co.brownie.user.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.brownie.user.service.UserService;
import kr.co.brownie.user.service.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService{
	@Resource(name = "userMapper")
	UserMapper userMapper;

	@Override
	public void insertNick(Map<String, Object> map) {
		userMapper.insertNick(map);
	}

	@Override
	public UserVO userOneSelect(String id) {
		return userMapper.userOneSelect(id);
	}

	@Override
	public int LvSelect(String id) {
		return userMapper.LvSelect(id);
	}

	@Override
	public float starCntSelect() {
		return userMapper.starCntSelect();
	}

}
