package kr.co.brownie.notice.service;

import java.util.List;
import java.util.Map;

public interface NoticeService {
    int CONTENT_PER_PAGE = 10;

    PagingVO selectList(String notice,String keyword, int currentPageNumber);

    int count(String keyword);

    int insertNotice(String id, String title, String content);

    List<NoticeVO> getNoticelist(Map<String, Object> map);

    int deleteNotice(int boardSeq);

    NoticeVO getNotice(int boardSeq);

    int updateNotice(String id,String title,String content, int boardSeq);

    int selectCount();

    List<NoticeVO> noticeList();
}
