package kr.co.brownie.review.service;

import kr.co.brownie.review.service.impl.ReviewPagingVO;

import java.util.List;

public interface ReviewService {

    List<ReviewVO> selectReviewList(ReviewPagingVO page);

    int countAllReview(ReviewPagingVO page);


}
