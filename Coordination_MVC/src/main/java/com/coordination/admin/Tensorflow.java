package com.coordination.admin;

public interface Tensorflow {

	//전신 이미지를 상의/하의로 구분
	//상의 : 원본이미지에 상의부분을 덮어씌움
	//하의 : 원본이미지.1jpg
	//원본 : 원본이미지.2jpg로 Copy
	public void Cut(String image);
	
	//관리자-상의 이미지 분석
	public void admin_Upper(String image);
	
	//관리자-하의 이미지 분석
	public void admin_Lower(String image);
	
	//관리자-쇼핑몰 이름 업데이트
	public void admin_ShopName(String shopName);
	
	//관리자-사진 이미지 복구
	public void admin_restore(String image);
	
	//사용자-상의 이미지 분석
	public void user_Upper(String image);

	//사용자-하의 이미지 분석
	public void user_Lower(String image);
	
}
