package kr.co.brownie.notice.service;

import java.util.List;

public class NoticePage {
    private int total;
    private int currentPage;
    private List<NoticeVO> content;
    private int totalPages;
    private int startPage;
    private int endPage;

    public NoticePage(int total, int currentPage,int size, List<NoticeVO> content) {
        this.total = total;
        this.currentPage = currentPage;
        this.content = content;
        if(total==0){
            totalPages = 0;
            startPage = 0;
            endPage = 0;
        }else{
            totalPages = total/size;
            if(total%size>0){
                totalPages++;
            }
            int modVal = currentPage % 5;
            startPage = currentPage / 5 * 5 + 1;
            if(modVal == 0) startPage -= 5;

            endPage = startPage + 4;
            if(endPage > totalPages) endPage = totalPages;
        }
    }
    public int getTotal() {
        return total;
    }

    public boolean hasNoArticles() {
        return total == 0;
    }

    public boolean hasArticles() {
        return total > 0;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public int getTotalPages() {
        return totalPages;
    }

    public List<NoticeVO> getContent() {
        return content;
    }
    //시작 페이지 번호 get
    public int getStartPage() {
        return startPage;
    }
    //종료 페이지 번호 get
    public int getEndPage() {
        return endPage;
    }
}
