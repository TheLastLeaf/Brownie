package kr.co.brownie.free.service;

import lombok.Builder;
import lombok.Data;

import java.util.List;

@Data
@Builder
public class FreeReplyPagingVO {
    List<FreeReplyVO> freeReplyVOList;
    int replyPerPage;
    int startPageNumber;
    int currentPageNumber;
    int endPageNumber;
    int totalPageNumber;
}
