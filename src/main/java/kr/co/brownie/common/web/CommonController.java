package kr.co.brownie.common.web;

import java.util.Calendar;
import java.util.HashMap;
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
        model.addAttribute("youTubeVoList", youTubeVoList);

    	return "common/index";
    }

    @GetMapping("/contact")
    public String contact() {
        return "common/contact";
    }

    @GetMapping("/day")
    public String day(Model model) {
    	HashMap<String, Integer> dateForCheck = dateForDayMethod();
    	model.addAttribute("dateForCheck", dateForCheck);

    	return "common/day";
    }

    public HashMap<String, Integer> dateForDayMethod() {
		Calendar cal = Calendar.getInstance();

		int year = cal.get(Calendar.YEAR);		//올해
        int month = cal.get(Calendar.MONTH);	//이번달계산
        month += 1;	// 달이 0월부터 시작하므로 +1
        int day = cal.get(Calendar.DATE);		//오늘 날짜
        int lastDate = cal.getActualMaximum(Calendar.DATE); //해당 월의 마지막 일(date)를 반환
        cal.set(Calendar.DAY_OF_MONTH,1); //DAY_OF_MONTH를 1로 설정 (월의 첫날)
        int firstDay = cal.get(Calendar.DAY_OF_WEEK); //이번달 1일 요일 반환 (일:1 ~ 토:7)

        HashMap<String, Integer> dayMap = new HashMap<String, Integer>();

        dayMap.put("year", year);
        dayMap.put("month", month);
        dayMap.put("day", day);
        dayMap.put("lastDate", lastDate);
        dayMap.put("firstDay", firstDay);

        return dayMap;
    }

}
