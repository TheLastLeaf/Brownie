package kr.co.brownie.board.web;

import com.google.gson.JsonObject;
import kr.co.brownie.board.reply.service.ReplyService;
import kr.co.brownie.board.service.BoardService;
import kr.co.brownie.board.service.BoardVO;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

@RestController
@RequestMapping("/board")
public class BoardController {
    @Resource(name = "boardService")
    BoardService boardService;

    @Resource(name = "replyService")
    ReplyService replyService;

    @PostMapping(path = "/write.ajax", produces = "application/text;charset=UTF-8")
    public String write(HttpSession httpSession,
                        HttpServletRequest httpServletRequest,
                        @RequestParam Map<String, Object> map) {
        JsonObject jsonObject = new JsonObject();
        String referer = httpServletRequest.getHeader("REFERER");
        if (referer == null) {
            jsonObject.addProperty("status", "ng");
            jsonObject.addProperty("message", "정상적인 접근이 아닙니다.");
        } else {
            map.put("boardKind",
                    referer.substring(
                            referer.substring(1, referer.indexOf("/write")).lastIndexOf("/") + 2,
                            referer.indexOf("/write")
                    )
            );

            if (httpSession.getAttribute("id") == null) {
                jsonObject.addProperty("status", "ng");
                jsonObject.addProperty("message", "로그인 후 이용하세요.");
            } else {
                map.put("userId", httpSession.getAttribute("id"));

                if (this.boardService.insert(map) != 1) {
                    jsonObject.addProperty("status", "ng");
                    jsonObject.addProperty("message", "작성에 실패하였습니다.");
                } else {
                    jsonObject.addProperty("status", "ok");
                }
            }
        }
        return jsonObject.toString();
    }


    @PostMapping(path = "/modify.ajax", produces = "application/text;charset=UTF-8")
    public String modify(HttpSession httpSession,
                         HttpServletRequest httpServletRequest,
                         @RequestParam Map<String, Object> map) {
        JsonObject jsonObject = new JsonObject();
        String referer = httpServletRequest.getHeader("REFERER");
        if (referer == null) {
            jsonObject.addProperty("status", "ng");
            jsonObject.addProperty("message", "정상적인 접근이 아닙니다.");
        } else {
            map.put("boardKind",
                    referer.substring(
                            referer.substring(1, referer.indexOf("/modify")).lastIndexOf("/") + 2,
                            referer.indexOf("/modify")
                    )
            );
            String userId = httpSession.getAttribute("id").toString();

            if (userId == null) {
                jsonObject.addProperty("status", "ng");
                jsonObject.addProperty("message", "로그인 후 이용하세요.");
            } else {
                map.put("userId", httpSession.getAttribute("id"));

                BoardVO boardVO = this.boardService.select(map);
                if (boardVO == null) {
                    jsonObject.addProperty("status", "ng");
                    jsonObject.addProperty("message", "해당 글이 없습니다.");
                } else if (!userId.equals(boardVO.getBoardInUserId())) {
                    jsonObject.addProperty("status", "ng");
                    jsonObject.addProperty("message", "작성자만 게시글을 수정할 수 있습니다..");
                } else {
                    if (this.boardService.update(map) != 1) {
                        jsonObject.addProperty("status", "ng");
                        jsonObject.addProperty("message", "수정에 실패하였습니다.");
                    } else {
                        jsonObject.addProperty("status", "ok");
                    }
                }
            }
        }
        return jsonObject.toString();
    }
}
