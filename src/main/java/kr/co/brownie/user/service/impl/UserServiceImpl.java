package kr.co.brownie.user.service.impl;

import java.io.IOException;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.brownie.user.service.UserService;
import kr.co.brownie.user.service.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Resource(name = "userMapper")
	UserMapper userMapper;

	@Override
	public UserVO userOneSelect(String id) throws IOException {
		return userMapper.userOneSelect(id);
	}

	@Override
	public void insertNick(Map<String, Object> map) throws IOException {
		userMapper.insertNick(map);
	}

	@Override
	public int selectExp(String id) throws IOException {
		int exp = userMapper.selectExp(id);
		System.out.println("userImpl exp: " + exp);
		return exp;
	}

	@Override
	public float starCntSelect(String id) {
		return userMapper.starCntSelect(id);
	}

	@Override
	public int boardTotalCnt(String id) {
		int boardTotalCnt = userMapper.boardTotalCnt(id);
		if(boardTotalCnt == 0) {
			return boardTotalCnt = 0;
		}
		return boardTotalCnt;
	}
}
