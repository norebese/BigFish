package com.kh.bigFish.fishingTeacher.controller;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;
import com.kh.bigFish.fishingTeacher.model.dao.Question;

@Controller
public class FisingTeacherController {
	
	
	@RequestMapping("gofisingTeacher")
	public String gofisingTeacher() {
		return "fishingTeacher/fishingTeacher";
	}
	
	@ResponseBody
	@RequestMapping("fishingQuestion")
	public String fishingQuestion(@RequestBody Question q) {
		
		new Gson().toJson(q.getPrompt());
		System.out.println(q.getPrompt());
		
		String openAIUrl = "https://api.openai.com/v1/engines/text-davinci-003/completions";
		String appKey = "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";
		
		// gpt 어시스턴트 및 prompt 설정
		String systemPrompt = "As an expert in Korean marine and freshwater fishing, I can provide step-by-step guidance on effective fishing techniques. If you have a question about fishing methods, simply ask, and I'll walk you through the process. Remember, I'm here to help you become a better angler.\n\n이상 낚시 빅선생이었습니다. 오늘도 즐거운 낚시 되세요!";
		String requestBody = "{\"model\": \"text-davinci-003\", \"prompt\": \"User: "+q.getPrompt()+"\\nSystem: "+systemPrompt+"\", \"temperature\": 0.5, \"max_tokens\": 150}" ;
		
		
		// 요청 헤더 설정
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.set("Authorization","Bearer " + appKey);
		
		HttpEntity<String> httpEntity = new HttpEntity<String>(requestBody, headers);
		
		
		RestTemplate restTemplate = new RestTemplate();
		//보내기
		String result = restTemplate.postForObject(openAIUrl, httpEntity, String.class);
		
		return result;
		
	}
}
