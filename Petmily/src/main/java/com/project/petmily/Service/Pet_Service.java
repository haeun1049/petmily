package com.project.petmily.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.project.petmily.DAO.Pet_DAO;
import com.project.petmily.DTO.Paging_DTO;
import com.project.petmily.DTO.Pet_DTO;

@Service
public class Pet_Service {
	private ModelAndView mav;
	
	@Autowired
	private Pet_DAO pet_DAO;
	
	public ModelAndView admin_pet_writ(Pet_DTO pet_DTO) {
		
		mav = new ModelAndView();
		int writResult = pet_DAO.admin_pet_writ(pet_DTO);
		
		if (writResult>0) {
			mav.setViewName("home"); //수정
			
		} else {
			mav.setViewName("admin_pet_WriteJSP"); //수정
		}
		return mav;
	}

	//미분양된 강아지 all리스트 
	public ModelAndView Pet_Dog_allList(int page) {
	
		mav = new ModelAndView();
		
		Paging_DTO paging =new Paging_DTO();
		
		  if(page==0) {
	        	 page =1; 
	       	}else {
	       		paging.setPage(page);
	       	}
	         int limit =12;
	    	
	    	int Pet_Dog_allList_Count = pet_DAO.Pet_Dog_allList_Count();
	    	
	    	System.out.println("Pet_Dog_allList_Count값 : "+Pet_Dog_allList_Count);
	    	//출력할 범위값(db명령할때 숫자값) 계산하기
	    	
	    	int startRow =(page-1)*limit +1;
	    	int endRow =page*limit;
	    	
	        paging.setStartRow(startRow);
	        paging.setEndRow(endRow);
	        //내가 보고자 하는 페이지에 글을 가져오려면
	        //List<Pagingdto> boardList = boardDAO.boardListPaging(paging); 에서 
	        //List<Boarddto> boardList = boardDAO.boardListPaging(paging);로 해도된다.
	        
	        
	        List<Paging_DTO> Pet_Dog_allList = pet_DAO.Pet_Dog_allList_Paging(paging);
	    
	    	int maxPage =(int)((double)Pet_Dog_allList_Count/limit +0.9);
	    	int startPage = (((int)((double)page/10+0.9)) - 1 )* 10 + 1;
	    	int endPage = startPage +10 -1;
	    	 
	    	
	    	if(endPage>maxPage) {endPage=maxPage;}
	    	
	    	
	    	
	    	paging.setStartPage(startPage);
	    	paging.setEndPage(endPage);
	    	paging.setMaxPage(maxPage);
	    	paging.setBoardCount(Pet_Dog_allList_Count);
	    	
	    	
	        mav.addObject("paging", paging);
	        mav.addObject("Pet_Dog_allList", Pet_Dog_allList);
			mav.setViewName("dog_ListJsp");

			return mav;
	}

	public ModelAndView Pet_Dog_View(int pet_number) {
		mav = new ModelAndView();
		
		Pet_DTO petdto = pet_DAO.Pet_Dog_View(pet_number);
		mav.addObject("DogView", petdto);
		mav.setViewName("Pet_Dog_ViewJSP");

		return mav;
	}
	
  //분양 추천 
	public String Hitto(int pet_number) {
		int hit = pet_DAO.Hitto(pet_number);
		String hitplus = null;  
		
		if(hit>0){
			hitplus ="1";
		
		}else {
			hitplus ="0";
		}
		return hitplus;
	}
	
	//분양 추천 취소 
	public String likecancle(int pet_number) {
		int hit = pet_DAO.Hitcancle(pet_number);
		String hitplus = null;  
		
		if(hit==0){
			hitplus ="0";
		
		}else {
			hitplus ="1";
		}
		return hitplus;
	}

}
