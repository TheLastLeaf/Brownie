package kr.co.brownie.miniGame.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import kr.co.brownie.gallery.service.GalleryService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/miniGame")
public class MiniGameController {

    @GetMapping
    public String main() {
        return list();
    }

    @GetMapping("/miniGame1")
    public String list() {
        return "miniGame/blueMarvel";
    }
    
}
