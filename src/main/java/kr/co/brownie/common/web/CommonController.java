package kr.co.brownie.common.web;

import com.google.gson.JsonObject;
import kr.co.brownie.auth.service.AuthService;
import kr.co.brownie.blackList.service.BlackUserService;
import kr.co.brownie.blackList.service.BlackUserVO;
import kr.co.brownie.board.service.BoardService;
import kr.co.brownie.common.service.CommonService;
import kr.co.brownie.user.service.UserService;
import kr.co.brownie.user.service.UserVO;
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
        map.put("boardKind", "notice");
        map.put("contentPerPage", this.boardService.CONTENT_PER_PAGE);

        model.addAttribute("boardPagingVO", boardService.selectPagingList(map));
        model.addAttribute("youTubeVoList", youTubeService.selectList());

        try {
            model.addAttribute("leagueCalendarList", this.commonService.leagueCalendarList());
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            model.addAttribute("teamInfoList", this.commonService.teamInfoList());
        } catch (Exception e) {
            e.printStackTrace();
        }

        map.put("boardKind", "gallery");
        map.put("days", 30);
        map.put("limit", 7);

        model.addAttribute("galleryBoardVOList", this.boardService.selectListOrderByLike(map));

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

        String fileRoot = "Z:\\upload\\summernote\\images\\"; // ??????????????? ????????? ????????????.

        String originalFileName = multipartFile.getOriginalFilename();    //???????????? ?????????
        assert originalFileName != null;
        String extension = originalFileName.substring(originalFileName.lastIndexOf("."));    //?????? ?????????
        String savedFileName = UUID.randomUUID() + extension;    //????????? ?????? ???

        File targetFile = new File(fileRoot + savedFileName);
        try {
            InputStream fileStream = multipartFile.getInputStream();
            FileUtils.copyInputStreamToFile(fileStream, targetFile);    //?????? ??????
            jsonObject.addProperty("url", "/upload/summernote/images/" + savedFileName);
            jsonObject.addProperty("responseCode", "success");
        } catch (IOException e) {
            FileUtils.deleteQuietly(targetFile);    //????????? ?????? ??????
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

    @GetMapping("/login/{id}")
    public String loginUsingUserId(HttpSession httpSession,
                                   RedirectAttributes redirectAttributes,
                                   @PathVariable String id) {
        try {
            /*????????? ??? ????????? ???????????? ?????????????????? ??????*/
            BlackUserVO blackUserVO = blackUserService.oneBlackUser(id);

            if (blackUserVO != null) {
                redirectAttributes.addFlashAttribute("blackUserVO", blackUserVO);
                return "redirect:/";
            }

            httpSession.setAttribute("id", id);

            UserVO userVO = userService.userOneSelect(id);
            if (userVO != null) {
                int permitlevel = authService.permitLevel(id);
                httpSession.setAttribute("permit_level", permitlevel);

                String nickName = authService.nickName(id);
                httpSession.setAttribute("nickname", nickName);
            } else {
                /* ??? ????????? ?????? */
                // ???????????? ??? ??????
                String tempLolNick = "??????_" + (int) (Math.random() * 10000 + 1);
                String tempBrownieNick;
                do {
                    tempBrownieNick = "?????????_" + (int) (Math.random() * 10000 + 1);
                } while (userService.validating(tempBrownieNick) == 1);
                String position = "[empty]";
                // ????????? ????????? ??????
                int exp = 0;
                // REVIEW ????????? ??????
                int reviewSeq = 1;
                int starCnt = 0;
                String reply = "empty";
                String writeUserId = "admin";

                // ????????? ??????, ?????? ??????, ?????????, ????????? ????????? ??????
                /* service ???????????? ???????????? */
                authService.insertUser(id, tempLolNick, tempBrownieNick, position);
                authService.insertReview(reviewSeq, id, starCnt, reply, writeUserId);

                /* ??? ???????????? ?????? ?????? ?????? ??? ????????? ?????? ??????, ????????? ???????????? ????????????*/
                authService.insertPermitLevel(id);
                authService.insertExp(id, exp);

                /* ????????? ??? ??? ?????? ?????? ????????? ???????????? ????????? ?????? ??? ?????? */
                int permitlevel = authService.permitLevel(id);
                httpSession.setAttribute("permit_level", permitlevel);

                String nickName = authService.nickName(id);
                httpSession.setAttribute("nickname", nickName);
                httpSession.setAttribute("nickname", nickName);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:/";
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

            /*????????? ??? ????????? ???????????? ?????????????????? ??????*/
            BlackUserVO blackUserVO = blackUserService.oneBlackUser(id);

            if (blackUserVO != null) {
                redirectAttributes.addFlashAttribute("blackUserVO", blackUserVO);
                return "redirect:/";
            }

            httpSession.setAttribute("id", id);

            UserVO userVO = userService.userOneSelect(id);
            if (userVO != null) {
                int permitlevel = authService.permitLevel(id);
                httpSession.setAttribute("permit_level", permitlevel);

                String nickName = authService.nickName(id);
                httpSession.setAttribute("nickname", nickName);
            } else {
                /* ??? ????????? ?????? */
                // ???????????? ??? ??????
                String tempLolNick = "??????_" + (int) (Math.random() * 10000 + 1);
                String tempBrownieNick;
                do {
                    tempBrownieNick = "?????????_" + (int) (Math.random() * 10000 + 1);
                } while (userService.validating(tempLolNick) == 1);
                String position = "[empty]";
                // ????????? ????????? ??????
                int exp = 0;
                // REVIEW ????????? ??????
                int reviewSeq = 1;
                int starCnt = 0;
                String reply = "empty";
                String writeUserId = "admin";

                // ????????? ??????, ?????? ??????, ?????????, ????????? ????????? ??????
                /* service ???????????? ???????????? */
                authService.insertUser(id, tempLolNick, tempBrownieNick, position);
                authService.insertReview(reviewSeq, id, starCnt, reply, writeUserId);

                /* ??? ???????????? ?????? ?????? ?????? ??? ????????? ?????? ??????, ????????? ???????????? ????????????*/
                authService.insertPermitLevel(id);
                authService.insertExp(id, exp);

                /* ????????? ??? ??? ?????? ?????? ????????? ???????????? ????????? ?????? ??? ?????? */
                int permitlevel = authService.permitLevel(id);
                httpSession.setAttribute("permit_level", permitlevel);

                String nickName = authService.nickName(id);
                httpSession.setAttribute("nickname", nickName);
            }
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
                jsonObject.addProperty("message", "BROWNIE??? ?????? KR ????????? ???????????????.");
            } else if (this.userService.saveLolId(map) == 1) {
                jsonObject.addProperty("status", "ok");
            } else {
                jsonObject.addProperty("status", "ng");
                jsonObject.addProperty("message", "token??? ?????? ??????????????????.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            jsonObject.addProperty("status", "ng");
            jsonObject.addProperty("message", "????????? ??????????????????. ?????? ??? ??????????????????.");
        }

        return jsonObject.toString();
    }

    @PostMapping(path = "/authCancel", produces = "application/text;charset=UTF-8")
    @ResponseBody
    public String authCancle(HttpSession httpSession) {
        JsonObject jsonObject = new JsonObject();
        Map<String, Object> map = new HashMap<>();

        String lolId = "??????_" + (int) (Math.random() * 10000 + 1);
        map.put("lolId", lolId);

        map.put("userId", httpSession.getAttribute("id"));
        try {
            if (this.userService.deleteLolId(map) == 1) {
                jsonObject.addProperty("status", "ok");
            } else {
                jsonObject.addProperty("status", "ng");
                jsonObject.addProperty("message", "????????? ??????????????????.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            jsonObject.addProperty("status", "ng");
            jsonObject.addProperty("message", "????????? ??????????????????.");
        }

        return jsonObject.toString();
    }

    @PostMapping(path = "/time.ajax", produces = "application/text;charset=UTF-8")
    @ResponseBody
    public String time() {
        return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
    }
}
