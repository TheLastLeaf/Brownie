package kr.co.brownie.report.service;

import java.util.Map;

public interface ReportService {
    int CONTENT_PER_PAGE = 10;

    ReportPagingVO selectReportList(int currentPageNumber);

    int insert(Map<String, Object> map);

    int update(int reportSeq, String id);

    int deleteReport(int reportSeq);

    ReportVO selectOneReport(int reportSeq);
}
