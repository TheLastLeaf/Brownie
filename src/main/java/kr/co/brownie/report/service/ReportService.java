package kr.co.brownie.report.service;

import kr.co.brownie.admin.service.ReportPagingVO;

import java.util.List;
import java.util.Map;

public interface ReportService {
    int CONTENT_PER_PAGE = 10;

    ReportPagingVO selectReportList(int currentPageNumber);

    int insert(Map<String, Object> map);
}
