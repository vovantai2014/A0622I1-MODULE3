use quanlysinhvien;
insert into class (class_id, class_name, start_time, status )
value (1, 'A1', '2008-12-20', 1),
	  (2, 'A2', '2008-12-21', 1),
      (3, 'B3', 'current_date', 0);
insert into student
value (1, 'Hung', 'Ha Noi', '0912113113', 1, 1),
      (2, 'Hoa', 'Hai Phong', 1, 1),
      (3, 'Manh', 'HCM', '0123123123', 0, 2);
insert into subject
value (1, 'CF', 5, 1),
      (2, 'C', 6, 1),
      (3, 'HTJ', 5, 1),
      (4, 'RDBMS', 10,1);
insert into mark
value (1,1,1,8,1),
	  (2,1,2,10,2),
      (3,2,1,12,1);
