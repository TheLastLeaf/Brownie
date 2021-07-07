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
import kr.co.brownie.user.service.UserService;
import kr.co.brownie.user.service.UserVO;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/admin")
public class AdminController {
	@Resource(name = "adminService")
	AdminService adminService;

	@Resource(name = "userService")
	UserService userService;

	@GetMapping("/adminView")
	public String adminView(Model model) {

		Calendar cal = Calendar.getInstance();
        int month = cal.get(Calendar.MONTH)+1;	//이번달
        HashMap<String, Integer> dayMap = new HashMap<String, Integer>();
        dayMap.put("month", month);

    	model.addAttribute("dayMap", dayMap);

		return "admin/adminView"; //관리자 화면 기본
	}

	@GetMapping("/adminMemberList")
	public String adminMemberList(Model model) {

		//유저 리스트 셀렉트
		List<UserVO> userList = userService.selectList();
		model.addAttribute("userList", userList);


		return "admin/adminMemberList"; //회원 리스트 화면
	}

	@GetMapping("/adminReportList")
	public String adminReportList() {
		return "admin/adminReportList"; //신고 리스트 화면
	}

	@GetMapping("/adminBlackList")
	public String adminBlackList() {
		return "admin/adminBlackList"; //블랙리스트 화면
	}
}
