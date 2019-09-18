package com.project.petmily.Controller;

import java.io.File;
import java.io.IOException;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.petmily.DTO.Pet_DTO;
import com.project.petmily.Service.Pet_Service;


@Controller
public class Pet_Controller {
	
	@Autowired
	private Pet_Service Pet_service; 
	
	@Autowired
	private HttpSession session;
	
	private ModelAndView mav;
	/* 회사 소개 클릭 */
	@RequestMapping(value = "Item_puffy")
	public String Item_puffy() {
		
		return "AboutUs";
	}
	
	/* 회사 소개 클릭 */
	@RequestMapping(value = "Item_cat")
	public String Item_cat() {
		
		return "AboutUs";
	}
	
	 //admin만 할수 있는 펫등록하러가기
	@RequestMapping(value = "admin_pet")
	public String admin_pet() {
		
		return "admin_pet_WriteJSP";
	}
	
	
	 //admin만 할수 있는 펫등록
  @RequestMapping(value ="/admin_pet_writ")
	public ModelAndView admin_pet_writ(@ModelAttribute Pet_DTO pet_DTO) throws IllegalStateException, IOException {
	 mav = new ModelAndView();
	 System.out.println("컨트롤러엔 넘어오나?"+pet_DTO.getPet_name());
	 
	MultipartFile pet_profile_file = pet_DTO.getPet_profile_file(); //펫 프로필 사진
	String fileName = pet_profile_file.getOriginalFilename();//펫 프로필 사진
//	MultipartFile pet_trailer_file = pet_DTO.getPet_profile_file(); //펫 소개 동영상 
//	String fileName2 = pet_trailer_file.getOriginalFilename();//펫 소개 동영상 
	
	String savePath = "C:\\Users\\user\\Desktop\\Petmily (2)\\src\\main\\webapp\\resources\\petUploadFile\\"+fileName;
//	String savePath2 = "C:\\Users\\user\\Desktop\\Petmily (2)\\src\\main\\webapp\\resources\\petUploadFile\\"+fileName2;
		    //수정하기
	if(!pet_profile_file.isEmpty()) {//펫 프로필 사진
		pet_profile_file.transferTo(new File(savePath));
		}
//	
//	if(!pet_trailer_file.isEmpty()) {//펫 소개 동영상 
//		pet_trailer_file.transferTo(new File(savePath2));
//		}
	pet_DTO.setPet_profile(fileName);//펫 프로필 사진
//	pet_DTO.setPet_trailer(fileName2);//펫 소개 동영상 
	
	 mav = Pet_service.admin_pet_writ(pet_DTO);
				
	 return mav;
		}
  
  
  //미분양된 강아지 all리스트 (이미지 띄워줘야함 )
  @RequestMapping(value = "/Pet_Dog_List", method = RequestMethod.GET)
	public ModelAndView Pet_Dog_allList(@RequestParam("page") int page) {
   
		mav = new ModelAndView();
		mav = Pet_service.Pet_Dog_allList(page);

		return mav;

	}
  
  
	//강아지 상세 보기 
	@RequestMapping(value ="/Pet_Dog_View", method = RequestMethod.GET)
	public ModelAndView Pet_Dog_View(@RequestParam("pet_number") int pet_number) {
	// @RequestParam("page") int page 넣기 
		mav = new ModelAndView();
		mav = Pet_service.Pet_Dog_View(pet_number);
	
		return mav;
}
	
	//분양 추천 (강아지)
	@RequestMapping(value="liketo")
	public @ResponseBody String  liketo(@RequestParam("pet_number") int pet_number){
		
		 // Pet_DTO petdto = new Pet_DTO();
		  String UpdateResult = Pet_service.Hitto(pet_number);
        
		  if(UpdateResult.equals("1") ) {
        	session.setAttribute("sessionHit",UpdateResult);
        }
        
//		 int pet_hit = Pet_service.Hitto(pet_number);
//		// pet_hit = Pet_service.Hitto(pet_number);
//
//		if(pet_hit ==1) { //좋아요 
//			session.setAttribute("sessionHit",pet_hit);
//			
//		}else { //좋아요 안됨.
//			
//			
//		}
		return UpdateResult;
}
	
	
	//분양 추천취소  (강아지)
		@RequestMapping(value="likecancle")
		public @ResponseBody String  likecancle(@RequestParam("pet_number") int pet_number){
			
			 // Pet_DTO petdto = new Pet_DTO();
			  String UpdateResult = Pet_service.likecancle(pet_number);
	        if(UpdateResult.equals("0") ) {
	        	session.setAttribute("sessionHit",UpdateResult);
	        }

			return UpdateResult;
	}
  
  
  
  
  
	

	



}