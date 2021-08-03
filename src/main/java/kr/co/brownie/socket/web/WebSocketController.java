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
        System.out.println("websocket Map : "+map);
        List<TeamGameVO> roomInfo = teamGameService.selectLeader(Integer.parseInt(map.get("roomNumber").toString()));
        List<TeamGameVO> memList = teamGameService.selectRoomMember(Integer.parseInt(map.get("roomNumber").toString()));

        System.out.println("roooooooooooo : " + roomInfo.get(0));
        model.addAttribute("userInfo", map);
        model.addAttribute("memList", memList);
        model.addAttribute("roomInfo", roomInfo.get(0));

        //해당 방 번호를 가진 유저 닉네임과 롤 닉네임, 티어 목록이 필요함
        return "teamGame/chatRoom";
    }
}
