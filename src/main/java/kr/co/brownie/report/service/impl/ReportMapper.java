package kr.co.brownie.report.service.impl;

import kr.co.brownie.report.service.ReportVO;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("reportMapper")
public interface ReportMapper {
    List<ReportVO> selectReportList(Map<String, Object> map);

    int insert(Map<String, Object> map);

    int count();

    int update(Map<String, Object> map);
}
