package kr.co.brownie.common.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.brownie.common.service.CommonService;
import kr.co.brownie.youtube.service.YouTubeService;
import kr.co.brownie.youtube.service.YouTubeVO;

@Controller
@RequestMapping
public class CommonController {
    @Resource(name = "commonService")
    CommonService commonService;

    @Resource(name = "youTubeService")
    YouTubeService youTubeService;


    @GetMapping(path = {"", "index"})
    public String index(Model model) {
    	//main youtube list
    	List<YouTubeVO> youTubeVoList = youTubeService.selectList();
        System.out.println(youTubeVoList);
        model.addAttribute("youTubeVoList", youTubeVoList);

    	return "common/index";
    }

    @GetMapping("/contact")
    public String contact() {
        return "common/contact";
    }

    @GetMapping("/day")
    public String day() {
    	return "common/day";
    }
}
