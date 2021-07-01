package kr.co.brownie.notice.service.impl;

import kr.co.brownie.notice.service.NoticeVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository("noticeMapper")
public interface NoticeMapper {

    int insert(Map<String,Object> map);

    List<NoticeVO> selectList();

    NoticeVO read(int boardSeq);

    int delete(int boardSeq);

    int update(Map<String, Object> map);

    int count();
}