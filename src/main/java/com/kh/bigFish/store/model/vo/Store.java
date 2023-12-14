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
	private int rmemNo;
	private String locationBig;
	private String locationSmall;
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
	private String storeFishKind;
	private String reservationDetail;
	private String businessNo;
	private String storeStatus;
	private int likeCount;
	private int minPrice;
	private int replyCount;
}

