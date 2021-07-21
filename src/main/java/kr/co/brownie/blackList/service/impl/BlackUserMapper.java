package kr.co.brownie.blackList.service.impl;

import kr.co.brownie.blackList.service.BlackUserVO;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("blackUserMapper")
public interface BlackUserMapper {
    List<BlackUserVO> blackUserList(Map<String, Object> map);

    int merge(Map<String, Object> map);

    int count();

    int update(int bUserSeq);

    BlackUserVO oneBlackUser(String userId);
}
