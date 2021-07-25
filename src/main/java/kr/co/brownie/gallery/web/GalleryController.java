package kr.co.brownie.gallery.web;

import kr.co.brownie.board.hit.service.BoardHitService;
import kr.co.brownie.board.reply.service.ReplyService;
import kr.co.brownie.board.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/gallery")
public class GalleryController {
    @Resource(name = "boardService")
    BoardService boardService;

    @Resource(name = "replyService")
    ReplyService replyService;

    @Resource(name = "boardHitService")
    BoardHitService boardHitService;

    @GetMapping({"", "/list"})
    public String galleryList(HttpSession httpSession,
                              Model model,
                              @RequestParam(defaultValue = "1", required = false) int pageNum,
                              @RequestParam(required = false) String type,
                              @RequestParam(required = false) String query) {
        Map<String, Object> map = new HashMap<>();
        map.put("userId", httpSession.getAttribute("id"));
        map.put("boardKind", "gallery");
        map.put("pageNum", pageNum);
        map.put("contentPerPage", 18);
        model.addAttribute("boardPagingVO", boardService.selectPagingList(map));

        if (type != null && !"".equals(type) && query != null && !"".equals(query)) {
            map.put(type, query);

            model.addAttribute("type", type);
            model.addAttribute("query", query);
        }

        map.put("pageNum", 1);
        map.put("contentPerPage", 4);
        model.addAttribute("hitBoardPagingVO", boardService.selectPagingList(map));

        int randomImageNumber = (int) ((Math.random() * 11) + 1);
        model.addAttribute("randomImageNumber", randomImageNumber);
        model.addAttribute("boardPagingVO", boardService.selectPagingList(map));

        return "board/gallery/list";
    }


//    @GetMapping("/detail")
//    public String details_post_gallery(@RequestParam Map<String, Object> map, Model model, HttpSession session, HttpServletRequest request) {
//        int rnd = (int) ((Math.random() * 11) + 1);
//        model.addAttribute("rnd", rnd);
//        String id = (String) session.getAttribute("id");
//        int boardSeq = Integer.parseInt(map.get("boardSeq").toString());
////        GalleryVO galleryVO = this.galleryService.getGallery(boardSeq);
//        List<FileVO> fileVOList;
//
//
//        //
//        List<GalleryVO> freeRecent = this.galleryService.selectAB(boardSeq);
//        for (GalleryVO freeRecentOne : freeRecent) {
//            if (freeRecentOne.getBoardSeq() < boardSeq) {
//                //게시글 번호가 해당 게시글 번호보다 작다면 이전 게시글
//                model.addAttribute("freePrev", freeRecentOne);
//            } else if (freeRecentOne.getBoardSeq() > boardSeq) {
//                //게시글 번호가 해당 게시글 번호보다 크다면 다음 게시글
//                model.addAttribute("freeNext", freeRecentOne);
//            }
//        }
//
//        //
//
//        //이전글 다음글
//
//        ReplyVO recentBoardReplyDate = this.galleryService.galleryAB(boardSeq);
//        model.addAttribute("recentBoardReplyDate", recentBoardReplyDate);
//
//        System.out.println("recentBoardReplyDate" + recentBoardReplyDate);
//
//        //
//
//
//        //조회수 기능
//
//        //ip가져오기
//        String ip = request.getHeader("X-Forwarded-For");
//
//        if (ip == null) {
//            ip = request.getHeader("Proxy-Client-IP");
//        }
//        if (ip == null) {
//            ip = request.getHeader("WL-Proxy-Client-IP"); // 웹로직
//        }
//        if (ip == null) {
//            ip = request.getHeader("HTTP_CLIENT_IP");
//        }
//        if (ip == null) {
//            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
//        }
//        if (ip == null) {
//            ip = request.getRemoteAddr();
//        }
//        System.out.println("ip:" + ip);
//        //ip가져오기
//
//
//        //조회수증가
//        map.put("ip", ip);
//        map.put("boardSeq", boardSeq);
//        int cnt = 0;
//        if (id != null) {
//            map.put("userId", id);
//            System.out.println("mem");
//            System.out.println(cnt);
//        } else {
//            System.out.println("nomem");
//            System.out.println(cnt);
//        }
//
//        //조회수증가
//
//
//        //좋싫
////		BoardVO likeHateCnt = boardService.likeHateCnt(boardSeq);
////    	model.addAttribute("likeHateCnt", likeHateCnt);
//        //좋싫
//
//        if (galleryVO.getFileSeq() != null) {
//            fileVOList = this.galleryService.getFileList(Integer.parseInt(galleryVO.getFileSeq()));
//            model.addAttribute("fileVOList", fileVOList);
//        }
//        model.addAttribute("galleryVO", galleryVO);
//
//        return "gallery/galleryDetail";
//    }
//
    @GetMapping("/write")
    public String details_add_gallery(Model model) {
        int randomImageNumber = (int) ((Math.random() * 11) + 1);
        model.addAttribute("randomImageNumber", randomImageNumber);

        return "board/gallery/write";
    }
//
//
//    @GetMapping("/update")
//    public String details_modify_gallery(@RequestParam Map<String, Object> map, Model model, HttpSession session) {
//        int boardSeq = Integer.parseInt(map.get("boardSeq").toString());
//
//        int rnd = (int) ((Math.random() * 11) + 1);
//
//        model.addAttribute("rnd", rnd);
//
//        GalleryVO galleryVO = this.galleryService.getGallery(boardSeq);
//        System.out.println(galleryVO.getContent());
//        model.addAttribute("galleryVO", galleryVO);
//
//        return "gallery/galleryUpdate";
//    }
//
//    @ResponseBody
//    @RequestMapping(value = "/ajax.galleryadd", method = RequestMethod.POST)
//    public int AjaxAdd(@RequestParam Map<String, Object> map, Model model, HttpServletRequest response, HttpSession session, HttpServletRequest servletRequest) {
//        String inUserId = "곽지훈";
//        String title = servletRequest.getParameter("title");
//        String content = servletRequest.getParameter("summernote");
//        String fileName = servletRequest.getParameter("fileName");
//
//        map.put("inUserId", inUserId);
//        map.put("fileName", fileName);
//
//        int thumbCnt = this.galleryService.insertThumbnail(fileName);
//        int fileSeq = 0;
//        if (thumbCnt == 1) {
//            fileSeq = this.galleryService.selectFile(fileName);
//        }
//
//        map.put("title", title);
//        map.put("content", content);
//        map.put("fileSeq", fileSeq);
//
//        int cnt = this.galleryService.insertGallery(map);
//
//
//        return cnt;
//    }
//
//    @ResponseBody
//    @RequestMapping(value = "/ajax.galleryupdate", method = RequestMethod.POST)
//    public int AjaxUpdate(@RequestParam Map<String, Object> map, Model model, HttpServletRequest response, HttpSession session, HttpServletRequest servletRequest) {
//        String id = (String) session.getAttribute("id");
//        int boardSeq = Integer.parseInt(servletRequest.getParameter("boardSeq"));
//        String title = servletRequest.getParameter("title");
//        String content = servletRequest.getParameter("summernote");
//        String fileName = servletRequest.getParameter("fileName");
//
//        int fileSeq = 0;
//        try {
//            fileSeq = Integer.parseInt(this.galleryService.getGallery(boardSeq).getFileSeq());
//        } catch (Exception e) {
//
//        }
//
//        System.out.println("과연?:" + fileSeq);
//
//        System.out.println(fileName);
//        if (fileName != null) {
//            int thumbCnt = this.galleryService.insertThumbnail(fileName);
//            System.out.println(thumbCnt);
//            if (thumbCnt == 1) {
//                fileSeq = this.galleryService.selectFile(fileName);
//                System.out.println("fileSeq:" + fileSeq);
//            }
//        }
//
//        map.put("fileSeq", fileSeq);
//        map.put("inUserId", id);
//        map.put("title", title);
//        map.put("content", content);
//
//        int cnt = this.galleryService.updateGallery(map);
//
//        model.addAttribute("cnt", cnt);
//        System.out.println(cnt);
//
//        return cnt;
//    }
//
//    @ResponseBody
//    @RequestMapping(value = "/ajax.gallerydelete", method = RequestMethod.POST)
//    public int Ajaxdelete(@RequestParam Map<String, Object> map, Model model, HttpServletRequest response, HttpSession session, HttpServletRequest servletRequest) {
//        int boardSeq = Integer.parseInt(servletRequest.getParameter("boardSeq"));
//
//        int cnt = this.galleryService.deleteGallery(boardSeq);
//
//        model.addAttribute("cnt", cnt);
//
//        return cnt;
//    }
//
//    @ResponseBody
//    @RequestMapping(value = "/ajax.gallerylikeHate", method = RequestMethod.GET)
//    public BoardVO AjaxLikeHate(@RequestParam Map<String, Object> map, Model model, HttpServletRequest response, HttpSession session) {
//
//        //새로 들어온 값
//        int kind = Integer.parseInt(map.get("kind").toString());
//        int boardSeq = Integer.parseInt(map.get("boardSeq").toString());
//
//        try {
//            //유저의 기존 값 가져옴
////    		BoardVO userInBoard = boardService.selectUserStance(map);
////    		int userStance = userInBoard.getLikeHateKind();
//
////    		if(userStance == kind) {
//            //기존값이 새로 들어온 값과 같을 경우 저장된 값을 삭제함
////    			boardService.deleteUserStance(map);
//
////    		} else {
//            //기존값이 새로 들어온 값과 다를 경우 값을 업데이트함
////    			boardService.updateLikeHate(map);
////    		}
//
//        } catch (NullPointerException e) {
//            //기존값이 null일 경우 새로 들어온 값을 삽입해줌
////			boardService.updateLikeHate(map);
//        }
//
//        //좋아요 싫어요 개수 출력
////    	BoardVO likeHateCnt = boardService.likeHateCnt(boardSeq);
////    	model.addAttribute("likeHateCnt", likeHateCnt);
////    	return likeHateCnt;
//        return null;
//    }

}
