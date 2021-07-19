package kr.co.brownie.common.web;

import com.google.gson.JsonObject;
import kr.co.brownie.board.service.BoardService;
import kr.co.brownie.common.service.CommonService;
import kr.co.brownie.free.service.FreeService;
import kr.co.brownie.youtube.service.YouTubeService;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping
public class CommonController {
    @Resource(name = "commonService")
    CommonService commonService;

    @Resource(name = "youTubeService")
    YouTubeService youTubeService;

    @Resource(name = "freeService")
    FreeService freeService;

    @Resource(name = "boardService")
    BoardService boardService;

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

        String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.

        // 내부경로로 저장
//        String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
//        String fileRoot = contextRoot + "resources/fileupload/";

        String originalFileName = multipartFile.getOriginalFilename();    //오리지날 파일명
        assert originalFileName != null;
        String extension = originalFileName.substring(originalFileName.lastIndexOf("."));    //파일 확장자
        String savedFileName = UUID.randomUUID() + extension;    //저장될 파일 명

        File targetFile = new File(fileRoot + savedFileName);
        try {
            InputStream fileStream = multipartFile.getInputStream();
            FileUtils.copyInputStreamToFile(fileStream, targetFile);    //파일 저장
//            jsonObject.addProperty("url", "/resources/fileupload/" + savedFileName); // contextroot + resources + 저장할 내부 폴더명
            jsonObject.addProperty("url", "/summernoteImage/" + savedFileName);
            jsonObject.addProperty("responseCode", "success");
        } catch (IOException e) {
            FileUtils.deleteQuietly(targetFile);    //저장된 파일 삭제
            jsonObject.addProperty("responseCode", "error");
            e.printStackTrace();
        }
        System.out.println(1);
        return jsonObject.toString();
    }
}
