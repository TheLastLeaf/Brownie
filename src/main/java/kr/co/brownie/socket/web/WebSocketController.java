package kr.co.brownie.socket.web;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.config.annotation.EnableWebSocket;

@Configuration
@RequiredArgsConstructor
@EnableWebSocket
@Controller
@RequestMapping("/websocket")
public class WebSocketController {

    @GetMapping("/chat")
    public String websocket() {
        return "websocket/websocket";
    }
}
