package kr.co.brownie.tip.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.brownie.tip.service.TipService;

@Controller
public class TipController {
	@Autowired
	TipService tipService;
}
