package kr.co.brownie.blackList.service;

import java.util.Date;

public interface BlackUserService {

    int insert(int bListSeq, String userId, int endDate,String id);
}
