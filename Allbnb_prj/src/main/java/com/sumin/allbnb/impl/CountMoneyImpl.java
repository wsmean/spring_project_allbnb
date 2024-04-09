package com.sumin.allbnb.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

import com.sumin.allbnb.CountService;
import com.sumin.allbnb.CountMoneyVO;

@Service("CountMoneyService")
public class CountMoneyImpl implements CountService{
	@Autowired
	private CountMoneyDAO countMoneyDAO;
	
	public CountMoneyImpl() {
		System.out.println("CountryMoneyImpl 들어옴");
	}
	
	@Override
	public List<CountMoneyVO> loadCountMoneyList(CountMoneyVO vo) {
		System.out.println("countMoneyimpl들어옴");
		return countMoneyDAO.loadCountMoneyList(vo);
	}

//	@Override
//	public List<CountMoneyVO> loadCountMoneyList(CountMoneyVO vo) {
//		System.out.println("countMoneyimpl들어옴");
//		return countMoneyDAO.loadCountMoneyList(vo);
//		
//	}
	
}
