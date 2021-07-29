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

    //소켓 세션 관리를 위한 맵 : Map <"방번호", 세션리스트>
    //방 번호 : uri=ws:// + window.location.host + /WebEcho?roomNumber=1 에서 roomNumber에 해당함
    //세션리스트 : 같은 페이지를 공유하고 있는 사람들의 세션이 들어감
    Map<String, List> userSessions = new HashMap<>();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        System.out.println("웹소켓 접속 시작 -------------------------------------------------------------");
        System.out.println("afterConnectionEstablished : " + session);
        System.out.println("session.getAttributes() : " + session.getAttributes());

        //새로 들어온 세션의 방 번호 뽑아내기
        String roomNumber = session.getUri().getQuery().split("=")[1];
        System.out.println("roomNumber : " + roomNumber);

        //해당 방 번호를 키값으로 맵에 삽입해줌. 기존에 해당 키값이 존재한다면 세션에 이 세션을 추가해주면 될 듯 ?
        if (userSessions.containsKey(roomNumber)) {
            //기존 세션 방이 존재할 경우 value값인 세션리스트에 새로 들어온 세션을 추가해서 업데이트 해야함 세션탈트오겠네
            List<WebSocketSession> sessions = userSessions.get(roomNumber);
            sessions.add(session);

            userSessions.replace(roomNumber, sessions);
            System.out.println("여기는 방이 존재하는 경우에 출력됩니다.----------------------------------");
        } else if (!userSessions.containsKey(roomNumber)) {
            //존재하는 세션 방이 없기 때문에 새로 삽입하기
            List<WebSocketSession> sessions = new ArrayList<>();
            sessions.add(session);
            userSessions.put(roomNumber, sessions);
            System.out.println("크아악!! 방이 존재하지 않아!!---------------------------------");
        }
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        System.out.println("웹소켓 메시지 전송 시 출력됩니다 -------------------------------------------------------------");
        System.out.println("handleTextMessage : " + session + " / message : " + message);
        System.out.println("아이디 : " + session.getId() + " / 메시지 : " + message.getPayload());
        System.out.println("방주소 : " + session.getUri() + " / 글자수 : " + message.getPayloadLength());
        System.out.println("session.getAttributes() : " + session.getAttributes());

        //세션이 들어가있는 방 번호 뽑아내기
        String roomNumber = session.getUri().getQuery().split("=")[1];
        System.out.println("roomNumber : " + roomNumber);

        //해당 방 번호를 가진 리스트 가져오기!
        List<WebSocketSession> sessions = userSessions.get(roomNumber);

        //메시지 디비에 삽입
        String[] chatLogArr = message.getPayload().split(":");
        Map<String, Object> chatLog = new HashMap<>();
        chatLog.put("content",chatLogArr[1]);
        chatLog.put("inUserId",chatLogArr[2]);
        chatLog.put("teamGameSep",roomNumber);
        chatService.insertChatLog(chatLog);

        //유저 롤 아이디 가져오기용
        UserVO userInfo = userService.userOneSelect(session.getAttributes().get("id").toString());

        //리스트에 존재하는 세션을 뽑아서 메시지로 보내주기
        for (WebSocketSession sess : sessions) {
            TextMessage msg = new TextMessage(message.getPayload()+":"+userInfo.getLolId());
            sess.sendMessage(msg);
        }
        System.out.println("웹소켓 메시지 전송 끝 -------------------------------------------------------------");
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        System.out.println("웹소켓 종료 안내 시작 -------------------------------------------------------------");
        System.out.println("afterConnectionClosed session : " + session);
        //afterConnectionClosed session : StandardWebSocketSession[id=11, uri=ws:// 주소 /WebEcho?roomNumber=284]
        //session.getAttributes() : {HTTP.SESSION.ID=496834BDBAC682608FBF3B7D9759E2ED, permit_level=9, id=1786827527}
        System.out.println("status : " + status);
        System.out.println("session.getAttributes() : " + session.getAttributes());
        //status : CloseStatus[code=1001, reason=null]
        //session.getAttributes().get("id") 이 유저의 닉네임을 골라와서 WebSocketSession .sendMessage(msg)

        //종료된 세션의 방 번호 뽑아내기
        String roomNumber = session.getUri().getQuery().split("=")[1];
        //해당 방 번호를 가진 리스트 가져와서 나간 친구만 제거해주는 메서드 와 드디어
        List<WebSocketSession> sessions = userSessions.get(roomNumber);

        System.out.println("ssessionsssss : "+sessions);
        //유저아이디로 유저가 해당 방에서 어떤 포지션인지 알아야 함

        String userId = "";
        //이게 세션에 들어온 유저의 정보를 가지고 있음 이 아이디가 일치하는 사람의 어트리뷰트를 뽑아서 아이디 가져오면 도미
        for(WebSocketSession wsId : sessions){
            if(wsId.getId().equals(session.getId())){
                System.out.println("wsId : " + wsId);
                System.out.println("wsId.getId() : " + wsId.getId());
                System.out.println("session.getId() : " + session.getId());
                System.out.println("wsId.getAttributes() : " + wsId.getAttributes());
                userId = wsId.getAttributes().get("id").toString();
            }
        }
        System.out.println("session get att : "+ userId);

        Map<String, Object> map = new HashMap<>();
        map.put("userId", userId);
        map.put("teamGameSeq", roomNumber);

        //여기서 계속 값 멈춰서 서버오류남
        TeamGameVO tgvo = teamGameService.selectOne(map);
        System.out.println("tgvo : "+ tgvo);

        //왜 가끔씩 null이 들어가는지 모르겠음 찾아봐야함
        try {
            String tgvoId = tgvo.getUserId();
            if(tgvoId.equals(userId)){
                System.out.println("tgvo.getUserId() : "+ tgvoId);

                map.put("position", tgvo.getPosition());
                map.put("positionSeq", tgvo.getPositionSeq());

                System.out.println("websocketHandler 128line map : " + map);

                //TEAMGAME_POSITION update 'y' to 'n'
                teamGameService.deleteTeamGamePosition(map);
                System.out.println("tgvo.getLeader().equals(y) : " + tgvo.getLeader());
                //방장일 경우 방 상태도 n으로 변경해줌
                if(tgvo.getLeader().equals("y")){
                    System.out.println("not null map : "+map);
                    teamGameService.deleteTeamGame(map);
                    System.out.println("deleteteamgamemap");
                }
                System.out.println("성공 ? "+ tgvoId);
            }

            //리스트에 존재하는 세션을 뽑아서 메시지로 보내주기
            TextMessage msg = new TextMessage("오류:발생:");
            for (WebSocketSession sess : sessions) {
                System.out.println("오류:발생:" + tgvoId);
                if(tgvo.getLeader().equals("y")){
                    msg = new TextMessage(tgvo.getNickName() +": 님이 퇴장하셨습니다.:방장퇴장:"+tgvoId);
                    System.out.println("방장나감"+tgvoId);
                } else {
                    msg = new TextMessage(tgvo.getNickName()+": 님이 퇴장하셨습니다.:팀원퇴장:"+tgvoId);
                    System.out.println("팀우ㅡㅓㅏㄴ나감");
                }
                sess.sendMessage(msg);
                System.out.println(msg);
            }
        } catch (Exception e){
            System.out.println("---------------catch here");
            System.out.println(e.getStackTrace());
        } finally {
            sessions.remove(session);
            System.out.println("웹소켓 종료 안내 끝-------------------------------------------------------------");
        }

        //sessions.get(0).getAttributes() : {HTTP.SESSION.ID=437649508DF2FF3CC7C3E4266F3A90CD, permit_level=9, id=1786827527}

        //sessions : [StandardWebSocketSession[id=19, uri=ws:// 주소 /WebEcho?roomNumber=292], StandardWebSocketSession[id=1a, uri=ws:// 주소 /WebEcho?roomNumber=292]]
        //sessions 22 : [StandardWebSocketSession[id=19, uri=ws:// 주소 /WebEcho?roomNumber=292]]

        //서버종료 또는 브라우저 종료가 아닌 경우
        if (status.getCode() != 1001 || status.getCode() != 1000 ) {
            //afterConnectionEstablished(session);
        }
    }


}
