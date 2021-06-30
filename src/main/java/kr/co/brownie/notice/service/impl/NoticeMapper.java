package kr.co.brownie.notice.service.impl;

import kr.co.brownie.notice.service.NoticeVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository("noticeMapper")
public interface NoticeMapper {
    List<NoticeVO> selectList();
}
