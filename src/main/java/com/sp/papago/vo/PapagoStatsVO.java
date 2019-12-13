package com.sp.papago.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
public class PapagoStatsVO {

	private Integer psNum;
	private Integer uiNum;
	private Integer piNum;
	private String credat;
	private String order;
	private String uiId;
	private Integer cnt;
}