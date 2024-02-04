package com.product.service;

import java.util.List;

import com.board.domain.BoardVO;
import com.product.domain.OrderVO;
import com.product.domain.ProductVO;



public interface ProductService {

	// 상품 목록
		public List<ProductVO> list() throws Exception;
	// 상품 등록
		public void register(ProductVO vo) throws Exception;
	// 상품 조회
		public ProductVO view(int pno) throws Exception;
	// 상품 조회수 증가
		public void updateReadCount(int pno) throws Exception;
	// 게시물 수정
		public void modify(ProductVO vo) throws Exception;
	// 게시물 삭제
		public void delete(int pno) throws Exception;
	// 좋음 증가
		public void upLike(int pno) throws Exception;
	// 구매 상품 조회
		public ProductVO getpView(int pno) throws Exception;
	// 구매 등록
		public void buy(OrderVO ovo) throws Exception;
	// 상품 목록
		public List<OrderVO> olist() throws Exception;	
	// 상품 조회
		public OrderVO buyView(int onum) throws Exception;
	// 주문 취소
		public void cancel(int onum) throws Exception;
		
}
