 package kr.co.brownie.admin.web;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import kr.co.brownie.admin.service.AdminService;
import kr.co.brownie.admin.service.AdminVO;
import kr.co.brownie.blackList.service.BlackListService;
import kr.co.brownie.blackList.service.BlackListVO;
import kr.co.brownie.report.service.ReportService;
import kr.co.brownie.report.service.ReportVO;
import kr.co.brownie.user.service.UserService;
import kr.co.brownie.user.service.UserVO;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/admin")
public class AdminController {
	@Resource(name = "adminService")
	AdminService adminService;

	@Resource(name = "blackListService")
	BlackListService blackListService;

	@Resource(name = "userService")
	UserService userService;

	@Resource(name = "reportService")
	ReportService reportService;


	@GetMapping(path={"", "/adminView"})
	public String adminView(Model model) {
		//이번달 표시
		Calendar cal = Calendar.getInstance();
        int month = cal.get(Calendar.MONTH)+1;	//이번달
        HashMap<String, Integer> dayMap = new HashMap<String, Integer>();
        dayMap.put("month", month);
    	model.addAttribute("dayMap", dayMap);

    	//전체 회원 수 / 최근 일주일 간 신규 회원 수
    	AdminVO UserCnt = adminService.UserCnt();
    	model.addAttribute("UserCnt", UserCnt);

    	//미처리 신고 수 집계
    	AdminVO reportCnt = adminService.ReportCnt();
    	model.addAttribute("reportCnt", reportCnt);


    	// 공지사항 포함 총 게시글 수 / (공지사항 제외한) 최근 일주일 간 신규 게시글 수 집계
    	AdminVO boardCnt = adminService.BoardCnt();
    	model.addAttribute("boardCnt", boardCnt);

		return "admin/adminView"; //관리자 화면 기본
	}

	@GetMapping("/adminMemberList")
	public String adminMemberList(Model model) {
		//유저 리스트 셀렉트
//		List<UserVO> userList = userService.selectList();
//		model.addAttribute("userList", userList);
		return "admin/adminMemberList"; //회원 리스트 화면
	}

	@GetMapping("/adminReportList")
	public String adminReportList(Model model) {
		List<ReportVO> reportList = reportService.selectReportList();
		model.addAttribute("reportList", reportList);
		return "admin/adminReportList"; //신고 리스트 화면
	}

	@GetMapping("/adminBlackList")
	public String adminBlackList(Model model) {
		List<BlackListVO> blackList = blackListService.selectBlackList();
		model.addAttribute("blackList", blackList);
		return "admin/adminBlackList"; //블랙리스트 화면
	}
}
