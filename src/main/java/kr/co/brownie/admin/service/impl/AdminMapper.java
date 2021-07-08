package kr.co.brownie.admin.service.impl;

import org.springframework.stereotype.Repository;

import kr.co.brownie.admin.service.AdminVO;

@Repository("adminMapper")
public interface AdminMapper {
	AdminVO UserCnt();

	AdminVO ReportCnt();

	AdminVO BoardCnt();
}
