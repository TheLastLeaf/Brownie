package kr.co.brownie.chat.service.impl;

import kr.co.brownie.chat.service.ChatService;
import kr.co.brownie.chat.service.ChatVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("chatService")
public class ChatServiceImpl implements ChatService {
    @Resource(name = "chatMapper")
    ChatMapper chatMapper;

    @Override
    public List<ChatVO> selectChatting(String writer) {
        return chatMapper.chatList(writer);
    }

//    @Override
//    public ChatPagingVO selectChatting(int currentPageNumber,String writer) {
//        Map<String, Object> map = new HashMap<>();
//        map.put("writer",writer);
//        map.put("contentPerPage", CONTENT_PER_PAGE);
//        map.put("currentPageNumber", currentPageNumber);
//
//        int total = chatMapper.count();
//
//        return ChatPagingVO.builder()
//                .chatVO(chatMapper.chatList(map))
//                .contentPerPage(CONTENT_PER_PAGE)
//                .startPageNumber((currentPageNumber - 1) / CONTENT_PER_PAGE + 1)
//                .currentPageNumber(currentPageNumber)
//                .endPageNumber(Math.min((currentPageNumber - 1) / CONTENT_PER_PAGE + 10, (total - 1) / CONTENT_PER_PAGE + 1))
//                .totalPageNumber((total - 1) / CONTENT_PER_PAGE + 1)
//                .build();
//    }
}
