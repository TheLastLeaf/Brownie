package kr.co.brownie.user.service;

import java.util.Map;

public interface UserService {

	void insertNick(Map<String, Object> map);

	UserVO userOneSelect(String id);

	int LvSelect(String id);

	float starCntSelect();



}
