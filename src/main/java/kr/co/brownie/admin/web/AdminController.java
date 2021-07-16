package kr.co.brownie.admin.web;

import java.text.SimpleDateFormat;
import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import kr.co.brownie.blackList.service.BlackUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import kr.co.brownie.admin.service.AdminService;
import kr.co.brownie.admin.service.AdminVO;
import kr.co.brownie.blackList.service.BlackListService;
import kr.co.brownie.blackList.service.BlackListVO;
import kr.co.brownie.report.service.ReportService;
import kr.co.brownie.report.service.ReportVO;
import kr.co.brownie.user.service.UserService;
import kr.co.brownie.user.service.UserVO;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/admin")
public class AdminController {
    @Resource(name = "adminService")
    AdminService adminService;

    @Resource(name = "blackListService")
    BlackListService blackListService;

    @Resource(name = "blackUserService")
    BlackUserService blackUserService;

    @Resource(name = "userService")
    UserService userService;

    @Resource(name = "reportService")
    ReportService reportService;


    @GetMapping(path = {"", "/adminView"})
    public String adminView(Model model) {
        //이번달 표시
        Calendar cal = Calendar.getInstance();
        int month = cal.get(Calendar.MONTH) + 1;    //이번달
        HashMap<String, Integer> dayMap = new HashMap<String, Integer>();
        dayMap.put("month", month);
        model.addAttribute("dayMap", dayMap);

        //전체 회원 수 / 최근 일주일 간 신규 회원 수
        AdminVO UserCnt = adminService.UserCnt();
        model.addAttribute("UserCnt", UserCnt);

        //미처리 신고 수 집계
        AdminVO reportCnt = adminService.ReportCnt();
        model.addAttribute("reportCnt", reportCnt);

        //블랙유저 집계
        AdminVO blackUserCnt = adminService.BlackUserCnt();
        model.addAttribute("blackUserCnt",blackUserCnt);

        // 공지사항 포함 총 게시글 수 / (공지사항 제외한) 최근 일주일 간 신규 게시글 수 집계
        AdminVO boardCnt = adminService.BoardCnt();
        model.addAttribute("boardCnt", boardCnt);



        return "admin/adminView"; //관리자 화면 기본
    }

    @GetMapping("/adminMemberList")
    public String adminMemberList(Model model) {
        //유저 리스트 셀렉트
        List<UserVO> userList = userService.selectList();
        model.addAttribute("userList", userList);
        return "admin/adminMemberList"; //회원 리스트 화면
    }


    @GetMapping("/adminBlackList")
    public String adminBlackList(Model model,HttpServletRequest httpServletRequest) {
        int currentPageNumber;
        try {
            currentPageNumber = Math.max(Integer.parseInt(httpServletRequest.getParameter("pageNum")), 1);
        } catch (NullPointerException | NumberFormatException e) {
            currentPageNumber = 1;
        }
        model.addAttribute("BlackUserPagingVO", blackUserService.blackUserList(currentPageNumber));
        return "admin/adminBlackList"; //블랙리스트 화면
    }

    @ResponseBody
    @RequestMapping(value = "/upDateblack", method = {RequestMethod.GET, RequestMethod.POST})
    public Object addblackPost(Model model, HttpServletRequest httpServletRequest) {
        String Seq = httpServletRequest.getParameter("bUserSeq");
        int bUserSeq = Integer.parseInt(Seq);
        String status = httpServletRequest.getParameter("status");
        int count = blackUserService.update(bUserSeq);
        model.addAttribute("count", count);
        return count;
    }

    @GetMapping("/adminReportList")
    public String adminReportList(Model model, HttpServletRequest httpServletRequest) {
        int currentPageNumber;
        try {
            currentPageNumber = Math.max(Integer.parseInt(httpServletRequest.getParameter("pageNum")), 1);
        } catch (NullPointerException | NumberFormatException e) {
            currentPageNumber = 1;
        }
        model.addAttribute("blackList", blackListService.selectBlackList());
        model.addAttribute("ReportPagingVO", reportService.selectReportList(currentPageNumber));
        return "admin/adminReportList"; //신고 리스트 화면
    }

    @ResponseBody
    @RequestMapping(value = "/addblacklist", method = {RequestMethod.GET, RequestMethod.POST})
    public Object reportPost(Model model, HttpServletRequest httpServletRequest) {
        String id = httpServletRequest.getSession().getAttribute("id").toString();
        String Seq = httpServletRequest.getParameter("reportSeq");
        int reportSeq = Integer.parseInt(Seq);
        String userId = httpServletRequest.getParameter("userId");
        String result = httpServletRequest.getParameter("log");
        String rSeq = httpServletRequest.getParameter("reasonSeq");
        int reasonSeq = Integer.parseInt(rSeq);
        String bSeq = httpServletRequest.getParameter("bListSeq");
        int bListSeq = Integer.parseInt(bSeq);
        String endD = httpServletRequest.getParameter("endDate");
        int endDate = Integer.parseInt(endD);
        int cnt = reportService.update(reportSeq, id);
        if (cnt == 1) {
            int ucount = userService.blackstack(userId);
            model.addAttribute("ucount", ucount);
            if (ucount == 1) {
                int count = blackListService.insert(userId, result, id, reasonSeq);
                model.addAttribute("count", count);
                if (count == 1) {
                    int bcount = blackUserService.insert(bListSeq, userId, endDate, id);
                    return bcount;
                }
            }
        }
        model.addAttribute("cnt", cnt);
        return cnt;
    }
}
