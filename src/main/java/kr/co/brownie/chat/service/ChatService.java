package kr.co.brownie.chat.service;

public interface ChatService {

    int CONTENT_PER_PAGE = 10;

    ChatPagingVO selectChatting(int currentPageNumber);
}
