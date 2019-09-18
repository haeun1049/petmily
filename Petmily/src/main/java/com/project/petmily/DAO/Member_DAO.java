package com.project.petmily.DAO;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.petmily.DTO.Member_DTO;
@Repository
public class Member_DAO {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	public int memberJoin(Member_DTO memberDTO) {
		return sql.insert("Member.memberJoin",memberDTO);
	}
	public Member_DTO memberLogin(Member_DTO memberDTO) {
		return sql.selectOne("Member.memberlogin",memberDTO);
	}
	public String idOverlap(String id) {
		return sql.selectOne("Member.idOverlap",id);
	}
	public String nameOverlap(String name) {
		return sql.selectOne("Member.nameOverlap",name);
	}
	public int joinFile(Member_DTO memberDTO) {
		return sql.insert("Member.joinFile",memberDTO);
	}
	public List<Member_DTO> memberList() {
		return sql.selectList("Member.memberList");
	}
	public  Member_DTO memberView(String id) {
		return sql.selectOne("Member.memberView",id);
	}
	public int MemberModify(Member_DTO memberDTO) {
		return sql.update("Member.memberModify",memberDTO);		
	}
	public int memberDelete(String id) {
		return sql.delete("Member.memberDelete",id);
	}
	public void logout(HttpSession session) {
		
	}
	// 이메일 인증
		public int approval_member(Member_DTO memberDTO) throws Exception{
		return sql.update("Member.approval_member", memberDTO);
		}	
		// 비밀번호 변경
		
	public int update_pw(Member_DTO memberDTO) throws Exception{
		return sql.update("Member.update_pw", memberDTO);
				}
	//아이디 찾기
	public String select_id(Member_DTO memberDTO) {
		return sql.selectOne("Member.select_id", memberDTO);
	}	

}
