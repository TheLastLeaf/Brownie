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
		page.setTotalCount(teamGameService.countAllRoom(page));
		page.setSearchRoomTitle(map.get("searchRoomTitle") == null ? "" : map.get("searchRoomTitle").toString().trim());
		page.setSearchGameType(map.get("searchGameType") == null ? "" : map.get("searchGameType").toString());
		page.setSearchPositions(map.get("searchPositions") == null ? "" : map.get("searchPositions").toString());

		List<TeamGameVO> teamGameList = teamGameService.selectTeamGameList(page);
        Map<Integer, Object> teamPosition = new HashMap<>();
        for (TeamGameVO tgvo : teamGameList) {
            if (tgvo.getStatus().equals("y")) {
                int teamGameSeq = tgvo.getTeamGameSeq();
                int positionSeq = tgvo.getPositionSeq();
                TeamGameVO posiList = teamGameService.selectTeamGamePosition(positionSeq);
                teamPosition.put(teamGameSeq, posiList);
            }
        }

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

        return "teamGame/teamGame";
    }

    @GetMapping("/makeRoom")
    public String makeRoom(Model model, HttpSession httpSession) throws IOException {
        String inUserId = httpSession.getAttribute("id").toString();
        UserVO userInfo = userService.userOneSelect(inUserId);
        model.addAttribute("userInfo", userInfo);
        return "teamGame/makeRoom";
    }


    @ResponseBody
    @PostMapping(path = "/insert-room", produces="application/text;charset=utf-8")
    public String ajaxInsertRoom(@RequestParam Map<String, Object> map, HttpSession httpSession) throws IOException {
        String userId = httpSession.getAttribute("id").toString();
        UserVO userInfo = userService.userOneSelect(userId);
        if(map.get("usePoint").equals("y")){
            int userPoint = userService.userOneSelect(userId).getBrowniePoint();
            if(userPoint < 500){
                JsonObject jsonObject = new JsonObject();
                jsonObject.addProperty("result", 0);
                jsonObject.addProperty("browniePoint", userPoint);
                return jsonObject.toString();
            } else {
                Map<String, Object> mapForPoint = new HashMap<>();
                mapForPoint.put("userId",map.get("userId"));
                mapForPoint.put("browniePoint", 500);
                userService.usePointForChat(mapForPoint);
            }
        }
        teamGameService.insertTeamGameRoom(map);

        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("TEAMGAME_SEQ", map.get("TEAMGAME_SEQ").toString());
        jsonObject.addProperty("nickName", userInfo.getNickName());
        jsonObject.addProperty("lolId", userInfo.getLolId());
        return jsonObject.toString();
    }

    @ResponseBody
    @PostMapping(path = "/update-position", produces="application/text;charset=utf-8")
    public String ajaxUpdatePosition(@RequestParam Map<String, Object> map) {
        String teamGameSeq = map.get("roomNumber").toString();
        String positionSeq = map.get("positionSeq").toString();
        String selectedPosition = map.get("position").toString();

        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("roomNumber", teamGameSeq);
        jsonObject.addProperty("positionSeq", positionSeq);
        jsonObject.addProperty("position", selectedPosition);

        String exsitedPosi = "";
        TeamGameVO teamPosition = teamGameService.selectTeamGamePosition(Integer.parseInt(positionSeq));
        if(teamPosition == null){
            teamGameService.updateTeamGamePosition(map);
            teamGameService.insertMemberPosi(map);
            jsonObject.addProperty("info", "nobody");
            return jsonObject.toString();
        }

        if (selectedPosition.equals("top")) {
            exsitedPosi = teamPosition.getTop();
            if(exsitedPosi.equals("n")){
                teamGameService.updateTeamGamePosition(map);
                teamGameService.insertMemberPosi(map);
                jsonObject.addProperty("info", "good");
            } else {
                jsonObject.addProperty("info", "exist");
                return jsonObject.toString();
            }
        } else if (selectedPosition.equals("jun")) {
            exsitedPosi = teamPosition.getJun();
            if(exsitedPosi.equals("n")){
                teamGameService.updateTeamGamePosition(map);
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
            if(tgm.getUserId().equals(map.get("userId").toString())){
                jsonObject.addProperty("nickName", tgm.getNickName());
                jsonObject.addProperty("lolId", tgm.getLolId());
            }
        }
        jsonObject.addProperty("TEAMGAME_SEQ", map.get("TEAMGAME_SEQ").toString());
        return jsonObject.toString();
    }
}
