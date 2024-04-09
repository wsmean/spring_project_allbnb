package com.sumin.allbnb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.sumin.allbnb.ReserveInformService;
import com.sumin.allbnb.ReserveInformVO;

@Controller
public class ReserveInformController {
	
	@Autowired
	ReserveInformService reserveService;
	
	public ReserveInformController() {
		System.out.println("ReserveController들어옴");
	}
	
	@RequestMapping("/insertReserve.do")
	@ResponseBody
	public void insertReserve(ReserveInformVO vo,
	@RequestParam
	(value = "r_hotel_num",required = false) int hotel_num,
	@RequestParam
	(value = "r_email",required = false) String reserve_email,
	@RequestParam
	(value = "r_check_in",required = false) String check_in,
	@RequestParam
	(value = "r_check_out",required = false) String check_out,
	@RequestParam
	(value = "r_total_price",required = false) int total_price,
	@RequestParam
	(value = "r_hotel_bak",required = false) int hotel_bak) {
	System.out.println("insertReserve 들어옴");
	System.out.println("들어온 정보");
	System.out.println(hotel_num);
	System.out.println(reserve_email);
	System.out.println(check_in);
	System.out.println(check_out);
	System.out.println(total_price);
	System.out.println(hotel_bak);
	vo.setHotel_num(hotel_num);
	vo.setEmail(reserve_email);
	vo.setCheck_in(check_in);
	vo.setCheck_out(check_out);
	vo.setHotel_total_price(total_price);
	vo.setHotel_stay(hotel_bak);
	reserveService.insertReserve(vo);
	
	}
	
	
			

}
