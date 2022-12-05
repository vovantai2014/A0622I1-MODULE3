-- B1:
create database if not exists demo;
use demo;

-- B2:
create table products (
id int auto_increment primary key,
productCode varchar(50),
productName varchar(50),
productPrice int,
productAmount int,
productDescription varchar(50),
productStatus varchar(50)
);
insert into products
values (1, 'MT001', 'May Tinh', 14000000, 100, 'May tinh xach tay', 'May moi'),
       (2, 'MI002', 'May in', 2000000, 50, 'May in Canon', 'May da qua su dung'),
       (3, 'PT003', 'May Photo', 30000000, 3, 'May pho to lazer', 'Hong hop muc'),
	   (4, 'CMR001', 'Camera', 300000, 5, 'Camera an ninh', 'Hang moi'),
       (5, 'KB212', 'Keyboard', 120000, 100, 'Ban Phim may tinh ban', 'nhap khau TQ');
-- select * from products;

-- B3: Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index i_productCode on products(productCode);
-- B3: Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index i_composite on products (productName, productPrice);
-- B3: Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select * from products;

-- B4: TAO VIEW
create view view_product as 
select productCode, productName, productPrice, productStatus
from products;
select * from view_product;

-- CHINH SUA VIEW
alter view view_product as
select productCode, productName, productPrice, productStatus
from products
where productPrice > 5000000;

-- XOA VIEW
drop view view_product;

-- B5: TAO STORED PROCEDURE LAY TAT CA THONG TIN TRONG TABLE
delimiter //
create procedure sp_product()
begin
select * from sp_product;
end //
delimiter ;sp_product
-- call sp_product();

-- TAO STORED PROCEDURE THEM 1 SAN PHAM MOI
delimiter //
create procedure sp_addnew()
begin
insert into products
values ('MH001','Desktop Screen', 7000000, 50, 'Man hinh DeskTop', 'Hang chinh hang');
end //
delimiter ;
-- call sp_addnew();
-- TAO STORED PROCEDURE SUA SAN PHAM THEO id
delimiter //
create procedure sp_update(IN sp_id int)
begin
update products set productName = 'May photocopy' where id = sp_id;
end //
delimiter ;
call sp_update(3);

delimiter //
create procedure sp_delete(IN sp_id int)
begin
delete from products where id = sp_id;
end //
delimiter ;
call sp_delete(1);