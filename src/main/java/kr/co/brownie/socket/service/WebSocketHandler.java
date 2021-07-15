package kr.co.brownie.socket.service;

import org.jsoup.internal.StringUtil;
import org.springframework.util.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class WebSocketHandler extends TextWebSocketHandler {
    //소켓 세션 관리를 위한 리스트 (나중에는 맵으로 바꿀거임)
    List<WebSocketSession> sessions = new ArrayList<>();
    Map<String, WebSocketSession> userSessions = new HashMap<>();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        System.out.println("afterConnectionEstablished : "+session);
        String sendUserId = "testId";
        sessions.add(session);
        userSessions.put(sendUserId, session);
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        System.out.println("handleTextMessage : "+ session + " : " + message);
        System.out.println("아이디 : "+ session.getId() + " / 메시지 : " + message.getPayload());
        System.out.println("방주소 : "+ session.getUri() + " / 글자수 (많으면 잘라야 하나?) : " + message.getPayloadLength());
        for(WebSocketSession sess : sessions){
            TextMessage msg = new TextMessage(message.getPayload());
            sess.sendMessage(msg);
        }
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        System.out.println("afterConnectionClosed : "+session + " : " + status);
    }
}
