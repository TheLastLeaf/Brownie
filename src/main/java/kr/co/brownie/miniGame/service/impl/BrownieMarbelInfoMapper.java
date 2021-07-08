package kr.co.brownie.miniGame.service.impl;

import kr.co.brownie.miniGame.service.BrownieMarbelInfoVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
@Repository("brownieMarbelInfoMapper")
public interface BrownieMarbelInfoMapper {
    int insert(Map<String,Object> map);

    List<BrownieMarbelInfoVO> selectList(HashMap<String, Object> passmap);

    BrownieMarbelInfoVO read(int boardSeq);

    int update(Map<String, Object> map);
    
    int delete(int boardSeq);
}