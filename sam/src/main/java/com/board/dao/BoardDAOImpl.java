package com.board.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	// 마이바티스
	@Inject
	private SqlSession sql;
	
	// 매퍼: boardMapper.xml에 있는 mapper 요소의 namespace 속성값 지정
	private static String namespace = "com.board.mappers.board";

	// 게시물 목록
	@Override
	public List<BoardVO> list() throws Exception {
		return sql.selectList(namespace + ".list");
		// boardMapper.xml에서 id="list" 인 요소 내부의 쿼리문을 수행한 결과값을 얻는다.
	}

	// 게시물 작성
	@Override
	public void write(BoardVO vo) throws Exception {
		sql.insert(namespace + ".write", vo);
	}
	
	// 게시물 조회
	public BoardVO view(int bno) throws Exception {
		return sql.selectOne(namespace + ".view", bno);
	}
	
	// 게시물 조회수 증가
	public void updateReadCount(int bno) throws Exception {
		sql.update(namespace + ".updateReadCount", bno);
	}
	
	// 게시물 수정
	@Override
	public void modify(BoardVO vo) throws Exception {
		sql.update(namespace + ".modify", vo);
	}
	
	// 게시물 삭제
	@Override
	public void delete(int bno) throws Exception {
		sql.update(namespace + ".delete", bno);
	}
	
	// 좋음 처리
	@Override
	public void upLike(int bno) throws Exception {
		sql.update(namespace+".like", bno);
	}
	
	// 싫음 처리
	@Override
	public void upHate(int bno) throws Exception {
		sql.update(namespace+".hate", bno);
	}
	
	// 게시물 총 갯수
	@Override
	public int count() throws Exception {
		return sql.selectOne(namespace + ".count");
	}
	
	// 게시물 목록 + 페이징
	@Override
	public List<BoardVO> listPage(int displayPost, int postNum) throws Exception {
		HashMap<String, Integer> data = new HashMap<String, Integer>();
	  
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
	  
		return sql.selectList(namespace + ".listPage", data);
	}
	
	// 게시물 목록 + 페이징 + 검색
	@Override
	public List<BoardVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
	  
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
	  
		data.put("searchType", searchType);
		data.put("keyword", keyword);
	  
		return sql.selectList(namespace + ".listPageSearch", data);
	}
	
	// 검색 조건에 맞는 게시물 총 갯수
	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
		HashMap data = new HashMap();
	 
		data.put("searchType", searchType);
		data.put("keyword", keyword);
	 
		return sql.selectOne(namespace + ".searchCount", data);
	}

	// 댓글 수 처리
	@Override
	public void updateReplyCnt(int bno, int amount) {
		HashMap data = new HashMap();
		 
		data.put("bno", bno);
		data.put("amount", amount);
	 
		sql.update(namespace + ".updateReplyCnt", data);
	}

}





