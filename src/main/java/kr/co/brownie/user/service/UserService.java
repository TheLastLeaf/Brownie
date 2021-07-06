package kr.co.brownie.user.service;

import java.util.Map;

public interface UserService {

	UserVO userOneSelect(String id);

	void insertNick(Map<String, Object> map);

//	float starCntSelect();

}
