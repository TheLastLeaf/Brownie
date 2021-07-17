package kr.co.brownie.review.service.impl;

import kr.co.brownie.review.service.ReviewService;
import kr.co.brownie.review.service.ReviewVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("reviewService")
public class ReveiwServiceImpl implements ReviewService {
    @Resource(name = "reviewMapper")
    ReviewMapper reviewMapper;

    @Override
    public List<ReviewVO> selectReviewList(ReviewPagingVO page) {
        List<ReviewVO> reviewList = reviewMapper.selectReviewList(page);
        if (reviewList == null) {
            ReviewVO reviewvo = new ReviewVO();
            reviewvo.setReviewSeq(1);
            reviewvo.setUserId(page.getId());
            reviewvo.setStarCnt(5);
            reviewvo.setReply("회원가입을 축하드립니다!");
            reviewvo.setInDate(null);
            reviewvo.setModDate(null);
            reviewvo.setInUserId("Admin");
            reviewvo.setUpUserId("Admin");
        }
        return reviewList;
    }

    @Override
    public int countAllReview(ReviewPagingVO page) {
        return reviewMapper.countAllReview(page);
    }
}
