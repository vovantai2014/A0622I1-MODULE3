create database if not exists Quan_Ly_Sinh_Vien;
use Quan_Ly_Sinh_Vien;
create table Class
(
classid int not null auto_increment primary key,
classname varchar(60) not null,
startdate datetime not null,
statuss bit
);
create table Student 
(
studentid int not null auto_increment primary key,
studentname varchar(30) not null,
address varchar(50),
phone varchar(20),
statuss bit,
classid int not null,
foreign key (classid) references Class (classid)
);
create table Subjects 
(
subid int not null auto_increment primary key,
subname varchar(30) not null,
credit tinyint not null default 1 check (credit >= 1),
statuss bit default 1
);
create table Mark
(
markid int not null auto_increment primary key,
subid int not null,
studentid int not null,
unique (subid, studentid),
mark float default 0 check (mark between 0 and 100),
examtimes tinyint default 1,
foreign key (subid) references Subjects (subid),
foreign key (studentid) references Student (studentid)
);
