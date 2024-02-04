package com.product.dao;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.product.domain.ReviewVO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	// 마이바티스
		@Inject
		private SqlSession sql;
		
		// 매퍼: replyMapper.xml에 있는 mapper 요소의 namespace 속성값 지정
		private static String namespace = "com.product.mappers.review";
		
		// 댓글 조회
		@Override
		public List<ReviewVO> list(int pno) throws Exception {
		    return sql.selectList(namespace + ".reviewList", pno);
		}

		// 댓글 작성
		@Override
		public void write(ReviewVO vo) throws Exception {
		    sql.insert(namespace + ".reviewWrite", vo);
		}

		// 댓글 수정
		@Override
		public void modify(ReviewVO vo) throws Exception {
		    sql.update(namespace + ".reviewModify", vo);
		}

		// 댓글 삭제
		@Override
		public void delete(ReviewVO vo) throws Exception {
		    sql.delete(namespace + ".reviewDelete", vo);
		}
		
		// 단일 댓글 조회
		@Override
		public ReviewVO reviewSelect(ReviewVO vo) throws Exception {
			return sql.selectOne(namespace + ".reviewSelect", vo);
		}
}
