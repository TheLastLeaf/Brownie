package kr.co.brownie.attendance.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.brownie.attendance.service.AttendanceService;
import kr.co.brownie.attendance.service.AttendanceVO;

@Service("attendanceService")
public class AttendanceServiceImpl implements AttendanceService{
	@Resource(name = "attendanceMapper")
	AttendanceMapper attendanceMapper;

	@Override
	public List<AttendanceVO> getCheckedDate(String userId) {
		return attendanceMapper.selectOne(userId);
	}

	@Override
	public int insertOne() {
		return 0;
	}
}
