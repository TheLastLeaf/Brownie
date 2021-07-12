package kr.co.brownie.reply.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.co.brownie.reply.service.ReplyVO;

@Repository("replyMapper")
public interface ReplyMapper {

	void replyToBoard(Map<String, Object> map);

	void replyToReply(Map<String, Object> map);

	List<ReplyVO> replyOnBoard(int boardSeq);

	List<ReplyVO> replyOnReply(int replySeq);

	ReplyVO selectReplyStance(Map<String, Object> map);

	void deleteReplyStance(Map<String, Object> map);

	void updateReplyStance(Map<String, Object> map);

	ReplyVO replyLHCnt(int replySeq);

}
