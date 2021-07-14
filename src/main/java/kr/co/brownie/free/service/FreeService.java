package kr.co.brownie.free.service;

import java.util.List;
import java.util.Map;

public interface FreeService {
    int REPLY_PER_PAGE = 10;

    List<FreeVO> selectList();

    List<FreeVO> selectFamous();

    FreeVO selectDetail(int boardSeq);

    List<FreeVO> selectRecent(int boardSeq);

    List<FreeVO> selectRecentForMenu();

    void insertFree(Map<String, Object> map);

    void deleteFree(Map<String, Object> map);

    int update(Map<String, Object> map);

    FreeReplyPagingVO selectReplyList(Map<String, Object> map);

    int insertReply(Map<String, Object> map);

    FreeReplyVO selectReply(Map<String, Object> map);

    int deleteReply(Map<String, Object> map);
}
