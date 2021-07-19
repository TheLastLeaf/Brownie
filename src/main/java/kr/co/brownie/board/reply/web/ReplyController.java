package kr.co.brownie.board.reply.web;

import com.google.gson.JsonObject;
import kr.co.brownie.board.reply.service.ReplyService;
import kr.co.brownie.board.reply.service.ReplyVO;
import kr.co.brownie.board.service.BoardService;
import kr.co.brownie.board.service.BoardVO;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Map;

@RestController
@RequestMapping("/board/reply")
public class ReplyController {
    @Resource(name = "boardService")
    BoardService boardService;

    @Resource(name = "replyService")
    ReplyService replyService;

    @PostMapping(path = "/write.ajax", produces = "application/text;charset=UTF-8")
    public String write(HttpSession httpSession,
                        @RequestParam Map<String, Object> map) {
        JsonObject jsonObject = new JsonObject();
        if (httpSession.getAttribute("id") == null) {
            jsonObject.addProperty("status", "ng");
            jsonObject.addProperty("message", "로그인 후 이용하세요.");
        } else {
            map.put("userId", httpSession.getAttribute("id"));
            BoardVO boardVO = this.boardService.select(map);
            if (boardVO == null) {
                jsonObject.addProperty("status", "ng");
                jsonObject.addProperty("message", "해당 글이 없습니다.");
            } else {
                if (map.get("replyContent").toString().length() == 0) {
                    jsonObject.addProperty("status", "ng");
                    jsonObject.addProperty("message", "내용이 없습니다.");
                } else if (this.replyService.insert(map) != 1) {
                    jsonObject.addProperty("status", "ng");
                    jsonObject.addProperty("message", "작성에 실패하였습니다.");
                } else {
                    jsonObject.addProperty("status", "ok");
                }
            } 
        }
        return jsonObject.toString();
    }

    @PostMapping(path = "/delete.ajax", produces = "application/text;charset=UTF-8")
    public String delete(HttpSession httpSession,
                         @RequestParam Map<String, Object> map) {
        JsonObject jsonObject = new JsonObject();
        String userId = httpSession.getAttribute("id").toString();

        if (userId == null) {
            jsonObject.addProperty("status", "ng");
            jsonObject.addProperty("message", "로그인 후 이용하세요.");
        } else {
            ReplyVO replyVO = this.replyService.select(map);
            if (replyVO == null) {
                jsonObject.addProperty("status", "ng");
                jsonObject.addProperty("message", "해당 글이 없습니다.");
            } else if (!userId.equals(replyVO.getReplyInUserId())) {
                jsonObject.addProperty("status", "ng");
                jsonObject.addProperty("message", "작성자만 댓글을 삭제할 수 있습니다..");
            } else {
                if (this.replyService.delete(map) != 1) {
                    jsonObject.addProperty("status", "ng");
                    jsonObject.addProperty("message", "삭제에 실패하였습니다.");
                } else {
                    jsonObject.addProperty("status", "ok");
                    jsonObject.addProperty("message", "삭제하였습니다.");
                }
            }
        }
        return jsonObject.toString();
    }
}
