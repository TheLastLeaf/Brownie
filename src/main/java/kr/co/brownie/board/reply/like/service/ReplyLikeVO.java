package kr.co.brownie.board.reply.like.service;

import lombok.Data;

import java.util.Date;

@Data
public class ReplyLikeVO {
    private Integer replySeq;
    private String kind;
    private Date inDate;
    private String inUserId;
    private Date upDate;
    private String upUserId;
}
