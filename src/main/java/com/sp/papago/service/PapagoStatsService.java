package com.sp.papago.service;

import java.util.List;
import java.util.Map;

import com.sp.papago.vo.PapagoStatsVO;

public interface PapagoStatsService {
	public List<PapagoStatsVO> selectPapagoStats(PapagoStatsVO ps);
	public List<PapagoStatsVO> selectPapagoStatsByCredat(PapagoStatsVO ps);
	public List<PapagoStatsVO> selectPapagoStatsByUser(PapagoStatsVO ps);
	
	public Map<String,String> insertPapagoStats(PapagoStatsVO ps);
}