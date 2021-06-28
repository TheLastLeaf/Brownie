package kr.co.brownie.gallery.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import kr.co.brownie.gallery.service.GalleryService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/gallery")
public class GalleryController {
    @Resource(name = "galleryService")
    GalleryService galleryService;

    @GetMapping("/galleryList")
    public String galleryList() {
        return "gallery/galleryList";
    }
    
    @GetMapping("/galleryDetail")
    public String details_post_gallery() {
        return "gallery/galleryDetail";
    }
    
    @GetMapping
    public String main() {
        return galleryList();
    }
}
