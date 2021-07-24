package kr.co.brownie.admin.web;

import kr.co.brownie.admin.service.AdminService;
import kr.co.brownie.admin.service.AdminVO;
import kr.co.brownie.blackList.service.BlackListService;
import kr.co.brownie.blackList.service.BlackUserService;
import kr.co.brownie.chat.service.ChatService;
import kr.co.brownie.report.service.ReportService;
import kr.co.brownie.user.service.UserService;
import kr.co.brownie.user.service.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Calendar;
import java.util.HashMap;


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

    @Resource(name = "chatService")
    ChatService chatService;


    @GetMapping(path = {"", "/adminView"})
    public String adminView(Model model, HttpServletRequest httpServletRequest) {
        if (httpServletRequest.getSession().getAttribute("id") == null || (int) httpServletRequest.getSession().getAttribute("permit_level") != 9) {
            model.addAttribute("message", "alert('권한이 없습니다.'); location.href='/'");
            return "common/message";
        }
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
        model.addAttribute("blackUserCnt", blackUserCnt);

        // 공지사항 포함 총 게시글 수 / (공지사항 제외한) 최근 일주일 간 신규 게시글 수 집계
        AdminVO boardCnt = adminService.BoardCnt();
        model.addAttribute("boardCnt", boardCnt);

        AdminVO todayUser = adminService.todayUser();
        model.addAttribute("todayUser", todayUser);

        AdminVO chatCount = adminService.chatCount();
        model.addAttribute("chatCount",chatCount);


        return "admin/adminView"; //관리자 화면 기본
    }

    @GetMapping("/adminMemberList")
    public String adminMemberList(Model model, HttpServletRequest httpServletRequest) {
        if (httpServletRequest.getSession().getAttribute("id") == null || (int) httpServletRequest.getSession().getAttribute("permit_level") != 9) {
            model.addAttribute("message", "alert('권한이 없습니다.'); location.href='/'");
            return "common/message";
        }
        int currentPageNumber;
        try {
            currentPageNumber = Math.max(Integer.parseInt(httpServletRequest.getParameter("pageNum")), 1);
        } catch (NullPointerException | NumberFormatException e) {
            currentPageNumber = 1;
        }
        model.addAttribute("UserPagingVO", userService.userList(currentPageNumber));
        //유저 리스트 셀렉트
        return "admin/adminMemberList"; //회원 리스트 화면
    }


    @GetMapping("/adminBlackList")
    public String adminBlackList(Model model, HttpServletRequest httpServletRequest) {
        if (httpServletRequest.getSession().getAttribute("id") == null || (int) httpServletRequest.getSession().getAttribute("permit_level") != 9) {
            model.addAttribute("message", "alert('권한이 없습니다.'); location.href='/'");
            return "common/message";
        }
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
        if (httpServletRequest.getSession().getAttribute("id") == null || (int) httpServletRequest.getSession().getAttribute("permit_level") != 9) {
            model.addAttribute("message", "alert('권한이 없습니다.'); location.href='/'");
            return "common/message";
        }
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
        try {
            String id = httpServletRequest.getSession().getAttribute("id").toString();
            String Seq = httpServletRequest.getParameter("reportSeq");
            int reportSeq = Integer.parseInt(Seq);
            String userId = httpServletRequest.getParameter("userId");
            String result = httpServletRequest.getParameter("log");
            String rSeq = httpServletRequest.getParameter("reasonSeq");
            int reasonSeq = Integer.parseInt(rSeq);
            int cnt = reportService.update(reportSeq, id);
            if (cnt == 1) {
                int ucount = userService.blackstack(userId);
                userService.updateStatus(userId);
                //블랙 카운트 update 시 블랙 스택 확인 후 활동상태 변경하기
                if (ucount == 1) {
                    int count = blackListService.insert(userId, result, id, reasonSeq);
                    model.addAttribute("count", count);
                    if (count == 1) {
                        String bSeq = httpServletRequest.getParameter("bListSeq");
                        int bListSeq = Integer.parseInt(bSeq);
                        String endD = httpServletRequest.getParameter("endDate");
                        int endDate = Integer.parseInt(endD);
                        UserVO user = userService.userOneSelect(userId);
                        int stack = user.getBlackStack();
                        switch (stack) {
                            case 0:
                                endDate = endDate + 1;
                                break;
                            case 1:
                                endDate = endDate + 3;
                                break;
                            case 2:
                                endDate = endDate + 7;
                                break;
                            case 3:
                                endDate = endDate + 30;
                                break;
                            default:
                                endDate = endDate + 30;
                                break;
                        }
                        blackUserService.merge(bListSeq, userId, endDate, id);
                        return "ok";
                    }
                }
            }
            model.addAttribute("cnt", cnt);
            return "ok";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "ok";
    }

    @GetMapping("/chatList")
    public String chatList(HttpServletRequest httpServletRequest, Model model){
        if (httpServletRequest.getSession().getAttribute("id") == null || (int) httpServletRequest.getSession().getAttribute("permit_level") != 9) {
            model.addAttribute("message", "alert('권한이 없습니다.'); location.href='/'");
            return "common/message";
        }
        int currentPageNumber;
        try {
            currentPageNumber = Math.max(Integer.parseInt(httpServletRequest.getParameter("pageNum")), 1);
        } catch (NullPointerException | NumberFormatException e) {
            currentPageNumber = 1;
        }
        model.addAttribute("ChatPagingVO", chatService.selectChatting(currentPageNumber));
        //유저 리스트 셀렉트
        return "admin/adminChatList";
    }
}
