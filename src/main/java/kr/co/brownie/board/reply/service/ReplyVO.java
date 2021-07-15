package kr.co.brownie.board.reply.service;

import lombok.Data;

import java.util.Date;

@Data
public class ReplyVO {
    private Integer lv;

    //BROWNIE_BOARD_REPLY
    private Integer replySeq;
    private String replyContent;
    private Date replyInDate;
    private String replyInUserId;
    private Date replyUpDate;
    private String replyUpUserId;
    private Integer boardSeq;
    private Integer headReplySeq;
    private String boardStatus;

    //BROWNIE_USER
    private String userId;
    private String lolId;
    private String nickName;
    private Integer blackStack;
    private String userStatus;
    private Date userInDate;
    private Date userUpDate;
    private String userInUserId;
    private String userUpUserId;
    private String userPosition;
    private Integer browniePoint;

    //BROWNIE_BOARD_REPLY_LIKE
    private Integer likeCnt;
    private Integer unlikeCnt;
}
