package kr.co.brownie.reply.web;

import java.util.HashMap;
import java.util.List;
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

import kr.co.brownie.board.service.BoardVO;
import kr.co.brownie.reply.service.ReplyService;
import kr.co.brownie.reply.service.ReplyVO;

@Controller
@RequestMapping("/reply")
public class ReplyController {
	@Resource(name="replyService")
	ReplyService replyService;


	@ResponseBody
	@RequestMapping(value="/ajax.replyToBoard", method= {RequestMethod.GET, RequestMethod.POST})
	public void ajaxReplyToBoard(@RequestParam Map<String, Object> map, Model model, HttpServletRequest response, HttpSession session) {
		replyService.replyToBoard(map);
	}

	@ResponseBody
	@RequestMapping(value="/ajax.modReply", method= {RequestMethod.GET, RequestMethod.POST})
	public void ajaxModReply(@RequestParam Map<String, Object> map, Model model, HttpServletRequest response, HttpSession session) {
		replyService.modReply(map);
	}

	@ResponseBody
	@RequestMapping(value="/ajax.delReply", method= {RequestMethod.GET, RequestMethod.POST})
	public void ajaxDelReply(@RequestParam Map<String, Object> map, Model model, HttpServletRequest response, HttpSession session) {

		int replySeq = Integer.parseInt(map.get("replySeq").toString());
		List<ReplyVO> replyOnReply = replyService.replyOnReply(replySeq);

		//리리플이 존재하는 경우 삭제하면 안되고 업데이트를 해야함ㅠ
		if(replyOnReply.size() > 0) {
			String upUserId= map.get("replySeq").toString();

			Map<String, Object> delReplyMap = new HashMap<String, Object>();
			delReplyMap.put("replySeq", replySeq);
			delReplyMap.put("replyContent", "작성자에 의해 삭제된 댓글입니다.");
			delReplyMap.put("upUserId", upUserId);

			replyService.delHadReReply(delReplyMap);

		} else {
			//리리플이 없는 경우 그대로 삭제 진행
			replyService.delReply(map);
		}
	}

    @ResponseBody
    @RequestMapping(value="/ajax.replyLikeHate", method=RequestMethod.GET)
    public ReplyVO ajaxReplyLikeHate(@RequestParam Map<String, Object> map, Model model, HttpServletRequest response, HttpSession session) {

    	//새로 들어온 값
    	int kind = Integer.parseInt(map.get("kind").toString());
    	int replySeq = Integer.parseInt(map.get("replySeq").toString());

    	try {
    		//유저의 기존 값 가져옴
    		ReplyVO userInReply = replyService.selectReplyStance(map);
//    		int userStance = userInReply.getLikeHateKind();

//    		if(userStance == kind) {
    			//기존값이 새로 들어온 값과 같을 경우 저장된 값을 삭제함
//    			replyService.deleteReplyStance(map);

//    		} else {
    			//기존값이 새로 들어온 값과 다를 경우 값을 업데이트함
//    			replyService.updateReplyStance(map);
//    		}

		} catch (NullPointerException e) {
			//기존값이 null일 경우 새로 들어온 값을 삽입해줌
			replyService.updateReplyStance(map);
		}

    	//좋아요 싫어요 개수 출력
    	ReplyVO likeHateCnt = replyService.replyLHCnt(replySeq);

    	//해당 댓글에 좋아요 싫어요가 하나도 없을 경우 쿼리문에 값이 나타나지 않아서 적어둠 / 쿼리 너무어려워서ㅠ 쿼리수정 임시보류함
    	if(likeHateCnt == null) {
    		ReplyVO likeHateCntZero = new ReplyVO();
//    		likeHateCntZero.setReplySeq(replySeq);
//    		likeHateCntZero.setHateCnt("0");
    		likeHateCntZero.setLikeCnt("0");
    		return likeHateCntZero;
    	}
    	return likeHateCnt;
    }

}
