package kr.co.brownie.exp.service.impl;

import org.springframework.stereotype.Repository;

@Repository("expMapper")
public interface ExpMapper {

    int selectExp(String id);

}
