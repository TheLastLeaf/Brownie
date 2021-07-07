package kr.co.brownie.auth.service.impl;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("authMapper")
public interface AuthMapper {

	void insertUser(Map<String, Object> map);

	void insertExp(Map<String, Object> map);

	void insertReview(Map<String, Object> map);

}
