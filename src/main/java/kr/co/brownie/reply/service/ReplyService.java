package kr.co.brownie.reply.service;

import java.util.List;
import java.util.Map;

public interface ReplyService {
	void replyToBoard(Map<String, Object> map);

	void replyToReply(Map<String, Object> map);

	List<ReplyVO> replyOnBoard(int boardSeq);

	List<ReplyVO> replyOnReply(int replySeq);

	ReplyVO selectReplyStance(Map<String, Object> map);

	void deleteReplyStance(Map<String, Object> map);

	void updateReplyStance(Map<String, Object> map);

	ReplyVO replyLHCnt(int replySeq);

	ReplyVO boardReplyCnt(int boardSeq);


}
