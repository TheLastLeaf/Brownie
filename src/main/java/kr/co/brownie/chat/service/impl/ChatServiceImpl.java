package kr.co.brownie.chat.service.impl;

import kr.co.brownie.chat.service.ChatPagingVO;
import kr.co.brownie.chat.service.ChatService;
import kr.co.brownie.chat.service.ChatVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("chatService")
public class ChatServiceImpl implements ChatService {
    @Resource(name = "chatMapper")
    ChatMapper chatMapper;

    @Override
    public List<ChatVO> selectChatting(Map<String, Object> map) {
        return chatMapper.chatList(map);
    }

    @Override
    public void insertChatLog(Map<String, Object> map) {
        chatMapper.insertChatLog(map);
    }

    @Override
    public ChatPagingVO chatAllList(int currentPageNumber, String nickName) {
        Map<String, Object> map = new HashMap<>();
        map.put("nickName",nickName);
        map.put("contentPerPage", CONTENT_PER_PAGE);
        map.put("currentPageNumber", currentPageNumber);
        System.out.println("map"+map);
        int total = chatMapper.count();

        return ChatPagingVO.builder()
                .chatVO(chatMapper.chatAllList(map))
                .contentPerPage(CONTENT_PER_PAGE)
                .startPageNumber((currentPageNumber - 1) / CONTENT_PER_PAGE + 1)
                .currentPageNumber(currentPageNumber)
                .endPageNumber(Math.min((currentPageNumber - 1) / CONTENT_PER_PAGE + 10, (total - 1) / CONTENT_PER_PAGE + 1))
                .totalPageNumber((total - 1) / CONTENT_PER_PAGE + 1)
                .build();
    }
}
