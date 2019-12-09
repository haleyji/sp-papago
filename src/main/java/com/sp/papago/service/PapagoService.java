package com.sp.papago.service;

import java.util.List;

import com.sp.papago.vo.Message;
import com.sp.papago.vo.PapagoInfoVO;
import com.sp.papago.vo.TranslateVO;

public interface PapagoService {

	public Message doTranslate(TranslateVO tvo);
	public List<PapagoInfoVO> getPpgInfoList(PapagoInfoVO pvo);
}
