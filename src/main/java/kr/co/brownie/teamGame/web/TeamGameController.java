package kr.co.brownie.teamGame.web;

import com.google.gson.JsonObject;
import kr.co.brownie.teamGame.service.TeamGameService;
import kr.co.brownie.teamGame.service.TeamGameVO;
import kr.co.brownie.user.service.UserService;
import kr.co.brownie.user.service.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.EOFException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/teamGame")
public class TeamGameController {
    @Resource(name = "teamGameService")
    TeamGameService teamGameService;

    @Resource(name = "userService")
    UserService userService;

    @GetMapping({"", "/teamGame"})
    public String teamMaker(Model model, HttpSession httpSession) throws IOException {
        List<TeamGameVO> teamGameList = teamGameService.selectTeamGameList();

        Map<Integer, Object> teamPosition = new HashMap<>();
        for (TeamGameVO tgvo : teamGameList) {
            if (tgvo.getStatus().equals("y")) {
                int positionSeq = tgvo.getPositionSeq();
                List<TeamGameVO> posiList = teamGameService.selectTeamGamePosition(positionSeq);
                teamPosition.put(positionSeq, posiList);
            }
        }

        //블랙회원인 경우 진입이 불가능해야함 권한 if문 돌리기

        //로그인 안 했을 경우
        UserVO userInfo = new UserVO();
        try{
            String userId = httpSession.getAttribute("id").toString();
            userInfo = userService.userOneSelect(userId);
        } catch (NullPointerException e){
            System.out.println("userId null 들어왔을때임");
        }
        model.addAttribute("userInfo", userInfo);
        model.addAttribute("teamGameList", teamGameList);
        model.addAttribute("teamPosition", teamPosition);

        return "teamGame/teamGame";
    }

    @GetMapping("/makeRoom")
    public String makeRoom(Model model, HttpServletRequest servletRequest) throws IOException {
        //로그인 안하면 터져서 잠깐 주석처리했음
        //String inUserId = servletRequest.getSession().getAttribute("id").toString();
        //UserVO userInfo = userService.userOneSelect(inUserId);
        //int userExp = userService.selectExp(inUserId);

        //model.addAttribute("userInfo",userInfo);
        //model.addAttribute("userExp",userExp);


        //블랙회원인 경우 진입이 불가능해야함. 세션 불러와서 권한 if문 돌리기



        model.addAttribute("userInfo", "경험치~");
        model.addAttribute("nickName", "닉네임~");

        return "teamGame/makeRoom";
    }


    @ResponseBody
    @PostMapping(path = "/insert-room", produces="application/text;charset=utf-8")
    public String ajaxInsertRoom(@RequestParam Map<String, Object> map, HttpSession httpSession) throws IOException {

        //블랙회원인 경우 진입이 불가능해야함. 세션 불러와서 권한 if문 돌리기
        String userId = httpSession.getAttribute("id").toString();
        UserVO userInfo = userService.userOneSelect(userId);

        teamGameService.insertTeamGameRoom(map);
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("TEAMGAME_SEQ", map.get("TEAMGAME_SEQ").toString());
        jsonObject.addProperty("nickName", userInfo.getNickName());
        jsonObject.addProperty("lolId", userInfo.getLolId());
        //세션에서 아이디 가져와서 유저 정보 조회한거 같이 보내줘야함 / 닉네임 / 티어 / 롤닉네임
        return jsonObject.toString();
    }


    @ResponseBody
    @PostMapping(path = "/update-position", produces="application/text;charset=utf-8")
    public String ajaxUpdatePosition(@RequestParam Map<String, Object> map) {

        //블랙회원인 경우 진입이 불가능해야함. 세션 불러와서 권한 if문 돌리기

        System.out.printf("map : " + map);

        String positionSeq = map.get("positionSeq").toString();
        String selectedPosition = map.get("position").toString();

        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("roomNumber", positionSeq);
        jsonObject.addProperty("position", selectedPosition);

        //들어온 값 이미 포지션 존재하는지 판별해야함  와  코드 진심 개못생겼네
        String exsitedPosi = "";
        List<TeamGameVO> teamPosition = teamGameService.selectTeamGamePosition(Integer.parseInt(positionSeq));
        if (selectedPosition.equals("top")) {
            exsitedPosi = teamPosition.get(0).getTop();
            if(exsitedPosi.equals("n")){

                teamGameService.updateTeamGamePosition(map);

                //새 포지션 들어갈때 삽입해주는거
                teamGameService.insertMemberPosi(map);
                jsonObject.addProperty("info", "good");
            } else {
                jsonObject.addProperty("info", "exist");
                return jsonObject.toString();
            }
        } else if (selectedPosition.equals("jun")) {
            exsitedPosi = teamPosition.get(0).getJun();
            if(exsitedPosi.equals("n")){
                teamGameService.updateTeamGamePosition(map);

                //새 포지션 들어갈때 삽입해주는거
                teamGameService.insertMemberPosi(map);
                jsonObject.addProperty("info", "good");
            } else {
                jsonObject.addProperty("info", "exist");
                return jsonObject.toString();
            }
        } else if (selectedPosition.equals("mid")) {
            exsitedPosi = teamPosition.get(0).getMid();
            if(exsitedPosi.equals("n")){
                teamGameService.updateTeamGamePosition(map);

                //새 포지션 들어갈때 삽입해주는거
                teamGameService.insertMemberPosi(map);
                jsonObject.addProperty("info", "good");
            } else {
                jsonObject.addProperty("info", "exist");
                return jsonObject.toString();
            }
        } else if (selectedPosition.equals("bot")) {
            exsitedPosi = teamPosition.get(0).getBot();
            if(exsitedPosi.equals("n")){
                teamGameService.updateTeamGamePosition(map);

                //새 포지션 들어갈때 삽입해주는거
                teamGameService.insertMemberPosi(map);
                jsonObject.addProperty("info", "good");
            } else {
                jsonObject.addProperty("info", "exist");
                return jsonObject.toString();
            }
        } else if (selectedPosition.equals("sup")) {
            exsitedPosi = teamPosition.get(0).getSup();
            if(exsitedPosi.equals("n")){
                teamGameService.updateTeamGamePosition(map);

                //새 포지션 들어갈때 삽입해주는거
                teamGameService.insertMemberPosi(map);
                jsonObject.addProperty("info", "good");
            } else {
                jsonObject.addProperty("info", "exist");
                return jsonObject.toString();
            }
        }
        return jsonObject.toString();
    }


    @GetMapping("/chatRoom")
    public String chatRoom() {

        //방 번호를 가져와야함 : 유저 아이디랑 제목을 가지고 일치하는 방을 골라올건데 이거 너무 허술하지않나... 유저아이디와 방제목이 겹치는 방이 있다면 혼선이 생길 가능성이 있음.
        //방을 만들 때 부터 방 번호를 얻어내서 같이 보내주는 방법을 취해야 하나? 조금 더 고민을 해봐야 할 듯
        //가져온 방 번호를 model에 넣어서 넘겨줌


        //참가자가 기존에 개설된 방에 들어갈 경우 : 유저 아이디, 포지션, 방번호가 필요함
        //채팅방에 해당 유저가 이미 존재하는지 여부 판별해야하고
        //채팅방에서 새로고침을 했을 경우 세션 유지되는지 확인해야하고
        //채팅방을 나갔다가 다시 들어온 유저의 세션이 새로 생겨나는지 체크해야함

        return "teamGame/chatRoom";
    }
}
