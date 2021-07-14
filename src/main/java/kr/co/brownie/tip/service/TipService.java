package kr.co.brownie.tip.service;

import kr.co.brownie.reply.service.ReplyVO;

public interface TipService {
    int CONTENT_PER_PAGE = 10;
    int REPLY_PER_PAGE = 10;

    TipPagingVO selectList(String champion, int currentPageNumber);

    TipVO select(int board_seq);

    int insert(String author, String champion, String title, String content);

    int update(int boardSeq, String author, String champion, String title, String content);

    int delete(int boardSeq);

    TipReplyPagingVO selectReplyList(int boardSeq, int currentReplyPageNumber, int totalReplyCount);

    int insertReply(int boardSeq, String author, String message, String headReplySeq);

    TipReplyVO selectReply(int boardSeq, int replySeq);

    int deleteReply(int replySeq);
}
