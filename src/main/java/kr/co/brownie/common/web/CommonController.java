package kr.co.brownie.common.web;

import com.google.gson.JsonObject;
import kr.co.brownie.auth.service.AuthService;
import kr.co.brownie.blackList.service.BlackUserService;
import kr.co.brownie.blackList.service.BlackUserVO;
import kr.co.brownie.board.service.BoardService;
import kr.co.brownie.common.service.CommonService;
import kr.co.brownie.user.service.UserService;
import kr.co.brownie.youtube.service.YouTubeService;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping
public class CommonController {
    @Resource(name = "commonService")
    CommonService commonService;

    @Resource(name = "authService")
    AuthService authService;

    @Resource(name = "youTubeService")
    YouTubeService youTubeService;

    @Resource(name = "boardService")
    BoardService boardService;

    @Resource(name = "blackUserService")
    BlackUserService blackUserService;

    @Resource(name = "userService")
    UserService userService;

    @GetMapping(path = {"", "index", "home"})
    public String index(HttpSession httpSession,
                        Model model) {
        Map<String, Object> map = new HashMap<>();
        map.put("userId", httpSession.getAttribute("id"));
        map.put("pageNum", 1);
        map.put("contentPerPage", this.boardService.CONTENT_PER_PAGE);

        model.addAttribute("boardPagingVO", boardService.selectPagingList(map));

        //main youtube list
        model.addAttribute("youTubeVoList", youTubeService.selectList());

        return "common/index";
    }

    @GetMapping("/contact")
    public String contact() {
        return "common/contact";
    }

    @PostMapping(path = "/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
    @ResponseBody
    public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) {
        JsonObject jsonObject = new JsonObject();

        String fileRoot = "Z:\\upload\\summernote\\images\\"; // 외부경로로 저장을 희망할때.

        String originalFileName = multipartFile.getOriginalFilename();    //오리지날 파일명
        assert originalFileName != null;
        String extension = originalFileName.substring(originalFileName.lastIndexOf("."));    //파일 확장자
        String savedFileName = UUID.randomUUID() + extension;    //저장될 파일 명

        File targetFile = new File(fileRoot + savedFileName);
        try {
            InputStream fileStream = multipartFile.getInputStream();
            FileUtils.copyInputStreamToFile(fileStream, targetFile);    //파일 저장
            jsonObject.addProperty("url", "/upload/summernote/images/" + savedFileName);
            jsonObject.addProperty("responseCode", "success");
        } catch (IOException e) {
            FileUtils.deleteQuietly(targetFile);    //저장된 파일 삭제
            jsonObject.addProperty("responseCode", "error");
            e.printStackTrace();
        }
        return jsonObject.toString();
    }

    @GetMapping("/login")
    public String login(HttpServletRequest httpServletRequest) {
        String redirectUrl = httpServletRequest.getScheme() + "://" + httpServletRequest.getServerName() + ":" + httpServletRequest.getServerPort() + "/oauth";
        return authService.getAuthorize(redirectUrl);
    }

    @GetMapping("/logout")
    public String logout(HttpSession httpSession) {
        httpSession.invalidate();
        return "redirect:/";
    }

    @GetMapping("oauth")
    public String oauth(@RequestParam String code,
                        HttpSession httpSession,
                        RedirectAttributes redirectAttributes,
                        HttpServletRequest httpServletRequest) {
        try {
            String redirectUrl = httpServletRequest.getScheme() + "://" + httpServletRequest.getServerName() + ":" + httpServletRequest.getServerPort() + "/oauth";
            String access_token = authService.getToken(code, redirectUrl);
            String id = authService.getUserInfoByToken(access_token);

            /*로그인 시 회원의 아이디가 블랙유저인지 확인*/
            BlackUserVO blackUserVO = blackUserService.oneBlackUser(id);

            if (blackUserVO != null) {
                redirectAttributes.addFlashAttribute("blackUserVO", blackUserVO);
                return "redirect:/";
            }

            httpSession.setAttribute("id", id);

            /* 첫 로그인 세웅 */
            // 소환사명 및 세팅
            String tempLolNick = "익명의소환사_" + (int) (Math.random() * 100 + 1);
            String tempBrownieNick = "커뮤닉_" + (int) (Math.random() * 100 + 1);
            String position = "[empty]";
            // 경험치 테이블 세팅
            int exp = 0;
            // REVIEW 테이블 세팅
            int reviewSeq = 1;
            int starCnt = 0;
            String reply = "empty";
            String writeUserId = "admin";

            // 게시글 갯수, 댓글 갯수, 좋아요, 싫어요 초기값 세팅


            /* service 호출해서 집어넣기 */
            authService.insertUser(id, tempLolNick, tempBrownieNick, position);
            authService.insertReview(reviewSeq, id, starCnt, reply, writeUserId);

            /* 첫 로그인일 경우 권한 레벨 및 사이트 레벨 지정, 유저가 존재해야 삽입가능*/
            authService.insertPermitLevel(id);
            authService.insertExp(id, exp);

            /* 로그인 할 때 권한 레벨 세션에 넣어줘야 게시글 조회 시 사용 */
            int permitlevel = authService.permitLevel(id);
            httpSession.setAttribute("permit_level", permitlevel);

        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:/";
    }

    @PostMapping(path = "/auth", produces = "application/text;charset=UTF-8")
    @ResponseBody
    public String oauth(@RequestParam Map<String, Object> map) {
        JsonObject jsonObject = new JsonObject();

        try {
            if (!"KR".equalsIgnoreCase(map.get("region").toString())) {
                jsonObject.addProperty("status", "ng");
                jsonObject.addProperty("message", "BROWNIE는 현재 KR 서버만 지원합니다.");
            } else if (this.userService.saveLolId(map) == 1) {
                jsonObject.addProperty("status", "ok");
            } else {
                jsonObject.addProperty("status", "ng");
                jsonObject.addProperty("message", "token을 다시 확인해주세요.");
            }
        } catch(Exception e) {
            e.printStackTrace();
            jsonObject.addProperty("status", "ng");
            jsonObject.addProperty("message", "오류가 발생했습니다. 잠시 뒤 시도해주세요.");
        }

        return jsonObject.toString();
    }

    @PostMapping(path = "/time.ajax", produces = "application/text;charset=UTF-8")
    @ResponseBody
    public String time() {
        return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
    }
}
