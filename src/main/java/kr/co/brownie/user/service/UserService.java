package kr.co.brownie.user.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

public interface UserService {
    int CONTENT_PER_PAGE = 10;

    UserVO userOneSelect(String id);

    float starCntSelect(String id);

    int boardTotalCnt(String id);

    int replyTotalCnt(String id);

    int likeReplyCnt(String id);

    int hateReplyCnt(String id);

    int updateImage(Map<String, Object> map);

    // 최근 게시글 3개
    List<Map<String, Object>> recentBoard(String id);

    String nickName(String id);

    List<UserVO> selectList();

    String dateChecking(String id);

    // 닉네임과 UPDATE 하는 SERVICE
    void updateNick(Map<String, Object> map) throws IOException;

    // 포지션을 UPDATE 하는 SERVICE
    void updatePosition(Map<String, Object> map) throws IOException;

    // 아이디 중복체크
    int validating(String userNick);

    int blackstack(String userId);

    UserPagingVO userList(int currentPageNumber);

    //blackstack 3이상 상태변경
    void updateStatus(String userId);

    int saveToken(Map<String, Object>map);

    int saveLolId(Map<String, Object> map);

    int deleteLolId(Map<String, Object> map);

    void updatePoint(Map<String, Object> map);

    void usePointForChat(Map<String, Object> map);

	void updateSummonerLv(Map<String, Object> map);

	int selectPermitLevel(String user_id);

    List<UserVO> recentlyChatUsers(Map<String, Object> map);
}
