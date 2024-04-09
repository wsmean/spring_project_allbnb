package com.sumin.allbnb;

public class ShowReserveVO {
	private String email;
	private int hotel_num;
	private int reserve_num;
	private String thumbnail;
	private String hotel_title;
	private String hotel_explain;
	private String check_in;
	private String check_out;
	
	public ShowReserveVO() {
		System.out.println("ShowReserveVO 들어옴");
	}

	public ShowReserveVO(String email, int hotel_num, int reserve_num, String thumbnail, String hotel_title,
			String hotel_explain, String check_in, String check_out) {
		super();
		this.email = email;
		this.hotel_num = hotel_num;
		this.reserve_num = reserve_num;
		this.thumbnail = thumbnail;
		this.hotel_title = hotel_title;
		this.hotel_explain = hotel_explain;
		this.check_in = check_in;
		this.check_out = check_out;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getHotel_num() {
		return hotel_num;
	}

	public void setHotel_num(int hotel_num) {
		this.hotel_num = hotel_num;
	}

	public int getReserve_num() {
		return reserve_num;
	}

	public void setReserve_num(int reserve_num) {
		this.reserve_num = reserve_num;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getHotel_title() {
		return hotel_title;
	}

	public void setHotel_title(String hotel_title) {
		this.hotel_title = hotel_title;
	}

	public String getHotel_explain() {
		return hotel_explain;
	}

	public void setHotel_explain(String hotel_explain) {
		this.hotel_explain = hotel_explain;
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

	@Override
	public String toString() {
		return "ShowReserveVO [email=" + email + ", hotel_num=" + hotel_num + ", reserve_num=" + reserve_num
				+ ", thumbnail=" + thumbnail + ", hotel_title=" + hotel_title + ", hotel_explain=" + hotel_explain
				+ ", check_in=" + check_in + ", check_out=" + check_out + "]";
	}

	
	
	
}
