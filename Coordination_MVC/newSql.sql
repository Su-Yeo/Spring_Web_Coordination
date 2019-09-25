--회원들의 정보를 저장하기 위한 데이터베이스
create database user;

--접근권한 부여
grant ALL ON user.* TO 'man01'@'localhost'
IDENTIFIED BY 'man01';

/* 회원정보를 저장하는 테이블
 * 아이디(PK)
 * 비밀번호(비밀번호 암호화)
 * 이름
 * 전화번호(01000000000)
 * 회원 탈퇴 여부 (삭제 요청 시 y로 변경 후 비밀번호를 암호화 시킬 예정)
 * */
create table member(
id varchar(30) not null,
password varchar(50),
name varchar(30),
phone varchar(11),
ghost varchar(1) default 'n',
primary key(id)
);


/* 웹 파싱 후, 이미지를 분석해서 DB에 등록하는 테이블
 * 사진번호(PK)
 * 카테고리(상의)
 * 카테고리(하의)
 * 상의 색상
 * 하의 색상
 * 이미지 파일명
 */
create table style(
num int(11) not null auto_increment,
top varchar(30),
top_color varchar(30),
pants varchar(30),
pants_color varchar(30),
img varchar(50),
primary key(num)
);

/* 회원이 사진을 업로드하는 옷장 테이블
 * 번호(PK)
 * 회원 아이디(FK)
 * 카테고리
 * 색상
 * 이미지 파일명
 */
create table closet(
num int(11) not null auto_increment,
id varchar(30),
category varchar(30),
color varchar(30),
img varchar(50),
primary key(num),
constraint closet_id_fk foreign key(id) references member(id)
);

/* 회원이 마음에 드는 사진을 저장할 때 필요한 테이블
 * 번호(PK)
 * 회원 아이디(FK)
 * 이미지 파일명
 */

/*
dskfnsdkflndskr234120312u3/회원아이디.jpg
dskfnsdkflndskr234120312u3/회원아이디.jpg
dskfnsdkflndskr234120312u3/회원아이디
회원아이디
dskfnsdkflndskr234120312u3.jpg
 */
