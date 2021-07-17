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
    public void ajaxDayCheck(@RequestParam HashMap<String, Object> map, Model model, HttpServletRequest response, HttpSession session) {
        System.out.println("map : " + map);
        teamGameService.insertTeamGameRoom(map);
        System.out.println("----------ajax 끝남");
    }


    @GetMapping("/chatRoom")
    public String chatRoom() {
        return "teamGame/chatRoom";
    }
}
