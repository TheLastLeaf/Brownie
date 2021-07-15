package kr.co.brownie.blackList.service.impl;

import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository("blackUserMapper")
public interface BlackUserMapper {

    int insert(Map<String, Object> map);
}
