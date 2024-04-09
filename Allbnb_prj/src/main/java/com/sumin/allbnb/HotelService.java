package com.sumin.allbnb;

import java.util.Collection;
import java.util.List;

public interface HotelService {

	List<HotelInformVO> loadHotelList();


	List<HotelInformVO> loadHotelCountryList(HotelInformVO vo);


	List<HotelInformVO> loadHotelDetail(HotelInformVO vo);



	List<HotelInformVO> loadminHotelList(HotelInformVO vo);

}
