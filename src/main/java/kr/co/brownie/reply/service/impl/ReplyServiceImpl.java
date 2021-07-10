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
	public List<ReplyVO> replyOnReply(int boardSeq) {
		return replyMapper.replyOnReply(boardSeq);
	}


}
