package kr.co.brownie.common.service;

import java.util.List;
import java.util.Map;

public interface YouTubeService {
	public List<YouTubeVO> selectList(Map<String, Object> map);

}
