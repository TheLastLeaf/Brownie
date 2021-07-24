package kr.co.brownie.miniGame.service.impl;

import kr.co.brownie.miniGame.service.BrownieMarbelInfoService;
import kr.co.brownie.miniGame.service.BrownieMarbelInfoVO;
import kr.co.brownie.miniGame.service.BrownieMarbelLogVO;
import kr.co.brownie.miniGame.service.BrownieMarbelVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("brownieMarbelInfoService")
public class BrownieMarbelInfoServiceImpl implements BrownieMarbelInfoService {
    @Resource(name = "brownieMarbelInfoMapper")
    BrownieMarbelInfoMapper brownieMarbelMapper;

    @Override
    public int insertBrownieMarbel(Map<String, Object> map) {
        return brownieMarbelMapper.insert(map);
    }

    @Override
    public List<BrownieMarbelInfoVO> getBrownieMarbelList(HashMap<String, Object> passmap) {
        List<BrownieMarbelInfoVO> noticeVo = brownieMarbelMapper.selectList(passmap);
        return noticeVo;
    }

    @Override
    public BrownieMarbelInfoVO getBrownieMarbel(int boardSeq) {
        BrownieMarbelInfoVO brownieMarbelInfoVo = brownieMarbelMapper.read(boardSeq);
        return brownieMarbelInfoVo;
    }

    @Override
    public BrownieMarbelVO selectPlayer(String userId) {
        return brownieMarbelMapper.selectPlayer(userId);
    }

    @Override
    public List<BrownieMarbelLogVO> selectLogs(HashMap<String, Object> map) {
        return brownieMarbelMapper.selectLogs(map);
    }

    @Override
    public int insertPlayer(HashMap<String, Object> map) {
        return brownieMarbelMapper.insertPlayer(map);
    }

    @Override
    public int updatePlayer(HashMap<String, Object> map) {
        return brownieMarbelMapper.updatePlayer(map);
    }

    @Override
    public int insertLog(HashMap<String, Object> map) {
        return brownieMarbelMapper.insertLog(map);
    }

    @Override
    public BrownieMarbelInfoVO selectInfo(int seq) {
        return brownieMarbelMapper.selectInfo(seq);

    }

    @Override
    public List<BrownieMarbelInfoVO> selectListPoint(List<Integer> list) {
        return brownieMarbelMapper.selectListPoint(list);
    }

    @Override
    public int modifyGamePoint(HashMap<String, Object> map) {
        return brownieMarbelMapper.updateGamePoint(map);
    }

    @Override
    public int modifyBPoint(HashMap<String, Object> map) {
        return brownieMarbelMapper.updateBPoint(map);
    }

	@Override
	public int deleteLog(String userId) {
		return brownieMarbelMapper.deleteLog(userId);
	}
	
	@Override
	public int deleteMarblePlayer(String userId) {
		return brownieMarbelMapper.deleteMarblePlayer(userId);
	}

}
