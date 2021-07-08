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
		if(reviewMapper.selectReviewList(id).size() == 0) {
			ReviewVO reviewvo = new ReviewVO();
			reviewvo.setReviewSeq(1);
			reviewvo.setUserId(id);
			reviewvo.setStarCnt(0);
			reviewvo.setReply("empty");
			reviewvo.setInDate(null);
			reviewvo.setModDate(null);
			reviewvo.setInUserId("anonymous");
			reviewvo.setUpUserId("anonymous");
		}
		
		return reviewMapper.selectReviewList(id); 
	}
}
