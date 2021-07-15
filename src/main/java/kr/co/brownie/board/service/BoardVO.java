package kr.co.brownie.board.service;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
    //BROWNIE_BOARD
    private Integer boardSeq;
    private String boardKind;
    private String boardCategory;
    private String title;
    private String content;
    private String noticeYn;
    private String boardStatus;
    private Date boardInDate;
    private String boardInUserId;
    private Date boardUpDate;
    private String boardUpUserId;
    private Integer fileSeq;
    private Integer subSeq;

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

    //BROWNIE_BOARD_REPLY
    private Integer replyCnt;

    //BROWNIE_BOARD_HIT
    private Integer hitCnt;

    //BROWNIE_BOARD_LIKE
    private Integer likeCnt;
    private Integer unlikeCnt;
}
