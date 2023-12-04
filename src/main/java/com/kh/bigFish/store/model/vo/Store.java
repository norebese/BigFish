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
public class Store {

	private int storeNo;
	private int remNo;
	private String location;
	private String storeAddress;
	private String storeAddressDetail;
	private int storePostNo;
	private String storeName;
	private String storePhone;
	private int maxMember;
	private String storeWeekday;
	private String storeWeekend;
	private String storeGroup;
	private String storeKind;
	private int businessNo;
	
}
