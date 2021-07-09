package kr.co.brownie.blackList.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.brownie.blackList.service.BlackListVO;

@Repository("blackListMapper")
public interface BlackListMapper {

	List<BlackListVO> selectBlackList();
}