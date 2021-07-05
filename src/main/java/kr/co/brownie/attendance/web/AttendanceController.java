package kr.co.brownie.attendance.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.brownie.attendance.service.AttendanceService;
import kr.co.brownie.attendance.service.AttendanceVO;

@Controller
@RequestMapping("/attendance")
public class AttendanceController {

	@Resource(name = "attendanceService")
	AttendanceService attendanceService;

	@GetMapping(path={"", "/day"})
	public String dayView(Model model) {
		//서버 오늘 날짜
    	HashMap<String, Integer> dateForCheck = dateForDayMethod();
    	model.addAttribute("dateForCheck", dateForCheck);

    	String year = dateForCheck.get("year")+ "";
    	Integer month = dateForCheck.get("month");

    	//유저가 출석 체크한 날짜 : test 유저라서 test 써 놨음. 나중에 유저 아이디로 바꾸면 됨
    	List<AttendanceVO> checkedList = this.attendanceService.getCheckedDate("test");
    	List<Integer> dateList = new ArrayList<>();
    	for ( AttendanceVO attendance : checkedList ) {
    		String tempDate = attendance.getInDate();
    		String[] tempDateArr = tempDate.split("/");
    		//오늘 날짜랑 디비에 저장된 날짜 비교해서 일자 삽입
    		if(year.substring(year.length()-2, year.length()).equals(tempDateArr[0]) && month == Integer.parseInt(tempDateArr[1])) {
    			dateList.add(Integer.parseInt(tempDateArr[2]));
    		}
    	}
    	model.addAttribute("dateList", dateList);
    	return "attendance/day";	//이게 jsp 경로인가봐
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
