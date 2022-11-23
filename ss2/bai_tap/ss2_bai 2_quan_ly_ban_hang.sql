create database if not exists ss2_bai2_quanlybanhang;
use ss2_bai2_quanlybanhang;
create table Customer
(
cus_id int not null auto_increment primary key,
cus_name varchar (50) not null,
cus_age int not null default 0
);
create table Orderr
(
order_id int not null auto_increment primary key,
cus_id int not null,
order_date datetime not null,
totalprice float not null check (totalprice > 0),
foreign key (cus_id) references Customer (cus_id)
);
create table Product
(
pro_id int not null auto_increment primary key,
pro_name varchar (50) not null,
pro_price float not null check (pro_price > 0)
);
create table Order_Detail
(
order_id int not null,
pro_id int not null,
odQTY int not null,
primary key (order_id, pro_id),
foreign key (order_id) references Orderr (order_id),
foreign key (pro_id) references Product (pro_id)
);
