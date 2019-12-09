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
		SqlSession ss = ssf.openSession();
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
	public int insertPpgInfo(TranslateVO tvo) {
		SqlSession ss = ssf.openSession();
		try {
			return ss.insert("com.sp.papago.dao.PapagoInfoMapper.insertPpgInfo", tvo);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			ss.close();
		}
		return 0;
	}

	

}
