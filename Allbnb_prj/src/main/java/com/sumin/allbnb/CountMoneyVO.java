package com.sumin.allbnb;

public class CountMoneyVO {

	private double service_percent;
	private int hotel_count;
	
	public CountMoneyVO() {
		System.out.println("CountMoneyVO진입");
	}

	public CountMoneyVO(double service_percent, int hotel_count) {
		super();
		this.service_percent = service_percent;
		this.hotel_count = hotel_count;
	}

	public double getService_percent() {
		return service_percent;
	}

	public void setService_percent(double service_percent) {
		this.service_percent = service_percent;
	}

	public int getHotel_count() {
		return hotel_count;
	}

	public void setHotel_count(int hotel_count) {
		this.hotel_count = hotel_count;
	}

	@Override
	public String toString() {
		return "CountMoneyVO [service_percent=" + service_percent + ", hotel_count=" + hotel_count + "]";
	}
	
	
}
