package kr.co.brownie.tip.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import kr.co.brownie.tip.service.TipService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tip")
public class TipController {
    @Resource(name = "tipService")
    TipService tipService;

    @GetMapping("/categories-grid")
    public String categories_grid() {
        return "tip/categories-grid";
    }

    @GetMapping
    public String main() {
        return list();
    }

    @GetMapping("/list")
    public String list() {
        return "tip/list";
    }

    @GetMapping("/details-post-default")
    public String details_post_default() {
        return "tip/details-post-default";
    }

    @GetMapping("/details-post-gallery")
    public String details_post_gallery() {
        return "tip/details-post-gallery";
    }

    @GetMapping("/details-post-review")
    public String details_post_review() {
        return "tip/details-post-review";
    }

    @GetMapping("/typography")
    public String typography() {
        return "tip/typography";
    }
}
