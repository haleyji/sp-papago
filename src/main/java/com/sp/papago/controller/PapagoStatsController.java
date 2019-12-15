package com.sp.papago.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RestController;

import com.sp.papago.service.PapagoStatsService;
import com.sp.papago.vo.PapagoStatsVO;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class PapagoStatsController {

	@Resource
	private PapagoStatsService psService;
	
	@GetMapping("/papago/stats")
	public List<PapagoStatsVO> getPapagoStatsList(@ModelAttribute PapagoStatsVO ps){
		return psService.selectPapagoStats(ps);
	}
	@GetMapping("/papago/stats/credat")
	public List<PapagoStatsVO> getPapagoStatsListByCredat(@ModelAttribute PapagoStatsVO ps){
		return psService.selectPapagoStatsByCredat(ps);
	}
	@GetMapping("/papago/stats/user")
	public List<PapagoStatsVO> getPapagoStatsListByUser(@ModelAttribute PapagoStatsVO ps){
		return psService.selectPapagoStatsByUser(ps);
	}
	
}	