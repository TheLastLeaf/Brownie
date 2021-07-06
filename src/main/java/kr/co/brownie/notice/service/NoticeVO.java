package kr.co.brownie.notice.service;

import lombok.Data;

import java.util.Date;

@Data
public class NoticeVO {
    private int boardSeq;
    private String boardKind;
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
    private int permitLevel;
}
