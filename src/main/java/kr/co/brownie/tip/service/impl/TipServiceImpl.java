package kr.co.brownie.tip.service.impl;

import kr.co.brownie.tip.service.*;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

@Service("tipService")
public class TipServiceImpl implements TipService {
    @Resource(name = "tipMapper")
    TipMapper tipMapper;

    @Override
    public TipPagingVO selectList(Map<String, Object> map) {
        String champion = map.get("champion").toString();
        int currentPageNumber = (int) map.get("currentPageNumber");
        int totalTipCount = tipMapper.countTipList(champion);

        return TipPagingVO.builder()
                .tipVOList(tipMapper.selectTipList(map))
                .contentPerPage(CONTENT_PER_PAGE)
                .startPageNumber((currentPageNumber - 1) / CONTENT_PER_PAGE + 1)
                .currentPageNumber(currentPageNumber)
                .endPageNumber(Math.min((currentPageNumber - 1) / CONTENT_PER_PAGE + 10, (totalTipCount - 1) / CONTENT_PER_PAGE + 1))
                .totalPageNumber((totalTipCount - 1) / CONTENT_PER_PAGE + 1)
                .build();
    }

    @Override
    public TipVO select(Map<String, Object> map) {
        return tipMapper.select(map);
    }

    @Override
    public int insert(Map<String, Object> map) {
        return tipMapper.insert(map);
    }

    @Override
    public int update(Map<String, Object> map) {
        return tipMapper.update(map);
    }

    @Override
    public int delete(Map<String, Object> map) {
        return tipMapper.delete(map);
    }

    @Override
    public TipReplyPagingVO selectReplyList(Map<String, Object> map) {
        int totalReplyCount = (int) map.get("totalReplyCount");
        int currentReplyPageNumber = (int) map.get("currentReplyPageNumber");

        return TipReplyPagingVO.builder()
                .tipReplyVOList(tipMapper.selectReplyList(map))
                .replyPerPage(REPLY_PER_PAGE)
                .startPageNumber((currentReplyPageNumber - 1) / REPLY_PER_PAGE + 1)
                .currentPageNumber(currentReplyPageNumber)
                .endPageNumber(Math.min((currentReplyPageNumber - 1) / REPLY_PER_PAGE + 10, (totalReplyCount - 1) / REPLY_PER_PAGE + 1))
                .totalPageNumber((totalReplyCount - 1) / REPLY_PER_PAGE + 1)
                .build();
    }

    @Override
    public int insertReply(Map<String, Object> map) {
        return tipMapper.insertReply(map);
    }

    @Override
    public TipReplyVO selectReply(Map<String, Object> map) {
        return tipMapper.selectReply(map);
    }

    @Override
    public int deleteReply(Map<String, Object> map) {
        return tipMapper.deleteReply(map);
    }
}
