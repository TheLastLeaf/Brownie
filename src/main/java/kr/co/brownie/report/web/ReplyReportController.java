package kr.co.brownie.report.web;

import com.google.gson.JsonObject;
import kr.co.brownie.board.reply.service.ReplyService;
import kr.co.brownie.board.reply.service.ReplyVO;
import kr.co.brownie.report.service.ReportService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/replyReport")
public class ReplyReportController {

    @Resource(name = "reportService")
    ReportService reportService;

    @Resource(name = "replyService")
    ReplyService replyService;

    @GetMapping("/write")
    public String report(HttpServletRequest request,
                         Model model,
                         HttpSession session,
                         @RequestParam int boardSeq,
                         @RequestParam int replySeq) {
        Map<String,Object> map = new HashMap<>();
        map.put("replySeq",replySeq);
        map.put("boardSeq",boardSeq);

        ReplyVO replyVO = replyService.select(map);
        model.addAttribute("replyVO",replyVO);
        return "report/replyReport";
    }

    @ResponseBody
    @PostMapping(path = "/reportReply" , produces = "application/text;charset=UTF-8")
    public Object reportPost(@RequestParam Map<String, Object> map, HttpSession session, HttpServletRequest servletRequest) {
        String id = (String) session.getAttribute("id");
        JsonObject jsonObject = new JsonObject();
        map.put("id", id);
        if (id == null) {
            return "loginCheck";
        } else {
            if (reportService.insert(map) == 1) {
                jsonObject.addProperty("message","success");
                return jsonObject.toString();
            } else {
                jsonObject.addProperty("message","fail");
                return jsonObject.toString();
            }
        }
    }
}
