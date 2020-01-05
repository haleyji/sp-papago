package com.sp.papago.dao;

import java.util.List;

import com.sp.papago.vo.PapagoInfoVO;
import com.sp.papago.vo.TranslateVO;

public interface PapagoDAO {

	public List<PapagoInfoVO> selectPpgInfoList(PapagoInfoVO pvo);
	public PapagoInfoVO selectPpgInfo(PapagoInfoVO pvo);
	public PapagoInfoVO selectPpgInfoView(int piNum);
	public int insertPpgInfo(PapagoInfoVO pvo);
	public int updatePpgInfoForCnt(PapagoInfoVO pvo);
	
	
}
