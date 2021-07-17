package kr.co.brownie.board.reply.like.web;

import com.google.gson.JsonObject;
import kr.co.brownie.board.reply.like.service.ReplyLikeCountVO;
import kr.co.brownie.board.reply.like.service.ReplyLikeService;
import kr.co.brownie.board.reply.like.service.ReplyLikeVO;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Map;

@RestController
@RequestMapping("/board/reply/like")
public class ReplyLikeController {
    @Resource(name = "replyLikeService")
    ReplyLikeService replyLikeService;

    @PostMapping(path = "/like.ajax", produces = "application/text;charset=UTF-8")
    public String like(HttpSession httpSession,
                       @RequestParam Map<String, Object> map) {
        JsonObject jsonObject = new JsonObject();
        if (httpSession.getAttribute("id") == null) {
            jsonObject.addProperty("status", "ng");
            jsonObject.addProperty("message", "로그인 후 이용하세요.");

            return jsonObject.toString();
        }
        map.put("userId", httpSession.getAttribute("id").toString());

        ReplyLikeVO replyLikeVO = this.replyLikeService.select(map);
        if (replyLikeVO == null) {
            if (this.replyLikeService.insert(map) != 1) {
                jsonObject.addProperty("status", "ng");
                jsonObject.addProperty("message", "추천 / 반대 에 실패했습니다.");

                return jsonObject.toString();
            }

            jsonObject.addProperty("status", "ok");
            jsonObject.addProperty("message", map.get("kind").toString());
        } else {
            if (!replyLikeVO.getKind().equals(map.get("kind").toString())) {
                jsonObject.addProperty("status", "ng");
                jsonObject.addProperty("message", "추천 / 반대 중 하나만 할 수 있습니다.");

                return jsonObject.toString();
            }

            if (this.replyLikeService.delete(map) != 1) {
                jsonObject.addProperty("status", "ng");
                jsonObject.addProperty("message", "추천 / 반대 취소가 실패했습니다.");

                return jsonObject.toString();
            }
            jsonObject.addProperty("status", "ok");
            jsonObject.addProperty("message", "cancel");
        }

        ReplyLikeCountVO replyLikeCountVO = this.replyLikeService.count(map);
        JsonObject replyLikeCountVOObject = new JsonObject();
        if (replyLikeCountVO == null) {
            replyLikeCountVOObject.addProperty("replySeq", map.get("replySeq").toString());
            replyLikeCountVOObject.addProperty("likeCnt", 0);
            replyLikeCountVOObject.addProperty("unlikeCnt", 0);
        } else {
            replyLikeCountVOObject.addProperty("replySeq", replyLikeCountVO.getReplySeq());
            replyLikeCountVOObject.addProperty("likeCnt", replyLikeCountVO.getLikeCnt());
            replyLikeCountVOObject.addProperty("unlikeCnt", replyLikeCountVO.getUnlikeCnt());
        }
        jsonObject.add("replyLikeCount", replyLikeCountVOObject);

        return jsonObject.toString();
    }
}
