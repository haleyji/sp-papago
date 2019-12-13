package com.sp.papago.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sp.papago.dao.PapagoStatsDAO;
import com.sp.papago.service.PapagoStatsService;
import com.sp.papago.vo.PapagoStatsVO;

@Service
public class PapagoStatsServiceImpl implements PapagoStatsService {

	@Resource
	private PapagoStatsDAO psdao;
	
	@Override
	public List<PapagoStatsVO> selectPapagoStats(PapagoStatsVO ps) {
		return psdao.selectPapagoStats(ps);
	}
	
	@Override
	public List<PapagoStatsVO> selectPapagoStatsByCredat(PapagoStatsVO ps) {
		return psdao.selectPapagoStatsByCredat(ps);
	}

	
	@Override
	public List<PapagoStatsVO> selectPapagoStatsByUser(PapagoStatsVO ps) {
		return psdao.selectPapagoStatsByUser(ps);
	}

	@Override
	public Map<String, String> insertPapagoStats(PapagoStatsVO ps) {
		Map<String,String> rMap = new HashMap<>();
		rMap.put("msg", "실패");
		int cnt = psdao.insertPapagoStats(ps);
		if(cnt==1) {
			rMap.put("msg", "성공");
		}
		rMap.put("cnt", cnt+"");
		return null;
	}

	
}