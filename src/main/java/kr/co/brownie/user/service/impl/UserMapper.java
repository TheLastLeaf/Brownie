package kr.co.brownie.user.service.impl;

import kr.co.brownie.user.service.UserVO;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("userMapper")
public interface UserMapper {

    UserVO userOneSelect(String id);

    float starCntSelect(String id);

    int boardTotalCnt(String id);

    int replyTotalCnt(String id);

    int likeReplyCnt(String id);

    int hateReplyCnt(String id);

    int updateImage(Map<String, Object> map);

    List<String> recentBoard(String id);

    String nickName(String id);

    List<UserVO> selectList();

    String dateChecking(String id);

    void updateNick(Map<String, Object> map);

    void updatePosition(Map<String, Object> map);

    int validating(String userNick);

    int blackStack(String userId);

    int userCount();

    List<UserVO> userList(Map<String, Object> map);

    void updateStatus(String userId);

    int saveToken(Map<String, Object> map);

    int saveLolId(Map<String, Object> map);

    int deleteLolId(Map<String, Object> map);

    void updatePoint(Map<String, Object> map);

    void usePointForChat(Map<String, Object> map);

	void updateSummonerLv(Map<String, Object> map);

}
