package kr.co.brownie.reply.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.brownie.reply.service.ReplyService;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {

	@Resource(name = "replyMapper")
	ReplyMapper replyMapper;


}
