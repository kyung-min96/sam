package com.sub.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/sub/*")
public class SubController {
	
	// iyagi 페이지
		@RequestMapping(value = "/iyagi", method = RequestMethod.GET)
		public void iyagi() throws Exception {}
		
	// menu 페이지
		@RequestMapping(value = "/menu", method = RequestMethod.GET)
		public void menu() throws Exception {}
		
	// startup 페이지
		@RequestMapping(value = "/startup", method = RequestMethod.GET)
		public void startup() throws Exception {}

}
