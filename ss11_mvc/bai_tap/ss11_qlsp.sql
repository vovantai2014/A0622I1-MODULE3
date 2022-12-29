create database if not exists ss11_thuchanh;
use ss11_thuchanh;
create table product (
id int not null auto_increment,
name varchar(50) not null,
price float not null,
descreibe varchar(50) not null,
producer varchar (50) not null,
primary key (id)
);
insert into product (name, price, descreibe ,producer)
values ('Iphone', 12000000, 'Hàng mới', 'Apple');
insert into product (name, price, descreibe ,producer)
values ('Samsung', 15000000, 'Hàng mới', 'Sam sung ');
select name, price, descreibe, producer from product;
select * from product;
insert into product (name, price, descreibe, producer) values (?,?,?,?);
