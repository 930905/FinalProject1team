package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.NoticeBoardVO;

public interface NoticeBoardService {

	public NoticeBoardVO get(Long bno);
	
	// Page299 : 페이징 처리가 적용되는 getList() 메서드 선언
	public List<NoticeBoardVO> getList(Criteria cri);
	
	// Page323 : 전체 데이터스를 구해주는 getTotal() 메서드 선언
	public int getTotal(Criteria cri);
	
}


