package kr.co.brownie.admin.service;

import lombok.Data;

@Data
public class AdminVO {
	//유저 수 집계
	private int allUserCnt;
	private int recentUserCnt;

	//신고 수 집계
	private int reportUserCnt;

	//게시글 수 집계
	private int allBoardCnt;
	private int recentBoardCnt;

	//블랙유저 집계
	private int blackUserCnt;

}
