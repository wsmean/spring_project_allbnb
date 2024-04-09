package com.sumin.allbnb.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sumin.allbnb.ShowReserveService;
import com.sumin.allbnb.ShowReserveVO;

@Service("ShowReserveService")
public class ShowReserveServiceImpl implements ShowReserveService{

	@Autowired
	private ShowReserveDAO showReserveDAO;
	
	@Override
	public List<ShowReserveVO> loadReserveList(ShowReserveVO vo){
		System.out.println("loadReserveList impl 들어옴");
		return showReserveDAO.loadReserveList(vo);
		
	}

	@Override
	public void deleteReserve(ShowReserveVO vo) {
		showReserveDAO.deleteReserve(vo);
		
	}
}
