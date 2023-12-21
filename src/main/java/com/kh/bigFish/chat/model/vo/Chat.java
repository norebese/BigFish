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
public class Chat {
	private int chatId;
	private String senderId;
	private String receiverId;
	private String msgText;
	private String sendTime;
	private String type;
	private String readCheck;
}
