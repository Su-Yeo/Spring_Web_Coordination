package com.coordination.weather;

public class Coord {
	private String sx;
	private String sy;
	
	public Coord(String x, String y){
		sx = x;
		sy = y;
	}
	public String getSx() {
		return sx;
	}
	public void setSx(String sx) {
		this.sx = sx;
	}
	public String getSy() {
		return sy;
	}
	public void setSy(String sy) {
		this.sy = sy;
	}
	
}