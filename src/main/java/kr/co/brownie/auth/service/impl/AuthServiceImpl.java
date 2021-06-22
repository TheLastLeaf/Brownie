package kr.co.brownie.auth.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.brownie.auth.service.AuthService;

@Service("authService")
public class AuthServiceImpl implements AuthService {
	@Autowired
	AuthDAO authDAO;
}
