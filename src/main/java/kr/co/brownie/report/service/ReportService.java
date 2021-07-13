package kr.co.brownie.report.service;

import java.util.List;
import java.util.Map;

public interface ReportService {
	List<ReportVO> selectReportList();

	int insert(Map<String,Object> map);
}
