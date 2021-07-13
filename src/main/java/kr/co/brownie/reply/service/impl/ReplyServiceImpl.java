package kr.co.brownie.reply.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.brownie.reply.service.ReplyService;
import kr.co.brownie.reply.service.ReplyVO;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {

	@Resource(name = "replyMapper")
	ReplyMapper replyMapper;

	@Override
	public void replyToBoard(Map<String, Object> map) {
		replyMapper.replyToBoard(map);
	}

	@Override
	public void replyToReply(Map<String, Object> map) {
		replyMapper.replyToReply(map);
	}

	@Override
	public List<ReplyVO> replyOnBoard(int boardSeq) {
		return replyMapper.replyOnBoard(boardSeq);
	}

	@Override
	public List<ReplyVO> replyOnReply(int replySeq) {
		return replyMapper.replyOnReply(replySeq);
	}

	@Override
	public ReplyVO selectReplyStance(Map<String, Object> map) {
		return replyMapper.selectReplyStance(map);
	}

	@Override
	public void deleteReplyStance(Map<String, Object> map) {
		replyMapper.deleteReplyStance(map);
	}

	@Override
	public void updateReplyStance(Map<String, Object> map) {
		replyMapper.updateReplyStance(map);
	}

	@Override
	public ReplyVO replyLHCnt(int replySeq) {
		return replyMapper.replyLHCnt(replySeq);
	}

	@Override
	public ReplyVO boardReplyCnt(int boardSeq) {
		return replyMapper.boardReplyCnt(boardSeq);
	}

	@Override
	public void modReply(Map<String, Object> map) {
		replyMapper.modReply(map);
	}

	@Override
	public void delReply(Map<String, Object> map) {
		replyMapper.delReply(map);
	}

	@Override
	public void delHadReReply(Map<String, Object> map) {
		replyMapper.delHadReReply(map);
	}

}
