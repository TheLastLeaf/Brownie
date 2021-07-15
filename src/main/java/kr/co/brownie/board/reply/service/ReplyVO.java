package kr.co.brownie.board.reply.service;

import lombok.Data;

@Data
public class ReplyVO {
    private String lv;

    //BROWNIE_BOARD_REPLY
    private String replySeq;
    private String replyContent;
    private String replyInDate;
    private String replyInUserId;
    private String replyUpDate;
    private String replyUpUserId;
    private String boardSeq;
    private String headReplySeq;
    private String boardStatus;

    //BROWNIE_USER
    private String userId;
    private String lolId;
    private String nickName;
    private String blackStack;
    private String userStatus;
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
