package kr.co.brownie.report.web;

import com.google.gson.JsonObject;
import kr.co.brownie.board.service.BoardService;
import kr.co.brownie.board.service.BoardVO;
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
@RequestMapping("/report")
public class BoardReportController {

    @Resource(name = "reportService")
    ReportService reportService;

    @Resource(name = "boardService")
    BoardService boardService;

    @GetMapping("/write")
    public String report(HttpServletRequest request,
                         Model model,
                         HttpSession session,
                         @RequestParam int boardSeq) {
        Map<String, Object> map = new HashMap<>();
        map.put("boardSeq", boardSeq);
        BoardVO boardVO = boardService.select(map);
        model.addAttribute("boardVO", boardVO);
        return "report/boardReport";
    }

    @ResponseBody
    @PostMapping(path = "/reportBoard", produces = "application/text;charset=UTF-8")
    public Object reportPost(@RequestParam Map<String, Object> map, HttpSession session, HttpServletRequest servletRequest) {
        String id = (String) session.getAttribute("id");
        JsonObject jsonObject = new JsonObject();
        map.put("id", id);
        if (id == null) {
            return "loginCheck";
        } else {
            if (reportService.insert(map) == 1) {
                jsonObject.addProperty("message", "success");
                return jsonObject.toString();
            } else {
                jsonObject.addProperty("message", "fail");
                return jsonObject.toString();
            }
        }
    }
}
