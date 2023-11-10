package org.zerock.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.NoticeBoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

// Ctrl + Shift + O : import 자동 정리

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NoticeBoardMapperTests {

	
	@Setter(onMethod_ = @Autowired)
	private NoticeBoardMapper mapper;
	
	@Test
	public void testGetList() {		
		mapper.getList().forEach(notice -> log.info(notice));
	}
		
	@Test
	public void testRead() {
		NoticeBoardVO notice = mapper.read(1L);
		log.info(notice);		
	}
	
	
	@Test
	public void testPaging() {
	
		Criteria cri = new Criteria();
		
		// Page297 : 10개씩 3페이지 출력 내용을 확인해 봅니다!
		cri.setPageNum(1); // 3페이지의
		cri.setAmount(3); // 10개 데이터를
		
		List<NoticeBoardVO> list = mapper.getListWithPaging(cri); // list에 담아서 보여주게 합니다!
		
		list.forEach(notice -> log.info(notice));
	}

}
