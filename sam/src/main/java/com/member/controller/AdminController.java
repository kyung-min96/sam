package com.member.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.board.service.BoardService;
import com.member.service.MemberService;
import com.product.service.ProductService;


@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Inject
	MemberService memberService;
	
	@Inject
	BoardService boardService;
	
	@Inject
	ProductService productService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(Model model) throws Exception {
		List olist = productService.olist();
		List plist = productService.list();
		List mlist = memberService.list();
		List blist = boardService.list();
		
		
		model.addAttribute("olist", olist);
		model.addAttribute("plist",plist);
		model.addAttribute("mlist", mlist);
		model.addAttribute("blist", blist);
	}
}
