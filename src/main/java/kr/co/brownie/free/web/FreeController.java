package kr.co.brownie.free.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.brownie.board.service.BoardService;
import kr.co.brownie.board.service.BoardVO;
import kr.co.brownie.board.service.impl.BoardMapper;
import kr.co.brownie.free.service.FreeService;
import kr.co.brownie.free.service.FreeVO;
import kr.co.brownie.free.service.impl.FreeMapper;

@Controller
@RequestMapping("/free")
public class FreeController {
	@Resource(name = "freeService")
	FreeService freeService;

	@Resource(name = "boardService")
	BoardService boardService;

	@GetMapping(path= {"", "/freeList"})
	public String freeList(Model model) {
		//자유게시판 글 리스트 출력
		List<FreeVO> freeList = freeService.selectList();
		model.addAttribute("freeList", freeList);
		System.out.println(freeList);

		//최근 일주일 간 좋아요 수가 많은 상위 5개
		List<FreeVO> freeFamousList = freeService.selectFamous();
		model.addAttribute("freeFamousList", freeFamousList);

		return "free/freeBoardList";  // 자유게시판 리스트
	}

    @GetMapping("/freeBoardDetail")
    public String freeBoardDetail(@RequestParam Map<String, Object> map, Model model, HttpSession session) {

    	int boardSeq = Integer.parseInt(map.get("boardSeq").toString());
    	FreeVO freeDetail = freeService.selectDetail(boardSeq);
    	model.addAttribute("freeDetail", freeDetail);

    	//좋아요 싫어요 개수
    	BoardVO likeHateCnt = boardService.likeHateCnt(boardSeq);
    	model.addAttribute("likeHateCnt", likeHateCnt);

    	System.out.println(likeHateCnt);
    	System.out.println(freeDetail);

    	//최근 일주일 간 좋아요 수가 많은 상위 5개
    	List<FreeVO> freeFamousList = freeService.selectFamous();
    	model.addAttribute("freeFamousList", freeFamousList);

        return "free/freeBoardDetail"; // 자유게시판 리스트 디테일화면
    }

    @GetMapping("/freeBoardWrite")
    public String freeBoardWrite() {
        return "free/freeBoardWrite"; // 자유게시판 글쓰기 화면
    }

    @ResponseBody
    @RequestMapping(value="/ajax.likeHate", method=RequestMethod.GET)
    public void AjaxLikeHate(@RequestParam Map<String, Object> map, Model model, HttpServletRequest response, HttpSession session) {

    	int boardSeq = Integer.parseInt(map.get("boardSeq").toString());
    	String kind = map.get("kind").toString();
    	String inUserId = map.get("inUserId").toString();
    	System.out.println("map :"+map);
    	System.out.println(boardSeq +" "+ kind +" "+ inUserId);

//    	BoardVO likeHate = new BoardVO();
//
//    	likeHate.setBoardSeq(boardSeq);
//    	likeHate.setLikeHateKind(kind);
//    	likeHate.setInUserId(inUserId);

    	boardService.updateLikeHate(map);

    	//좋아요 싫어요 개수 출력
//    	BoardVO likeHateCnt = boardService.likeHateCnt(boardSeq);
//    	model.addAttribute("likeHateCnt", likeHateCnt);
//    	return likeHateCnt;

    }









}
