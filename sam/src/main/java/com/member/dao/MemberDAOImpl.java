package com.member.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.BoardVO;
import com.member.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	// 마이바티스
	@Inject
	private SqlSession sql;
	
	// 매퍼: memberMapper.xml에 있는 mapper 요소의 namespace 속성값 지정
	private static String namespace = "com.member.mappers.member";
	
	// 회원 목록
	@Override
	public List<MemberVO> list() throws Exception {
		return sql.selectList(namespace + ".list");
		// boardMapper.xml에서 id="list" 인 요소 내부의 쿼리문을 수행한 결과값을 얻는다.
	}

	// 회원 가입
	@Override
	public void register(MemberVO vo) throws Exception {
		sql.insert(namespace + ".register", vo);
	}
	
	// 회원 조회
	@Override
	public MemberVO view(String userId) throws Exception {
		return sql.selectOne(namespace + ".view", userId);
	}

	// 로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return sql.selectOne(namespace + ".login", vo);
	}

	// 회원 수정
	@Override
	public void modify(MemberVO vo) throws Exception {
		sql.update(namespace + ".modify", vo);
	}

	// 회원 삭제
	@Override
	public void delete(MemberVO vo) throws Exception {
		sql.delete(namespace + ".delete", vo);
	}
	
	// 아이디 중복 확인
	public MemberVO idCheck(String userId) throws Exception {
		return sql.selectOne(namespace + ".idCheck", userId);
	}
	
	// 닉네임 중복 확인
	public MemberVO nickNameCheck(String nickName) throws Exception {
		return sql.selectOne(namespace + ".nickNameCheck", nickName);
	}

}
