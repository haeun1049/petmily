package com.project.petmily.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Petmily_Controller {
	
	
	
	/* 회사 소개 클릭 */
	@RequestMapping(value = "aboutUs")
	public String uboutUs() {
		
		return "AboutUs";
	}
	
	
	/* 결제 테스트 */ 
	@RequestMapping(value = "pay_test")
	public String pay_test() {
		
		return "pay_test";
	}
	
	/* 결제 성공 */ 
	@RequestMapping(value = "paySucess")
	public String paySucess() {
		
		return "paySucess";
	}
	
	/* 입양 후기로 이동 */ 
	@RequestMapping(value = "/ar_board")
	public String ar_board() {
		
		return "AdoptReview_List";
	}

	/* 입양 후기 글쓰러 이동 */ 
	@RequestMapping(value = "/ar_gowrite")
	public String ar_gowrite() {
		
		return "AdoptReview_Write";
	}
	

}
