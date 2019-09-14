/* 2019.09.14
 * 새로운 데이터베이스 설계
 * 문제 시, 수정 바람
 * closet, codibook Table PK는 auto_increment속성 제외
 * Insert시, MAX로 조회 후 +1하는 방식
*/

/* 추가 사항 발생 시 해당 아래에 적어주기
 * 
 */

--회원들의 정보를 저장하기 위한 데이터베이스
create database user;

--접근권한 부여
grant ALL ON user.* TO 'man01'@'localhost'
IDENTIFIED BY 'man01';

/* 회원정보를 저장하는 테이블
 * 아이디(PK)
 * 비밀번호
 * 이름
 * 전화번호(01000000000)
 * */
create table member(
id varchar(30) not null,
password varchar(16),
name varchar(30),
phone varchar(11),
primary key(id)
);


/* 의상 넘버(PK)
 * 회원아이디(FK)
 * 의상 종류(상의면 t, 하의면 p)
 * 의상 정보(옷의 종류 = 맨투맨, 셔츠, 티셔츠, 자켓, 가디건 등등)
 * 의상 색상(옷의 색상 = 검정, 빨강, 노랑, 초록, 퍼플 등등)
 * */
create table closet(
num int(11) not null,
id varchar(30),
class varchar(1),
data varchar(30),
color varchar(30),
primary key(num),
constraint closet_id_fk foreign key(id) references member(id)
);


/* 회원이 마음에 드는 코디룩을 저장하는 테이블
 * 의상 넘버(PK)
 * 회원아이디(FK)
 * 코디 사진(쇼핑몰에서 파싱한 img명)
 * */
create table codibook(
num int(11) not null,
id varchar(30),
codi_img text,
primary key(num),
constraint codibook_id_fk foreign key(id) references member(id)
);