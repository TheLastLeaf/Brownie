package kr.co.brownie.teamGame.service.impl;

import lombok.Data;

@Data
public class TeamGamePagingVO {
    // 현재 페이지 번호
    private int num = 1;

    // 게시물 총 갯수
    private int totalCount;

    // 한 페이지에 출력할 게시물 갯수
    private int postNum = 19;

    // 하단 페이징 번호([게시물 총 갯수 ÷ 한페이지에 출력할 갯수의]의 올림)
    private int pageNum;

    // 출력할 시작 게시물
    private int startPost;

    // 출력할 마지막 게시물
    private int endPost;

    // 한번에 표시할 페이징 번호의 갯수
    private int pageNumCnt = 3;

    // 표시되는 페이지 번호 중 마지막 번호
    private int endPageNum;

    // 표시되는 페이지 번호 중 첫번째 번호
    private int startPageNum;

    // 다음/이전 표시여부
    private boolean prev;
    private boolean next;

    // 
    private String searchRoomTitle = "";
    private String searchGameType = "";
    private String searchPositions = "";

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        dataCalc();
    }

    private void dataCalc() {
        // 마지막 번호 1/3=0.2 -> 올림 1 * 3 = 3
        endPageNum = (int) (Math.ceil((double) num / (double) pageNumCnt) * pageNumCnt);
        // 시작 번호
        startPageNum = endPageNum - (pageNumCnt - 1);
        // 마지막 번호 재계산 (예: 총 22개의 게시물을 9로 나누고 올림 3)
        int endPageNum_tmp = (int) (Math.ceil((double) totalCount / (double) postNum));
        if (endPageNum > endPageNum_tmp) {
            endPageNum = endPageNum_tmp;
        }
        prev = startPageNum != 1;
        next = endPageNum * postNum < totalCount;

        startPost = (num - 1) * postNum + 1;
        endPost = startPost + (postNum - 1);
    }

}
