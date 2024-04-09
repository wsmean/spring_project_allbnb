package com.sumin.allbnb.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.sumin.allbnb.MembersService;
import com.sumin.allbnb.MembersVO;
import com.sumin.allbnb.impl.MembersDAO;

@Controller
@SessionAttributes("members")
public class MembersController {
	
	@Autowired
	MembersService membersService;
	
	public MembersController() {
		System.out.println("memberscontroller진입");
		}
	
	@RequestMapping("/admin.do")
	public String loadMembersList(MembersVO vo, MembersDAO membersDAO, Model model) {
		System.out.println("멤버 조회 처리 ");
		model.addAttribute("membersList", membersService.loadMembersList());
		System.out.println("이거는 : "+membersService.loadMembersList());
		return "admin.jsp";
		
	}
	
	@RequestMapping("/deleteMembers.do")
	public String deleteMembers(MembersVO vo, MembersDAO membersDAO) {
		System.out.println("멤버삭제처리");
		membersService.deleteMembers(vo);
		return "admin.do";
		
	}
	
	@RequestMapping("/test.do")
	public String test() {
		System.out.println("testcontroller들어옴");
		return "test";
	}
	
	@RequestMapping("/insert_join.do")
	@ResponseBody
	public void insertMembers(MembersVO vo,
	@RequestParam
	(value = "user_name",required = false) String user_name,
	@RequestParam
	(value = "user_email",required = false) String user_email,
	@RequestParam
	(value = "user_pwd",required = false) String user_pwd){
	System.out.println("insert_login들어옴");
	System.out.println("이름 : "+user_name);
	System.out.println("이메일 : "+user_email);
	System.out.println("비밀번호 : "+user_pwd);
		vo.setName(user_name);
		vo.setEmail(user_email);
		vo.setPassword(user_pwd);
		membersService.insertMembers(vo);
	}
	
	@RequestMapping(value="/join_check.do", method = RequestMethod.GET)
	@ResponseBody
	public String join_check(MembersVO vo, MembersDAO membersDAO,
	@RequestParam
	(value = "email_", required = false) String email1) {
		System.out.println("1. 아이디 중복확인 처리...");

		vo.setEmail(email1);
		System.out.println("2."+email1);
		String user =membersService.join_check(vo);
		
		System.out.println("이거뭐야 :"+membersService.join_check(vo));
//		String user = membersDAO.join_check(vo); service에서 dao를 부르기에 중복
		System.out.println("4.값은?:" + user);
		
		//화면 출력
		//ajax에서 data 값으로 나오는 것!!
		if(user == "id_use") {
			System.out.println("5.아이디 사용 불가 ");
			return "true";
		}else {
			System.out.println("5.아이디 사용 가능");
			return "false";
		}
		
	}
	
	@RequestMapping(value="/login.do", method = RequestMethod.GET)
	@ResponseBody
	public String login_check(MembersVO vo, MembersDAO membersDAO,
	@RequestParam
	(value = "email_", required = false) String email1,
	@RequestParam
	(value = "pwd_", required = false) String pwd1) {
		System.out.println("로그인 처리");
		
		vo.setEmail(email1);
		vo.setPassword(pwd1);
		
		String user = membersService.login_check(vo);
		if(user == "login_ok") {
			return "login_true";
		}else {
			return "login_false";			
		}
		
		
		
	}
	
}
