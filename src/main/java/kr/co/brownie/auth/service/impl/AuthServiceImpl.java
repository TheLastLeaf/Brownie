package kr.co.brownie.auth.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.brownie.auth.service.AuthService;

@Service("authService")
public class AuthServiceImpl implements AuthService {
	@Resource(name = "authDAO")
	AuthDAO authDAO;
}
