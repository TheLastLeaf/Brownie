package kr.co.brownie.board.reply.service.impl;

import kr.co.brownie.board.reply.service.ReplyPagingVO;
import kr.co.brownie.board.reply.service.ReplyService;
import kr.co.brownie.board.reply.service.ReplyVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {
    @Resource(name = "replyMapper")
    ReplyMapper replyMapper;

    @Override
    public int insert(Map<String, Object> map) {
        return this.replyMapper.insert(map);
    }

    @Override
    public ReplyPagingVO selectPagingList(Map<String, Object> map) {
        int pageNum = (int) map.get("pageNum");
        int totalContent = (int) map.get("totalContent");

        System.out.println(map);

        return ReplyPagingVO.builder()
                .replyVOList(this.replyMapper.selectList(map))
                .contentPerPage(CONTENT_PER_PAGE)
                .startPageNumber((pageNum - 1) / CONTENT_PER_PAGE + 1)
                .currentPageNumber(pageNum)
                .endPageNumber(Math.min((pageNum - 1) / CONTENT_PER_PAGE + 10, (totalContent - 1) / CONTENT_PER_PAGE + 1))
                .totalPageNumber((totalContent - 1) / CONTENT_PER_PAGE + 1)
                .build();
    }

    @Override
    public List<ReplyVO> selectList(Map<String, Object> map) {
        return this.replyMapper.selectList(map);
    }

    @Override
    public ReplyVO select(Map<String, Object> map) {
        return this.replyMapper.select(map);
    }

    @Override
    public int update(Map<String, Object> map) {
        return this.replyMapper.update(map);
    }

    @Override
    public int delete(Map<String, Object> map) {
        return this.replyMapper.delete(map);
    }
}
