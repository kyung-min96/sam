package com.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.domain.BoardVO;
import com.member.dao.MemberDAO;
import com.member.domain.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO dao;
	
	// 회원 목록
	@Override
	public List<MemberVO> list() throws Exception {
		return dao.list();
	}

	// 회원 가입
	@Override
	public void register(MemberVO vo) throws Exception {
		dao.register(vo);
	}
	
	// 회원 조회
	@Override
	public MemberVO view(String userId) throws Exception {
		return dao.view(userId);
	}
	
	// 로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return dao.login(vo);
	}

	// 회원 수정
	@Override
	public void modify(MemberVO vo) throws Exception {
		dao.modify(vo);
	}
	
	// 회원 삭제
	@Override
	public void delete(MemberVO vo) throws Exception {
		dao.delete(vo);
	}
	
	// 아이디 중복 확인
	public MemberVO idCheck(String userId) throws Exception {
		return dao.idCheck(userId);
	}
	
	// 닉네임 중복 확인
	public MemberVO nickNameCheck(String nickName) throws Exception {
		return dao.nickNameCheck(nickName);
	}

}
