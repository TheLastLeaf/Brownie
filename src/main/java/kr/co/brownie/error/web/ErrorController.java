package kr.co.brownie.error.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = "/error")
public class ErrorController {
	@GetMapping
	public String defaultError() {
		return "error/500";
	}

	@GetMapping("/no-resource")
	public String noResource() {
		return "error/404";
	}

	@GetMapping("/server-error")
	public String serverError() {
		return "error/500";
	}
}