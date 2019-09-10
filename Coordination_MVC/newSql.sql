--2019.09.10 변경 사항
--data Table에 img속성 추가
--closet Table에 class속성 추가
--data / closet Table auto_increment속성 추가

--데이터셋으로 사용하기 위한 데이터베이스 생성
create database dataset;

--접근권한 부여
grant ALL ON dataset.* TO 'man01'@'localhost'
IDENTIFIED BY 'man01';

/* 데이터셋을 저장하기 위한 테이블
 * 상의 정보
 * 상의 색상
 * 하의 정보
 * 하의 색상
 * 모든 정보는 초기에 관리자가 코디룩의 사진을 Tensorflow기법을 통해 이미지 분석 후 저장
 * */
create table data(
num int(11) not null auto_increment,
top varchar(30),
top_color varchar(30),
pants varchar(30),
pants_color varchar(30),
img varchar(50),
primary key(num)
);

--회원들의 정보를 저장하기 위한 데이터베이스
create database user;

--접근권한 부여
grant ALL ON user.* TO 'man02'@'localhost'
IDENTIFIED BY 'man02';

/* 회원정보를 저장하는 테이블
 * 아이디
 * 비밀번호
 * 이름
 * 전화번호
 * */
create table member(
id varchar(30) not null,
password varchar(16),
name varchar(30),
phone varchar(11),
primary key(id)
);


/* 회원이 자신의 옷장에 상,하의 옷을 등록하면 Tensorflow기법을 통해 이미지 분석 후 등록
 * 회원아이디(fk)
 * 옷의 정보
 * 옷의 색상
 * 이미지명(단일 파일)
 * */
-- 2019.09.10변경사항
-- 상의 / 하의 구분하는 속성 추가(class)
-- 상의면 Top의 t, 하의면 Pants의 p
create table closet(
num int(11) not null auto_increment,
id varchar(30),
class varchar(1),
data varchar(30),
color varchar(30),
img varchar(30),
primary key(num),
constraint closet_id_fk foreign key(id) references member(id)
);


/* 회원이 마음에 드는 코디룩을 저장하는 테이블
 * 회원아이디(fk)
 * 상의 정보
 * 상의 색상
 * 하의 정보
 * 하의 색상
 * 이미지명(상의사진명 / 하의사진명)
 * */
create table codibook(
num int(11) not null,
id varchar(30),
top varchar(30),
top_color varchar(30),
pants varchar(30),
pants_color varchar(30),
img_name varchar(50),
primary key(num),
constraint codibook_id_fk foreign key(id) references member(id)
);





