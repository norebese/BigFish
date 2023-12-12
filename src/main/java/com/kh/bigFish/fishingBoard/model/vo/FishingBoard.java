package com.kh.bigFish.fishingBoard.model.vo;

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
public class FishingBoard {
	private int fishingNo;
	private String fishingTitle;
	private String fishingWriter;
	private String fishingContent;
	private String fishingStatus;
	private Date fishingCreateDate;
	private int fishingCount;
	private int rmemNo;
	private String originName;
	private String changeName;
	private String rfishingNo;
}
