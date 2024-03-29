package com.sp.papago.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sp.papago.dao.PapagoDAO;
import com.sp.papago.vo.PapagoInfoVO;

@Component
public class PapagoDAOImpl implements PapagoDAO {

	@Autowired
	private SqlSessionFactory ssf;
	
	@Override
	public List<PapagoInfoVO> selectPpgInfoList(PapagoInfoVO pvo) {
		SqlSession ss = ssf.openSession(false);
		try {
			return ss.selectList("com.sp.papago.dao.PapagoInfoMapper.selectPpgInfoList");
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			ss.close();
		}
		return null;
	}
	
	@Override
	public PapagoInfoVO selectPpgInfoView(int piNum) {
		SqlSession ss = ssf.openSession(false);
		try {
			return ss.selectOne("com.sp.papago.dao.PapagoInfoMapper.selectPpgInfoView",piNum);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ss.close();
		}
		return null;
	}
	
	@Override
	public int insertPpgInfo(PapagoInfoVO pvo) {
		SqlSession ss = ssf.openSession(false);
		try {
			int cnt = ss.insert("com.sp.papago.dao.PapagoInfoMapper.insertPpgInfo", pvo);
			ss.commit();
			return cnt;
		}catch(Exception e){
			ss.rollback();
			e.printStackTrace();
		}finally {
			ss.close();
		}
		return 0;
	}
	
	@Override
	public PapagoInfoVO selectPpgInfo(PapagoInfoVO pvo) {
		SqlSession ss = ssf.openSession(false);
		try {
			return ss.selectOne("com.sp.papago.dao.PapagoInfoMapper.selectPpgInfo",pvo);
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			ss.close();
		}
		return null;
	}
	
	@Override
	public int updatePpgInfoForCnt(PapagoInfoVO pvo) {
		SqlSession ss = ssf.openSession(false);
		try {
			int cnt = ss.update("com.sp.papago.dao.PapagoInfoMapper.updatePpgInfoForCnt",pvo);
			ss.commit();
			return cnt;
		}catch(Exception e){
			ss.rollback();
			e.printStackTrace();
		}finally {
			ss.close();
		}
		return 0;
	}
}
