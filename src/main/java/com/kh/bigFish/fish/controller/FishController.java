package com.kh.bigFish.fish.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bigFish.attachment.model.vo.Attachment;
import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.common.template.Pagenation;
import com.kh.bigFish.fish.model.service.FishService;
import com.kh.bigFish.fish.model.vo.Fish;

@Controller
public class FishController {
	
	@Autowired
	private FishService fishService;
	
	@RequestMapping(value="fishInfo.fi")
	public ModelAndView AnnounceList(@RequestParam(value="cpage", defaultValue="1") int currentPage, 
			ModelAndView mv) {
		
		PageInfo pi = Pagenation.getPageInfo(fishService.selectListCount(), currentPage, 10, 6);
		
			mv.addObject("pi",pi)
			  .addObject("list", fishService.selectList(pi))
			  .setViewName("fishInfo/fishInfo");
		
		return mv;
	}
	
	@RequestMapping(value="fishInEnroll.fi")
	public String fishInfoEnroll() {
		return "fishInfo/fishInfoInsert";
	}
	
	@RequestMapping(value="fishInsert.fi")
	public String fishInfoInsert(Fish f, String deleteImgs, MultipartFile upfile, HttpSession session, Model model) {
		
		String changeName = saveFishFile(upfile, session);
		
		String[] imgs = deleteImgs.split(",");
		
		// 이미지를 저장확정 안할시 삭제한 이미지를 폴더에서 삭제하는 코드
		for (String imgPath : imgs) {
	        new File(session.getServletContext().getRealPath(imgPath)).delete();
			}
		
		int result = fishService.insertFishInfo(f);
		
		if((result) > 0) {
			
			session.setAttribute("alertMsg", "백과사전 작성완료");
			return "redirect:fishInfo.fi";
		} else {
			model.addAttribute("errorMsg", "게시글 작성 실패");
			return "common/errMsg";
		}
	}
	

	@ResponseBody
	@RequestMapping(value="/uploadFishImageFile")
	public String saveFile(MultipartFile upfile, HttpSession session, String path) {

		//원래 파일명
		String originName = upfile.getOriginalFilename();

		//시간정보(년월일시분초)
		String currentTime = new SimpleDateFormat("yyyyMMddHHss").format(new Date());


		//랜덤숫자 5자리
		int ranNum = (int)(Math.random() *90000) + 10000;
		
		//확장자
		String ext = originName.substring(originName.lastIndexOf("."));

		//변경된 이름
		String changeName = currentTime + ranNum + ext;
		
		//첨부파일 저장할 폴더의 물리적인 경우(web이 아니라 진짜 컴퓨터 안에있는 드라아비)
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");

		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		changeName = "/resources/uploadFiles/" + changeName;
		return changeName;
		
	}
	
	
	public String saveFishFile(MultipartFile upfile, HttpSession session) {
		//파일명 수정 후 서버 업로드 시키기("이미지저장용 (2).jpg" => 20231109102712345.jpg)
		//년월일시분초 + 랜덤숫자 5개 + 확장자
		
		//원래 파일명
		String originName = upfile.getOriginalFilename();
		
		//시간정보 (년월일시분초)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		//랜덤숫자 5자리
		int ranNum = (int)(Math.random() * 90000) + 10000;
		
		//확장자
		String ext = originName.substring(originName.lastIndexOf(".")+1);
		
		//변경된이름
		String changeName = currentTime + ranNum +"."+ ext;
		
		//첨부파일 저장할 폴더의 물리적인 경우
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	private List<String> extractImgPathsFromContent(String annContent) {
	    List<String> imgPaths = new ArrayList<>();

	    // 이미지 경로 추출
	    int startIndex = annContent.indexOf("<img");

	    while (startIndex != -1) {
	        int srcIndex = annContent.indexOf("src=", startIndex);
	        int startQuoteIndex = annContent.indexOf("\"", srcIndex);	      
	        int endQuoteIndex = annContent.indexOf("\"", startQuoteIndex + 1);
	        String imgPath = annContent.substring(startQuoteIndex + 9, endQuoteIndex); // +9인 이유는 +1에다가 /bigFish라는 contextPath제거
	        imgPaths.add(imgPath);
	        startIndex = annContent.indexOf("<img", endQuoteIndex);
	    }

	    return imgPaths;
	} 
	
	public static final String SERVICE_KEY = "qPwOeIrU-2312-SSDOQU-0720";
	
	@ResponseBody
	@RequestMapping(value="fishInfo.fi", produces="application/json; charset=UTF-8")
	public String airPollution(String location) throws IOException {
		//OpenAPI 서버로 요청하는 url 만들기
		String url = "https://www.nifs.go.kr/OpenAPI_json?id=frcenterCode";
		url += "?servicekey=" + SERVICE_KEY;
		url += "&sidoName=" + URLEncoder.encode(location, "UTF-8"); // 요청값에 한글이 있다면 인코딩 해줘야한다.
		url += "&returnType=json";
		
		// 1. 요천하고자하는 url을 전달하면서 java.net.URL객체를 생성
		URL requestUrl = new URL(url);
		
		// 2. 1번 과정으로 URL객체를 가지고 HttpURLConnection 객체 생성
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		
		// 3. 요청에필요한 Header값 설정하기
		urlConnection.setRequestMethod("GET");
		
		// 4. 해당 OpenAPI서버로 요청을 보낸 후 입력데이터로 읽어오기
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String responseText = "";
		String line;
		
		while((line = br.readLine()) != null){
			responseText += line;
		}
		
		br.close();
		urlConnection.disconnect();
		
		return responseText;
	}
}
