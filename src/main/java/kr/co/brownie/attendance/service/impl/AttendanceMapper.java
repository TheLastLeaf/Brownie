package kr.co.brownie.attendance.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.brownie.attendance.service.AttendanceVO;

@Mapper
@Repository("attendanceMapper")
public interface AttendanceMapper {

	List<AttendanceVO> selectOne(String userId);

	int insertOne(String userId);

}
