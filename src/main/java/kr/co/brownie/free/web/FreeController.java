package kr.co.brownie.free.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.brownie.report.service.ReportService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import kr.co.brownie.board.service.BoardService;
import kr.co.brownie.board.service.BoardVO;
import kr.co.brownie.board.service.impl.BoardMapper;
import kr.co.brownie.free.service.FreeService;
import kr.co.brownie.free.service.FreeVO;
import kr.co.brownie.free.service.impl.FreeMapper;
import kr.co.brownie.reply.service.ReplyService;
import kr.co.brownie.reply.service.ReplyVO;

@Controller
@RequestMapping("/free")
public class FreeController {
	@Resource(name = "freeService")
	FreeService freeService;

	@Resource(name = "boardService")
	BoardService boardService;

	@Resource(name = "replyService")
	ReplyService replyService;

	@Resource(name = "reportService")
	ReportService reportService;

	@GetMapping(path= {"", "/freeList"})
	public String freeList(Model model) {
		//자유게시판 글 리스트 출력
		List<FreeVO> freeList = freeService.selectList();
		model.addAttribute("freeList", freeList);

		//최근 일주일 간 좋아요 수가 많은 상위 5개
		List<FreeVO> freeFamousList = freeService.selectFamous();
		model.addAttribute("freeFamousList", freeFamousList);

		//상단 메뉴바에 표시되는 최근 게시물 5개
        List<FreeVO> recentList = freeService.selectRecentForMenu();
        System.out.println(recentList);
        model.addAttribute("recentList", recentList);



		return "free/freeBoardList";  // 자유게시판 리스트
	}

    @GetMapping("/freeBoardDetail")
    public String freeBoardDetail(@RequestParam Map<String, Object> map, Model model, HttpSession session) {

    	int boardSeq = Integer.parseInt(map.get("boardSeq").toString());
    	FreeVO freeDetail = freeService.selectDetail(boardSeq);
    	model.addAttribute("freeDetail", freeDetail);

    	//최근 일주일 간 좋아요 수가 많은 상위 5개
    	List<FreeVO> freeFamousList = freeService.selectFamous();
    	model.addAttribute("freeFamousList", freeFamousList);

    	//좋아요 싫어요 개수
    	BoardVO likeHateCnt = boardService.likeHateCnt(boardSeq);
    	model.addAttribute("likeHateCnt", likeHateCnt);

    	//게시글 하단 : 이전 게시글과 다음 게시글을 리스트로 가져옵니다.
    	List<FreeVO> freeRecent = freeService.selectRecent(boardSeq);
    	for(FreeVO freeRecentOne : freeRecent) {
    		if(freeRecentOne.getBoardSeq() < boardSeq) {
    			//게시글 번호가 해당 게시글 번호보다 작다면 이전 게시글
    			model.addAttribute("freePrev", freeRecentOne);
    		} else if(freeRecentOne.getBoardSeq() > boardSeq) {
    			//게시글 번호가 해당 게시글 번호보다 크다면 다음 게시글
    			model.addAttribute("freeNext", freeRecentOne);
    		}
    	}

    	//게시글 하단 : 현재글 이전글 다음글 작성일자 및 리플 개수
    	ReplyVO recentBoardReplyDate = replyService.boardReplyCnt(boardSeq);
    	model.addAttribute("recentBoardReplyDate", recentBoardReplyDate);

    	//게시글 리플 : 현재 프로필 사진 누락되어있어서 쿼리문 수정해야함 / file 테이블도 연결해서 쿼리쓰기
    	List<ReplyVO> replyOnBoard = replyService.replyOnBoard(boardSeq);
    	System.out.println("replyOnBoard : "+replyOnBoard);
    	model.addAttribute("replyOnBoard", replyOnBoard);

    	//게시글 리리플 :리리플에 유저 태그 기능도 고려해보도록 하겠음 아빠가 제안해줌 하하
    	Map<String, Object> reReplyMap = new HashMap<String, Object>();
    	for(ReplyVO reply : replyOnBoard) {
    		//리플 시퀀스 번호를 받아와서 시퀀스 번호에 맞게 해당 리리플 목록을 가져와서 맵에 저장
    		int replySeq = reply.getReplySeq();

    		//리플 시퀀스 번호를 기반으로 리리플 리스트를 구함
    		List<ReplyVO> replyOnReply = replyService.replyOnReply(replySeq);

    		//값이 있는 경우 { replySeq : List<replyVO> } 이런 식으로 넣어줘야할듯
    		if(replyOnReply.size() > 0) {
    			reReplyMap.put(replySeq+"", replyOnReply);
    		}
    	}
    	model.addAttribute("reReplyMap", reReplyMap);


		//상단 메뉴바에 표시되는 최근 게시물 5개
        List<FreeVO> recentList = freeService.selectRecentForMenu();
        System.out.println(recentList);
        model.addAttribute("recentList", recentList);

        return "free/freeBoardDetail"; // 자유게시판 리스트 디테일화면
    }

    @GetMapping("/freeBoardWrite")
    public String freeBoardWrite() {
        return "free/freeBoardWrite"; // 자유게시판 글쓰기 화면
    }

    @ResponseBody
    @RequestMapping(value="/ajax.likeHate", method=RequestMethod.GET)
    public BoardVO ajaxLikeHate(@RequestParam Map<String, Object> map, Model model, HttpServletRequest response, HttpSession session) {

    	//새로 들어온 값
    	int kind = Integer.parseInt(map.get("kind").toString());
    	int boardSeq = Integer.parseInt(map.get("boardSeq").toString());

    	try {
    		//유저의 기존 값 가져옴
    		BoardVO userInBoard = boardService.selectUserStance(map);
    		int userStance = userInBoard.getLikeHateKind();

    		if(userStance == kind) {
    			//기존값이 새로 들어온 값과 같을 경우 저장된 값을 삭제함
    			boardService.deleteUserStance(map);

    		} else {
    			//기존값이 새로 들어온 값과 다를 경우 값을 업데이트함
    			boardService.updateLikeHate(map);
    		}

		} catch (NullPointerException e) {
			//기존값이 null일 경우 새로 들어온 값을 삽입해줌
			boardService.updateLikeHate(map);
		}

    	//좋아요 싫어요 개수 출력
    	BoardVO likeHateCnt = boardService.likeHateCnt(boardSeq);

    	//해당 게시글에 좋아요 싫어요가 하나도 없을 경우 쿼리문에 값이 나타나지 않아서 적어둠 / 쿼리 너무어려워서ㅠ 쿼리수정 임시보류함
    	if(likeHateCnt == null) {
    		BoardVO likeHateCntZero = new BoardVO();
    		likeHateCntZero.setBoardSeq(boardSeq);
    		likeHateCntZero.setHateCnt("0");
    		likeHateCntZero.setLikeCnt("0");
    		return likeHateCntZero;
    	}
    	return likeHateCnt;
    }

    @GetMapping("/report")
	public String report(HttpServletRequest request, Model model, HttpSession session){
		String userId = request.getParameter("userId");
		model.addAttribute("userId",userId);
		String id = (String)session.getAttribute("id");
		model.addAttribute("id",id);
		return "free/report";
	}
	@PostMapping("/report")
	public String reportPost(Map<String,Object> map, HttpSession session, Model model, HttpServletRequest servletRequest){
		String id = (String)session.getAttribute("id");
		String content = servletRequest.getParameter("content");
		String reportName = servletRequest.getParameter("reportName");
		String userId = servletRequest.getParameter("userId");
		map.put("content",content);
		map.put("reportName",reportName);
		map.put("id",id);
		map.put("userId",userId);
		if(id==null){
			model.addAttribute("message", "<script>alert('로그인 후 이용가능한 서비스입니다.'); history.go(-1);</script>");
			return "common/message";
		}else{
			reportService.insert(map);
			return "free/report";
		}
	}
}
