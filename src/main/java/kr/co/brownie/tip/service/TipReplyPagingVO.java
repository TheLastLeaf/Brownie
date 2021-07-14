package kr.co.brownie.tip.service;

import lombok.Builder;
import lombok.Data;

import java.util.List;

@Data
@Builder
public class TipReplyPagingVO {
    List<TipReplyVO> tipReplyVOList;
    int replyPerPage;
    int startPageNumber;
    int currentPageNumber;
    int endPageNumber;
    int totalPageNumber;
}
