package com.kh.bigFish.store.model.vo;

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
public class Ticket {
	private int ticketNo;
	private int rstoreNo;
	private String ticketName;
	private int ticketPrice;
	private int ticketTime;
	
	public Ticket(String ticketName, int ticketPrice, int ticketTime) {
		this.ticketName = ticketName;
		this.ticketPrice = ticketPrice;
		this.ticketTime = ticketTime;
	}

	
}

