package kr.co.brownie.reply.service;

import java.util.List;
import java.util.Map;

public interface ReplyService {
	void replyToBoard(Map<String, Object> map);

	void replyToReply(Map<String, Object> map);

	List<ReplyVO> replyOnBoard(int boardSeq);

	List<ReplyVO> replyOnReply(int boardSeq);
}
