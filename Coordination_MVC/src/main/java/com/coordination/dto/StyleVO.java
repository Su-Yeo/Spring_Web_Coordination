package com.coordination.dto;

import java.util.Date;

public class StyleVO {
	
	private int num;
	private String top;
	private String top_color;
	private String pants;
	private String pants_color;
	private String img;
	private Date reg_date;
	private String identify;
	
	//Getter Setter
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTop() {
		return top;
	}
	public void setTop(String top) {
		this.top = top;
	}
	public String getTop_color() {
		return top_color;
	}
	public void setTop_color(String top_color) {
		this.top_color = top_color;
	}
	public String getPants() {
		return pants;
	}
	public void setPants(String pants) {
		this.pants = pants;
	}
	public String getPants_color() {
		return pants_color;
	}
	public void setPants_color(String pants_color) {
		this.pants_color = pants_color;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getIdentify() {
		return identify;
	}
	public void setIdentify(String identify) {
		this.identify = identify;
	}
}
