package kr.co.brownie.board.like.web;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import kr.co.brownie.board.like.service.BoardLikeCountVO;
import kr.co.brownie.board.like.service.BoardLikeService;
import kr.co.brownie.board.like.service.BoardLikeVO;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Map;

@RestController
@RequestMapping("/board/like")
public class BoardLikeController {
    @Resource(name = "boardLikeService")
    BoardLikeService boardLikeService;

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

        BoardLikeVO boardLikeVO = this.boardLikeService.select(map);
        if (boardLikeVO == null) {
            if (this.boardLikeService.insert(map) != 1) {
                jsonObject.addProperty("status", "ng");
                jsonObject.addProperty("message", "추천 / 반대 에 실패했습니다.");

                return jsonObject.toString();
            }

            jsonObject.addProperty("status", "ok");
            jsonObject.addProperty("message", map.get("kind").toString());
        } else {
            if (!boardLikeVO.getKind().equals(map.get("kind").toString())) {
                jsonObject.addProperty("status", "ng");
                jsonObject.addProperty("message", "추천 / 반대 중 하나만 할 수 있습니다.");

                return jsonObject.toString();
            }

            if (this.boardLikeService.delete(map) != 1) {
                jsonObject.addProperty("status", "ng");
                jsonObject.addProperty("message", "추천 / 반대 취소가 실패했습니다.");

                return jsonObject.toString();
            }
            jsonObject.addProperty("status", "ok");
            jsonObject.addProperty("message", "cancel");
        }

        BoardLikeCountVO boardLikeCountVO = this.boardLikeService.count(map);
        JsonObject boardLikeCountVoObject;
        if (boardLikeCountVO == null) {
            boardLikeCountVoObject = new JsonObject();
            boardLikeCountVoObject.addProperty("boardSeq", map.get("boardSeq").toString());
            boardLikeCountVoObject.addProperty("likeCnt", 0);
            boardLikeCountVoObject.addProperty("unlikeCnt", 0);
        } else {
            Gson gson = new Gson();
            boardLikeCountVoObject = gson.fromJson(gson.toJson(boardLikeCountVO), JsonObject.class);
        }
        jsonObject.add("boardLikeCount", boardLikeCountVoObject);

        return jsonObject.toString();
    }
}
