package kr.co.brownie.free.service.impl;

import java.util.List;
import java.util.Map;

import kr.co.brownie.free.service.FreeReplyPagingVO;
import kr.co.brownie.free.service.FreeReplyVO;
import kr.co.brownie.tip.service.TipReplyVO;
import org.springframework.stereotype.Repository;

import kr.co.brownie.free.service.FreeVO;

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
