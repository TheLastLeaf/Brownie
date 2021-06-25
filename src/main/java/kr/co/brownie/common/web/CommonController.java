package kr.co.brownie.common.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.brownie.common.service.CommonService;

@Controller
public class CommonController {
    @Resource(name = "commonService")
    CommonService commonService;

    @RequestMapping(path = "/")
    public String main() {
        return index();
    }

    @RequestMapping(path = "/index")
    public String index() {
        return "common/index";
    }

    @RequestMapping(path = "/contact")
    public String contact() {
        return "common/contact";
    }
}
