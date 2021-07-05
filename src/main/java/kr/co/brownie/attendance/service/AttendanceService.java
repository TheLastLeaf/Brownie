package kr.co.brownie.attendance.service;

import java.util.List;

public interface AttendanceService {
	List<AttendanceVO> getCheckedDate(String userId);

	int insertOne();
}
