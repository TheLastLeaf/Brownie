package kr.co.brownie.reply.service.impl;

import kr.co.brownie.reply.service.ReplyVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository("replyMapper")
public interface ReplyMapper {
	int insert(Map<String, Object> map);

	List<ReplyVO> selectList(Map<String, Object> map);

	ReplyVO select(Map<String, Object> map);

	int update(Map<String, Object> map);

	int delete(Map<String, Object> map);
}
