package kr.co.brownie.auth.service.impl;

import org.springframework.stereotype.Repository;

import java.io.IOException;
import java.util.Map;

@Repository("authMapper")
public interface AuthMapper {

    void insertUser(Map<String, Object> map);

    void insertPermitLevel(String userId) throws IOException;

    void insertExp(Map<String, Object> map);

    void insertReview(Map<String, Object> map);

    int permitlevel(String userId);
}
