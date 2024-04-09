package com.sumin.allbnb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sumin.allbnb.ShowReserveService;
import com.sumin.allbnb.ShowReserveVO;
import com.sumin.allbnb.impl.ShowReserveDAO;

@Controller
public class ShowReserveController {
	
	@Autowired
	ShowReserveService showReserveService;
	
	public ShowReserveController() {
		System.out.println("showReserveController 들어옴");
	}
	
	@RequestMapping("/showReserve.do")
	public String loadReserveList(String email, ShowReserveVO vo, ShowReserveDAO showDAO, Model model){
		System.out.println("email : "+email);
		vo.setEmail(email);
		model.addAttribute("showList",showReserveService.loadReserveList(vo));
		return "reserve.jsp";
	}
	
	@RequestMapping("/deleteReserve.do")
	public String deleteReserve(String email,ShowReserveVO vo, ShowReserveDAO showDAO){
		vo.setEmail(email);
		showReserveService.deleteReserve(vo);
		String email11 = vo.getEmail();
		return "redirect:showReserve.do?email="+email11;
	}
}
