package com.project.petmily.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.petmily.DTO.Paging_DTO;
import com.project.petmily.DTO.Pet_DTO;

@Repository
public class Pet_DAO {

	@Autowired
	private SqlSessionTemplate sql;
	
    // 관리자만 쓸수 있는 미분양 애완동물 작성 
	public int admin_pet_writ(Pet_DTO pet_DTO) {
		
		return sql.insert("Pet.admin_pet_writ",pet_DTO); 
	}

	//페이징 카운트 
	public int Pet_Dog_allList_Count() {
		
		return sql.selectOne("Pet.Pet_Dog_allList_Count"); 
	}

	// 강아지리스트  페이징 처리 
	public List<Paging_DTO> Pet_Dog_allList_Paging(Paging_DTO paging) {
		
		return sql.selectList("Pet.Pet_Dog_allList_Paging",paging); 
	}

	public Pet_DTO Pet_Dog_View(int pet_number) {
		return sql.selectOne("Pet.Pet_Dog_View",pet_number);
	}

	public int Hitto(int pet_number) {
		return sql.update("Pet.like_check",pet_number);
	}
	
	//분양글 취소 
	public int Hitcancle(int pet_number) {
		return sql.update("Pet.like_check_cancel",pet_number);
	}

	
	
	
}
