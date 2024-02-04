package com.board.domain;

public class Page {
	// 현재 페이지 번호
	private int num;

	// 게시물 총 갯수
	private int count;
	
	// 출력할 게시물의 시작 순번(limit 술어의 첫번째 값)
	private int displayPost;

	// 한 페이지에 출력할 게시물 갯수(limit 술어의 두번째 값)
	private int postNum = 15;
	
	// 블럭 페이지 번호 ([ 게시물 총 갯수 ÷ 한 페이지에 출력할 갯수 ]의 올림)
	private int pageNum;

	// 블럭 페이지에 표시할 페이지 번호의 갯수
	private int pageNumCnt = 5;
	
	// 블럭 페이지에 표시되는 첫번째 페이지 번호
	private int startPageNum;

	// 블럭 페이지에 표시되는 마지막 페이지 번호
	private int endPageNum;

	// 다음/이전 표시 여부
	private boolean prev;
	private boolean next;
	
	//검색 유형과 검색어
	private String searchTypeKeyword;
	private String searchType;
	private String keyword;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
		// 게시물 총 갯수를 알고난 시점부터 페이징 관련 계산을 할 수 있으므로 setCount()에서 호출한다.
		dataCalc();
	}
	public int getPostNum() {
		return postNum;
	}
	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getDisplayPost() {
		return displayPost;
	}
	public void setDisplayPost(int displayPost) {
		this.displayPost = displayPost;
	}
	public int getPageNumCnt() {
		return pageNumCnt;
	}
	public void setPageNumCnt(int pageNumCnt) {
		this.pageNumCnt = pageNumCnt;
	}
	public int getEndPageNum() {
		return endPageNum;
	}
	public void setEndPageNum(int endPageNum) {
		this.endPageNum = endPageNum;
	}
	public int getStartPageNum() {
		return startPageNum;
	}
	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	
	private void dataCalc() {
		// 마지막 블럭 페이지 번호
		endPageNum = (int)(Math.ceil((double)num / (double)pageNumCnt) * pageNumCnt);
		 
		// 시작 블럭 페이지 번호
		startPageNum = endPageNum - (pageNumCnt - 1);
		 
		// 마지막 번호 재계산
		int endPageNum_tmp = (int)(Math.ceil((double)count / (double)pageNumCnt));
		 
		if (endPageNum > endPageNum_tmp) {
			endPageNum = endPageNum_tmp;
		}
		
		// 이전/다음 표시 여부 설정
		prev = startPageNum == 1 ? false : true;
		next = endPageNum * pageNumCnt >= count ? false : true;
		 
		displayPost = (num - 1) * postNum;
	}
	
	public void setSearchTypeKeyword(String searchType, String keyword) {
		if (searchType.equals("") || keyword.equals("")) {
			searchTypeKeyword = "";
		} else {
			searchTypeKeyword = "&amp;searchType=" + searchType + "&amp;keyword=" + keyword;
		}  
	}
	public String getSearchTypeKeyword() {
		if(searchType.equals("") || keyword.equals("")) {
			return "";
		} else {
			return "&searchType=" + searchType + "&keyword=" + keyword;
		}
	}
	
	public void setSearchType(String searchType) {
		this.searchType = searchType;		
	}	
	public String getSearchType() {
		return searchType;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;		
	}
	public String getKeyword() {
		return keyword;
	}
}
