package kr.co.brownie.tip.service.impl;

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

    TipVO select(int boardSeq);

    int insert(Map<String, Object> map);

    int update(Map<String, Object> map);

    int delete(int boardSeq);
}
