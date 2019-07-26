package com.coordination.dto;

public class StyleVO {

	//사진번호
	//이미지명
	//상의종류 (하의종류 추가할지 고민중)
	//색상
	//조회 수
	//쇼핑몰코드
	//쇼핑몰 URL
	private int num;
	private String img_name;
	private String data;
	private String color;
	private int ref;
	private String shopcode;
	private String url;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getImg_name() {
		return img_name;
	}
	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public String getShopcode() {
		return shopcode;
	}
	public void setShopcode(String shopcode) {
		this.shopcode = shopcode;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
}
