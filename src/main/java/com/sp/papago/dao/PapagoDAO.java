package com.sp.papago.dao;

import java.util.List;

import com.sp.papago.vo.PapagoInfoVO;
import com.sp.papago.vo.TranslateVO;

public interface PapagoDAO {

	public List<PapagoInfoVO> selectPpgInfoList(PapagoInfoVO pvo);
	public int insertPpgInfo(TranslateVO tvo);
	
}
