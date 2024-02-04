package com.product.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.product.dao.ProductDAO;
import com.product.domain.OrderVO;
import com.product.domain.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {

	@Inject
	private ProductDAO dao;
	
	// 상품 목록
	@Override
	public List<ProductVO> list() throws Exception {
		return dao.list();
	}
	// 상품 등록
	@Override
	public void register(ProductVO vo) throws Exception {
		dao.register(vo);
		
	}
	//상품 조회
	@Override
	public ProductVO view(int pno) throws Exception {
		return dao.view(pno);
	}
	//상품 조회수 증가
	@Override
	public void updateReadCount(int pno) throws Exception {
		dao.updateReadCount(pno);
	}
	// 게시물 수정
	@Override
	public void modify(ProductVO vo) throws Exception {
		dao.modify(vo);
	}
	
	// 게시물 삭제
	@Override
	public void delete(int pno) throws Exception {
		dao.delete(pno);
	}
	// 좋음 증가
	@Override
	public void upLike(int pno) throws Exception {
		dao.upLike(pno);
	}
	//구매 상품 조회
	@Override
	public ProductVO getpView(int pno) throws Exception {
		return dao.getpView(pno);
	}
	//구매 등록
	@Override
	public void buy(OrderVO ovo) throws Exception {
		dao.buy(ovo);
		
	}
	
	//상품 목록
	@Override
	public List<OrderVO> olist() throws Exception {
		return dao.olist();
	}
	//상품 조회
	@Override
	public OrderVO buyView(int onum) throws Exception {
		return dao.buyView(onum);
	}
	//주문 취소
	@Override
	public void cancel(int onum) throws Exception {
		dao.cancel(onum);
		
	}
	
	
	
	
	
	
	
	
	
}
