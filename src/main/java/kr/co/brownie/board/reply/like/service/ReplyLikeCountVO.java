package kr.co.brownie.board.reply.like.service;

import lombok.Data;

@Data
public class ReplyLikeCountVO {
    private Integer replySeq;
    private Integer likeCnt;
    private Integer unlikeCnt;
}
