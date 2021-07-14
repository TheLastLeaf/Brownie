package kr.co.brownie.free.service.impl;

import kr.co.brownie.free.service.FreeReplyPagingVO;
import kr.co.brownie.free.service.FreeReplyVO;
import kr.co.brownie.free.service.FreeService;
import kr.co.brownie.free.service.FreeVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("freeService")
public class FreeServiceImpl implements FreeService {
    @Resource(name = "freeMapper")
    FreeMapper freeMapper;

    @Override
    public List<FreeVO> selectList() {
        return freeMapper.selectList();
    }

    @Override
    public List<FreeVO> selectFamous() {
        return freeMapper.selectFamous();
    }

    @Override
    public FreeVO selectDetail(int boardSeq) {
        return freeMapper.selectDetail(boardSeq);
    }

    @Override
    public List<FreeVO> selectRecent(int boardSeq) {
        return freeMapper.selectRecent(boardSeq);
    }

    @Override
    public List<FreeVO> selectRecentForMenu() {
        return freeMapper.selectRecentForMenu();
    }

    @Override
    public void insertFree(Map<String, Object> map) {
        freeMapper.insertFree(map);
    }

    @Override
    public void deleteFree(Map<String, Object> map) {
        freeMapper.deleteFree(map);
    }

    @Override
    public int update(Map<String, Object> map) {
        return freeMapper.update(map);
    }

    @Override
    public FreeReplyPagingVO selectReplyList(Map<String, Object> map) {
        int totalReplyCount = (int) map.get("totalReplyCount");
        int currentReplyPageNumber = (int) map.get("currentReplyPageNumber");

        return FreeReplyPagingVO.builder()
                .freeReplyVOList(freeMapper.selectReplyList(map))
                .replyPerPage(REPLY_PER_PAGE)
                .startPageNumber((currentReplyPageNumber - 1) / REPLY_PER_PAGE + 1)
                .currentPageNumber(currentReplyPageNumber)
                .endPageNumber(Math.min((currentReplyPageNumber - 1) / REPLY_PER_PAGE + 10, (totalReplyCount - 1) / REPLY_PER_PAGE + 1))
                .totalPageNumber((totalReplyCount - 1) / REPLY_PER_PAGE + 1)
                .build();
    }

    @Override
    public int insertReply(Map<String, Object> map) {
        return freeMapper.insertReply(map);
    }

    @Override
    public FreeReplyVO selectReply(Map<String, Object> map) {
        return freeMapper.selectReply(map);
    }

    @Override
    public int deleteReply(Map<String, Object> map) {
        return freeMapper.deleteReply(map);
    }
}
