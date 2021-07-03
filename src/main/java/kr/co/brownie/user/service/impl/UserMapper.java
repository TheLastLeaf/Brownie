package kr.co.brownie.user.service.impl;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.brownie.user.service.UserVO;

@Repository("userMapper")
public interface UserMapper {

	void insertNick(Map<String, Object> map);

	UserVO userOneSelect(String id);

}
