package kr.co.brownie.blackList.service.impl;

import kr.co.brownie.blackList.service.BlackUserPagingVO;
import kr.co.brownie.blackList.service.BlackUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Service("blackUserService")
public class BlackUserServiceImpl implements BlackUserService {

    @Resource(name = "blackUserMapper")
    BlackUserMapper blackUserMapper;

    @Override
    public BlackUserPagingVO blackUserList(int currentPageNumber) {
        Map<String, Object> map = new HashMap<>();
        map.put("contentPerPage", CONTENT_PER_PAGE);
        map.put("currentPageNumber", currentPageNumber);

        int total = blackUserMapper.count();

        return BlackUserPagingVO.builder()
                .blackUserVO(blackUserMapper.blackUserList(map))
                .contentPerPage(CONTENT_PER_PAGE)
                .startPageNumber((currentPageNumber - 1) / CONTENT_PER_PAGE + 1)
                .currentPageNumber(currentPageNumber)
                .endPageNumber(Math.min((currentPageNumber - 1) / CONTENT_PER_PAGE + 10, (total - 1) / CONTENT_PER_PAGE + 1))
                .totalPageNumber((total - 1) / CONTENT_PER_PAGE + 1)
                .build();
    }

    @Override
    public int merge(int bListSeq, String userId, int endDate, String id) {
        Map<String, Object> map = new HashMap<>();
        map.put("bListSeq", bListSeq);
        map.put("userId", userId);
        map.put("endDate", endDate);
        map.put("id", id);
        return blackUserMapper.merge(map);
    }

    @Override
    public int update(int bUserSeq) {
        return blackUserMapper.update(bUserSeq);
    }

}
