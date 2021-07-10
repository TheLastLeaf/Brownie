package kr.co.brownie.review.service;

import java.util.List;

import kr.co.brownie.review.service.impl.ReviewPagingVO;

public interface ReviewService {

	List<ReviewVO> selectReviewList(ReviewPagingVO page);

	int countAllReview(ReviewPagingVO page);


}
