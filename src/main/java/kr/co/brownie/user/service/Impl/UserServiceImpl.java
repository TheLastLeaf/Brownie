package kr.co.brownie.user.service.Impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.brownie.user.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService{
	@Resource(name = "userDAO")
	UserDAO userDAO;
}
