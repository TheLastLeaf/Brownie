package kr.co.brownie.board.reply.like.service;

import java.util.Map;

public interface ReplyLikeService {
    int insert(Map<String, Object> map);

    ReplyLikeVO select(Map<String, Object> map);

    ReplyLikeCountVO count(Map<String, Object> map);

    int delete(Map<String, Object> map);
}
