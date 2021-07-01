package kr.co.brownie.common.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.brownie.common.service.CommonService;
import kr.co.brownie.common.service.YouTubeService;
import kr.co.brownie.common.service.YouTubeVO;
import kr.co.brownie.common.service.impl.YouTubeServiceImpl;

@Controller
@RequestMapping
public class CommonController {
    @Resource(name = "commonService")
    CommonService commonService;

    @Resource(name = "youTubeService")
    YouTubeService youTubeService;


    @GetMapping(path = {"", "index"})
    public ModelAndView index(@RequestParam Map<String, Object> map, ModelAndView mav) {
    	//main youtube list
    	List<YouTubeVO> youTubeVoList = this.youTubeService.selectList(map);
    	mav.addObject("youTubeVoList", youTubeVoList);
    	mav.setViewName("common/index");

    	return mav;
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
