package com.kh.bigFish.chat.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class ChatMsgVO {
	
	
	private String msg;
	private String senderNo;
	private String time;
	private String type;
}
