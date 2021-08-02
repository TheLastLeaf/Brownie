package kr.co.brownie.socket.service;

import kr.co.brownie.chat.service.ChatService;
import kr.co.brownie.chat.service.ChatVO;
import kr.co.brownie.teamGame.service.TeamGameService;
import kr.co.brownie.teamGame.service.TeamGameVO;
import kr.co.brownie.user.service.UserService;
import kr.co.brownie.user.service.UserVO;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class WebSocketHandler extends TextWebSocketHandler {

    @Resource(name = "teamGameService")
    TeamGameService teamGameService;

    @Resource(name = "userService")
    UserService userService;

    @Resource(name = "chatService")
    ChatService chatService;

    Map<String, List> userSessions = new HashMap<>();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        String roomNumber = session.getUri().getQuery().split("=")[1];
        if (userSessions.containsKey(roomNumber)) {
            List<WebSocketSession> sessions = userSessions.get(roomNumber);
            sessions.add(session);
            userSessions.replace(roomNumber, sessions);
        } else if (!userSessions.containsKey(roomNumber)) {
            List<WebSocketSession> sessions = new ArrayList<>();
            sessions.add(session);
            userSessions.put(roomNumber, sessions);
        }
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String roomNumber = session.getUri().getQuery().split("=")[1];
        List<WebSocketSession> sessions = userSessions.get(roomNumber);
        String[] chatLogArr = message.getPayload().split(":");
        Map<String, Object> chatLog = new HashMap<>();
        chatLog.put("content",chatLogArr[1]);
        chatLog.put("inUserId",chatLogArr[2]);
        chatLog.put("teamGameSep",roomNumber);
        chatService.insertChatLog(chatLog);
        UserVO userInfo = userService.userOneSelect(session.getAttributes().get("id").toString());
        for (WebSocketSession sess : sessions) {
            TextMessage msg = new TextMessage(message.getPayload()+":"+userInfo.getLolId());
            sess.sendMessage(msg);
        }
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        String roomNumber = session.getUri().getQuery().split("=")[1];
        List<WebSocketSession> sessions = userSessions.get(roomNumber);
        String userId = "";
        for(WebSocketSession wsId : sessions){
            if(wsId.getId().equals(session.getId())){
                userId = wsId.getAttributes().get("id").toString();
            }
        }
        Map<String, Object> map = new HashMap<>();
        map.put("userId", userId);
        map.put("teamGameSeq", roomNumber);
        TeamGameVO tgvo = teamGameService.selectOne(map);
        try {
            String tgvoId = tgvo.getUserId();
            if(tgvoId.equals(userId)){
                map.put("position", tgvo.getPosition());
                map.put("positionSeq", tgvo.getPositionSeq());
                teamGameService.deleteTeamGamePosition(map);
                //if(tgvo.getLeader().equals("y")){
                    teamGameService.deleteTeamGame(map);
                //}
            }
            TextMessage msg = new TextMessage("오류:발생:");
            for (WebSocketSession sess : sessions) {
                try {
                    if(tgvo.getLeader().equals("y")){
                        msg = new TextMessage(tgvo.getNickName() +": 님이 퇴장하셨습니다.:방장퇴장:"+tgvoId);
                    } else {
                        msg = new TextMessage(tgvo.getNickName()+": 님이 퇴장하셨습니다.:팀원퇴장:"+tgvoId);
                    }
                    sess.sendMessage(msg);
                } catch (Exception e){
                    System.out.println(e.getMessage());
                }
            }
        } catch (Exception e){
            System.out.println(e.getMessage());
        } finally {
            sessions.remove(session);
        }
    }
}
