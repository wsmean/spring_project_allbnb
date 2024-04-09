package com.sumin.allbnb;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class HotelInformVO {

	private int hotel_num;
	private String country_name;
	private String hotel_title;
	private String host_name;
	private String hotel_name;
	private String hotel_explain;
	private int hotel_price;
	private String thumbnail;
	private String img1;
	private String img2;
	private String img3;
	private String img4;
	
	private String search_country;
	
	public HotelInformVO() {
		System.out.println("hotelInformVO");
	}
	
	

	public HotelInformVO(String search_country) {
		
		this.search_country = search_country;
	}
	
	@JsonIgnore
	public String getSearch_country() {
		return search_country;
	}



	public void setSearch_country(String search_country) {
		this.search_country = search_country;
	}



	public HotelInformVO(int hotel_num, String country_name, String hotel_title, String host_name, String hotel_name,
			String hotel_explain, int hotel_price, String thumbnail, String img1, String img2, String img3,
			String img4) {
		super();
		this.hotel_num = hotel_num;
		this.country_name = country_name;
		this.hotel_title = hotel_title;
		this.host_name = host_name;
		this.hotel_name = hotel_name;
		this.hotel_explain = hotel_explain;
		this.hotel_price = hotel_price;
		this.thumbnail = thumbnail;
		this.img1 = img1;
		this.img2 = img2;
		this.img3 = img3;
		this.img4 = img4;
	}

	public int getHotel_num() {
		return hotel_num;
	}

	public void setHotel_num(int hotel_num) {
		this.hotel_num = hotel_num;
	}

	public String getCountry_name() {
		return country_name;
	}

	public void setCountry_name(String country_name) {
		this.country_name = country_name;
	}

	public String getHotel_title() {
		return hotel_title;
	}

	public void setHotel_title(String hotel_title) {
		this.hotel_title = hotel_title;
	}

	public String getHost_name() {
		return host_name;
	}

	public void setHost_name(String host_name) {
		this.host_name = host_name;
	}

	public String getHotel_name() {
		return hotel_name;
	}

	public void setHotel_name(String hotel_name) {
		this.hotel_name = hotel_name;
	}

	public String getHotel_explain() {
		return hotel_explain;
	}

	public void setHotel_explain(String hotel_explain) {
		this.hotel_explain = hotel_explain;
	}

	public int getHotel_price() {
		return hotel_price;
	}

	public void setHotel_price(int hotel_price) {
		this.hotel_price = hotel_price;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getImg1() {
		return img1;
	}

	public void setImg1(String img1) {
		this.img1 = img1;
	}

	public String getImg2() {
		return img2;
	}

	public void setImg2(String img2) {
		this.img2 = img2;
	}

	public String getImg3() {
		return img3;
	}

	public void setImg3(String img3) {
		this.img3 = img3;
	}

	public String getImg4() {
		return img4;
	}

	public void setImg4(String img4) {
		this.img4 = img4;
	}

	@Override
	public String toString() {
		return "HotelInformVO [hotel_num=" + hotel_num + ", country_name=" + country_name + ", hotel_title="
				+ hotel_title + ", host_name=" + host_name + ", hotel_name=" + hotel_name + ", hotel_explain="
				+ hotel_explain + ", hotel_price=" + hotel_price + ", thumbnail=" + thumbnail + ", img1=" + img1
				+ ", img2=" + img2 + ", img3=" + img3 + ", img4=" + img4 + "]";
	}
	
}
