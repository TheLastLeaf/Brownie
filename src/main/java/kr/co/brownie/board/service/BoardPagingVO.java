package kr.co.brownie.board.service;

import lombok.Builder;
import lombok.Data;

import java.util.List;

@Data
@Builder
public class BoardPagingVO {
    List<BoardVO> boardVOList;
    int contentPerPage;
    int startPageNumber;
    int currentPageNumber;
    int endPageNumber;
    int totalPageNumber;
}
