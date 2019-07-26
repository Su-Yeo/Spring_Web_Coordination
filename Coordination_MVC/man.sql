Create Database man;

GRANT ALL ON man.* TO 'test'@'localhost'
IDENTIFIED BY 'test1234';

Create Table shop(
shopcode varchar(5) NOT NULL,
shopname varchar(30),
little varchar(1),
Primary Key(shopcode)
);

Create Table style(
num int(11) Not NULL Auto_Increment,
img_name varchar(50),
data varchar(50),
color varchar(50),
ref int(11),
shopcode varchar(5),
url text,
Primary Key(num),
Constraint style_shopcode_fk Foreign Key(shopcode) References shop(shopcode)
);


Insert Into shop VALUES('E01', 'buySlim', 'n');

Insert Into style(img_name, data, color, ref, shopcode, url)
VALUES('1.jpg', 'harf-tshirt', 'black/blue', 0, 'E01', 'https://www.byslim.com/product/5%EB%B6%80-%EB%B9%84%EC%B9%A8%EC%97%86%EC%9D%B4%EC%A6%90%EA%B2%A8-%EB%B0%98%ED%8C%94%ED%8B%B0/16345/category/765/display/1/');

Insert Into style(img_name, data, color, ref, shopcode, url)
VALUES('6.jpg', 'harf-shirt', 'white/black', 0, 'E01', 'https://www.byslim.com/product/%EC%98%AC%EC%97%AC%EB%A6%84%EB%8F%84%EB%B6%80%ED%83%81%ED%95%B4-%EB%A6%B0%EB%84%A8-%EB%B0%98%ED%8C%94%EC%85%94%EC%B8%A0mu/20244/category/765/display/1/');

Insert Into style(img_name, data, color, ref, shopcode, url)
VALUES('21.jpg', 't-shirt', 'blue/white', 0, 'E01', 'https://www.byslim.com/product/7%EB%B6%80-%EC%A6%90%EA%B8%B8%EB%9D%BD-%EC%88%8F%EC%99%80%EC%9D%B4%EB%93%9C%ED%8B%B0-msize-%EB%8B%A8%EB%8F%85%EC%A7%84%ED%96%89/19846/category/765/display/1/');

Insert Into style(img_name, data, color, ref, shopcode, url)
VALUES('50.jpg', 'shirt', 'white/blue', 0, 'E01', 'https://www.byslim.com/product/%EC%9E%85%EC%96%B4%EB%B4%84-%EC%98%A4%EB%B2%84%ED%95%8F-%EC%82%AC%EC%8A%ACst-%EC%85%94%EC%B8%A0/15533/category/170/display/1/');
