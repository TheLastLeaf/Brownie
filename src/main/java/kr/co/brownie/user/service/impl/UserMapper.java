package kr.co.brownie.user.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.co.brownie.user.service.UserVO;

@Repository("userMapper")
public interface UserMapper {

	UserVO userOneSelect(String id);

	int selectExp(String id);

	float starCntSelect(String id);

	int boardTotalCnt(String id);

	int replyTotalCnt(String id);

	int likeReplyCnt(String id);

	int hateReplyCnt(String id);

	List<String> recentBoard(String id);

	String nickName(String id);

	List<UserVO> selectList();

	String dateChecking(String id);

	void updateNick(Map<String, Object> map);

	void updatePosition(Map<String, Object> map);

	int validating(String userNick);

	int blackStack(String userId);

}
