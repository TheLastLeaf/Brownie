package kr.co.brownie.blackList.service.impl;

import kr.co.brownie.blackList.service.BlackListVO;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("blackListMapper")
public interface BlackListMapper {

    List<BlackListVO> selectBlackList();

    int insert(Map<String, Object> map);

    int updateBlackUser(Map<String, Object> map);
}
