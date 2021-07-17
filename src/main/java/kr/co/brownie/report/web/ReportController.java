package kr.co.brownie.report.web;

import kr.co.brownie.report.service.ReportService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.Map;

@Controller
@RequestMapping("/report")
public class ReportController {

    @Resource(name = "reportService")
    ReportService reportService;

    @GetMapping("/write")
    public String report(HttpServletRequest request, Model model, HttpSession session) {
        String userId = request.getParameter("userId");
        model.addAttribute("userId", userId);
        String id = (String) session.getAttribute("id");
        model.addAttribute("id", id);
        String log = request.getParameter("log");
        model.addAttribute("log", log);
        return "board/free/report";
    }

    @ResponseBody
    @PostMapping("/reportBoard")
    public Object reportPost(Map<String, Object> map, HttpSession session, HttpServletRequest servletRequest) {
        String id = (String) session.getAttribute("id");
        String content = servletRequest.getParameter("content");
        String[] reportNameList = servletRequest.getParameterValues("reportName[]");
        String userId = servletRequest.getParameter("userId");
        String log = servletRequest.getParameter("log");
        map.put("content", content);
        map.put("reportName", Arrays.toString(reportNameList));
        map.put("id", id);
        map.put("userId", userId);
        map.put("log", log);
        System.out.println(map);
        if (id == null) {
            return "loginCheck";
        } else {
            if (reportService.insert(map) == 1) {
                return "success";
            } else {
                System.out.println(reportService.insert(map));
                return "fail";
            }
        }
    }
}
