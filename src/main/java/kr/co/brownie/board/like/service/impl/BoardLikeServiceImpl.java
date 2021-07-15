package kr.co.brownie.board.like.service.impl;

import kr.co.brownie.board.like.service.BoardLikeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("boardLikeService")
public class BoardLikeServiceImpl implements BoardLikeService {
    @Resource(name = "boardLikeMapper")
    BoardLikeMapper boardLikeMapper;
}
