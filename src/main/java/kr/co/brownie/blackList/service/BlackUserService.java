package kr.co.brownie.blackList.service;


public interface BlackUserService {
    int CONTENT_PER_PAGE = 10;

    BlackUserPagingVO blackUserList(int currentPageNumber);

    int merge(int bListSeq, String userId, int endDate, String id);

    int update(int bUserSeq);
}
