package kr.co.brownie.attendance.service.impl;

import kr.co.brownie.attendance.service.AttendanceService;
import kr.co.brownie.attendance.service.AttendanceVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("attendanceService")
public class AttendanceServiceImpl implements AttendanceService {
    @Resource(name = "attendanceMapper")
    AttendanceMapper attendanceMapper;

    @Override
    public List<AttendanceVO> getCheckedDate(String userId) {
        return attendanceMapper.getCheckedDate(userId);
    }

    @Override
    public int insertOne(String userId) {
        return attendanceMapper.insertOne(userId);
    }
}
