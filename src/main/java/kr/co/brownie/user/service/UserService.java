package kr.co.brownie.user.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

public interface UserService {

	UserVO userOneSelect(String id) throws IOException;

	int selectExp(String id) throws IOException;

	float starCntSelect(String id);

	int boardTotalCnt(String id);

	int replyTotalCnt(String id);

	int likeReplyCnt(String id);

	int hateReplyCnt(String id);

	List<String> recentBoard(String id);

	String nickName(String id);

	List<UserVO> selectList();

	String dateChecking(String id);

	// 닉네임과 UPDATE 하는 SERVICE
	void updateNick(Map<String, Object> map) throws IOException;

	// 포지션을 UPDATE 하는 SERVICE
	void updatePosition(Map<String, Object> map) throws IOException;

	// 아이디 중복체크
	int validating(String userNick);
}
