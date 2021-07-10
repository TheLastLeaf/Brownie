package kr.co.brownie.gallery.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import kr.co.brownie.board.service.BoardService;
import kr.co.brownie.board.service.BoardVO;
import kr.co.brownie.gallery.service.FileVO;
import kr.co.brownie.gallery.service.GalleryPage;
import kr.co.brownie.gallery.service.GalleryService;
import kr.co.brownie.gallery.service.GalleryVO;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import com.google.gson.JsonObject;
import org.apache.commons.io.FileUtils;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

@Controller
@RequestMapping("/gallery")
public class GalleryController {
	@Resource(name = "galleryService")
	GalleryService galleryService;

	@Resource(name = "boardService")
	BoardService boardService;
	
	private int size = 30;

	@GetMapping({ "", "/list" })
	public String galleryList(@RequestParam Map<String, Object> map, Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		map.put("id", id);
		
		//怨듭��뜲�씠�꽣
		List<GalleryVO> noticeVOList = this.galleryService.getNoticeList(map);
		
		System.out.println(noticeVOList);
		System.out.println(noticeVOList.get(1).getUpDate());
		
		int total = this.galleryService.selectCount();
		String strPageNum = (String) map.get("pageNum") == null ? "1" : (String) map.get("pageNum");
		int pageNum = Integer.parseInt(strPageNum);
		map.put("pageNum", pageNum);
		
		List<GalleryVO> galleryVOList = this.galleryService.getGalleryList(map);
		
		model.addAttribute("galleryVOList", new GalleryPage(total, pageNum, size, galleryVOList));
		model.addAttribute("noticeVOList", noticeVOList);
		model.addAttribute("gallery", map.get("gallery"));
		model.addAttribute("keyword", map.get("keyword"));
		return "gallery/galleryList";
	}

	
	@GetMapping("/detail")
	public String details_post_gallery(@RequestParam Map<String, Object> map, Model model, HttpSession session) {
		int boardSeq = Integer.parseInt(map.get("boardSeq").toString());
		GalleryVO galleryVO = this.galleryService.getGallery(boardSeq);
		List<FileVO> fileVOList;
		
		BoardVO likeHateCnt = boardService.likeHateCnt(boardSeq);
    	model.addAttribute("likeHateCnt", likeHateCnt);
		
		
		if (galleryVO.getFileSeq()!=null) {
			fileVOList = this.galleryService.getFileList(Integer.parseInt(galleryVO.getFileSeq()));
			model.addAttribute("fileVOList", fileVOList);
		}
		
		model.addAttribute("galleryVO", galleryVO);
		
		return "gallery/galleryDetail";
	}

	@GetMapping("/add")
	public String details_add_gallery() {
		return "gallery/galleryAdd";
	}
	
	/*
	@PostMapping("/add")
	public String add(@RequestParam Map<String, Object> map, Model model,HttpSession session, HttpServletRequest servletRequest) {
        String title = servletRequest.getParameter("title");
        String content = servletRequest.getParameter("summernote");
		
		System.out.println(title);

		System.out.println(content);
		
		String id = (String) session.getAttribute("id");
		map.put("id", id);
		map.put("title", title);
		map.put("content", content);
		
		int cnt = this.galleryService.insertGallery(map);
		
		System.out.println(cnt);
		
		//file 이름가져오기
		if(cnt==1) {
			return "gallery/galleryList";
		}
		return "gallery/galleryAdd";
	}
	*/
	
	@GetMapping("/update")
	public String details_modify_gallery(@RequestParam Map<String, Object> map, Model model, HttpSession session) {
		int boardSeq = Integer.parseInt(map.get("boardSeq").toString());
		GalleryVO galleryVO = this.galleryService.getGallery(boardSeq);
		System.out.println(galleryVO.getContent());
		model.addAttribute("galleryVO", galleryVO);
		
		return "gallery/galleryUpdate";
	}
	
	@PostMapping("/update")
	public String update(@RequestParam Map<String, Object> map, Model model, HttpSession session, HttpServletRequest servletRequest) {
		String title = servletRequest.getParameter("title");
        String content = servletRequest.getParameter("summernote");
		
		System.out.println(title);

		System.out.println(content);
		
		String id = (String) session.getAttribute("id");
		map.put("id", id);
		map.put("title", title);
		map.put("content", content);
		
		int cnt = this.galleryService.updateGallery(map);
		
		System.out.println(cnt);
		
		if(cnt==1) {
			return "gallery/galleryDetail";
		}
		return "gallery/galleryUpdate";
	}

	@GetMapping("/delete")
	public String details_delete_gallery(@RequestParam Map<String, Object> map, Model model, HttpSession session) {
		int boardSeq = Integer.parseInt(map.get("boardSeq").toString());
		int cnt = this.galleryService.deleteGallery(boardSeq);
		System.out.println("delete : "+cnt);
		
		if(cnt==1) {
			return "gallery/galleryList";
		}
		
		return "gallery/galleryDetail";
	}
	
	@ResponseBody
    @RequestMapping(value="/ajax.galleryadd", method=RequestMethod.GET)
    public int AjaxAdd(@RequestParam Map<String, Object> map, Model model, HttpServletRequest response, HttpSession session, HttpServletRequest servletRequest) {
		String title = map.get("title").toString();
    	String content = map.get("summernote").toString();
    	
    	System.out.println(title);

		System.out.println(content);
		
		String inUserId = "곽지훈";
		map.put("inUserId", inUserId);
		map.put("title", title);
		map.put("content", content);
		
		int cnt = this.galleryService.insertGallery(map);
		
		System.out.println(cnt);
    	
		return cnt;
	}
	
	@ResponseBody
    @RequestMapping(value="/ajax.gallerylikeHate", method=RequestMethod.GET)
    public BoardVO AjaxLikeHate(@RequestParam Map<String, Object> map, Model model, HttpServletRequest response, HttpSession session) {

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
    	model.addAttribute("likeHateCnt", likeHateCnt);
    	return likeHateCnt;

    }

	
	
}
