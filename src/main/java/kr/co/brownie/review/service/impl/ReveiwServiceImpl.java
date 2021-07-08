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
	public List<ReviewVO> selectReviewList(ReviewPagingVO page) {
		List<ReviewVO> reviewList = reviewMapper.selectReviewList(page);
		if(reviewList == null) {
			ReviewVO reviewvo = new ReviewVO();
			reviewvo.setReviewSeq(1);
			reviewvo.setUserId(page.getId());
			reviewvo.setStarCnt(0);
			reviewvo.setReply("empty");
			reviewvo.setInDate(null);
			reviewvo.setModDate(null);
			reviewvo.setInUserId("anonymous");
			reviewvo.setUpUserId("anonymous");
		}
		return reviewList;
	}

	@Override
	public int countAllReview(String id) {
		return reviewMapper.countAllReview(id);
	}
}
