package com.kh.bigFish.reservation.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

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
public class Reservation {
	private int revNo;
	private int rmemNo;
	private int rstoreNo;
	private int rticketNo;
	private Date revDate;
	private int revPeople;
	private String revStart;
	private String revEnd;
	private String revStatus;
	private String revRequest;
	private String revName;
	private int revPhone; 
	private String rstoreName;
	private String rticketName;
	private int rticketPrice;
	private int rticketTime;
}



