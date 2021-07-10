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
}
