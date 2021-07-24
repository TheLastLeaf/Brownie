package kr.co.brownie.chat.service;

import lombok.Builder;
import lombok.Data;

import java.util.List;

@Data
@Builder
public class ChatPagingVO {
    List<ChatVO> chatVO;
    int contentPerPage;
    int startPageNumber;
    int currentPageNumber;
    int endPageNumber;
    int totalPageNumber;
}
