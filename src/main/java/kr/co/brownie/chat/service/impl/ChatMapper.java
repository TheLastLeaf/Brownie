package kr.co.brownie.chat.service.impl;

import kr.co.brownie.chat.service.ChatVO;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("chatMapper")
public interface ChatMapper {

    int count();

    void insertChatLog(Map<String,Object> map);

    List<ChatVO> chatList(Map<String, Object> map);

    List<ChatVO> chatAllList(Map<String, Object> map);
}
