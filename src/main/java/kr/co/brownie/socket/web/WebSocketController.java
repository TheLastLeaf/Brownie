package kr.co.brownie.socket.web;

import com.google.gson.JsonObject;
import kr.co.brownie.common.service.CommonService;
import kr.co.brownie.free.service.FreeService;
import kr.co.brownie.free.service.FreeVO;
import kr.co.brownie.notice.service.NoticeService;
import kr.co.brownie.notice.service.NoticeVO;
import kr.co.brownie.youtube.service.YouTubeService;
import kr.co.brownie.youtube.service.YouTubeVO;
import lombok.RequiredArgsConstructor;
import org.apache.commons.io.FileUtils;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.socket.config.annotation.EnableWebSocket;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

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
