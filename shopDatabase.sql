CREATE TABLE user(
name VARCHAR(20) NOT NULL,
id varchar(20) PRIMARY KEY,
pw VARCHAR(20) NOT NULL,
email varchar(50) NOT NULL,
postcode VARCHAR(6) NOT NULL,
roadAddress VARCHAR(40) NOT NULL,
jibunAddress VARCHAR(40) NOT NULL,
detailAddress VARCHAR(40) NOT NULL,
extraAddress VARCHAR(40) NOT NULL,
birthYear INT NOT NULL,
birthMonth INT NOT NULL,
birthDate INT NOT NULL,
cellphone CHAR(11) NOT NULL,
gender CHAR(6) NOT NULL,
wTime datetime default current_timestamp,		
withdrawal char(2) default 'n',					
verify int default '0'	
);

create table product(
product_id varchar(20) primary key,
product_name varchar(200) not null,
product_desc varchar(400) not null,
cost int,											
price int,											
discount int,										
product_image varchar(50),
product_use	char(1) default 'y',					
product_reg datetime default current_timestamp,	    
product_kind int not null,							
product_category char(2)							
);

create table product_detail(
no int auto_increment primary key,
product_id varchar(20) not null,
product_name varchar(200) not null,
cost int not null,											
price int not null,											
discount int not null,										
product_image varchar(50) not null,
unit varchar(100),											
weight varchar(100),										
origin varchar(100),										
shelf_life varchar(100),										
guide text,													
desc_image varchar(50) not null,							
foreign key (product_id) references product (product_id) on delete cascade 
);

create table manager(
m_id varchar(20) PRIMARY KEY,
m_pw varchar(20) not null,
m_name varchar(20) not null,
m_email varchar(50) not null,
m_cellphone char(11) not null,
verify int default '1'											
);

create table cart(
id varchar(20),										
product_id varchar(20),								
product_name varchar(200) not null,							
product_price int not null,
cart_quantity int not null,								
cart_total_amount int not null,							
cart_indate datetime default current_timestamp,		
foreign key (id) references user (id) on delete cascade,
foreign key (product_id) references product (product_id) on delete cascade
);

create table orders(
orders_id varchar(20) primary key,											
id varchar(20),																
product_id varchar(20),														
product_price int not null,													
od_quantity int not null,													
total_amount int not null,													
orders_indate datetime default current_timestamp,							
foreign key (id) references user (id) on delete cascade,
foreign key (product_id) references product (product_id) on delete cascade
);

create table notice(														
no int auto_increment primary key,
m_id varchar(50) not null,
title varchar(200) not null,
contents text not null,
hit int not null default 0,
wtime timestamp not null default current_timestamp,
foreign key (m_id) references manager (m_id)
);

create table qna(															
no int auto_increment primary key,
m_id varchar(50),
id varchar(20) not null,
product_id varchar(20),
categories int not null,					
title varchar(200) not null,
contents text not null,
hit int not null default 0,
wtime timestamp not null default current_timestamp,
answer char(2) default 'n',					
groupNum int not null default 0,
stepNum int not null default 0,
qnaKind char(2) not null default 'n',		
foreign key (m_id) references manager (m_id),
foreign key (id) references user (id) on delete cascade
);

