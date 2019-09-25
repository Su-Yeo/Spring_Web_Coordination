package com.coordination.dto;

public class MemberVO {

	private String id;
	private String password;
	private String name;
	private String phone;
	private String ghost;
	
	//Getter, Setter
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getGhost() {
		return ghost;
	}
	public void setGhost(String ghost) {
		this.ghost = ghost;
	}
}
