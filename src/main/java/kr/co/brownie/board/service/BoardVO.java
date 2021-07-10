package kr.co.brownie.board.service;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
    private int boardSeq;
    private String boardKind;
    private String title;
    private String content;
    private String noticeYn;
    private String status;
    private Date inDate;
    private String inUserId;
    private Date modDate;
    private String upUserId;
    private int fileSeq;
    private int subSeq;

    //좋아요 싫어요
	private String likeCnt;
	private String hateCnt;
	private int likeHateKind;
}
