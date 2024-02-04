package com.member.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.domain.BoardVO;
import com.board.domain.ReplyVO;
import com.member.domain.MemberVO;
import com.member.service.MemberService;
import com.product.domain.ProductVO;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
//	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	 
	@Inject
	MemberService service;
	
	// 회원 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(Model model) throws Exception {
		System.out.println("========== 회원 목록 : 화면 처리");
		
		List list = service.list();
		model.addAttribute("list", list);
	}
	 
	// 회원 가입 GET: 화면 처리
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		System.out.println("========== 회원 등록 : 화면 처리");
	}

	// 회원 가입 POST: 데이터 처리
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(MemberVO vo) throws Exception {
		System.out.println("========== 회원 등록 : 데이터 처리");
		
		service.register(vo);
		
		return "redirect:/";
	}
	
	// 회원 조회
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("userId") String userId, Model model) throws Exception {
		System.out.println("========== 회원 조회 : 화면 처리");
		
		MemberVO vo = service.view(userId);
		model.addAttribute("view", vo);
	}
	//  로그인 POST: 화면 처리
		@RequestMapping(value = "/login", method = RequestMethod.GET)
		public void getLogin() throws Exception {
			System.out.println("========== 회원 등록 : 화면 처리");
		}
	// 로그인 GET: 데이터 처리
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		System.out.println("========== 로그인 : 데이터 처리");
	   
		HttpSession session = req.getSession();
		MemberVO login = service.login(vo);

		if(login == null) {
			System.out.println("========== 로그인 실패");
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		}else {
			System.out.println("========== 로그인 성공");
			session.setAttribute("member", login);
		}

		return "redirect:/member/login";
	}
	
	// 로그아웃
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) throws Exception {
		System.out.println("========== 로그아웃 : 세션 삭제");
	   
		session.invalidate();
	     
		return "redirect:/";
	}
	
	// 아이디 중복 확인
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public String postIdCheck(HttpServletRequest req) throws Exception {
		String userId = req.getParameter("userId");
		MemberVO check =  service.idCheck(userId);
		System.out.println("========== 아이디 체크 : "+check);
	   
		String result = null;
	   
		if(check != null) {
			System.out.println("========== 아이디 중복");
			result = "success";
		}   
	   
		return result;
	}
	
	// 닉네임 중복 확인
	@ResponseBody
	@RequestMapping(value = "/nickNameCheck", method = RequestMethod.POST)
	public String postNickNameCheck(HttpServletRequest req) throws Exception {
		String nickName = req.getParameter("nickName");
		MemberVO check =  service.nickNameCheck(nickName);
		System.out.println("========== 닉네임 중복 확인 : "+check);
	   
		String result = null;
	   
		if(check != null) {
			System.out.println("========== 닉네임 중복");
			result = "success";
		}   
	   
		return result;
	}
	
	// 회원 수정 GET: 화면 처리
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getModify(@RequestParam("userId") String userId, Model model) throws Exception {
		System.out.println("========== 회원 수정 : 화면 처리");
		
		MemberVO vo = service.view(userId);
		model.addAttribute("modify", vo);
	}
	
	// 회원 수정 POST: 데이터 처리
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(HttpSession session, MemberVO vo) throws Exception {
		System.out.println("========== 회원 수정 : 데이터 처리");
		   
		service.modify(vo);
		 
		return "redirect:/";
	}
	
	// 회원 삭제 GET: 화면 처리
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void getDelete(@RequestParam("userId") String userId, Model model) throws Exception {
		System.out.println("========== 회원삭제 : 화면 처리");
	   
		MemberVO vo = service.view(userId);
		model.addAttribute("delete", vo);
	}
	
	// 회원 삭제 POST: 데이터 처리
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String postWithdrawal(HttpSession session, MemberVO vo, RedirectAttributes rttr) throws Exception {
		System.out.println("========== 회원삭제 : 데이터 처리");
	   
		MemberVO member = (MemberVO)session.getAttribute("member"); //로그인한 회원 객체를 얻는다.
		String memberId = member.getUserId(); //로그인한 회원의 아이디를 얻는다.
		String memberPass = member.getUserPass(); //로그인한 회원의 비밀번호를 얻는다.
		
		System.out.println("========== 로그인한 회원의 아이디: "+memberId);
		System.out.println("========== 로그인한 회원의 비밀번호: "+memberPass);
	   
		String userId = null; //선택한 회원의 아이디
		String userPass = null; //입력폼에 입력한 비밀번호
		String str=null; //페이지 이동
	   
		if(memberId.equals("admin")) { //로그인한 회원이 관리자이면
			System.out.println("========== 로그인 회원: 관리자");
			userId = vo.getUserId(); //선택한 회원의 아이디를 얻는다.
			userPass = vo.getUserPass(); //입력폼에 입력한 비밀번호를 얻는다.
			System.out.println("========== 선택한 회원의 아이디: "+userId);
			System.out.println("========== 입력폼에 입력한 비밀번호: "+userPass);
			
			MemberVO selectMember = service.view(userId); //선택한 회원 객체를 얻는다.
			String pwd = selectMember.getUserPass(); //선택한 회원의 비밀번호를 얻는다.
		   
			if(pwd.equals(userPass)) { //선택한 회원의 비밀번호와 입력폼에 입력한 비밀번호가 같으면
				System.out.println("========== 선택한 회원의 비밀번호와 입력폼에 입력한 비밀번호가 같다");
				service.delete(selectMember); //선택한 회원을 삭제한다.
				str = "redirect:/";
		   }else { //선택한 회원의 비밀번호와 입력폼에 입력한 비밀번호가 다르면
			   System.out.println("========== 선택한 회원의 비밀번호와 입력폼에 입력한 비밀번호가 다르다");
			   rttr.addFlashAttribute("msg", false); //msg에 false를 저장한다.
			   str = "redirect:/member/delete?userId="+userId; //회원삭제 화면으로 이동한다.
		   }
	   }else { //로그인한 회원이 일반 회원이면
		   System.out.println("========== 로그인 회원: 일반회원");
		   userId = vo.getUserId(); //회원의 아이디를 얻는다.
		   userPass = vo.getUserPass(); //입력폼에 입력한 비밀번호를 얻는다.
		   System.out.println("========== 회원의 아이디: "+userId);
			System.out.println("========== 입력폼에 입력한 비밀번호: "+userPass);
		   
		   if(memberPass.equals(userPass)) { //로그인한 회원의 비밀번호와 입력폼에 입력한 비밀번호가 같으면
			   System.out.println("========== 로그인한 회원의 비밀번호와 입력폼에 입력한 비밀번호가 같다");
			   service.delete(vo); //로그인한 회원을 삭제한다.
			   session.invalidate(); //세션에 저장된 회원정보를 삭제한다.
			   str = "redirect:/";
		   }else { //로그인한 회원의 비밀번호와 입력폼에 입력한 비밀번호가 다르면
			   System.out.println("========== 로그인한 회원의 비밀번호와 입력폼에 입력한 비밀번호가 다르다");
			   rttr.addFlashAttribute("msg", false);
			   str = "redirect:/member/delete?userId="+userId;
		   }
	   }
	    
	   return str;
	}
	

}
