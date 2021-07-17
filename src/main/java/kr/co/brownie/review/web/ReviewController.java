package kr.co.brownie.review.web;

import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

@Controller
public class ReviewController {
    @Resource(name = "reviewController")
    ReviewController reviewController;
}
