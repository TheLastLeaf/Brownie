package kr.co.brownie.review.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.brownie.review.service.ReviewVO;

@Repository("reviewMapper")
public interface ReviewMapper {

	List<ReviewVO> selectReviewList(String id);

}
