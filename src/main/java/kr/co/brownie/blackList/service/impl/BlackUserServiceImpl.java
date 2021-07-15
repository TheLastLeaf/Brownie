package kr.co.brownie.blackList.service.impl;

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
    public int insert(int bListSeq, String userId, int endDate, String id) {
        Map<String,Object> map = new HashMap<>();
        map.put("bListSeq",bListSeq);
        map.put("userId",userId);
        map.put("endDate",endDate);
        map.put("id",id);
        return blackUserMapper.insert(map);
    }
}
