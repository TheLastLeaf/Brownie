package kr.co.brownie.reply.service;

import lombok.Builder;
import lombok.Data;

import java.util.List;

@Data
@Builder
public class ReplyPagingVO {
    List<ReplyVO> replyVOList;
    int contentPerPage;
    int startPageNumber;
    int currentPageNumber;
    int endPageNumber;
    int totalPageNumber;
}
