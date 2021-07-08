package kr.co.brownie.free.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.brownie.free.service.impl.FreeMapper;

@Controller
@RequestMapping("/free")
public class FreeController {

	@Resource(name = "freeMapper")
	FreeMapper freeMapper;

	@GetMapping(path= {"", "/freeList"})
	public String freeList(Model model) {



		return "";
	}














}
