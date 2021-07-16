package kr.co.brownie.admin.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.brownie.admin.service.AdminService;
import kr.co.brownie.admin.service.AdminVO;


@Service("adminService")
public class AdminServiceImpl implements AdminService {
	@Resource(name = "adminMapper")
	AdminMapper adminMapper;

	@Override
	public AdminVO UserCnt() {
		return adminMapper.UserCnt();
	}

	@Override
	public AdminVO ReportCnt() {
		return adminMapper.ReportCnt();
	}

	@Override
	public AdminVO BoardCnt() {
		return adminMapper.BoardCnt();
	}

	@Override
	public AdminVO BlackUserCnt() { return adminMapper.BlackUserCnt(); }


}
