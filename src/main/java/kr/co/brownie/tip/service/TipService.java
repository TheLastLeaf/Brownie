package kr.co.brownie.tip.service;

public interface TipService {
    int CONTENT_PER_PAGE = 10;

    TipPagingVO selectList(String champion, int currentPageNumber);

    TipVO select(int board_seq);
}
