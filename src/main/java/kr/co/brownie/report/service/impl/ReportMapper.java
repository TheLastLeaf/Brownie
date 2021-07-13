package kr.co.brownie.report.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.co.brownie.report.service.ReportVO;

@Repository("reportMapper")
public interface ReportMapper {
	List<ReportVO> selectReportList();

	int insert(Map<String,Object> map);
}
