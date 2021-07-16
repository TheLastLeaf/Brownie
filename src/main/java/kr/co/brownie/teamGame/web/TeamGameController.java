package kr.co.brownie.teamGame.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import kr.co.brownie.user.service.UserService;
import kr.co.brownie.user.service.UserVO;
import org.springframework.stereotype.Controller;

import kr.co.brownie.teamGame.service.TeamGameService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;

@Controller
@RequestMapping("/teamGame")
public class TeamGameController {
    @Resource(name = "teamGameService")
    TeamGameService teamGameService;

    @Resource(name = "userService")
    UserService userService;

    @GetMapping("/chatRoom")
    public String chatRoom() {
        return "teamGame/chatRoom";
    }

    @GetMapping("/makeRoom")
    public String makeRoom(Model model, HttpServletRequest servletRequest) throws IOException {
        String inUserId = servletRequest.getSession().getAttribute("id").toString();
        UserVO userInfo = userService.userOneSelect(inUserId);
        int userExp = userService.selectExp(inUserId);

        model.addAttribute("userInfo",userInfo);
        model.addAttribute("userExp",userExp);

        return "teamGame/makeRoom";
    }

    @GetMapping({"", "/teamMaker"})
    public String teamMaker() {
        return "teamGame/teamMaker";
    }
}
