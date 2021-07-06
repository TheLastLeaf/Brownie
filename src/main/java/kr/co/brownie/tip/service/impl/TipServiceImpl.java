package kr.co.brownie.tip.service.impl;

import kr.co.brownie.tip.service.TipPagingVO;
import kr.co.brownie.tip.service.TipService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Service("tipService")
public class TipServiceImpl implements TipService {
    @Resource(name = "tipMapper")
    TipMapper tipMapper;

    @Override
    public TipPagingVO selectTipList(String champion, int currentPageNumber) {
        Map<String, Object> map = new HashMap<>();
        map.put("champion", champion);
        map.put("contentPerPage", CONTENT_PER_PAGE);
        map.put("currentPageNumber", currentPageNumber);

        System.out.println(map);

        int total = tipMapper.countTipList(champion);
        return TipPagingVO.builder()
                .tipVOList(tipMapper.selectTipList(map))
                .contentPerPage(CONTENT_PER_PAGE)
                .startPageNumber((currentPageNumber - 1) / CONTENT_PER_PAGE + 1)
                .currentPageNumber(currentPageNumber)
                .endPageNumber(Math.min((currentPageNumber - 1) / CONTENT_PER_PAGE + CONTENT_PER_PAGE, (total - 1) / CONTENT_PER_PAGE + 1))
                .totalPageNumber((total - 1) / CONTENT_PER_PAGE + 1)
                .build();
    }
}
