package com.sumin.allbnb.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sumin.allbnb.ReserveInformService;
import com.sumin.allbnb.ReserveInformVO;

@Service("reserveService")
public class ReserveInformServiceImpl implements ReserveInformService{
	
	@Autowired
	private ReserveInformDAO reserveInformDAO;
	
	public void insertReserve(ReserveInformVO vo) {
		reserveInformDAO.insertReserve(vo);
	}
}
