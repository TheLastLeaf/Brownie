package kr.co.brownie.user.service.impl;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.brownie.user.service.UserVO;

@Repository("userMapper")
public interface UserMapper {

	UserVO userOneSelect(String id);

	void insertNick(Map<String, Object> map);

	int LvSelect(String id);

	float starCntSelect();


}
