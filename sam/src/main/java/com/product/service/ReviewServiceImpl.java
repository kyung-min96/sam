package com.product.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.product.dao.ProductDAO;
import com.product.dao.ReviewDAO;
import com.product.domain.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Inject
	private ReviewDAO rdao;
	@Inject
	private ProductDAO bdao;
	// 댓글 조회
		@Override
		public List<ReviewVO> list(int pno) throws Exception {
		    return rdao.list(pno);
		}

		// 댓글 작성
		@Transactional
		@Override
		public void write(ReviewVO vo) throws Exception {
			bdao.updateReviewCnt(vo.getPno(), 1);
		    rdao.write(vo);
		}

		// 댓글 수정
		@Override
		public void modify(ReviewVO vo) throws Exception {
		    rdao.modify(vo);
		}

		// 댓글 삭제
		@Transactional
		@Override
		public void delete(ReviewVO vo) throws Exception {
			bdao.updateReviewCnt(vo.getPno(), -1);
		    rdao.delete(vo);
		}
		
		// 단일 댓글 조회
		@Override
		public ReviewVO reviewSelect(ReviewVO vo) throws Exception {
			return rdao.reviewSelect(vo);
		}

}
