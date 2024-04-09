package com.sumin.allbnb.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sumin.allbnb.ShowReserveVO;

@Repository
public class ShowReserveDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public ShowReserveDAO() {
		System.out.println("showReserveDAO들어옴");
	}

	public List<ShowReserveVO> loadReserveList(ShowReserveVO vo) {
		System.out.println("loadReserveListDAO 들어옴");
		List<ShowReserveVO> list = mybatis.selectList("com.sumin.allbnb.impl.ShowReserveDAO.loadReserveList",vo);
		return list;
	}
	
	public void deleteReserve(ShowReserveVO vo) {
		System.out.println("deleteReserveDAO들어옴");
		mybatis.delete("com.sumin.allbnb.impl.ShowReserveDAO.deleteReserve",vo);
	}

}
