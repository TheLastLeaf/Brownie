package kr.co.brownie.gallery.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import kr.co.brownie.gallery.service.GalleryService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/gallery")
public class GalleryController {
	@Resource(name = "galleryService")
	GalleryService galleryService;

	@GetMapping("/categories-grid")
	public String categories_grid() {
		return "gallery/categories-grid";
	}

	@GetMapping("/categories-list")
	public String categories_list() {
		return "gallery/categories-list";
	}
	
	@GetMapping("/details-post-default")
	public String details_post_default() {
		return "gallery/details-post-default";
	}

	@GetMapping("/details-post-gallery")
	public String details_post_gallery() {
		return "gallery/details-post-gallery";
	}

	@GetMapping("/details-post-review")
	public String details_post_review() {
		return "gallery/details-post-review";
	}

	@GetMapping("/typography")
	public String typography() {
		return "gallery/typography";
	}
}
