package com.sumin.allbnb.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sumin.allbnb.HotelInformVO;

@Repository
public class HotelInformDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public HotelInformDAO() {
		System.out.println("hotelInformDAO");
	}
	
	
	
	public HotelInformDAO(SqlSessionTemplate mybatis) {
		System.out.println("mybatis hotellInformDAO들어옴");
		this.mybatis = mybatis;
	}


	
	public List<HotelInformVO> loadHotelList(){
        System.out.println("dao loadHotelList 들어옴");
        List<HotelInformVO> list = mybatis.selectList("com.sumin.allbnb.impl.HotelInformDAO.loadHotelList");
        System.out.println("list : "+list);
		return list;
	}
	
	public List<HotelInformVO> loadminHotelList(HotelInformVO vo){
        System.out.println("dao loadminHotelList 들어옴");
        List<HotelInformVO> list = mybatis.selectList("com.sumin.allbnb.impl.HotelInformDAO.loadminHotelList",vo);
        System.out.println("list : "+list);
		return list;
	}
	
	public List<HotelInformVO> loadHotelCountryList(HotelInformVO vo){
		System.out.println("dao loadHotelCountryList 들어옴");
		List<HotelInformVO> list = mybatis.selectList("com.sumin.allbnb.impl.HotelInformDAO.loadHotelCountryList",vo);
        System.out.println("list : "+list);
		return list;
	}



	public List<HotelInformVO> loadHotelDetail(HotelInformVO vo) {
		System.out.println("dao loadHotelDetail 들어옴");
		List<HotelInformVO> list = mybatis.selectList("com.sumin.allbnb.impl.HotelInformDAO.loadHotelDetail",vo);
		System.out.println("list"+list);
		return list;
	}

}
