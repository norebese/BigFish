package com.kh.bigFish.freeBoard.model.vo;

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
public class FreeBoard {
	private int freeNo;
	private String freeTitle;
	private String freeWriter;
	private String freeContent;
	private String status;
	private Date createDate;
	private int count;
	private int rmemNo;
	private String OriginName;
	private String ChangeName;
	
	
}
