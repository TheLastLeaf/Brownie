package kr.co.brownie.board.hit.service.impl;

import kr.co.brownie.board.hit.service.BoardHitService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

@Service("boardHitService")
public class BoardHitServiceImpl implements BoardHitService {
    @Resource(name = "boardHitMapper")
    BoardHitMapper boardHitMapper;

    @Override
    public int merge(Map<String, Object> map) {
        return this.boardHitMapper.merge(map);
    }
}
