package kr.co.brownie.reply.service;

import lombok.Data;

@Data
public class ReplyVO {
    //BROWNIE_BOARD_REPLY
    private String replySeq;
    private String replyContent;
    private String replyInDate;
    private String replyInUserId;
    private String replyUpDate;
    private String replyUpUserId;
    private String boardSeq;
    private String headReplySeq;

    //BROWNIE_USER
    private String userId;
    private String lolId;
    private String nickName;
    private String blackStack;
    private String status;
    private String userInDate;
    private String userUpDate;
    private String userInUserId;
    private String userUpUserId;
    private String userPosition;
    private String browniePoint;

    //BROWNIE_BOARD_REPLY_LIKE
    private String likeCnt;
    private String unlikeCnt;
}
