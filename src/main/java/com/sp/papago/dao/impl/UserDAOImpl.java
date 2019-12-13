package com.sp.papago.dao.impl;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.sp.papago.dao.UserDAO;
import com.sp.papago.vo.UserInfoVO;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class UserDAOImpl implements UserDAO {

	@Resource
	private SqlSessionFactory ssf;

	@Override
	public UserInfoVO doLogin(UserInfoVO ui) {
		SqlSession ss = ssf.openSession();
		try {
			return ss.selectOne("com.sp.papago.dao.UserInfo.doLogin", ui);

		} catch (Exception e) {
			log.error(e.getMessage());
		} finally {
			ss.close();
		}
		return null;
	}

	@Override
	public int doSignup(UserInfoVO ui) {
		SqlSession ss = ssf.openSession();
		try {
			
			int cnt = ss.insert("com.sp.papago.dao.UserInfo.doSignup", ui);
			if(cnt==1) {
				ss.commit();
			}
			return cnt;
		} catch (Exception e) {
			ss.rollback();
			log.error(e.getMessage());
		} finally {
			ss.close();
		}
		return 0;
	}

}
