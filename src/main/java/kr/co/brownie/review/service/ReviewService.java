package kr.co.brownie.review.service;

import java.util.List;

public interface ReviewService {

	List<ReviewVO> selectReviewList(String id);

}
