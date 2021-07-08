package kr.co.brownie.gallery.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import kr.co.brownie.gallery.service.FileVO;
import kr.co.brownie.gallery.service.GalleryPage;
import kr.co.brownie.gallery.service.GalleryService;
import kr.co.brownie.gallery.service.GalleryVO;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/gallery")
public class GalleryController {
	@Resource(name = "galleryService")
	GalleryService galleryService;

	private int size = 10;

	@GetMapping({ "", "/list" })
	public String galleryList(@RequestParam Map<String, Object> map, Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		map.put("id", id);
		
		//공지데이터
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
		System.out.println("어디서");
		int boardSeq = Integer.parseInt(map.get("boardSeq").toString());
		System.out.println("터진거야");
		GalleryVO galleryVO = this.galleryService.getGallery(boardSeq);
		System.out.println("시발");
		List<FileVO> fileVOList;
		if (galleryVO.getFileSeq()!=null) {
			System.out.println("놈아");
			fileVOList = this.galleryService.getFileList(Integer.parseInt(galleryVO.getFileSeq()));
			System.out.println("씨");
			model.addAttribute("fileVOList", fileVOList);
		}
		
		model.addAttribute("galleryVO", galleryVO);
		
		return "gallery/detail";
	}

	@GetMapping("/add")
	public String details_add_gallery() {
		return "gallery/galleryDetail";
	}

	@GetMapping("/update")
	public String details_modify_gallery() {
		return "gallery/galleryDetail";
	}

	@GetMapping("/delete")
	public String details_delete_gallery() {
		return "gallery/galleryDetail";
	}
	
}
