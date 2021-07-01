package kr.co.brownie.common.service.impl;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("commonServiceImpl")
public class CommonServiceImpl {
    @Resource(name = "commonMapper")
    CommonMapper commonMapper;
}
