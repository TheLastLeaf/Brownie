package kr.co.brownie.free.service.impl;

import kr.co.brownie.free.service.FreeReplyVO;
import kr.co.brownie.free.service.FreeVO;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("freeMapper")
public interface FreeMapper {
    List<FreeVO> selectList();

    List<FreeVO> selectFamous();

    FreeVO selectDetail(int boardSeq);

    List<FreeVO> selectRecent(int boardSeq);

    List<FreeVO> selectRecentForMenu();

    void insertFree(Map<String, Object> map);

    void deleteFree(Map<String, Object> map);

    int update(Map<String, Object> map);

    List<FreeReplyVO> selectReplyList(Map<String, Object> map);

    int insertReply(Map<String, Object> map);

    FreeReplyVO selectReply(Map<String, Object> map);

    int deleteReply(Map<String, Object> map);
}
