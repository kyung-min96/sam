package com.product.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.product.domain.OrderVO;
import com.product.domain.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO {
	

	// 마이바티스
		@Inject
		private SqlSession sql;
	// 매퍼: memberMapper.xml에 있는 mapper 요소의 namespace 속성값 지정
		private static String namespace = "com.product.mappers.product";
	// 상품 목록
		@Override
		public List<ProductVO> list() throws Exception {
			return sql.selectList(namespace + ".list");
			// productMapper.xml에서 id="list" 인 요소 내부의 쿼리문을 수행한 결과값을 얻는다.
		}
	//상품 등록
		@Override
		public void register(ProductVO vo) throws Exception {
			sql.insert(namespace + ".register",vo);
		}
	//상품 조회
		@Override
		public ProductVO view(int pno) throws Exception {
			return sql.selectOne(namespace + ".view", pno);
		}
	//상품 조회수 증가	
		@Override
		public void updateReadCount(int pno) throws Exception {
			sql.update(namespace + ".updateReadCount", pno);
		}
	// 게시물 수정
		@Override
		public void modify(ProductVO vo) throws Exception {
			sql.update(namespace + ".modify", vo);
		}
	// 게시물 삭제
		@Override
		public void delete(int pno) throws Exception {
			sql.delete(namespace + ".delete", pno);
		}
	// 좋음 증가	
		@Override
		public void upLike(int pno) throws Exception {
			sql.update(namespace+".like", pno);
	// 댓글 수 처리
		}
	@Override
	public void updateReviewCnt(int pno, int amount) {
		HashMap data = new HashMap();
		 
		data.put("pno", pno);
		data.put("amount", amount);
	 
		sql.update(namespace + ".updateReviewCnt", data);

	}
	@Override
	public ProductVO getpView(int pno) throws Exception {
		
		return sql.selectOne(namespace + ".view", pno);
	}
	
	//구매 등록
	@Override
	public void buy(OrderVO ovo) throws Exception {
		
			sql.insert(namespace + ".buy",ovo);
		
	}
	
	
	
	
	
	@Override
	public List<OrderVO> olist() throws Exception {
		return sql.selectList(namespace + ".olist");
	}
	
	
	@Override
	public OrderVO buyView(int onum) throws Exception {
		return sql.selectOne(namespace + ".bview", onum);
	}
	
	
	@Override
	public void cancel(int onum) throws Exception {
		sql.delete(namespace + ".cancel", onum);
		
	}
	
	
	
	
	
	
	
	
	

}
