package kr.co.brownie.youtube.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.brownie.youtube.service.YouTubeService;
import kr.co.brownie.youtube.service.YouTubeVO;

@Service("youTubeService")
public class YouTubeServiceImpl implements YouTubeService {

	@Resource(name = "youTubeMapper")
	YouTubeMapper youTubeMapper;

	@Override
	public List<YouTubeVO> selectList() {
		return youTubeMapper.selectList();
	}
}
