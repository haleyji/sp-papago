package com.sp.papago.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.sp.papago.dao.PapagoStatsDAO;
import com.sp.papago.vo.PapagoStatsVO;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class PapagoStatsDAOImpl implements PapagoStatsDAO {

	@Resource
	private SqlSessionFactory ssf;

	@Override
	public List<PapagoStatsVO> selectPapagoStats(PapagoStatsVO ps) {
		SqlSession ss = ssf.openSession();
		try {
			return ss.selectList("com.sp.papago.dao.PapagoStatsMapper.selectPapagoStats", ps);
		} catch (Exception e) {
			log.error(e.getMessage());
		} finally {
			ss.close();
		}
		return null;
	}

	@Override
	public List<PapagoStatsVO> selectPapagoStatsByCredat(PapagoStatsVO ps) {
		SqlSession ss = ssf.openSession();
		try {
			return ss.selectList("com.sp.papago.dao.PapagoStatsMapper.selectPapagoStatsByCredat", ps);
		} catch (Exception e) {
			log.error(e.getMessage());
		} finally {
			ss.close();
		}
		return null;
	}
	
	@Override
	public List<PapagoStatsVO> selectPapagoStatsByUser(PapagoStatsVO ps) {
		SqlSession ss = ssf.openSession();
		try {
			return ss.selectList("com.sp.papago.dao.PapagoStatsMapper.selectPapagoStatsByUser", ps);
		} catch (Exception e) {
			log.error(e.getMessage());
		} finally {
			ss.close();
		}
		return null;
	}

	@Override
	public int insertPapagoStats(PapagoStatsVO ps) {
		SqlSession ss = ssf.openSession();
		try {
			int cnt = ss.insert("com.sp.papago.dao.PapagoStatsMapper.insertPapagoStats", ps);
			ss.commit();
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