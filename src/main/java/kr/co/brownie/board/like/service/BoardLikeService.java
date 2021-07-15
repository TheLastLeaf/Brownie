package kr.co.brownie.board.like.service;

import java.util.Map;

public interface BoardLikeService {
    int insert(Map<String, Object> map);

    BoardLikeVO select(Map<String, Object> map);

    BoardLikeCountVO count(Map<String, Object> map);

    int delete(Map<String, Object> map);
}
