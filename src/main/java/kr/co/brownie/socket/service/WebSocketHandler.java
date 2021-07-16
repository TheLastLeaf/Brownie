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
    //소켓 세션 관리를 위한 맵 : Map <"방번호", 세션리스트>
    //방 번호 : uri=ws://192.168.41.27/WebEcho?roomNumber=1 에서 roomNumber에 해당함
    //세션리스트 : 같은 페이지를 공유하고 있는 사람들의 세션이 들어감
    Map<String, List> userSessions = new HashMap<>();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        System.out.println("afterConnectionEstablished : "+session);

        //새로 들어온 세션의 방 번호 뽑아내기
        String roomNumber = session.getUri().getQuery().split("=")[1];
        System.out.println("roomNumber : "+roomNumber);

        //해당 방 번호를 키값으로 맵에 삽입해줌. 기존에 해당 키값이 존재한다면 세션에 이 세션을 추가해주면 될 듯 ?
        if(userSessions.containsKey(roomNumber)) {
            //기존 세션 방이 존재할 경우 value값인 세션리스트에 새로 들어온 세션을 추가해서 업데이트 해야함 세션탈트오겠네
            List<WebSocketSession> sessions = userSessions.get(roomNumber);
            sessions.add(session);
            userSessions.replace(roomNumber, sessions);
            System.out.println("여기는 방이 존재하는 경우에 출력됩니다.");
        } else if (!userSessions.containsKey(roomNumber)) {
            //존재하는 세션 방이 없기 때문에 새로 삽입하기
            List<WebSocketSession> sessions = new ArrayList<>();
            sessions.add(session);
            userSessions.put(roomNumber, sessions);
            System.out.println("크아악!! 방이 존재하지 않아!!");
        }
        //방 번호가 같은 쪽으로만 해당 값을 보내야 함. 올라온 세션들을 저장할 리스트를 방 번호마다 생성해주면 될 듯?
        //sessions.add(session);
        //userSessions.put("testId", session);
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        System.out.println("handleTextMessage : "+ session + " / message : " + message);
        System.out.println("아이디 : "+ session.getId() + " / 메시지 : " + message.getPayload());
        System.out.println("방주소 : "+ session.getUri() + " / 글자수 : " + message.getPayloadLength());

        //여기는 받아온 메시지를 전달해주는 구간! 해당하는 세션으로 보내주기 위해서 세션 판별이 필요함

        //세션이 들어가있는 방 번호 뽑아내기
        String roomNumber = session.getUri().getQuery().split("=")[1];
        System.out.println("roomNumber : "+roomNumber);

        //해당 방 번호를 가진 리스트 가져오기!
        List<WebSocketSession> sessions = userSessions.get(roomNumber);

        //리스트에 존재하는 세션을 뽑아서 메시지로 보내주기
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
