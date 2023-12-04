package com.kh.bigFish.announce.model.vo;

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
public class Announce {
	
	private int annNo;
	private String annTitle;
	private String annWriter;
	private String annContent;
	private String originName;
	private String changeName;
	private Date annCreateDate;
	private String annStatus;
	private int annCount;
 
}
