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

	//좋아요 싫어요
	private String likeCnt;
	private String hateCnt;
	private int likeHateKind;

	//앞 뒤 게시글 리플개수
	private int replyCnt;
	private int beforeSeq;
	private String beforeDate;
	private int beforeCnt;
	private int afterSeq;
	private String afterDate;
	private int afterCnt;
}
