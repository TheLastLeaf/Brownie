package kr.co.brownie.user.service;

public class UserPagingVO {
	//현재 페이지번호
	private int num =1;
	// 게시물 총 갯수
	private int totalCount;
	// 한 페이지에 출력할 게시물 갯수
	private int postNum = 9;
	// 하단 페이징 번호([게시물 총 갯수 ÷ 한페이지에 출력할 갯수의]의 올림)
	private int pageNum;
	// 출력할 시작 게시물
	private int startPost;
	// 출력할 마지막 게시물
	private int endPost;
	// 한번에 표시할 페이징 번호의 갯수
	private int pageNumCnt = 5;
	// 표시되는 페이지 번호중 마지막 번호
	private int startPageNum;
	// 다음/이전 표시여부
	private boolean prev;
	private boolean next;
	public int getNum() {
		return num;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public int getPostNum() {
		return postNum;
	}
	public int getPageNum() {
		return pageNum;
	}
	public int getStartPost() {
		return startPost;
	}
	public int getEndPost() {
		return endPost;
	}
	public int getPageNumCnt() {
		return pageNumCnt;
	}
	public int getStartPageNum() {
		return startPageNum;
	}
	public boolean isPrev() {
		return prev;
	}
	public boolean isNext() {
		return next;
	}
	
	private void dataCalc() {
		
		
	}
	
	
	
}
