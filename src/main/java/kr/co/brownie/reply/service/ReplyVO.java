package kr.co.brownie.reply.service;

import lombok.Data;

@Data
public class ReplyVO {
	private int replySeq;
	private String replyContent;
	private String inDate;
	private String inUserId;
	private String modDate;
	private String upUserId;
	private String boardSeq;
	private String headReplySeq;

	//status가 N일 경우 비활성화해서 보여줘야함. 기본값 y
	private String status;

	//작성자 닉네임
	private String nickName;
}
