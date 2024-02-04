package com.product.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.product.domain.ReviewVO;
import com.product.service.ReviewService;


@Controller
@RequestMapping("/review/*")
public class ReviewController {
	
	@Inject
	private ReviewService reviewService;
	// 댓글 작성
		@RequestMapping(value = "/write", method = RequestMethod.POST)
		public String postWrite(ReviewVO vo) throws Exception {
		    reviewService.write(vo);
		    
		    return "redirect:/product/view?pno=" + vo.getPno();
		}
		
		// 댓글 단일 조회 (수정 페이지)
		@RequestMapping(value = "/modify", method = RequestMethod.GET)
		public void getModify(@RequestParam("pno") int pno, @RequestParam("rno") int rno, Model model) throws Exception {
			ReviewVO vo = new ReviewVO();
			vo.setPno(pno);
			vo.setRno(rno);
			
			ReviewVO review = reviewService.reviewSelect(vo);
			model.addAttribute("review", review);
		}
		
		// 댓글 수정
		@RequestMapping(value = "/modify", method = RequestMethod.POST)
		public String postModify(ReviewVO vo) throws Exception {
			reviewService.modify(vo);

			return "redirect:/product/view?pno=" + vo.getPno();
		}
		
		// 댓글 삭제
		@RequestMapping(value = "/delete", method = RequestMethod.GET)
		public String postDelete(ReviewVO vo) throws Exception {
			reviewService.delete(vo);

			return "redirect:/product/view?pno=" + vo.getPno();
		}
	
}
