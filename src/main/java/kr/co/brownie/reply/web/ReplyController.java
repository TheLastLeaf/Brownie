package kr.co.brownie.reply.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.brownie.reply.service.ReplyService;
import kr.co.brownie.reply.service.ReplyVO;

@Controller
@RequestMapping("/reply")
public class ReplyController {
	@Resource(name="replyService")
	ReplyService replyService;


	@ResponseBody
	@RequestMapping(value="/ajax.replyToBoard", method=RequestMethod.GET)
	public ReplyVO ajaxReplyToBoard(@RequestParam Map<String, Object> map, Model model, HttpServletRequest response, HttpSession session) {
		System.out.println(map);

		replyService.replyToBoard(map);
		return null;
	}




}
