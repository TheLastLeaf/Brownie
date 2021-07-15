package kr.co.brownie.blackList.service;

import java.util.List;

public interface BlackListService {

	List<BlackListVO> selectBlackList();

	int insert(String userId, String result, String id ,int reasonSeq);

	int update(String id, int bListSeq);

}
