package com.sumin.allbnb;

import java.util.List;

public interface ShowReserveService {

	List<ShowReserveVO> loadReserveList(ShowReserveVO vo);

	void deleteReserve(ShowReserveVO vo);

}
