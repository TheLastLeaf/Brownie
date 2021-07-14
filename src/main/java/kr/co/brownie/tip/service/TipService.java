package kr.co.brownie.tip.service;

public interface TipService {
    int CONTENT_PER_PAGE = 10;

    TipPagingVO selectList(String champion, int currentPageNumber);

    TipVO select(int board_seq);

    int insert(String author, String champion, String title, String content);

    int update(int boardSeq, String author, String champion, String title, String content);
}
