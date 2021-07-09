package kr.co.brownie.board.service.impl;

import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import kr.co.brownie.board.service.BoardVO;

@Repository("boardMapper")
public interface BoardMapper {
	BoardVO likeHateCnt(int boardSeq);

	void updateLikeHate(Map<String, Object> map);

}
