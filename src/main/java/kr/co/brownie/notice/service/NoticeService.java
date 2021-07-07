package kr.co.brownie.notice.service;

import java.util.List;
import java.util.Map;

public interface NoticeService {
    public int insertNotice(Map<String, Object> map);

    public List<NoticeVO> getNoticelist(Map<String, Object> map);

    public int deleteNotice(int boardSeq);

    public NoticeVO getNotice(int boardSeq);

    public int updateNotice(Map<String,Object> map);

    public int selectCount();

    public String selectnickname();

    public int selectlevel();
}
