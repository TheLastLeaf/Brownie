package kr.co.brownie.blackList.service.impl;

import kr.co.brownie.blackList.service.BlackListService;
import kr.co.brownie.blackList.service.BlackListVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("blackListService")
public class BlackListServiceImpl implements BlackListService {

    @Resource(name = "blackListMapper")
    BlackListMapper blackListMapper;


    @Override
    public List<BlackListVO> selectBlackList() {
        return blackListMapper.selectBlackList();
    }

    @Override
    public int insert(String userId, String result, String id, int reasonSeq,int bListSeq,int endDate) {
        Map<String, Object> map = new HashMap<>();
        map.put("userId", userId);
        map.put("result", result);
        map.put("id", id);
        map.put("reasonSeq", reasonSeq);
        map.put("bListSeq", bListSeq);
        map.put("endDate", endDate);
        return blackListMapper.insert(map);
    }

    @Override
    public int update(String id, int bListSeq) {
        Map<String, Object> map = new HashMap<>();
        map.put("id", id);
        map.put("bListSeq", bListSeq);
        return blackListMapper.updateBlackUser(map);
    }

}
