package com.sp.papago.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.sp.papago.service.PapagoService;
import com.sp.papago.vo.Message;
import com.sp.papago.vo.PapagoInfoVO;
import com.sp.papago.vo.TranslateVO;
import com.sp.papago.vo.UserInfoVO;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class PapagoController {

	@Resource
	private PapagoService ps;

	
	@PostMapping("/papago")
	public Message doTranslate(@RequestBody TranslateVO tvo, HttpSession hs) {
		UserInfoVO ui = (UserInfoVO)hs.getAttribute("ui");
		tvo.setUiNum(ui.getUiNum());
		log.info("tvo => {}",tvo);
		return ps.doTranslate(tvo);
	}
	
	@GetMapping("/papago")
	public List<PapagoInfoVO> getPapagoInfoList(PapagoInfoVO pvo){
		return ps.getPpgInfoList(pvo);
	}
}
