package kr.co.brownie.report.web;

import com.google.gson.JsonObject;
import kr.co.brownie.chat.service.ChatService;
import kr.co.brownie.chat.service.ChatVO;
import kr.co.brownie.report.service.ReportService;
import kr.co.brownie.user.service.UserService;
import kr.co.brownie.user.service.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/report/chat")
public class ChatReportController {
    @Resource(name="userService")
    UserService userService;

    @Resource(name="chatService")
    ChatService chatService;

    @Resource(name="reportService")
    ReportService reportService;

    @GetMapping("")
    public String chatList(HttpServletRequest httpServletRequest,
                           Model model,
                           @RequestParam Map<String, Object> map) {
        if (httpServletRequest.getSession().getAttribute("id") == null || (int) httpServletRequest.getSession().getAttribute("permit_level") != 9) {
            model.addAttribute("message", "alert('권한이 없습니다.'); location.href='/'");
            return "common/message";
        }

        UserVO userVO = userService.userOneSelect(map.get("userId").toString());
        model.addAttribute("userVO", userVO);
        model.addAttribute("userId", map.get("userId"));
        model.addAttribute("teamGameSeq", map.get("teamGameSeq"));

        return "report/chatReport";
    }

    @ResponseBody
    @PostMapping(path = "/report.ajax", produces = "application/text;charset=UTF-8")
    public Object chatLog(HttpSession httpSession,
                          @RequestParam Map<String, Object> map) {
        // Map<String, Object> map: String userId, String TeamGameSeq
        System.out.println(map);

        JsonObject jsonObject = new JsonObject();
        if (httpSession.getAttribute("id") == null) {
            jsonObject.addProperty("status", "ng");
            jsonObject.addProperty("message", "권한이 없습니다.");
        } else {
            map.put("id", httpSession.getAttribute("id"));

            List<ChatVO> chatVOList = chatService.selectChatting(map);
            System.out.println(chatVOList);
            if (chatVOList == null || chatVOList.size() == 0) {
                jsonObject.addProperty("status", "ng");
                jsonObject.addProperty("message", "신고할 내용이 없습니다.");
            } else {
                StringBuilder log = new StringBuilder();
                for (ChatVO chat : chatVOList) {
                    log.append("<p>").append(chat.getNickName()).append(": ").append(chat.getContent()).append("</p>");

                }
                map.put("log", log);

                System.out.println(map);
                if (reportService.insert(map) == 1) {
                    jsonObject.addProperty("message", "ok");
                } else {
                    jsonObject.addProperty("status", "ng");
                    jsonObject.addProperty("message", "신고가 접수되지 않았습니다.");
                }
            }
        }
        return jsonObject.toString();
    }
}
