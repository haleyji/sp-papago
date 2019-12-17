/*
 * package com.sp.papago;
 * 
 * import javax.annotation.Resource;
 * 
 * import org.junit.Test; import org.junit.runner.RunWith; import
 * org.springframework.test.context.ContextConfiguration; import
 * org.springframework.test.context.junit4.SpringJUnit4ClassRunner; import
 * org.springframework.util.Assert;
 * 
 * import com.sp.papago.dao.UserDAO; import com.sp.papago.vo.UserInfoVO;
 * 
 * import lombok.extern.slf4j.Slf4j;
 * 
 * @RunWith(SpringJUnit4ClassRunner.class)
 * 
 * @ContextConfiguration(locations = { "classpath:root-context.xml" })
 * 
 * @Slf4j public class UserDAOTest {
 * 
 * @Resource private UserDAO udao;
 * 
 * @Test public void test() { UserInfoVO ui = new UserInfoVO();
 * ui.setUiId("test"); ui.setUiPwd("test"); ui = udao.doLogin(ui);
 * Assert.isNull(ui,"로그인 노노"); }
 * 
 * }
 */