package com.sp.papago.service;

import com.sp.papago.vo.Message;
import com.sp.papago.vo.TranslateVO;

public interface PapagoService {

	public Message doTranslate(TranslateVO tvo);
}
