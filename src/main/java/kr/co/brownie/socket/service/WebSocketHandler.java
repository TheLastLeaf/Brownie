package kr.co.brownie.socket.service;

import kr.co.brownie.teamGame.service.TeamGameService;
import kr.co.brownie.teamGame.service.TeamGameVO;
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



    //소켓 세션 관리를 위한 맵 : Map <"방번호", 세션리스트>
    //방 번호 : uri=ws://192.168.41.27/WebEcho?roomNumber=1 에서 roomNumber에 해당함
    //세션리스트 : 같은 페이지를 공유하고 있는 사람들의 세션이 들어감
    Map<String, List> userSessions = new HashMap<>();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        System.out.println("afterConnectionEstablished : " + session);

        //새로 들어온 세션의 방 번호 뽑아내기
        String roomNumber = session.getUri().getQuery().split("=")[1];
        System.out.println("roomNumber : " + roomNumber);

        //해당 방 번호를 키값으로 맵에 삽입해줌. 기존에 해당 키값이 존재한다면 세션에 이 세션을 추가해주면 될 듯 ?
        if (userSessions.containsKey(roomNumber)) {
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

        //접속 할 때 마다 웹소켓쪽으로 메시지 보내주는걸 고려해보기


    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        System.out.println("handleTextMessage : " + session + " / message : " + message);
        System.out.println("아이디 : " + session.getId() + " / 메시지 : " + message.getPayload());
        System.out.println("방주소 : " + session.getUri() + " / 글자수 : " + message.getPayloadLength());

        //여기는 받아온 메시지를 전달해주는 구간! 해당하는 세션으로 보내주기 위해서 세션 판별이 필요함

        //세션이 들어가있는 방 번호 뽑아내기
        String roomNumber = session.getUri().getQuery().split("=")[1];
        System.out.println("roomNumber : " + roomNumber);

        //해당 방 번호를 가진 리스트 가져오기!
        List<WebSocketSession> sessions = userSessions.get(roomNumber);

        //리스트에 존재하는 세션을 뽑아서 메시지로 보내주기
        for (WebSocketSession sess : sessions) {
            TextMessage msg = new TextMessage(message.getPayload());
            sess.sendMessage(msg);
        }
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        System.out.println("afterConnectionClosed session : " + session);
        //afterConnectionClosed session : StandardWebSocketSession[id=11, uri=ws://1.245.30.134/WebEcho?roomNumber=284]
        //session.getAttributes() : {HTTP.SESSION.ID=496834BDBAC682608FBF3B7D9759E2ED, permit_level=9, id=1786827527}
        System.out.println("status : " + status);
        //status : CloseStatus[code=1001, reason=null]
        //session.getAttributes().get("id") 이 유저의 닉네임을 골라와서 WebSocketSession .sendMessage(msg)

        //종료된 세션의 방 번호 뽑아내기
        String roomNumber = session.getUri().getQuery().split("=")[1];
        //해당 방 번호를 가진 리스트 가져와서 나간 친구만 제거해주는 메서드 와 드디어
        List<WebSocketSession> sessions = userSessions.get(roomNumber);

        //유저아이디로 유저가 해당 방에서 어떤 포지션인지 알아야 함
        String userId = sessions.get(0).getAttributes().get("id").toString();
        System.out.println("session get att : "+ userId);

        Map<String, Object> map = new HashMap<>();
        map.put("userId",userId);
        map.put("teamGameSeq",roomNumber);
        TeamGameVO tgvo = teamGameService.selectOne(map);
        System.out.println("tgvo : "+ tgvo);

        if(tgvo.getUserId().equals(userId)){
            System.out.println("tgvo.getUserId() : "+ tgvo.getUserId());
            String delPosi = tgvo.getPosition();
            map.put("position", delPosi);
            map.put("positionSeq", roomNumber);
            System.out.println("delPosi : "+ delPosi + "map : " + map);
            teamGameService.deleteTeamGamePosition(map);
            System.out.printf("성공 ?");
        }
        //팀게임 방번호 . 해당 유저 아이디 스테이터스 n으로 바꿔서 화면에 출력 안 되게 하기


        sessions.remove(session); //처음 들어온 세션만 추방했는데 왜 새 세션으로 들어오지 못하는지 찾아봐야함
        //sessions.get(0).getAttributes() : {HTTP.SESSION.ID=437649508DF2FF3CC7C3E4266F3A90CD, permit_level=9, id=1786827527}
        //해당 아이디가 가진 포지션 n으로 바꿔줘야함 / 해당 아이디의 status n으로 바꿔줘야함 > 이거 존재하는애들 삽입 안되는거라서 업뎃이나 머지문으로 바꿔줘야할듯
                                                                                    //그러면 이제 기존에 값 삽입할 때  teamgame_position에서 해당 포지션이 n이면 진행하고
                                                                                    // teamgame에서 해당 포지션이 y인지 n인지 판단해서 y일땐 안들어가고 n일땐 들어가게해야할듯
                                                                                    //정리다시해야함
        //sessions : [StandardWebSocketSession[id=19, uri=ws://1.245.30.134/WebEcho?roomNumber=292], StandardWebSocketSession[id=1a, uri=ws://1.245.30.134/WebEcho?roomNumber=292]]
        //sessions 22 : [StandardWebSocketSession[id=19, uri=ws://1.245.30.134/WebEcho?roomNumber=292]]

        //서버종료 또는 브라우저 종료가 아닌 경우
        if (status.getCode() != 1001 || status.getCode() != 1000 ) {
            //afterConnectionEstablished(session);
        }


    }


}
