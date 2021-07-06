package kr.co.brownie.gallery.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

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

    @GetMapping(path={"","/list"})
    public String galleryList(@RequestParam Map<String,Object> map, Model model,HttpSession session) {
    	String id = (String)session.getAttribute("id");
    	map.put("id",id);
    	System.out.println(123123123);

    	String strPageNum = (String)map.get("pageNum")==null?"1":(String) map.get("pageNum");
        int pageNum = Integer.parseInt(strPageNum);
        map.put("pageNum", pageNum);
        List<GalleryVO> galleryVOList = this.galleryService.getGallerylist(map);
        model.addAttribute("galleryVOList", galleryVOList);
        model.addAttribute("gallery",map.get("gallery"));
        model.addAttribute("keyword",map.get("keyword"));
        return "gallery/galleryList";
    }
    
	/*
	 * @GetMapping("/detail") public String details_post_gallery() { return
	 * "gallery/galleryDetail"; }
	 * 
	 * @GetMapping("/add") public String details_add_gallery() { return
	 * "gallery/galleryDetail"; }
	 * 
	 * @GetMapping("/update") public String details_modify_gallery() { return
	 * "gallery/galleryDetail"; }
	 * 
	 * @GetMapping("/delete") public String details_delete_gallery() { return
	 * "gallery/galleryDetail"; }
	 */
}
