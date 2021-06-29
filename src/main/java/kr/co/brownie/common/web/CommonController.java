package kr.co.brownie.common.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.brownie.common.service.CommonService;

@Controller
@RequestMapping
public class CommonController {
    @Resource(name = "commonService")
    CommonService commonService;

    @GetMapping(path = {"", "index"})
    public String index() {
        return "common/index";
    }

    @GetMapping("/contact")
    public String contact() {
        return "common/contact";
    }
}
