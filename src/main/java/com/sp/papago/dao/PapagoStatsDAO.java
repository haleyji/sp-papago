  
package com.sp.papago.dao;

import java.util.List;

import com.sp.papago.vo.PapagoStatsVO;

public interface PapagoStatsDAO {
	public List<PapagoStatsVO> selectPapagoStats(PapagoStatsVO ps);
	public List<PapagoStatsVO> selectPapagoStatsByCredat(PapagoStatsVO ps);
	public List<PapagoStatsVO> selectPapagoStatsByUser(PapagoStatsVO ps);
	
	public int insertPapagoStats(PapagoStatsVO ps);
}