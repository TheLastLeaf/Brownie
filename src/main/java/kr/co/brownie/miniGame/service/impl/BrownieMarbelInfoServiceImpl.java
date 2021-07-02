package kr.co.brownie.miniGame.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.brownie.miniGame.service.BrownieMarbelInfoService;
import kr.co.brownie.miniGame.service.BrownieMarbelInfoVO;

@Service("brownieMarbelInfoService")
public class BrownieMarbelInfoServiceImpl implements BrownieMarbelInfoService {
	@Resource(name = "brownieMarbelInfoMapper")
	BrownieMarbelInfoMapper brownieMarbelMapper;

	@Override
	public int insertBrownieMarbel(Map<String, Object> map) {
		return brownieMarbelMapper.insert(map);
	}

	@Override
	public List<BrownieMarbelInfoVO> getBrownieMarbelList() {
		List<BrownieMarbelInfoVO> noticeVo = brownieMarbelMapper.selectList();
		return noticeVo;
	}

	@Override
	public BrownieMarbelInfoVO getBrownieMarbel(int boardSeq) {
		BrownieMarbelInfoVO brownieMarbelInfoVo = brownieMarbelMapper.read(boardSeq);
		return brownieMarbelInfoVo;
	}

	@Override
	public int updateBrownieMarbel(Map<String, Object> map) {
		return brownieMarbelMapper.update(map);
	}

	@Override
	public int deleteBrownieMarbel(int boardSeq) {
		return brownieMarbelMapper.delete(boardSeq);
	}
}
