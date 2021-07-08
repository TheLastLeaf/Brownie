package kr.co.brownie.tip.service.impl;

import kr.co.brownie.tip.service.TipPagingVO;
import kr.co.brownie.tip.service.TipService;
import kr.co.brownie.tip.service.TipVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Service("tipService")
public class TipServiceImpl implements TipService {
    @Resource(name = "tipMapper")
    TipMapper tipMapper;

    @Override
    public TipPagingVO selectList(String champion, int currentPageNumber) {
        Map<String, Object> map = new HashMap<>();
        map.put("champion", champion);
        map.put("contentPerPage", CONTENT_PER_PAGE);
        map.put("currentPageNumber", currentPageNumber);

        int total = tipMapper.countTipList(champion);
        return TipPagingVO.builder()
                .tipVOList(tipMapper.selectTipList(map))
                .contentPerPage(CONTENT_PER_PAGE)
                .startPageNumber((currentPageNumber - 1) / CONTENT_PER_PAGE + 1)
                .currentPageNumber(currentPageNumber)
                .endPageNumber(Math.min((currentPageNumber - 1) / CONTENT_PER_PAGE + 10, (total - 1) / CONTENT_PER_PAGE + 1))
                .totalPageNumber((total - 1) / CONTENT_PER_PAGE + 1)
                .build();
    }

    @Override
    public TipVO select(int board_seq) {
        return tipMapper.select(board_seq);
    }

    @Override
    public int insert(String author, String champion, String title, String content) {
        Map<String, Object> map = new HashMap<>();
        map.put("author", author);
        map.put("champion", champion);
        map.put("title", title);
        map.put("content", content);

        System.out.println(author);
        System.out.println(champion);
        System.out.println(title);
        System.out.println(content);

        return tipMapper.insert(map);
    }
}
