package kr.co.brownie.board.reply.like.service.impl;

import kr.co.brownie.board.reply.like.service.ReplyLikeCountVO;
import kr.co.brownie.board.reply.like.service.ReplyLikeVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Mapper
@Repository("replyLikeMapper")
public interface ReplyLikeMapper {
    int insert(Map<String, Object> map);

    ReplyLikeVO select(Map<String, Object> map);

    ReplyLikeCountVO count(Map<String, Object> map);

    int delete(Map<String, Object> map);
}
