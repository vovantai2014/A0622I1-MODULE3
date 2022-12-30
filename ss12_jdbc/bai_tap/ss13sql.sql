create database if not exists ss12_quan_ly_users;
use ss12_quan_ly_users;
create table users (
id int(3) auto_increment not null,
name varchar(120) not null,
email varchar(120) not null,
country varchar(120) not null,
primary key (id)
);
insert into users (name, email, country) 
value ('Minh', 'minh@codegym.vn', 'Viet Nam');
insert into users (name, email, country) 
value ('Kante', 'kante@che.uk', 'Jamaica');
-- select * from users;

create table Permision(
id int(11) primary key,
name varchar(50)
);

create table users_permision (
permision_id int (11),
user_id int(11)
);
insert into Permision(id, name) values(1, 'add');
insert into Permision(id, name) values(2, 'edit');
insert into Permision(id, name) values(3, 'delete');
insert into Permision(id, name) values(4, 'view');
select * from Permision;
