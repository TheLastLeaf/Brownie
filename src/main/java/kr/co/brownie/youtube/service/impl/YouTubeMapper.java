package kr.co.brownie.youtube.service.impl;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.brownie.youtube.service.YouTubeVO;

import java.util.List;

@Mapper
@Repository("youTubeMapper")
public interface YouTubeMapper {
    List<YouTubeVO> selectList();
}
