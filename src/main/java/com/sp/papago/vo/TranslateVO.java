package com.sp.papago.vo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class TranslateVO {

	private String source;
	private String target;
	private String text;
	private Message message;
	private Integer uiNum;
}
