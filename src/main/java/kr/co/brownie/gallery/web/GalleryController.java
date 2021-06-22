package kr.co.brownie.gallery.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.brownie.gallery.service.GalleryService;

@Controller
public class GalleryController {
	@Autowired
	GalleryService galleryService;
}
