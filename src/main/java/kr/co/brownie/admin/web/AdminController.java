 package kr.co.brownie.admin.web;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.brownie.admin.service.AdminService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/admin")
public class AdminController {
	@Resource(name = "adminService")
	AdminService adminService;

	@GetMapping("/adminView")
	public String adminView() {
		return "admin/adminView"; //관리자 화면 기본
	}

	@GetMapping("/adminMemberList")
	public String adminMemberList() {
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
