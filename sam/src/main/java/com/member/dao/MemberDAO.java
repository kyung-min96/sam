package com.member.dao;

import java.util.List;

import com.member.domain.MemberVO;

public interface MemberDAO {
	
	// 회원 목록
	public List<MemberVO> list() throws Exception;
	
	// 회원가입
	public void register(MemberVO vo) throws Exception;
	
	// 회원 조회
	public MemberVO view(String userId) throws Exception;
	
	// 로그인
	public MemberVO login(MemberVO vo) throws Exception;
	
	// 회원 수정
	public void modify(MemberVO vo) throws Exception;
	
	// 회원 삭제
	public void delete(MemberVO vo) throws Exception;
	
	// 아이디 중복 확인
	public MemberVO idCheck(String userId) throws Exception;
	
	// 닉네임 중복 확인
	public MemberVO nickNameCheck(String nickName) throws Exception;

}
