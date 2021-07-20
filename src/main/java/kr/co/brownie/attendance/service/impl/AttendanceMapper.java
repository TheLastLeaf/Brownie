package kr.co.brownie.attendance.service.impl;

import kr.co.brownie.attendance.service.AttendanceVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository("attendanceMapper")
public interface AttendanceMapper {
    List<AttendanceVO> getCheckedDate(String userId);

    int insertOne(String userId);
}
