package kr.co.brownie.user.service;

import java.io.IOException;
import java.util.Map;

public interface UserService {

	UserVO userOneSelect(String id) throws IOException;

	void insertNick(Map<String, Object> map) throws IOException;

	int selectExp(String id) throws IOException;

	float starCntSelect(String id);

	int boardTotalCnt(String id);


}
