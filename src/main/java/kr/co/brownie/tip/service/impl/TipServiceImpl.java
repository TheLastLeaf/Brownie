package kr.co.brownie.tip.service.impl;

import kr.co.brownie.reply.service.ReplyVO;
import kr.co.brownie.tip.service.*;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Service("tipService")
public class TipServiceImpl implements TipService {
    @Resource(name = "tipMapper")
    TipMapper tipMapper;

    @Override
    public TipPagingVO selectList(String champion, int currentPageNumber) {
        Map<String, Object> map = new HashMap<>();
        map.put("champion", champion);
        map.put("contentPerPage", CONTENT_PER_PAGE);
        map.put("currentPageNumber", currentPageNumber);

        int total = tipMapper.countTipList(champion);
        return TipPagingVO.builder()
                .tipVOList(tipMapper.selectTipList(map))
                .contentPerPage(CONTENT_PER_PAGE)
                .startPageNumber((currentPageNumber - 1) / CONTENT_PER_PAGE + 1)
                .currentPageNumber(currentPageNumber)
                .endPageNumber(Math.min((currentPageNumber - 1) / CONTENT_PER_PAGE + 10, (total - 1) / CONTENT_PER_PAGE + 1))
                .totalPageNumber((total - 1) / CONTENT_PER_PAGE + 1)
                .build();
    }

    @Override
    public TipVO select(int board_seq) {
        return tipMapper.select(board_seq);
    }

    @Override
    public int insert(String author, String champion, String title, String content) {
        Map<String, Object> map = new HashMap<>();
        map.put("author", author);
        map.put("champion", champion);
        map.put("title", title);
        map.put("content", content);

        return tipMapper.insert(map);
    }

    @Override
    public int update(int boardSeq, String author, String champion, String title, String content) {
        Map<String, Object> map = new HashMap<>();
        map.put("boardSeq", boardSeq);
        map.put("author", author);
        map.put("champion", champion);
        map.put("title", title);
        map.put("content", content);

        return tipMapper.update(map);
    }

    @Override
    public int delete(int boardSeq) {
        return tipMapper.delete(boardSeq);
    }

    @Override
    public TipReplyPagingVO selectReplyList(int boardSeq, int currentReplyPageNumber, int totalReplyCount) {
        Map<String, Object> map = new HashMap<>();
        map.put("boardSeq", boardSeq);
        map.put("replyPerPage", REPLY_PER_PAGE);
        map.put("currentReplyPageNumber", currentReplyPageNumber);
        return TipReplyPagingVO.builder()
                .tipReplyVOList(tipMapper.selectReplyList(map))
                .replyPerPage(REPLY_PER_PAGE)
                .startPageNumber((currentReplyPageNumber - 1) / REPLY_PER_PAGE + 1)
                .currentPageNumber(currentReplyPageNumber)
                .endPageNumber(Math.min((currentReplyPageNumber - 1) / REPLY_PER_PAGE + 10, (totalReplyCount - 1) / REPLY_PER_PAGE + 1))
                .totalPageNumber((totalReplyCount - 1) / REPLY_PER_PAGE + 1)
                .build();
    }

    @Override
    public int insertReply(int boardSeq, String author, String message, String headReplySeq) {
        Map<String, Object> map = new HashMap<>();
        map.put("boardSeq", boardSeq);
        map.put("author", author);
        map.put("message", message);
        map.put("headReplySeq", headReplySeq);

        return tipMapper.insertReply(map);
    }

    @Override
    public TipReplyVO selectReply(int boardSeq, int replySeq) {
        Map<String, Object> map = new HashMap<>();
        map.put("boardSeq", boardSeq);
        map.put("replySeq", replySeq);

        return tipMapper.selectReply(map);
    }

    @Override
    public int deleteReply(int replySeq) {
        return tipMapper.deleteReply(replySeq);
    }
}
