package kr.co.brownie.user.service.impl;

import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.co.brownie.user.service.UserVO;

@Repository("userMapper")
public interface UserMapper {

	UserVO userOneSelect(String id);

	void insertNick(Map<String, Object> map);

	int selectExp(String id);

	float starCntSelect(String id);

	int boardTotalCnt(String id);

	int replyTotalCnt(String id);

	int likeReplyCnt(String id);

	int hateReplyCnt(String id);

}
