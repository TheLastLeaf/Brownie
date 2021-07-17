package kr.co.brownie.exp.service.impl;

import kr.co.brownie.exp.service.ExpService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("expService")
public class ExpServiceImpl implements ExpService {
    @Resource(name = "expMapper")
    ExpMapper expMapper;

    @Override
    public int selectExp(String id) {
        int exp = expMapper.selectExp(id);
        return exp;
    }


}
