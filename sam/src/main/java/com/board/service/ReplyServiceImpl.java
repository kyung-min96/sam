package com.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.board.dao.BoardDAO;
import com.board.dao.ReplyDAO;
import com.board.domain.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDAO rdao;
	@Inject
	private BoardDAO bdao;

	// 댓글 조회
	@Override
	public List<ReplyVO> list(int bno) throws Exception {
	    return rdao.list(bno);
	}

	// 댓글 작성
	@Transactional
	@Override
	public void write(ReplyVO vo) throws Exception {
		bdao.updateReplyCnt(vo.getBno(), 1);
	    rdao.write(vo);
	}

	// 댓글 수정
	@Override
	public void modify(ReplyVO vo) throws Exception {
	    rdao.modify(vo);
	}

	// 댓글 삭제
	@Transactional
	@Override
	public void delete(ReplyVO vo) throws Exception {
		bdao.updateReplyCnt(vo.getBno(), -1);
	    rdao.delete(vo);
	}
	
	// 단일 댓글 조회
	@Override
	public ReplyVO replySelect(ReplyVO vo) throws Exception {
		return rdao.replySelect(vo);
	}

}
