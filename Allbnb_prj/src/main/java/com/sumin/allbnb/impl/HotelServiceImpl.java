package com.sumin.allbnb.impl; 

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sumin.allbnb.HotelInformVO;
import com.sumin.allbnb.HotelService;

@Service("hotelService")
public class HotelServiceImpl implements HotelService{
	@Autowired
	private HotelInformDAO hotelInformDAO;
	
	public HotelServiceImpl() {
		System.out.println("hotelServiceImpl 들어옴");
	}
	
	@Override
	public List<HotelInformVO> loadHotelList(){
		System.out.println("hotle list impl들어옴");
    	System.out.println("serviceimpl값 :"+hotelInformDAO.loadHotelList());
        return hotelInformDAO.loadHotelList();
    }
	
	@Override
	public List<HotelInformVO> loadminHotelList(HotelInformVO vo){
		System.out.println("hotle list impl들어옴");
        return hotelInformDAO.loadminHotelList(vo);
    }

	@Override
	public List<HotelInformVO> loadHotelCountryList(HotelInformVO vo) {
		System.out.println("hotle country list impl들어옴");
    	System.out.println("serviceimpl값 :"+hotelInformDAO.loadHotelList());
		return hotelInformDAO.loadHotelCountryList(vo);
	}

	@Override
	public List<HotelInformVO> loadHotelDetail(HotelInformVO vo) {
		System.out.println("hotel Detail impl 들어옴");
		return hotelInformDAO.loadHotelDetail(vo);
	}


}
