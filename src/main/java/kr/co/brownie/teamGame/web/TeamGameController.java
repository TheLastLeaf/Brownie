package kr.co.brownie.teamGame.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import kr.co.brownie.teamGame.service.TeamGameVO;
import kr.co.brownie.user.service.UserService;
import kr.co.brownie.user.service.UserVO;
import org.springframework.stereotype.Controller;

import kr.co.brownie.teamGame.service.TeamGameService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
        for(TeamGameVO tgvo : teamGameList) {
            if(tgvo.getStatus().equals("y")){
                int positionSeq = tgvo.getPositionSeq();
                List<TeamGameVO> posiList = teamGameService.selectTeamGamePosition(positionSeq);
                teamPosition.put(positionSeq, posiList);
            }
        }
        model.addAttribute("teamGameList",teamGameList);
        model.addAttribute("teamPosition", teamPosition);

        return "teamGame/teamGame";
    }

    @GetMapping("/chatRoom")
    public String chatRoom() {
        return "teamGame/chatRoom";
    }

    @GetMapping("/makeRoom")
    public String makeRoom(Model model, HttpServletRequest servletRequest) throws IOException {
        //로그인 안하면 터져서 잠깐 주석처리했음
    	//String inUserId = servletRequest.getSession().getAttribute("id").toString();
        //UserVO userInfo = userService.userOneSelect(inUserId);
        //int userExp = userService.selectExp(inUserId);

        //model.addAttribute("userInfo",userInfo);
        //model.addAttribute("userExp",userExp);
    	model.addAttribute("userInfo","경험치~");
    	model.addAttribute("nickName","닉네임~");

        return "teamGame/makeRoom";
    }

}
