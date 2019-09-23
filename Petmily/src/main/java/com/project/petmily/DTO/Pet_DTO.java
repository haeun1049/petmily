package com.project.petmily.DTO;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Pet_DTO {
	
	private int pet_number; //펫번호
	private String pet_size; //펫 크기 
	private String pet_kategorie; // 펫 종류 
	private String pet_name; // 펫 이름 (펫 종 ex>포메라니안,진돗개)
	private int pet_live; // 생후 개월수 
	private int pet_hit; //펫 추천수 
	private int pet_price; // 분양 가격
	private int pet_adopt; // 분양 예약 유무 
	private int adopt_confirm; //분양 확인 (초기값 0으로 인설트 하기 )
	private String pet_profile; //펫 프로필 사진 
	private MultipartFile pet_profile_file; //펫 프로필 사진 
	private String pet_trailer; //펫 소개 동영상 
//	private MultipartFile pet_trailer_file; //펫 소개 동영상  링크 할거여서 필요음슴 
	private String pet_contents; // 펫 소개글 
	private String pet_inoculation; //펫 접종 

	

	

}