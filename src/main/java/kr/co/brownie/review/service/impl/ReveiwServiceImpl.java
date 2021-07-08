package kr.co.brownie.review.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.brownie.review.service.ReviewService;
import kr.co.brownie.review.service.ReviewVO;

@Service("reviewService")
public class ReveiwServiceImpl implements ReviewService{
	@Resource(name = "reviewMapper")
	ReviewMapper reviewMapper;

	@Override
	public List<ReviewVO> selectReviewList(String id){
		return reviewMapper.selectReviewList(id); 
	}
}
