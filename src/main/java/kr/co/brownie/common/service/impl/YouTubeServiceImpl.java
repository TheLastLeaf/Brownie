package kr.co.brownie.common.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.brownie.common.service.YouTubeService;
import kr.co.brownie.common.service.YouTubeVO;

@Service("youTubeService")
public class YouTubeServiceImpl implements YouTubeService {

	@Resource(name = "youTubeMapper")
	YouTubeMapper youTubeMapper;

	@Override
	public List<YouTubeVO> selectList() {
		return youTubeMapper.selectList();
	}
}
