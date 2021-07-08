package kr.co.brownie.review.service;

import lombok.Data;

@Data
public class ReviewVO {
	private String reviewSeq;
	private String userId;
	private String starCnt;
	private String reply;
	private String inDate;
	private String modDate;
	private String inUserId;
	private String upUserId;
}
