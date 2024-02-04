package com.product.service;

import java.util.List;

import com.product.domain.ReviewVO;

public interface ReviewService {

	// 댓글 조회
		public List<ReviewVO> list(int pno) throws Exception;
	// 댓글 작성
		public void write(ReviewVO vo) throws Exception;
	// 댓글 수정
		public void modify(ReviewVO vo) throws Exception;
	// 댓글 삭제
		public void delete(ReviewVO vo) throws Exception;
	// 단일 댓글 조회
		public ReviewVO reviewSelect(ReviewVO vo) throws Exception;
}
