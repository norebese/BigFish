package com.kh.bigFish.shop.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bigFish.attachment.model.vo.Attachment;
import com.kh.bigFish.common.model.vo.PageInfo;
import com.kh.bigFish.common.template.Pagenation;
import com.kh.bigFish.member.model.vo.Member;
import com.kh.bigFish.shop.model.service.ShopService;
import com.kh.bigFish.shop.model.vo.KakaoRequestDto;
import com.kh.bigFish.shop.model.vo.Shop;
import com.kh.bigFish.study.model.vo.Study;


@Controller
public class ShopController {
	
	@Autowired
	private ShopService shopService;
	
	@RequestMapping(value="/list.sh") 
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage,
			ModelAndView mv) {
		
		PageInfo pi = Pagenation.getPageInfo(shopService.selectListCount(), currentPage, 5, 8);
		
		mv.addObject("pi", pi)
		  .addObject("list", shopService.selectList(pi))
		  .setViewName("shop/shopListView");
//			System.out.println(shopService.selectList(pi));
		return mv;
	}
	
	@RequestMapping("/enrollForm.sh")
	public String enrollForm() {
	
		return "shop/shopEnrollForm";
	}
	
	@RequestMapping("insert.sh")
	public String insertShop(Shop s, MultipartFile upfile, HttpSession session, Model model) {
		String changeName = saveFile(upfile, session);
		Attachment at = new Attachment();
//		System.out.println(at);
		
		at.setOriginName(upfile.getOriginalFilename());
		at.setChangeName("/resources/uploadFiles/" + changeName);
		
		int result = shopService.insertShop(s);
		int result1 = shopService.insertShopFile(at);
		
		if(result * result1 > 0) {
			
			session.setAttribute("alertMsg", "상품 등록 완료");
			return "redirect:list.sh";
		} else {
			model.addAttribute("errorMsg", "상품 등록 실패");
			return "common/errorMsg";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/shopuploadImageFile") 
	public String shopuploadImageFile(MultipartFile upfile,HttpSession session) { 
		
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
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ("/resources/uploadFiles/" + changeName);
	}
	
	@ResponseBody
	@RequestMapping(value="/shopuploadSummernoteImageFile") 
	public String shopuploadSummernoteImageFile(MultipartFile upfile,HttpSession session) { 

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
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ("/resources/uploadFiles/" + changeName);
	}
	
	private String saveFile(MultipartFile upfile, HttpSession session) {
		//파일명 수정 후 서버 업로드 시키기(ex-"이미지저장용(2).jpg => 20231109102712345.jpg)
		//년월일시분초 + 렌덤숫자 5개 + 확장자

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

		return changeName;
	}

	@RequestMapping("detail.sh")
	public String selectShop(int sno, Model model) {
	    Shop s = shopService.selectShop(sno);
	    
	    if (s != null) {
	        model.addAttribute("s", s);
	        return "shop/shopDetailView";
	    } else {
	        model.addAttribute("errorMsg", "게시글 작성 실패");
	        return "common/errorMsg";
	    }
	}
	
	@RequestMapping(value="updateForm.sh")
	public String updateForm(int sno, Model model) {
		
		model.addAttribute("s", shopService.selectShop(sno));
		
		return "shop/shopUpdateForm";
	}
	
	@RequestMapping(value="/update.sh")
	public String updateShop(Shop s, String filePath, MultipartFile upfile, MultipartFile reupfile, HttpSession session, Model model) {
		
		if(!reupfile.getOriginalFilename().equals("")) {
			String changeName = saveFile(reupfile, session);
			
			System.out.println(s);
			
			if(s.getOriginName() != null) {
				new File(session.getServletContext().getRealPath(s.getChangeName())).delete();
			}
			
			s.setOriginName(reupfile.getOriginalFilename());
			s.setChangeName("/resources/uploadFiles/" + changeName);
		}
		int result = shopService.updateShop(s);
		int result1 = shopService.updateFileShop(s);
		
		if(result * result1 > 0) {
			session.setAttribute("alertMsg", "상품 수정 완료");
			return "redirect:detail.sh?sno=" + s.getProductNo();
		} else {
			model.addAttribute("errorMsg", "상품 수정 실패");
			return "common/errorMsg";
		}
	}
	
	@RequestMapping(value="/delete.sh")
	public String deleteShop(int sno, HttpSession session, Model model) {
		
		int result = shopService.deleteShop(sno);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "상품 삭제 성공");
			return "redirect:list.sh";
		} else {
			model.addAttribute("errorMsg", "상품 삭제 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping(value="search.sh")
	public ModelAndView searchShop(@RequestParam(value="cpage", defaultValue="1") int currentPage, String condition,String keyword,ModelAndView mv) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		PageInfo pi = Pagenation.getPageInfo(shopService.selectSearchListCount(map), currentPage, 8, 5);
		ArrayList<Shop> list = shopService.selectSearchList(map, pi);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("condition", condition)
		  .addObject("keyword", keyword)
		  .setViewName("shop/shopListView");
		return mv;
	}
	
	@RequestMapping(value="/listasdf.SHbo")
	public String freeBoardList(int sno, int quantity, int total_amount, Model model) {
		
		Shop s = shopService.buyShop(sno);
	    
	    if (s != null) {
	        model.addAttribute("s", s);
	        model.addAttribute("quantity", quantity);
	        model.addAttribute("total_amount", total_amount);
	        return "shop/goodsPayment";
	    } else {
	        model.addAttribute("errorMsg", "게시글 작성 실패");
	        return "common/errorMsg";
	    }
	}
	
	@ResponseBody
	@RequestMapping("kakao.fr")
	public String kakao(@RequestBody KakaoRequestDto kakaoRequestDto) throws IOException  {
		URL pay;

			pay = new URL("https://kapi.kakao.com/v1/payment/ready");
		
		
			HttpURLConnection conn=(HttpURLConnection)pay.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "KakaoAK e04a6e1d2f48b503788cdd07f67dc975");
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			conn.setDoOutput(true);
//			String parameter ="cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=\"fishing\"&quantity=1&total_amount=2200&tax_free_amount=0&approval_url=http://localhost:8987/bigFish&fail_url=http://localhost:8987/fail&cancel_url=http://localhost:8987/cancel";
			String item_name_param = "\"" + kakaoRequestDto.getItem_name() + "\"";
			String parameter = ("cid=" + kakaoRequestDto.getCid() +
            "&partner_order_id=" + kakaoRequestDto.getPartner_order_id() +
            "&partner_user_id=" + kakaoRequestDto.getPartner_user_id() +
            "&item_name=" + item_name_param +
            "&quantity=" + kakaoRequestDto.getQuantity() +
            "&total_amount=" + kakaoRequestDto.getTotal_amount() +
            "&tax_free_amount=" + kakaoRequestDto.getTax_free_amount() +
            "&approval_url=" + kakaoRequestDto.getApproval_url() +
            "&fail_url=" + kakaoRequestDto.getFail_url() +
            "&cancel_url=" + kakaoRequestDto.getCancel_url());
			OutputStream i =conn.getOutputStream();
			DataOutputStream j =new DataOutputStream(i);
			System.out.println(parameter);
			j.writeBytes(parameter);
			int result1 = shopService.insertParameter(parameter);
			
			j.close();
			int result =conn.getResponseCode();
			System.out.println("fdsafdsafasdgbewsagase"+result);
			InputStream k ;
			if(result == 200) {
				k =conn.getInputStream();
			}else {
				k=conn.getErrorStream();
			}
			InputStreamReader l=new InputStreamReader(k);
			BufferedReader m =new BufferedReader(l);
		
			return m.readLine();
		
		
		
		
	}//이게진짜
	
	@ResponseBody
	@RequestMapping("pay.fr")
	 public String handlePaymentResult(@RequestBody KakaoRequestDto kakaoRequestDto) {
		   // 여기서 받은 데이터를 활용하여 원하는 로직을 수행
		
		
		                                
		   String pg_token=kakaoRequestDto.getPg_token();
		   int sno=kakaoRequestDto.getProductNo();
		   
		
		   String j=pg_token+","+sno;
		   
		   int result1 = shopService.updatePg_token(j);
	    System.out.println(sno+"파라미터"+pg_token);
        
        // TODO: 여기에 원하는 로직을 추가하세요.

        return "Success"; // 또는 다른 응답을 반환
    }
}
