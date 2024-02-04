package com.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.board.domain.BoardVO;

public interface BoardDAO {
	
	// 게시물 목록
	public List<BoardVO> list() throws Exception;
	
	// 게시물 작성
	public void write(BoardVO vo) throws Exception;
	
	// 게시물 조회
	public BoardVO view(int bno) throws Exception;
	
	// 게시물 조회수 증가
	public void updateReadCount(int bno) throws Exception;
	
	// 게시물 수정
	public void modify(BoardVO vo) throws Exception;
	
	// 게시뮬 삭제
	public void delete(int bno) throws Exception;
	
	// 좋음 처리
	public void upLike(int bno) throws Exception;
	
	// 싫음 처리
	public void upHate(int bno) throws Exception;
	
	// 게시물 총 갯수
	public int count() throws Exception;
	
	// 게시물 목록 + 페이징
	public List listPage(int displayPost, int postNum) throws Exception;
	
	// 게시물 목록 + 페이징 + 검색
	public List<BoardVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword) throws Exception;
	
	// 검색 조건에 맞는 게시물 총 갯수
	public int searchCount(String searchType, String keyword) throws Exception;
	
	// 댓글 수 처리
	public void updateReplyCnt(@Param("bno") int bno, @Param("amount") int amount);
	
}





