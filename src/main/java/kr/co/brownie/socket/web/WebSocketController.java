package kr.co.brownie.socket.web;

import kr.co.brownie.teamGame.service.TeamGameService;
import kr.co.brownie.teamGame.service.TeamGameVO;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.socket.config.annotation.EnableWebSocket;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;


@Configuration
@RequiredArgsConstructor
@EnableWebSocket
@Controller
@RequestMapping("/websocket")
public class WebSocketController {
    @Resource(name = "teamGameService")
    TeamGameService teamGameService;

    @PostMapping (value="/chat2", produces="application/text;charset=utf-8")
    public String websocket2(@RequestParam Map<String, Object> map, Model model) {
        List<TeamGameVO> roomInfo = teamGameService.selectLeader(Integer.parseInt(map.get("roomNumber").toString()));
        List<TeamGameVO> memList = teamGameService.selectRoomMember(Integer.parseInt(map.get("roomNumber").toString()));

        model.addAttribute("userInfo", map);
        model.addAttribute("memList", memList);
        model.addAttribute("roomInfo", roomInfo.get(0));

        return "teamGame/chatRoom";
    }
}
