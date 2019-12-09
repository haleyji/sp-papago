package com.sp.papago;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import com.sp.papago.dao.PapagoDAO;
import com.sp.papago.vo.PapagoInfoVO;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@Slf4j
public class PapagoInfoDAOTest {
//test할 주체를 적고 + Test라고 이름을 짓는게 관례
//TDD 테스트 주도 개발 방법	
	@Resource
	private PapagoDAO pdao;

	@Test
	public void test() {
		Assert.notNull(pdao, "오키오키");
		List<PapagoInfoVO> pvo = pdao.selectPpgInfoList(null);
		Assert.isTrue(pvo.size()==1,"사이즈가 1이야");
	}

}
