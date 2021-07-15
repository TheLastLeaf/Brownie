package kr.co.brownie.admin.service;

import kr.co.brownie.report.service.ReportVO;
import lombok.Builder;
import lombok.Data;

import java.util.List;

@Data
@Builder
public class ReportPagingVO {
    List<ReportVO> reportVOList;
    int contentPerPage;
    int startPageNumber;
    int currentPageNumber;
    int endPageNumber;
    int totalPageNumber;
}
