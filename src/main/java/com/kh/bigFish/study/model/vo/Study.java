package com.kh.bigFish.study.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor

public class Study {
	private int studyNo;
	private String studyTitle;
	private String studyContent;
	private String studyStatus;
	private int studyCount;
	private String studyWriter;
	private String studyLink;
	private Date studyCreateDate;
	private int rmemNo;
	private String studyGoodStatus;
}

