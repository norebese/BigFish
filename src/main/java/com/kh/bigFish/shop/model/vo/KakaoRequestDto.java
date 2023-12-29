package com.kh.bigFish.shop.model.vo;

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
public class KakaoRequestDto {
	private int payNo;
	private String cid; 
    private String partner_order_id;
    private String partner_user_id;
    private String item_name;
    private int quantity;
    private int total_amount;
    private int vat_amount;
    private int tax_free_amount;
    private String approval_url;
    private String fail_url;
    private String cancel_url;
    private String pg_token;
    private int productNo;
	private Date payDate;
	  private int fishingNo;
	  private int rproductNo;
	  private String changeName;
    
    

}
