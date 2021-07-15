package kr.co.brownie.free.web;

import kr.co.brownie.board.service.BoardService;
import kr.co.brownie.board.service.BoardVO;
import kr.co.brownie.free.service.FreeService;
import kr.co.brownie.free.service.FreeVO;
import kr.co.brownie.reply.service.ReplyService;
import kr.co.brownie.reply.service.ReplyVO;
import kr.co.brownie.report.service.ReportService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping("/free")
public class FreeController {
    @Resource(name = "freeService")
    FreeService freeService;

    @Resource(name = "boardService")
    BoardService boardService;

    @Resource(name = "replyService")
    ReplyService replyService;

    @Resource(name = "reportService")
    ReportService reportService;

    @GetMapping(path = {"", "/list"})
    public String freeList(Model model) {
        //자유게시판 글 리스트 출력
        List<FreeVO> freeList = freeService.selectList();
        model.addAttribute("freeList", freeList);

        //최근 일주일 간 좋아요 수가 많은 상위 5개
        List<FreeVO> freeFamousList = freeService.selectFamous();
        model.addAttribute("freeFamousList", freeFamousList);

        //상단 메뉴바에 표시되는 최근 게시물 5개
        List<FreeVO> recentList = freeService.selectRecentForMenu();
        model.addAttribute("recentList", recentList);

        return "free/list";  // 자유게시판 리스트
    }

    @GetMapping("/details/{boardSeq}")
    public String freeBoardDetail(@PathVariable int boardSeq,
                                  @RequestParam Map<String, Object> map, Model model,
                                  HttpServletRequest httpServletRequest) {

        model.addAttribute("freeDetail", freeService.selectDetail(boardSeq));

        int totalReplyCount = ((FreeVO) Objects.requireNonNull(model.getAttribute("freeDetail"))).getReplyCnt();
        int currentReplyPageNumber;
        try {
            currentReplyPageNumber = Integer.parseInt(httpServletRequest.getParameter("page"));
            if (currentReplyPageNumber < 1 || (totalReplyCount - 1) / freeService.REPLY_PER_PAGE + 1 < currentReplyPageNumber) {
                currentReplyPageNumber = (totalReplyCount - 1) / freeService.REPLY_PER_PAGE + 1;
            }
        } catch (NullPointerException | NumberFormatException e) {
            currentReplyPageNumber = (totalReplyCount - 1) / freeService.REPLY_PER_PAGE + 1;
        }
        map.put("boardSeq", boardSeq);
        map.put("replyPerPage", freeService.REPLY_PER_PAGE);
        map.put("currentReplyPageNumber", currentReplyPageNumber);
        map.put("totalReplyCount", totalReplyCount);

        model.addAttribute("freeReplyPagingVO", freeService.selectReplyList(map));

        //좋아요 싫어요 개수
//        BoardVO likeHateCnt = boardService.likeHateCnt(boardSeq);
//        model.addAttribute("likeHateCnt", likeHateCnt);

        //게시글 하단 : 이전 게시글과 다음 게시글을 리스트로 가져옵니다.
        List<FreeVO> freeRecent = freeService.selectRecent(boardSeq);
        for (FreeVO freeRecentOne : freeRecent) {
            if (freeRecentOne.getBoardSeq() < boardSeq) {
                //게시글 번호가 해당 게시글 번호보다 작다면 이전 게시글
                model.addAttribute("freePrev", freeRecentOne);
            } else if (freeRecentOne.getBoardSeq() > boardSeq) {
                //게시글 번호가 해당 게시글 번호보다 크다면 다음 게시글
                model.addAttribute("freeNext", freeRecentOne);
            }
        }

        //게시글 하단 : 현재글 이전글 다음글 작성일자 및 리플 개수
//        ReplyVO recentBoardReplyDate = replyService.boardReplyCnt(boardSeq);
//        model.addAttribute("recentBoardReplyDate", recentBoardReplyDate);

        //게시글 리플 : 현재 프로필 사진 누락되어있어서 쿼리문 수정해야함 / file 테이블도 연결해서 쿼리쓰기
//        List<ReplyVO> replyOnBoard = replyService.replyOnBoard(boardSeq);
//        model.addAttribute("replyOnBoard", replyOnBoard);

        //게시글 리리플 :리리플에 유저 태그 기능도 고려해보도록 하겠음 아빠가 제안해줌 하하
        Map<String, Object> reReplyMap = new HashMap<String, Object>();
//        for (ReplyVO reply : replyOnBoard) {
            //리플 시퀀스 번호를 받아와서 시퀀스 번호에 맞게 해당 리리플 목록을 가져와서 맵에 저장
//            int replySeq = reply.getReplySeq();

            //리플 시퀀스 번호를 기반으로 리리플 리스트를 구함
//            List<ReplyVO> replyOnReply = replyService.replyOnReply(replySeq);

            //값이 있는 경우 { replySeq : List<replyVO> } 이런 식으로 넣어줘야할듯
//            if (replyOnReply.size() > 0) {
//                reReplyMap.put(replySeq + "", replyOnReply);
//            }
//        }
//        model.addAttribute("reReplyMap", reReplyMap);

        //상단 메뉴바에 표시되는 최근 게시물 5개
        List<FreeVO> recentList = freeService.selectRecentForMenu();
//        model.addAttribute("recentList", recentList);

        return "free/details"; // 자유게시판 리스트 디테일화면
    }

    @PostMapping("/details/{board_seq}")
    public String writeReply(HttpServletRequest httpServletRequest,
                             @PathVariable int board_seq,
                             @RequestParam String message,
                             @RequestParam(defaultValue = "", required = false) String headReplySeq) {
        Map<String, Object> map = new HashMap<>();

        Assert.notNull(httpServletRequest.getSession().getAttribute("id"), "로그인이 필요합니다.");
        String author = httpServletRequest.getSession().getAttribute("id").toString();
        message = message.trim();

        Assert.state(message.length() != 0, "댓글을 입력해주세요.");

        map.put("boardSeq", board_seq);
        map.put("author", author);
        map.put("message", message);
        map.put("headReplySeq", headReplySeq);

        Assert.state(freeService.insertReply(map) == 1, "댓글 등록 중 문제가 발생했습니다.");

        return "redirect:/" + httpServletRequest.getContextPath() + "free/details/" + board_seq;
    }

    @GetMapping("/details/{board_seq}/delete/{reply_seq}")
    public String deleteReply(HttpServletRequest httpServletRequest,
                              @PathVariable int board_seq,
                              @PathVariable int reply_seq,
                              Map<String, Object> map) {
        Assert.notNull(httpServletRequest.getSession().getAttribute("id"), "로그인이 필요합니다.");
        String id = httpServletRequest.getSession().getAttribute("id").toString();

        map.put("boardSeq", board_seq);
        map.put("replySeq", reply_seq);

        Assert.state(id.equals(freeService.selectReply(map).getInUserId()), "작성자만 댓글을 삭제할 수 있습니다.");
        Assert.state(freeService.deleteReply(map) == 1, "댓글 삭제 중 문제가 발생했습니다.");

        return "redirect:/" + httpServletRequest.getContextPath() + "free/details/" + board_seq;
    }

    @GetMapping("/write")
    public String freeBoardWrite(HttpSession session, Model model) {
        String inUserId = (String) session.getAttribute("id");
        model.addAttribute("inUserId", inUserId);
        if (inUserId == null) {
            return "free/write";
//        	return "redirect:/free/freeBoardList";
//        	ERR_TOO_MANY_REDIRECTS
            //이렇게 하면 로그아웃 유저가 링크에 접근했을때 리디렉션 오류나서 잠시 보류하겠음ㅇ_ㅇ 왜안될까
        }
        return "free/write"; // 자유게시판 글쓰기 화면
    }

    @PostMapping("/write")
    public String freeAddPost(@RequestParam Map<String, Object> map) {

        //공지사항 여부가 체크되지 않았을 경우
        try {
            String noticeYn = map.get("noticeYn").toString();
        } catch (Exception e) {
            map.put("noticeYn", "n");
        }
        freeService.insertFree(map);

        return "redirect:/free/list";
    }

    @GetMapping("/modify/{boardSeq}")
    public String modify(Model model,
                         HttpServletRequest servletRequest,
                         @PathVariable int boardSeq) {
        Assert.notNull(servletRequest.getSession().getAttribute("id"), "로그인 후 이용하세요.");
        String inUserId = servletRequest.getSession().getAttribute("id").toString();

        FreeVO freeVO = freeService.selectDetail(boardSeq);
        model.addAttribute("freeVO", freeVO);
        Assert.notNull(freeVO, "해당 글이 없습니다.");
        Assert.state(freeVO.getInUserId().equals(inUserId), "작성자만 수정할 수 있습니다.");

        return "free/modify";
    }

    @PostMapping("/modify/{boardSeq}")
    public String update(@RequestParam Map<String, Object> map,
                         HttpServletRequest servletRequest,
                         @PathVariable int boardSeq) {
        Assert.notNull(servletRequest.getSession().getAttribute("id"), "로그인 후 이용하세요.");
        String author = servletRequest.getSession().getAttribute("id").toString();

        FreeVO freeVO = freeService.selectDetail(boardSeq);
        Assert.notNull(freeVO, "해당 글이 없습니다.");
        Assert.state(author.equals(freeVO.getInUserId()), "작성자만 수정할 수 있습니다.");

        map.put("boardSeq", boardSeq);
        map.put("author", author);
        Assert.state(freeService.update(map) == 1, "수정에 실패했습니다.");

        return "redirect:/free/details/" + boardSeq;
    }

    @ResponseBody
    @RequestMapping(value = "/ajax.delBoard", method = {RequestMethod.GET, RequestMethod.POST})
    public void ajaxDelBoard(@RequestParam Map<String, Object> map) {
        freeService.deleteFree(map);
    }

    @ResponseBody
    @RequestMapping(value = "/ajax.likeHate", method = RequestMethod.GET)
    public BoardVO ajaxLikeHate(@RequestParam Map<String, Object> map) {

        //새로 들어온 값
        int kind = Integer.parseInt(map.get("kind").toString());
        int boardSeq = Integer.parseInt(map.get("boardSeq").toString());

//        try {
            //유저의 기존 값 가져옴
//            BoardVO userInBoard = boardService.selectUserStance(map);
//            int userStance = userInBoard.getLikeHateKind();

//            if (userStance == kind) {
                //기존값이 새로 들어온 값과 같을 경우 저장된 값을 삭제함
//                boardService.deleteUserStance(map);

//            } else {
                //기존값이 새로 들어온 값과 다를 경우 값을 업데이트함
//                boardService.updateLikeHate(map);
//            }

//        } catch (NullPointerException e) {
            //기존값이 null일 경우 새로 들어온 값을 삽입해줌
//            boardService.updateLikeHate(map);
//        }

        //좋아요 싫어요 개수 출력
//        BoardVO likeHateCnt = boardService.likeHateCnt(boardSeq);

        //해당 게시글에 좋아요 싫어요가 하나도 없을 경우 쿼리문에 값이 나타나지 않아서 적어둠 / 쿼리 너무어려워서ㅠ 쿼리수정 임시보류함
//        if (likeHateCnt == null) {
//            BoardVO likeHateCntZero = new BoardVO();
//            likeHateCntZero.setBoardSeq(boardSeq);
//            likeHateCntZero.setHateCnt("0");
//            likeHateCntZero.setLikeCnt("0");
//            return likeHateCntZero;
//        }
//        return likeHateCnt;
            return null;
    }

    @GetMapping("/report")
    public String report(HttpServletRequest request, Model model, HttpSession session) {
        String userId = request.getParameter("userId");
        model.addAttribute("userId", userId);
        String id = (String) session.getAttribute("id");
        model.addAttribute("id", id);
        return "free/report";
    }

    @ResponseBody
    @PostMapping("/report")
    public Object reportPost(Map<String, Object> map, HttpSession session, HttpServletRequest servletRequest) {
        String id = (String) session.getAttribute("id");
        String content = servletRequest.getParameter("content");
        String[] reportNameList = servletRequest.getParameterValues("reportName[]");
        String userId = servletRequest.getParameter("userId");
        map.put("content", content);
        map.put("reportName", Arrays.toString(reportNameList));
        map.put("id", id);
        map.put("userId", userId);
        if (id == null) {
            return "loginCheck";
        } else {
            if (reportService.insert(map) == 1) {
                return "success";
            } else {
                return "fail";
            }
        }
    }
}
