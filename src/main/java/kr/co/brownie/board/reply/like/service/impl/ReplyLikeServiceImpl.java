package kr.co.brownie.board.reply.like.service.impl;

import kr.co.brownie.board.reply.like.service.ReplyLikeCountVO;
import kr.co.brownie.board.reply.like.service.ReplyLikeService;
import kr.co.brownie.board.reply.like.service.ReplyLikeVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

@Service("replyLikeService")
public class ReplyLikeServiceImpl implements ReplyLikeService {
    @Resource(name="replyLikeMapper")
    ReplyLikeMapper replyLikeMapper;

    @Override
    public int insert(Map<String, Object> map) {
        return this.replyLikeMapper.insert(map);
    }

    @Override
    public ReplyLikeVO select(Map<String, Object> map) {
        return this.replyLikeMapper.select(map);
    }

    @Override
    public ReplyLikeCountVO count(Map<String, Object> map) {
        return this.replyLikeMapper.count(map);
    }

    @Override
    public int delete(Map<String, Object> map) {
        return this.replyLikeMapper.delete(map);
    }
}
