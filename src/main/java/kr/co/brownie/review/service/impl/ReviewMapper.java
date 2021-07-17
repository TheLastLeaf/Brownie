package kr.co.brownie.review.service.impl;

import kr.co.brownie.review.service.ReviewVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("reviewMapper")
public interface ReviewMapper {

    List<ReviewVO> selectReviewList(ReviewPagingVO page);

    int countAllReview(ReviewPagingVO page);

}
