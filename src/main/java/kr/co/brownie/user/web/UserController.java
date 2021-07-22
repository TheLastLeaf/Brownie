package kr.co.brownie.user.web;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonObject;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.brownie.fileUpload.service.FileService;
import kr.co.brownie.report.service.ReportService;
import kr.co.brownie.review.service.ReviewService;
import kr.co.brownie.review.service.ReviewVO;
import kr.co.brownie.review.service.impl.ReviewPagingVO;
import kr.co.brownie.user.service.UserService;
import kr.co.brownie.user.service.UserVO;

@Controller
@RequestMapping("/user")
public class UserController {
    @Resource(name = "userService")
    UserService userService;

    @Resource(name = "reviewService")
    ReviewService reviewService;

    @Resource(name = "fileService")
    FileService fileService;

    @Resource(name = "reportService")
    ReportService reportService;

    /**
     * @param user_id: String
     * @param model:   Model
     * @param page:    ReviewPagingVO
     * @return String
     * @author 박세웅
     */
    @GetMapping("/info/{user_id}")
    public String userInfo(@PathVariable String user_id,
                           Model model,
                           ReviewPagingVO page) {

        // LOGGER.debug(" page {}", page);

        UserVO userOneSelect = userService.userOneSelect(user_id);

        if (userOneSelect == null) {
            model.addAttribute("message", "alert(\"등록되지 않은 유저입니다.\");history.go(-1);");
            return "common/message";
        }

        // 프로필 사진들고오기
        String selectProfile = fileService.selectProfile(user_id);

        // 경험치 select
        int exp = userService.selectExp(user_id);

        // 별카운트
        float starCnt = userService.starCntSelect(user_id);
        int fullStar = (int) starCnt;
        float halfStar = starCnt - fullStar;
        if (halfStar >= 0.5) {
            halfStar = 1;
        }

        // 게시글 갯수, 댓글 갯수, 좋아요, 싫어요 초기값 세팅
        int boardTotalCnt = userService.boardTotalCnt(user_id);
        int replyTotalCnt = userService.replyTotalCnt(user_id);
        int likeReplyCnt = userService.likeReplyCnt(user_id);
        int hateReplyCnt = userService.hateReplyCnt(user_id);

        // 로그인한 사람의 최근 게시글 3개가져오기
        List<String> recentBoard = userService.recentBoard(user_id);

        // 후기 페이징
        page.setId(user_id);
        page.setTotalCount(reviewService.countAllReview(page));

        // 리뷰
        List<ReviewVO> reviewVOs = reviewService.selectReviewList(page);

        // model.addattribute
        model.addAttribute("userOneSelect", userOneSelect);
        model.addAttribute("selectProfile", selectProfile);
        model.addAttribute("exp", exp);
        model.addAttribute("fullStar", fullStar);
        if (halfStar == 1) {
            model.addAttribute("halfStar", halfStar);
        }
        model.addAttribute("boardTotalCnt", boardTotalCnt);
        model.addAttribute("replyTotalCnt", replyTotalCnt);
        model.addAttribute("likeReplyCnt", likeReplyCnt);
        model.addAttribute("hateReplyCnt", hateReplyCnt);
        model.addAttribute("recentBoard", recentBoard);

        model.addAttribute("reviewVOs", reviewVOs);
        model.addAttribute("page", page);

        System.out.println("UserController 111줄 호출: userOneSelect: " + userOneSelect);
        System.out.println("UserController 112줄 호출: reviewVOs" + reviewVOs);
        System.out.println();

        return "user/info";
    }

    @PostMapping(path = "/info", produces = "application/text;charset=UTF-8")
    @ResponseBody // AJAX 사용시 써야함
    public String userName(HttpSession httpSession,
                           @RequestParam(required = false) MultipartFile uploadFile,
                           @RequestParam Map<String, Object> map) throws IOException {
        List<String> changed = new ArrayList<>();
        JsonObject jsonObject = new JsonObject();

        System.out.println(map);

        if (httpSession.getAttribute("id") == null) {
            jsonObject.addProperty("responseCode", "error");
            jsonObject.addProperty("message", "로그인 후 이용하세요.");
        } else {
            String id = httpSession.getAttribute("id").toString();
            map.put("id", id);

            UserVO userVO = userService.userOneSelect(id);
            if (!userVO.getNickName().equals(map.get("nickNameBox").toString())) {
                if (userService.dateChecking(id).equals("no")) {
                    jsonObject.addProperty("responseCode", "error");
                    jsonObject.addProperty("message", "로그인 후 이용하세요.");
                    return jsonObject.toString();
                } else {
                    userService.updateNick(map);
                    changed.add("닉네임");
                }
            }

            if (uploadFile != null) {
                // 파일 저장되는 경로
                String fileRoot = "Z:\\upload\\profile\\images\\"; // 외부경로로 저장을 희망할때.
                String profilePath = "/upload/profile/images/";

                String originalFileName = uploadFile.getOriginalFilename();    //오리지날 파일명
                assert originalFileName != null;
                String extension = originalFileName.substring(originalFileName.lastIndexOf("."));    //파일 확장자
                String savedFileName = UUID.randomUUID() + extension;    //저장될 파일 명

                File targetFile = new File(fileRoot + savedFileName);
                try {
                    InputStream fileStream = uploadFile.getInputStream();
                    FileUtils.copyInputStreamToFile(fileStream, targetFile);    //파일 저장
                    map.put("userId", id);
                    map.put("image", profilePath + savedFileName);
                    userService.updateImage(map);
                    changed.add("사진");
                } catch (IOException e) {
                    FileUtils.deleteQuietly(targetFile);    //저장된 파일 삭제
                    jsonObject.addProperty("responseCode", "error");
                    jsonObject.addProperty("message", "파일 업로드 실패");
                    e.printStackTrace();
                }
            }

            if (!userVO.getUserPosition().equals(map.get("positions").toString())) {
                userService.updatePosition(map);
                changed.add("포지션");
            }

            jsonObject.addProperty("responseCode", "success");
            if (changed.size() == 0) {
                jsonObject.addProperty("message", "변경된 항목이 없습니다.");
            } else {
                String result = Arrays.toString(changed.toArray(new String[0]));
                jsonObject.addProperty("message", result + " 항목이 변경되었습니다.");
            }
        }
        return jsonObject.toString();
    }

    @GetMapping("/modify/{user_id}")
    public String userModify(Model model, @PathVariable String user_id) throws IOException {
        System.out.println("get");
        String selectProfile = fileService.selectProfile(user_id);
        UserVO userVO = userService.userOneSelect(user_id);
        model.addAttribute("userOneSelect", userVO);
        model.addAttribute("selectProfile", selectProfile);
        return "user/modify";
    }

    @PostMapping("/idCheck.ajax")
    @ResponseBody
    public String userPostModify(Model model, @RequestParam Map<String, Object> map, HttpServletRequest httpServletRequest) throws IOException {
        String userNick = (String) map.get("user_nick");
        int checkValue = userService.validating(userNick);
        String msg;
        if (checkValue == 1) {
            // 아이디 중복
            msg = "ng";
        } else {
            msg = "ok";
        }
        return msg;
    }

    @GetMapping("/declare")
    public String userDeclar(HttpServletRequest request, Model model) {
        String userId = request.getParameter("userId");
        String nickName = userService.nickName(userId);
        String log = request.getParameter("log");

        model.addAttribute("userId", userId);
        model.addAttribute("log", log);
        model.addAttribute("nickName", nickName);

        return "user/declare";
    }

    @ResponseBody
    @PostMapping(path = "/report", produces = "application/text;charset=UTF-8")
    public Object reportPost(@RequestParam Map<String,Object> map,Model model, HttpServletRequest httpServletRequest) {
        String id = httpServletRequest.getSession().getAttribute("id").toString();
        JsonObject jsonObject = new JsonObject();
        map.put("id", id);
        int cnt = reportService.insert(map);
        if(cnt == 1){
            jsonObject.addProperty("message","success");
            return jsonObject.toString();
        }else{
            jsonObject.addProperty("message","fail");
            return jsonObject.toString();
        }
    }

    @GetMapping("/review/{user_id}")
    public String userReview(Model model,
                             @RequestParam Map<String, Object> map,
                             HttpSession httpsession,
                             @PathVariable String user_id) {
        String sessionId = (String) httpsession.getAttribute("id");
        // 현재 접속한 세션 아이디의 VO
        UserVO userVO = userService.userOneSelect(sessionId);

        model.addAttribute("userVO", userVO);

        return "user/review";
    }

    @PostMapping("/review")
    @ResponseBody
    public String userPostReview(@RequestParam Map<String, Object> map,
                                 HttpSession httpsession) {
        String sessionId = (String) httpsession.getAttribute("id");
        map.put("sessionId", sessionId);
        reviewService.insertReview(map);

        return "<script>window.close();</script>";
    }

    @GetMapping("/sync")
    public String userSync() {
        return "user/sync";
    }
}
