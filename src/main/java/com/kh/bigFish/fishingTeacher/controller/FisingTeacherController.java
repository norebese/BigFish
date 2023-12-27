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
	
}
