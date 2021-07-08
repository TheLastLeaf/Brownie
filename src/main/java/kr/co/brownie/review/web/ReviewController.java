package kr.co.brownie.review.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

@Controller
public class ReviewController {
	@Resource(name = "reviewController")
	ReviewController reviewController;
}
