package kr.co.brownie.user.service.impl;

import kr.co.brownie.user.service.UserPagingVO;
import kr.co.brownie.user.service.UserService;
import kr.co.brownie.user.service.UserVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("userService")
public class UserServiceImpl implements UserService {
    @Resource(name = "userMapper")
    UserMapper userMapper;

    @Override
    public UserVO userOneSelect(String id) {
        return userMapper.userOneSelect(id);
    }

    @Override
    public int selectExp(String id) {
        return userMapper.selectExp(id);
    }

    @Override
    public float starCntSelect(String id) {
        return userMapper.starCntSelect(id);
    }

    @Override
    public int boardTotalCnt(String id) {
        return userMapper.boardTotalCnt(id);
    }

    @Override
    public int replyTotalCnt(String id) {
        return userMapper.replyTotalCnt(id);
    }

    @Override
    public int likeReplyCnt(String id) {
        return userMapper.likeReplyCnt(id);
    }

    @Override
    public int hateReplyCnt(String id) {
        return userMapper.hateReplyCnt(id);
    }

    @Override
    public int updateImage(Map<String, Object> map) {
        return this.userMapper.updateImage(map);
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

    @Override
    public int blackstack(String userId) {
        return userMapper.blackStack(userId);
    }

    @Override
    public UserPagingVO userList(int currentPageNumber) {
        Map<String, Object> map = new HashMap<>();
        map.put("contentPerPage", CONTENT_PER_PAGE);
        map.put("currentPageNumber", currentPageNumber);

        int total = userMapper.userCount();

        return UserPagingVO.builder()
                .userVOList(userMapper.userList(map))
                .contentPerPage(CONTENT_PER_PAGE)
                .startPageNumber((currentPageNumber - 1) / CONTENT_PER_PAGE + 1)
                .currentPageNumber(currentPageNumber)
                .endPageNumber(Math.min((currentPageNumber - 1) / CONTENT_PER_PAGE + 10, (total - 1) / CONTENT_PER_PAGE + 1))
                .totalPageNumber((total - 1) / CONTENT_PER_PAGE + 1)
                .build();
    }

    @Override
    public void updateStatus(String userId) {
        userMapper.updateStatus(userId);
    }

    @Override
    public int saveToken(Map<String, Object> map) {
        return this.userMapper.saveToken(map);
    }

    @Override
    public int saveLolId(Map<String, Object> map) {
        return this.userMapper.saveLolId(map);
    }

    @Override
    public int deleteLolId(Map<String, Object> map) {
        return this.userMapper.deleteLolId(map);
    }

    @Override
    public void updatePoint(Map<String, Object> map) {
        userMapper.updatePoint(map);
    }

    @Override
    public void usePointForChat(Map<String, Object> map) {
        userMapper.usePointForChat(map);
    }
}
