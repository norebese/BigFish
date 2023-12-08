package com.kh.bigFish.faq.model.vo;

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
public class FAQ {
	
	private int faqNo;
	private String faqTitle;
	private String faqWriter;
	private String faqContent;
	private Date faqCreateDate;
	private String faqStatus;
	private int faqCount;
}
