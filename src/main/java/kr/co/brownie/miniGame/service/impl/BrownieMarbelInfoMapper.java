package kr.co.brownie.miniGame.service.impl;

import kr.co.brownie.notice.service.NoticeVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository("noticeMapper")
public interface BrownieMarbelInfoMapper {
    int insert(Map<String,Object> map);

    List<NoticeVO> selectList();

    NoticeVO read(int boardSeq);

    int update(Map<String, Object> map);
    
    int delete(int boardSeq);
}