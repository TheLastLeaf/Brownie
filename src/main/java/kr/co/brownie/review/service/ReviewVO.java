package kr.co.brownie.review.service;

import java.util.Date;

import lombok.Data;

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
