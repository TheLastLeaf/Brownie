package kr.co.brownie.user.service.impl;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.brownie.user.service.UserService;
import kr.co.brownie.user.service.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Resource(name = "userMapper")
	UserMapper userMapper;

	@Override
	public UserVO userOneSelect(String id) throws IOException {
		return userMapper.userOneSelect(id);
	}

	@Override
	public int selectExp(String id) throws IOException {
		int exp = userMapper.selectExp(id);
		return exp;
	}

	@Override
	public float starCntSelect(String id) {
		return userMapper.starCntSelect(id);
	}

	@Override
	public int boardTotalCnt(String id) {
		int boardTotalCnt = userMapper.boardTotalCnt(id);
		if (boardTotalCnt == 0) {
			return boardTotalCnt = 0;
		}
		return boardTotalCnt;
	}

	@Override
	public int replyTotalCnt(String id) {
		int replyTotalCnt = userMapper.replyTotalCnt(id);
		if (replyTotalCnt == 0) {
			return replyTotalCnt = 0;
		}
		return replyTotalCnt;
	}

	@Override
	public int likeReplyCnt(String id) {
		int likeReplyCnt = userMapper.likeReplyCnt(id);
		if (likeReplyCnt == 0) {
			return likeReplyCnt = 0;
		}
		return likeReplyCnt;
	}

	@Override
	public int hateReplyCnt(String id) {
		int hateReplyCnt = userMapper.hateReplyCnt(id);
		if (hateReplyCnt == 0) {
			return hateReplyCnt = 0;
		}
		return hateReplyCnt;
	}

	@Override
	public List<String> recentBoard(String id) {
		List<String> list = userMapper.recentBoard(id);
		if (list.size() == 0) {
			for (int i = 0; i < 3; i++) {
				list.add("???");
			}
			return list;
		}
		return list;
	}

	@Override
	public String nickName(String id) {
		return userMapper.nickName(id);
	}

	// 유저 리스트 출력 ( 관리자 화면에서 사용함 )
	@Override
	public List<UserVO> selectList() {
		return userMapper.selectList();
	}

	@Override
	public String dateChecking(String id) {
		return userMapper.dateChecking(id);
	}

	@Override
	public void updateNick(Map<String, Object> map) throws IOException {
		userMapper.updateNick(map);
	}

	@Override
	public void updatePosition(Map<String, Object> map) throws IOException {
		userMapper.updatePosition(map);
	}

	@Override
	public int validating(String userNick) {
		return userMapper.validating(userNick);
	}

}
