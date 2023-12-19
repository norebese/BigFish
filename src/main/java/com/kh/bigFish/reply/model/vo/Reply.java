package com.kh.bigFish.reply.model.vo;

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
public class Reply {
	
	private int replyNo;
	private String replyContent;
	private String replyWriter;
	private String replyCreateDate;
	private String replyStatus;
	private int rmemNo;
	private int rfreeNo;
	private int rfishingNo;
	private int rstudyNo;
	private int rstoreNo;
	private String memProfileImg;
}
