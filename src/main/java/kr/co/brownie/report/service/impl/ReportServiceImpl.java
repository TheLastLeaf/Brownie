package kr.co.brownie.report.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.co.brownie.report.service.ReportPagingVO;
import kr.co.brownie.notice.service.PagingVO;
import org.springframework.stereotype.Service;

import kr.co.brownie.report.service.ReportService;
import kr.co.brownie.report.service.ReportVO;

@Service("reportService")
public class ReportServiceImpl implements ReportService {
    @Resource(name = "reportMapper")
    ReportMapper reportMapper;

    @Override
    public ReportPagingVO selectReportList(int currentPageNumber) {
        Map<String, Object> map = new HashMap<>();
        map.put("contentPerPage", CONTENT_PER_PAGE);
        map.put("currentPageNumber", currentPageNumber);

        int total = reportMapper.count();

        return ReportPagingVO.builder()
                .reportVOList(reportMapper.selectReportList(map))
                .contentPerPage(CONTENT_PER_PAGE)
                .startPageNumber((currentPageNumber - 1) / CONTENT_PER_PAGE + 1)
                .currentPageNumber(currentPageNumber)
                .endPageNumber(Math.min((currentPageNumber - 1) / CONTENT_PER_PAGE + 10, (total - 1) / CONTENT_PER_PAGE + 1))
                .totalPageNumber((total - 1) / CONTENT_PER_PAGE + 1)
                .build();
    }

    @Override
    public int insert(Map<String, Object> map) {
        return reportMapper.insert(map);
    }

    @Override
    public int update(int reportSeq, String id) {
        Map<String,Object> map = new HashMap<>();
        map.put("reportSeq",reportSeq);
        map.put("id",id);
        return reportMapper.update(map);
    }

}
