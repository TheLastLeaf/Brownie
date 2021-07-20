package kr.co.brownie.teamGame.web;

import kr.co.brownie.teamGame.service.TeamGameService;
import kr.co.brownie.teamGame.service.TeamGameVO;
import kr.co.brownie.user.service.UserService;
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
    public String teamMaker(Model model) {
        List<TeamGameVO> teamGameList = teamGameService.selectTeamGameList();

        Map<Integer, Object> teamPosition = new HashMap<>();
        for (TeamGameVO tgvo : teamGameList) {
            if (tgvo.getStatus().equals("y")) {
                int positionSeq = tgvo.getPositionSeq();
                List<TeamGameVO> posiList = teamGameService.selectTeamGamePosition(positionSeq);
                teamPosition.put(positionSeq, posiList);
            }
        }
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
        model.addAttribute("userInfo", "경험치~");
        model.addAttribute("nickName", "닉네임~");

        return "teamGame/makeRoom";
    }


    @ResponseBody
    @RequestMapping(value = "/insert-room", method = {RequestMethod.POST})
    public void ajaxDayCheck(@RequestParam HashMap<String, Object> map, Model model, HttpServletRequest response) {
        //방 개설
        teamGameService.insertTeamGameRoom(map);
        System.out.println("map : "+map);
        model.addAttribute("들어옴","ㅇㅇ");
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
