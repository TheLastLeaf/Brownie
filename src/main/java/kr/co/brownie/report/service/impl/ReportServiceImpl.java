package kr.co.brownie.report.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.brownie.report.service.ReportService;
import kr.co.brownie.report.service.ReportVO;

@Service("reportService")
public class ReportServiceImpl implements ReportService {
	@Resource(name = "reportMapper")
	ReportMapper reportMapper;

	@Override
	public List<ReportVO> selectReportList() {
		return reportMapper.selectReportList();
	}

}
