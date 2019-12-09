package com.sp.papago.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sp.papago.vo.PapagoInfoVO;
import com.sp.papago.vo.TranslateVO;

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
			return ss.selectOne("com.sp.papago.dao.PapagoInfoMapper.selectPpgInfo");
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			ss.close();
		}
		return null;
	}
	

}
