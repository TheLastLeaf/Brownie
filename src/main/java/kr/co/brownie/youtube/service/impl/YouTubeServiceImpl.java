package kr.co.brownie.youtube.service.impl;

import kr.co.brownie.youtube.service.YouTubeService;
import kr.co.brownie.youtube.service.YouTubeVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("youTubeService")
public class YouTubeServiceImpl implements YouTubeService {

    @Resource(name = "youTubeMapper")
    YouTubeMapper youTubeMapper;

    @Override
    public List<YouTubeVO> selectList() {
        return youTubeMapper.selectList();
    }
}
