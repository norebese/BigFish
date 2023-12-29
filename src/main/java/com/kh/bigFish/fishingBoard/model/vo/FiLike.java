package com.kh.bigFish.fishingBoard.model.vo;

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
public class FiLike {
	private int rmemNo;
	private int rfishingNo;
	private String fishingGoodStatus;
	private int count;
}
