package kr.co.brownie.tip.service;

import lombok.Builder;
import lombok.Data;

import java.util.List;

@Data
@Builder
public class TipPagingVO {
    List<TipVO> tipVOList;
    int contentPerPage;
    int startPageNumber;
    int currentPageNumber;
    int endPageNumber;
    int totalPageNumber;
}
