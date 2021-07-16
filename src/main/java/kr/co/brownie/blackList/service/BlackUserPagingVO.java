package kr.co.brownie.blackList.service;

import lombok.Builder;
import lombok.Data;

import java.util.List;

@Data
@Builder
public class BlackUserPagingVO {
    List<BlackUserVO> blackUserVO;
    int contentPerPage;
    int startPageNumber;
    int currentPageNumber;
    int endPageNumber;
    int totalPageNumber;
}
