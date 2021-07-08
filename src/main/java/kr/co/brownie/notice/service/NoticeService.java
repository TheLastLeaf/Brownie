package kr.co.brownie.notice.service;

import java.util.List;
import java.util.Map;

public interface NoticeService {
    int CONTENT_PER_PAGE = 10;

    PagingVO selectList(String keyword, int currentPageNumber);

    int count(String keyword);

    int insertNotice(Map<String, Object> map);

    List<NoticeVO> getNoticelist(Map<String, Object> map);

    int deleteNotice(int boardSeq);

    NoticeVO getNotice(int boardSeq);

    int updateNotice(Map<String, Object> map);

    int selectCount();

    String selectnickname(String inUserId);

}
