package kr.co.brownie.notice.service;

import lombok.Builder;
import lombok.Data;

import java.util.List;

@Data
@Builder
public class PagingVO {
    List<NoticeVO> noticeVOList;
    int contentPerPage;
    int startPageNumber;
    int currentPageNumber;
    int endPageNumber;
    int totalPageNumber;
}
