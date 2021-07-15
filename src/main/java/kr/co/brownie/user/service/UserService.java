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

	// 닉네임과 포지션을 INSERT OR UPDATE 하는 SERVICE
	void insertNickPosition(Map<String, Object> map) throws IOException;

	String nickName(String id);

	List<UserVO> selectList();

	String dateChecking(String id);
}
