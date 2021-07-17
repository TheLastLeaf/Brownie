package kr.co.brownie.review.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.co.brownie.review.service.ReviewVO;

@Repository("reviewMapper")
public interface ReviewMapper {

	List<ReviewVO> selectReviewList(ReviewPagingVO page);

	int countAllReview(ReviewPagingVO page);

	void insertReview(Map<String, Object> map);

}
