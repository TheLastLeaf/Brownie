package kr.co.brownie.chat.service;

import java.util.List;
import java.util.Map;

public interface ChatService {

//    int CONTENT_PER_PAGE = 10;
//
//    ChatPagingVO selectChatting(int currentPageNumber,String writer);

    List<ChatVO> selectChatting(String writer);

    void insertChatLog(Map<String,Object> map);

}