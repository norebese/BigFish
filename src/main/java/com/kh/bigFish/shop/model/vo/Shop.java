package com.kh.bigFish.shop.model.vo;

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

public class Shop {
	private int productNo;
	private String productName;
	private int productPrice;
	private int productStock;
	private String productStatus;
	private String productOrigin;
	private String productDetail;
	private String productBrand;
	private String originName;
	private String changeName;
	private String rproductNo;
	private int productQuantity;
	private int productTotalPrice;	
}
