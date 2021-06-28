package kr.co.brownie.admin.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.brownie.admin.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Resource(name = "adminService")
	AdminService adminService;

	@GetMapping("/admin_view")
	public String admin_view() {
		return "admin/admin_view";
	}

}
