package kr.co.brownie.common.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.brownie.common.service.CommonService;

@Controller
public class CommonController {
    @Resource(name = "commonService")
    CommonService commonService;

    @RequestMapping(path = "index")
    public String index() {
        return "common/index";
    }

    @RequestMapping(path = "/")
    public String main() {
        return "redirect:/index";
    }

    @RequestMapping(path = "categories-grid")
    public String categories_grid() {
        return "common/categories-grid";
    }

    @RequestMapping(path = "categories-list")
    public String categories_list() {
        return "common/categories-list";
    }

    @RequestMapping(path = "contact")
    public String contact() {
        return "common/contact";
    }

    @RequestMapping(path = "details-post-default")
    public String details_post_default() {
        return "common/details-post-default";
    }

    @RequestMapping(path = "details-post-gallery")
    public String details_post_gallery() {
        return "common/details-post-gallery";
    }

    @RequestMapping(path = "details-post-review")
    public String details_post_review() {
        return "common/details-post-review";
    }

    @RequestMapping(path = "typography")
    public String typography() {
        return "common/typography";
    }
}
