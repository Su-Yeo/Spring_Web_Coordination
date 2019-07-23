Create Database man;

GRANT ALL ON man.* TO 'test'@'localhost'
IDENTIFIED BY 'test1234';

Create Table style(
num int(11) Not Null Auto_Increment,
img_name varchar(50),
data varchar(50),
color varchar(50),
ref int(11),
shopcode varchar(5),
url text,
Primary Key(num)
);

Create Table shop(
shopcode varchar(5) NOT NULL,
shopname varchar(30),
short varchar(1),
Primary Key(shopcode)
);

insert into style(img_name,data,color)
values('1.jpg','harf-tshirt','yellow');
insert into style(img_name,data,color)
values('2.jpg','harf-tshirt','gray');
insert into style(img_name,data,color)
values('3.jpg','t-shirt','black');
insert into style(img_name,data,color)
values('4.jpg','coat','gray');
insert into style(img_name,data,color)
values('5.jpg','coat','ivory');
insert into style(img_name,data,color)
values('6.jpg','coat','ivory');
insert into style(img_name,data,color)
values('7.jpg','coat','black');
insert into style(img_name,data,color)
values('8.jpg','t-shirt','black/white');