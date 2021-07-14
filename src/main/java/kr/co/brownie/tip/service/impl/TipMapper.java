package kr.co.brownie.tip.service.impl;

import kr.co.brownie.tip.service.TipReplyVO;
import kr.co.brownie.tip.service.TipVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository("tipMapper")
public interface TipMapper {
    List<TipVO> selectTipList(Map<String, Object> map);

    int countTipList(String champion);

    TipVO select(Map<String, Object> map);

    int insert(Map<String, Object> map);

    int update(Map<String, Object> map);

    int delete(Map<String, Object> map);

    List<TipReplyVO> selectReplyList(Map<String, Object> map);

    int insertReply(Map<String, Object> map);

    TipReplyVO selectReply(Map<String, Object> map);

    int deleteReply(Map<String, Object> map);
}
