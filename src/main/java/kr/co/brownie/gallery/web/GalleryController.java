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

    @GetMapping
    public String main() {
        return list();
    }

    @GetMapping("/list")
    public String list() {
        return "gallery/list";
    }
    
    @GetMapping("/galleryDetail")
    public String details_post_gallery() {
        return "gallery/detail";
    }
}
