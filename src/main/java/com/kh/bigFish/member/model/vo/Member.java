package com.kh.bigFish.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Member {
	
	private int memNo;
	private String memId;
	private String memPwd;
	private String memNick;
	private String phone;
	private String address;
	private String addressDetail;
	private int postNo;
	private Date memCreateDate;
	private String memStatus;
	private String businessStatus;
	private String memAdmin;
	private String memChangeName;
	
	
}
