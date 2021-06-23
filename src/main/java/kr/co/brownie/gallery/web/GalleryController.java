package kr.co.brownie.gallery.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import kr.co.brownie.gallery.service.GalleryService;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GalleryController {
	@Resource(name = "galleryService")
	GalleryService galleryService;

	@RequestMapping(path = "/galleryList")
	public String galleryList() {
		return "gallery/categories-grid";
	}

	@RequestMapping(path = "/galleryDetail")
	public String galleryDetail() {
		return "gallery/details-post-gallery";
	}
}
