package com.sp.papago.controller;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sp.papago.service.PapagoService;
import com.sp.papago.vo.Message;
import com.sp.papago.vo.TranslateVO;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class PapagoController {

	@Resource
	private PapagoService ps;
	
	@PostMapping("/papago")
	public Message doTranslate(@ModelAttribute TranslateVO tvo) {
		log.info("tvo => {}",tvo);
		return ps.doTranslate(tvo);
	}
}
