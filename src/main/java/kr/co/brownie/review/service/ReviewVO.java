package kr.co.brownie.review.service;

import lombok.Data;

import java.util.Date;

@Data
public class ReviewVO {
    private int reviewSeq;
    private String userId;
    private int starCnt;
    private String reply;
    private Date inDate;
    private Date modDate;
    private String inUserId;
    private String upUserId;
}
