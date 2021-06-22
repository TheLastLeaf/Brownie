package kr.co.brownie.gallery.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import kr.co.brownie.gallery.service.GalleryService;

@Controller
public class GalleryController {
	@Resource(name = "galleryService")
	GalleryService galleryService;
}
