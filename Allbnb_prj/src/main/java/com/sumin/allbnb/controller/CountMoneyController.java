package com.sumin.allbnb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.sumin.allbnb.CountMoneyVO;
import com.sumin.allbnb.CountService;
import com.sumin.allbnb.impl.CountMoneyDAO;

@Controller
@SessionAttributes("CountMoney")
public class CountMoneyController {
	
	@Autowired
	CountService countSercie;
	
	public CountMoneyController() {
		System.out.println("CountService들어옴");
	}
	
	@RequestMapping("/loadCount.do")
	public String loadCountMoneyList(int count_hotel,CountMoneyVO vo, CountMoneyDAO countDAO, Model model) {
		System.out.println("들어온값 : "+count_hotel);
		vo.setHotel_count(count_hotel);
		System.out.println("검색 : "+vo.getHotel_count());
		System.out.println("일수 별 퍼센트 처리");
		model.addAttribute("count_num",vo.getService_percent());
		double count_percent = (double) vo.getService_percent();
		System.out.println("갖고 온 서비스 퍼센트 : "+count_percent);
		return"detail.jsp";
	}
	
	

}
