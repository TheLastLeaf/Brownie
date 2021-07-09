package kr.co.brownie.free.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.brownie.free.service.FreeService;
import kr.co.brownie.free.service.FreeVO;
import kr.co.brownie.free.service.impl.FreeMapper;

@Controller
@RequestMapping("/free")
public class FreeController {

	@Resource(name = "freeService")
	FreeService freeService;

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

    	System.out.println(freeDetail);
    	model.addAttribute("freeDetail", freeDetail);

    	//최근 일주일 간 좋아요 수가 많은 상위 5개
    	List<FreeVO> freeFamousList = freeService.selectFamous();
    	model.addAttribute("freeFamousList", freeFamousList);

        return "free/freeBoardDetail"; // 자유게시판 리스트 디테일화면
    }

    @GetMapping("/freeBoardWrite")
    public String freeBoardWrite() {
        return "free/freeBoardWrite"; // 자유게시판 글쓰기 화면
    }












}
