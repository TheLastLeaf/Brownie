package kr.co.brownie.user.service;

import java.util.List;
import java.util.Map;

public interface UserService {
	List<UserVO> selectList();

	UserVO userOneSelect(String id);

	void insertNick(Map<String, Object> map);

//	float starCntSelect();
}
