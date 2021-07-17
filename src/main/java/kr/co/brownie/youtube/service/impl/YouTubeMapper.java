package kr.co.brownie.youtube.service.impl;

import kr.co.brownie.youtube.service.YouTubeVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository("youTubeMapper")
public interface YouTubeMapper {
    List<YouTubeVO> selectList();
}
