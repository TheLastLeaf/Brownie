package kr.co.brownie.tip.service;

import lombok.Data;

import java.util.Date;

@Data
public class TipVO {
    private int boardSeq;
    private String boardKind;
    private String boardCategory;
    private String title;
    private String content;
    private String noticeYn;
    private String status;
    private Date inDate;
    private String inUserId;
    private Date upDate;
    private String upUserId;
    private int fileSeq;
    private int subSeq;
}
