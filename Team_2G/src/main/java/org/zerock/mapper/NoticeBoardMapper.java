package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.NoticeBoardVO;

public interface NoticeBoardMapper {

	public List<NoticeBoardVO> getList();
	
	public List<NoticeBoardVO> getListWithPaging(Criteria cri);
	
	public NoticeBoardVO read(Long bno);

	public int getTotalCount(Criteria cri);

}
