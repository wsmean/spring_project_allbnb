package com.sumin.allbnb;

public class ReserveInformVO {
	private int hotel_num;
	private String email;
	private String check_in;
	private String check_out;
	private int hotel_total_price;
	private int hotel_stay;
	
	public ReserveInformVO() {
		System.out.println("hotelInformVO들어옴");
	}

	public ReserveInformVO(int hotel_num, String email, String check_in, String check_out, int hotel_total_price,
			int hotel_stay) {
		super();
		this.hotel_num = hotel_num;
		this.email = email;
		this.check_in = check_in;
		this.check_out = check_out;
		this.hotel_total_price = hotel_total_price;
		this.hotel_stay = hotel_stay;
	}

	public int getHotel_num() {
		return hotel_num;
	}

	public void setHotel_num(int hotel_num) {
		this.hotel_num = hotel_num;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCheck_in() {
		return check_in;
	}

	public void setCheck_in(String check_in) {
		this.check_in = check_in;
	}

	public String getCheck_out() {
		return check_out;
	}

	public void setCheck_out(String check_out) {
		this.check_out = check_out;
	}

	public int getHotel_total_price() {
		return hotel_total_price;
	}

	public void setHotel_total_price(int hotel_total_price) {
		this.hotel_total_price = hotel_total_price;
	}

	public int getHotel_stay() {
		return hotel_stay;
	}

	public void setHotel_stay(int hotel_stay) {
		this.hotel_stay = hotel_stay;
	}

	@Override
	public String toString() {
		return "ReserveInformVO [hotel_num=" + hotel_num + ", email=" + email + ", check_in=" + check_in
				+ ", check_out=" + check_out + ", hotel_total_price=" + hotel_total_price + ", hotel_stay=" + hotel_stay
				+ "]";
	}
	
	

}
