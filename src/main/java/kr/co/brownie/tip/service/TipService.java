package kr.co.brownie.tip.service;

import java.util.Map;

public interface TipService {
    int CONTENT_PER_PAGE = 10;
    int REPLY_PER_PAGE = 10;

    TipPagingVO selectList(Map<String, Object> map);

    TipVO select(Map<String, Object> map);

    int insert(Map<String, Object> map);

    int update(Map<String, Object> map);

    int delete(Map<String, Object> map);

    TipReplyPagingVO selectReplyList(Map<String, Object> map);

    int insertReply(Map<String, Object> map);

    TipReplyVO selectReply(Map<String, Object> map);

    int deleteReply(Map<String, Object> map);
}
