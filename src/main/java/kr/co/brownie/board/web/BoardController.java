package kr.co.brownie.board.web;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import kr.co.brownie.board.service.BoardService;
import kr.co.brownie.board.service.BoardVO;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/board")
public class BoardController {
    @Resource(name = "boardService")
    BoardService boardService;

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
                if (map.get("title").toString().trim().length() == 0) {
                    jsonObject.addProperty("status", "ng");
                    jsonObject.addProperty("message", "제목을 입력하세요.");
                } else if (map.get("content").toString().trim().length() == 0) {
                    jsonObject.addProperty("status", "ng");
                    jsonObject.addProperty("message", "내용을 입력하세요.");
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

    @PostMapping(path = "/delete.ajax", produces = "application/text;charset=UTF-8")
    public String delete(HttpSession httpSession,
                         @RequestParam Map<String, Object> map) {
        JsonObject jsonObject = new JsonObject();
        String userId = httpSession.getAttribute("id").toString();

        if (userId == null) {
            jsonObject.addProperty("status", "ng");
            jsonObject.addProperty("message", "로그인 후 이용하세요.");
        } else {
            BoardVO boardVO = this.boardService.select(map);
            if (boardVO == null) {
                jsonObject.addProperty("status", "ng");
                jsonObject.addProperty("message", "해당 글이 없습니다.");
            } else if (!userId.equals(boardVO.getBoardInUserId())) {
                jsonObject.addProperty("status", "ng");
                jsonObject.addProperty("message", "작성자만 게시글을 삭제할 수 있습니다..");
            } else {
                if (this.boardService.delete(map) != 1) {
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

    @PostMapping(path = "/list.ajax", produces = "application/text;charset=UTF-8")
    public String list() {
        JsonObject jsonObject = new JsonObject();
        Gson gson = new Gson();

        {
            JsonArray jsonArray = new JsonArray();

            Map<String, Object> map = new HashMap<>();
            map.put("pageNum", 1);
            map.put("contentPerPage", 5);
            map.put("boardKind", "notice");
            for (BoardVO boardVO : this.boardService.selectList(map)) {
                JsonObject subJsonObject = gson.fromJson(gson.toJson(boardVO), JsonObject.class);
                subJsonObject.addProperty("imgSrc", boardVO.getImgSrc());
                subJsonObject.addProperty("boardInDateToString", boardVO.getBoardInDateToString());
                jsonArray.add(subJsonObject);
            }

            jsonObject.add("noticeBoardVOList", jsonArray);
        }

        {
            JsonArray jsonArray = new JsonArray();

            Map<String, Object> map = new HashMap<>();
            map.put("boardKind", "tip");
            map.put("days", 30);
            map.put("limit", 5);

            for (BoardVO boardVO : this.boardService.selectListOrderByLike(map)) {
                JsonObject subJsonObject = gson.fromJson(gson.toJson(boardVO), JsonObject.class);
                subJsonObject.addProperty("imgSrc", boardVO.getImgSrc());
                subJsonObject.addProperty("boardInDateToString", boardVO.getBoardInDateToString());
                jsonArray.add(subJsonObject);
            }
            jsonObject.add("tipBoardVOList", jsonArray);
        }

        {
            JsonArray jsonArray = new JsonArray();

            Map<String, Object> map = new HashMap<>();
            map.put("boardKind", "gallery");
            map.put("days", 30);
            map.put("limit", 5);

            for (BoardVO boardVO : this.boardService.selectListOrderByLike(map)) {
                JsonObject subJsonObject = gson.fromJson(gson.toJson(boardVO), JsonObject.class);
                subJsonObject.addProperty("imgSrc", boardVO.getImgSrc());
                subJsonObject.addProperty("boardInDateToString", boardVO.getBoardInDateToString());
                jsonArray.add(subJsonObject);
            }
            jsonObject.add("galleryBoardVOList", jsonArray);
        }

        {
            JsonArray jsonArray = new JsonArray();

            Map<String, Object> map = new HashMap<>();
            map.put("boardKind", "free");
            map.put("days", 30);
            map.put("limit", 5);

            for (BoardVO boardVO : this.boardService.selectListOrderByLike(map)) {
                JsonObject subJsonObject = gson.fromJson(gson.toJson(boardVO), JsonObject.class);
                subJsonObject.addProperty("imgSrc", boardVO.getImgSrc());
                subJsonObject.addProperty("boardInDateToString", boardVO.getBoardInDateToString());
                jsonArray.add(subJsonObject);
            }
            jsonObject.add("freeBoardVOList", jsonArray);
        }

        return jsonObject.toString();
    }
}
