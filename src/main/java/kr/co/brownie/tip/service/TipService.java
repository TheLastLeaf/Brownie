package kr.co.brownie.tip.service;

import java.util.Map;

public interface TipService {
    int CONTENT_PER_PAGE = 10;

    TipPagingVO selectTipList(String champion, int currentPageNumber);
}
