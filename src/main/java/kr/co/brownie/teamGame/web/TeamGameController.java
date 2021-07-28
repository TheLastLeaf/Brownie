package kr.co.brownie.teamGame.web;

import com.google.gson.JsonObject;
import kr.co.brownie.teamGame.service.TeamGameService;
import kr.co.brownie.teamGame.service.TeamGameVO;
import kr.co.brownie.teamGame.service.impl.TeamGamePagingVO;
import kr.co.brownie.user.service.UserService;
import kr.co.brownie.user.service.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
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
    public String teamMaker(Model model, HttpSession httpSession, TeamGamePagingVO page, @RequestParam Map<String, Object> map) throws IOException {
        //팀게임 리스트
		// 나은이 커밋후 35, 39줄 추가함
		System.out.println("searchPositions: " + page.getSearchPositions());
		System.out.println("searchGameType: " + page.getSearchGameType());
		page.setTotalCount(teamGameService.countAllRoom(page));
		System.out.println("map: " + map);
		page.setSearchRoomTitle(map.get("searchRoomTitle") == null ? "" : map.get("searchRoomTitle").toString().trim());
		page.setSearchGameType(map.get("searchGameType") == null ? "" : map.get("searchGameType").toString());
		page.setSearchPositions(map.get("searchPositions") == null ? "" : map.get("searchPositions").toString());

		List<TeamGameVO> teamGameList = teamGameService.selectTeamGameList(page);

		System.out.println("teamGameVO: " + teamGameList);
		System.out.println("방 총 개수 : " + page.getTotalCount());
		System.out.println("page: " + page);
        Map<Integer, Object> teamPosition = new HashMap<>();
        for (TeamGameVO tgvo : teamGameList) {

            //현재 리더가 있는 방 상태 활성화 여부 판단
            if (tgvo.getStatus().equals("y")) {
                //방에서 포지션 시퀀스 빼옴
                int teamGameSeq = tgvo.getTeamGameSeq(); //방번호
                int positionSeq = tgvo.getPositionSeq(); //방에 해당하는 포지션 값

                //System.out.println("teamGameSeq : " + teamGameSeq + " --- positionSeq : " +  positionSeq);
                //해당 방에 해당하는 포지션 시퀀스 넣음
                TeamGameVO posiList = teamGameService.selectTeamGamePosition(positionSeq);
                teamPosition.put(teamGameSeq, posiList);
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
        model.addAttribute("page", page);
        model.addAttribute("teamPosition", teamPosition);

        System.out.println("teamGameList : "+model.getAttribute("teamGameList"));
        System.out.println("teamPosition : "+model.getAttribute("teamPosition"));

        System.out.println("방목록리스트 출력 끝");
        return "teamGame/teamGame";
    }

    @GetMapping("/makeRoom")
    public String makeRoom(Model model, HttpSession httpSession) throws IOException {
        //로그인 안하면 터져서 잠깐 주석처리했음
        String inUserId = httpSession.getAttribute("id").toString();
        UserVO userInfo = userService.userOneSelect(inUserId);

        //블랙회원인 경우 진입이 불가능해야함. 세션 불러와서 권한 if문 돌리기
        model.addAttribute("userInfo", userInfo);
        return "teamGame/makeRoom";
    }


    @ResponseBody
    @PostMapping(path = "/insert-room", produces="application/text;charset=utf-8")
    public String ajaxInsertRoom(@RequestParam Map<String, Object> map, HttpSession httpSession) throws IOException {
        //블랙회원인 경우 진입이 불가능해야함. 세션 불러와서 권한 if문 돌리기
        String userId = httpSession.getAttribute("id").toString();
        UserVO userInfo = userService.userOneSelect(userId);


        if(map.get("usePoint").equals("y")){
            //여기서 유저 포인트 500 빼는거 해줘야함

            int userPoint = userService.userOneSelect(userId).getBrowniePoint();
            if(userPoint < 500){
                JsonObject jsonObject = new JsonObject();
                jsonObject.addProperty("result", 0);
                jsonObject.addProperty("browniePoint", userPoint);
                System.out.println("-----포인트부족");
                return jsonObject.toString();
            } else {
                Map<String, Object> mapForPoint = new HashMap<>();
                map.put("userId",map.get("userId"));
                map.put("browniePoint", 500);
                userService.usePointForChat(mapForPoint);
                System.out.println("-----포인트차감");
            }
        }
        teamGameService.insertTeamGameRoom(map);
        System.out.println("insert map : : "+map);

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
        // map {userId=1786827527, positionSeq=346, position=sup}
        //블랙회원인 경우 진입이 불가능해야함. 세션 불러와서 권한 if문 돌리기

        System.out.println("update posi map : " + map);
        //{userId=1786827527, roomNumber=480, positionSeq=480, position=top}

        String teamGameSeq = map.get("roomNumber").toString();
        String positionSeq = map.get("positionSeq").toString();
        String selectedPosition = map.get("position").toString();

        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("roomNumber", teamGameSeq);
        jsonObject.addProperty("positionSeq", positionSeq);
        jsonObject.addProperty("position", selectedPosition);

        //들어온 값 이미 포지션 존재하는지 판별해야함  와  코드 진심 개못생겼네
        String exsitedPosi = "";
        TeamGameVO teamPosition = teamGameService.selectTeamGamePosition(Integer.parseInt(positionSeq));
        System.out.println("--? now teamPosition : "+teamPosition);

        //방에 있는 사람이 없어서 조회가 안 될 경우 그냥 바로 삽입
        if(teamPosition == null){
            teamGameService.updateTeamGamePosition(map);
            teamGameService.insertMemberPosi(map);
            jsonObject.addProperty("info", "nobody");
            return jsonObject.toString();
        }

        System.out.println("=,포지션 판별 진입=======================");
        if (selectedPosition.equals("top")) {
            exsitedPosi = teamPosition.getTop();
            if(exsitedPosi.equals("n")){
                System.out.println("exsitedPosi.equals(nnnnnnnnnn-----------------");
                teamGameService.updateTeamGamePosition(map);
                //새 포지션 들어갈때 삽입해주는거
                teamGameService.insertMemberPosi(map);
                jsonObject.addProperty("info", "good");

            } else {
                System.out.println("exsitedPosi.equals(yyyyyyyy-----------------");
                jsonObject.addProperty("info", "exist");
                return jsonObject.toString();
            }
        } else if (selectedPosition.equals("jun")) {
            exsitedPosi = teamPosition.getJun();
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
            exsitedPosi = teamPosition.getMid();
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
            exsitedPosi = teamPosition.getBot();
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
            exsitedPosi = teamPosition.getSup();
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

    @ResponseBody
    @PostMapping(path = "/select-member", produces="application/text;charset=utf-8")
    public String ajaxselectRoomMember(@RequestParam Map<String, Object> map) {
        JsonObject jsonObject = new JsonObject();

        List<TeamGameVO> memList = teamGameService.selectRoomMember(Integer.parseInt(map.get("TEAMGAME_SEQ").toString()));
        for(TeamGameVO tgm : memList) {
            System.out.println("mmmmmmmmm  : " + map);
            System.out.println("memList  : " + tgm.getUserId());
            if(tgm.getUserId().equals(map.get("userId").toString())){
                jsonObject.addProperty("nickName", tgm.getNickName());
                jsonObject.addProperty("lolId", tgm.getLolId());
            }
        }
        jsonObject.addProperty("TEAMGAME_SEQ", map.get("TEAMGAME_SEQ").toString());
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
