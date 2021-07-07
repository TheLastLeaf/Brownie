package kr.co.brownie.admin.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.brownie.admin.service.AdminService;


@Service("adminService")
public class AdminServiceImpl implements AdminService {
	@Resource(name = "adminMapper")
	AdminMapper adminMapper;
}
