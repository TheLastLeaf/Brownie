package kr.co.brownie.tip.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import kr.co.brownie.tip.service.TipService;

@Controller
public class TipController {
	@Resource(name = "tipService")
	TipService tipService;
}
