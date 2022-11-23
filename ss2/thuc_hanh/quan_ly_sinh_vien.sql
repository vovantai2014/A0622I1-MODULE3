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
insert into class
values (1, 'A1', '2008-12-20', 1);
insert into class
values (2, 'A2', '2008-12-22', 1);
insert into class
values (3, 'B3', current_date, 0);
insert into student (studentname, address, phone, statuss, classid)
values ('Hung', 'Ha Noi', '0905335344', 1, 1);
insert into student (studentname, address, phone, statuss, classid)
values ('Hoa', 'Hai Phong', 1, 1);
insert into student (studentname, address, phone, statuss, classid)
values ('Manh', 'HCM', '0986871261', 0, 2);
insert into subjects
values (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
insert into mark (subid, studentid, mark, examtimes)
values (1,1,8,1),
	   (1,2,10,2),
       (2,1,12,1);
-- select * from class;
-- select * from student;
-- select * from subjects;
-- select * from mark;
use Quan_Ly_Sinh_Vien;
select * 
from student
where statuss = 1;

select * 
from subjects
where credit < 10;

-- Hiển thị danh sách học viên lớp A1
select S.studentid, S.studentname, C.classname
from class C join student s on c.classid = S.classid
where C.classname = 'A1';

-- Hiển thị điểm môn CF của các học viên. 
select S.studentid, S.studentname, Sub.subname, M.mark
from student S join mark M on S.studentid = M.studentid join subjects Sub on M.subid = Sub.subid
where Sub.subname = 'CF';
-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * 
from student 
where studentname like 'H%';
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * 
from class
where month(startdate) = 12
group by classname;
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * 
from subjects
where credit between 3 and 6;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
update student set classid = 2 where studentname = 'Hung';

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select S.studentname, Sub.subname, M.mark
from student S join mark M on S.studentid = M.studentid 
join subjects Sub on M.subid = Sub.subid 
order by mark DESC;

-- Hiển thị số lượng sinh viên ở từng nơi
select address, count(studentid) as 'So Luong Hoc Vien'
from student
group by address;

-- Tính điểm trung bình các môn học của mỗi học viên
select S.studentid, S.studentname, avg(mark)
from student S join mark M on S.studentid = M.studentid
group by S. studentid, S.studentname;
-- Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15
select S.studentid, S.studentname, avg(mark)
from student S join mark M on S.studentid = M.studentid
group by S. studentid, S.studentname
having avg(mark) > 15;

-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
select S.studentid, S.studentname, avg(mark)
from student S join mark M on S.studentid = M.studentid
group by S. studentid, S.studentname
having avg(mark) >= all (
select avg(mark) 
from mark
group by mark.studentid
);
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select Sub.subid, Sub.subname, Sub.credit
from subjects Sub 
where Sub.credit = (select max(Sub.credit) from subjects Sub);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select Sub.subid, Sub.subname, M.mark
from subjects Sub join mark M on Sub.subid = M.subid
where M.mark = (select max(M.mark) from mark M);
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, 
-- xếp hạng theo thứ tự điểm giảm dần
select S.studentid, S.studentname, avg(M.mark)
from student S join mark M on S.studentid = M.studentid
group by S.studentid, S.studentname
order by avg(M.mark) desc;