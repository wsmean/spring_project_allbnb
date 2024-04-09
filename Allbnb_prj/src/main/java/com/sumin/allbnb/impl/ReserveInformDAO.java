package com.sumin.allbnb.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sumin.allbnb.ReserveInformVO;

@Repository
public class ReserveInformDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public ReserveInformDAO() {
		System.out.println("ReserveInformDAO들어옴");
	}
	
	public void insertReserve(ReserveInformVO vo) {
		System.out.println("insertReserveDAO 들어옴");
		mybatis.insert("com.sumin.allbnb.impl.ReserveInformDAO.insertReserve",vo);
		
	}

}
