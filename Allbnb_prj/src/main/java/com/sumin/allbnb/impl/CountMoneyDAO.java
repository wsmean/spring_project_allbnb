package com.sumin.allbnb.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import com.sumin.allbnb.CountMoneyVO;

@Repository
public class CountMoneyDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public CountMoneyDAO() {
		System.out.println("CountMoneyDAO 들어옴");
	}


	public List<CountMoneyVO> loadCountMoneyList(CountMoneyVO vo) {
		System.out.println("loadCountMoneyList들어옴");
		List<CountMoneyVO> list = mybatis.selectList("com.sumin.allbnb.impl.CountMoneyDAO.loadCountMoneyList",vo);
		return list;
	}
	
	
	
}
