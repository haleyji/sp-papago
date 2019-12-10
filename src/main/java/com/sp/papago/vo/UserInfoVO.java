package com.sp.papago.vo;

import lombok.Data;

@Data
public class UserInfoVO {

	private Integer uiNum;
	private Integer[] uiNums;
	private String uiName;
	private String uiId;
	private String uiPwd;
	private String active;
	private String credat;
	private String cretim;
	private String moddat;
	private String modtim;
	private String searchStr;
	private String[] search;
}
