package kr.co.brownie.review.service;

import java.util.List;
import java.util.Map;

import kr.co.brownie.review.service.impl.ReviewPagingVO;

public interface ReviewService {

	List<ReviewVO> selectReviewList(ReviewPagingVO page);

	int countAllReview(ReviewPagingVO page);

	void insertReview(Map<String, Object> map);

	int selectReviewCnt(Map<String, Object> reviewMap);

}
