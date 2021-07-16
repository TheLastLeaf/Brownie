package kr.co.brownie.socket.web;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.config.annotation.EnableWebSocket;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Configuration
@RequiredArgsConstructor
@EnableWebSocket
@Controller
@RequestMapping("/websocket")
public class WebSocketController {

    @GetMapping("/chat")
    public String websocket(Model model, HttpServletRequest httpServletRequest) {

        return "websocket/websocket";
    }

    @GetMapping("/chat2")
    public String websocket2(Model model, HttpServletRequest httpServletRequest, HttpSession httpSession) {
        String inUserId = httpSession.getId();
        System.out.println("httpSession : "+inUserId);
        //유저 세션에 저장된 아이디값 불러와야 하는데 안되는중 개화나네 왜 세션 못불러오는데 일단 브라우저 세션을 보내겠음
        //System.out.println("httpServletRequest getId : "+httpServletRequest.getSession().getId());
        //System.out.println("httpServletRequest : "+httpServletRequest.getSession().getAttribute("id").toString());

        if (inUserId == null) {
            inUserId = "session undefined";
        }
        httpSession.setAttribute("sessionId",inUserId);

        //model.addAttribute("inUserId", inUserId);
        return "websocket/websocket2";
    }
}
