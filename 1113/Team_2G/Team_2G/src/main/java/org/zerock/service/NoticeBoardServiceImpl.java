package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.NoticeBoardVO;
import org.zerock.mapper.NoticeBoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service  // 계층 구조상 주로 비즈니스 영역을 담당하는 객체임을 표시하기 위해 사용함.
@AllArgsConstructor
public class NoticeBoardServiceImpl implements NoticeBoardService {


		private NoticeBoardMapper mapper;


		@Override
		public NoticeBoardVO get(Long bno) {
			log.info("get... 특정 글 내용을 조회 합니다!" + bno);
			return mapper.read(bno);
		}

		// Page299 : 페이징 매개변수가 적용된 getList() 메서드 선언
		@Override
		public List<NoticeBoardVO> getList(Criteria cri) {
			log.info("get List with criteria : " + cri);
			return mapper.getListWithPaging(cri);
		}

		
		// 전체 데이터수를 구해주는 getTotal() 메서드 선언
		@Override
		public int getTotal(Criteria cri) {
			log.info("get total count : 전체 데이터 수를 구해줍니다!");
			return mapper.getTotalCount(cri);
		}
}


