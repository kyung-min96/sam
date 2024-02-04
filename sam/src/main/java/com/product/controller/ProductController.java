package com.product.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.domain.BoardVO;
import com.board.domain.ReplyVO;
import com.board.service.ReplyService;
import com.member.domain.MemberVO;
import com.product.domain.OrderVO;
import com.product.domain.ProductVO;
import com.product.domain.ReviewVO;
import com.product.service.ProductService;
import com.product.service.ReviewService;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Inject
	ProductService service;
	@Inject
	private ReviewService reviewService;
	//상품 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(Model model) throws Exception {
		System.out.println("==========상품 목록 : 화면 처리");
		
		List list = service.list();
		model.addAttribute("list", list);
		
	}
	
	// 상품등록  GET: 화면 처리
		@RequestMapping(value = "/register", method = RequestMethod.GET)
		public void getRegister() throws Exception {
			System.out.println("==========상품 등록 : 화면 처리");
		}

	// 상품등록 POST: 데이터 처리
		@RequestMapping(value = "/register", method = RequestMethod.POST)
		public String postRegister(ProductVO vo) throws Exception {
			System.out.println("========== 상품 등록 : 데이터 처리");
			service.register(vo);
			return "redirect:/product/list";
	}
	// 상품 조회
		@RequestMapping(value = "/view", method = RequestMethod.GET)
		public void getView(@RequestParam("pno") int pno, Model model) throws Exception {
			service.updateReadCount(pno);
			ProductVO vo = service.view(pno);
			model.addAttribute("view", vo);
			
			// 댓글 조회
			List<ReviewVO> review = reviewService.list(pno);
			model.addAttribute("review", review);
		}
		// 상품 수정 화면
		@RequestMapping(value = "/modify", method = RequestMethod.GET)
		public void getModify(@RequestParam("pno") int pno, Model model) throws Exception {
			ProductVO vo = service.view(pno);
			model.addAttribute("view", vo);
		}
		
		// 상품 수정 처리
		@RequestMapping(value = "/modify", method = RequestMethod.POST)
		public String postModify(ProductVO vo) throws Exception {
			service.modify(vo);
			System.out.println("========== 수정 성공");
			return "redirect:/product/view?pno=" + vo.getPno();
		}
		
		// 상품 삭제
		@RequestMapping(value = "/delete", method = RequestMethod.GET)
		public String getDelete(@RequestParam("pno") int pno) throws Exception {
			service.delete(pno);  

			return "redirect:/product/list";
		}
		// 좋음 증가 처리
		@RequestMapping(value="/like", method=RequestMethod.GET)
		public String upLike(@RequestParam("pno") int pno) throws Exception {
			service.upLike(pno);
	
			return "redirect:/product/view?pno=" + pno;
		} // board/view.jsp로 응답한다.
		
		// 구매 정보조회
				@RequestMapping(value = "/buy", method = RequestMethod.GET)
				public void getpView(@RequestParam("pno") int pno, Model model) throws Exception {
					ProductVO vo = service.view(pno);
					model.addAttribute("view", vo);
		}
		// 구매 등록 POST: 데이터 처리
				@RequestMapping(value = "/buy", method = RequestMethod.POST)
				public String postbuy(OrderVO ovo) throws Exception {
					service.buy(ovo);
					System.out.println("=========구매완료");
					return "redirect:/product/buylist";
				}

		//구매 리스트
				@RequestMapping(value = "/buylist", method = RequestMethod.GET)
				public void BuyList(Model model) throws Exception {
					List olist = service.olist();
					model.addAttribute("olist", olist);
				}	
			
		// 구매 품목 조회
				@RequestMapping(value = "/buyview", method = RequestMethod.GET)
				public void buyView(@RequestParam("onum") int onum, Model model) throws Exception {
					OrderVO ovo = service.buyView(onum);
					model.addAttribute("bview", ovo);
		}
				
		// 주문취소
				@RequestMapping(value = "/cancel", method = RequestMethod.GET)
				public String getcancel(@RequestParam("onum") int onum) throws Exception {
					service.cancel(onum);  

					return "redirect:/product/buylist";
				}		
		
				
				
		
}
