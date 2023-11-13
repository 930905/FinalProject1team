package org.zerock.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NoticeBoardServiceTests {

	@Setter(onMethod_ = {@Autowired})
	private NoticeBoardService service;
	
	@Test
	public void testExit() {
		log.info(service);
		assertNotNull(service);
	}
	

	// 글목록(리스트) 작업의 기능 구현과 테스트
	@Test
	public void testGetList() {

		service.getList(new Criteria(1, 3)).forEach(service -> log.info(service));
	}
	
	// 특정 글 조회 작업의 기능 구현과 테스트
	@Test
	public void testGet() {
		// 1번 글의 상세 정보를 로그 정보로 표시해 줍니다.
		log.info(service.get(1L));
	}

}
