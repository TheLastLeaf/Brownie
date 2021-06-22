package kr.co.brownie.common.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.brownie.common.service.CommonService;

@Controller
public class CommonController {
	@Autowired
	CommonService commonService;
}
