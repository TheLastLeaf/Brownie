package kr.co.brownie.free.service;

import lombok.Data;

@Data
public class FreeVO {
	private String boardSeq;
	private String boardKind;
	private String boardCategory;
	private String title;
	private String content;
	private String noticeYn;
	private String status;
	private String inDate;
	private String inUserId;
	private String modDate;
	private String upUserId;
	private String fileSeq;
	private String subSeq;
}
