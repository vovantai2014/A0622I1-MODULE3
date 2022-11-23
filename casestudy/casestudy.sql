create database if not exists furama_database;
use furama_database;
create table vi_tri 
(
ma_vi_tri int not null auto_increment primary key,
ten_vi_tri varchar(45)
);
create table trinh_do
(
ma_trinh_do int not null auto_increment primary key,
ten_trinh_do varchar(45)
);
create table bo_phan
(
ma_bo_phan int not null auto_increment primary key,
ten_bo_phan varchar(45)
);
create table nhan_vien
(
ma_nhan_vien int not null auto_increment primary key,
ho_ten varchar(45),
ngay_sinh date,
so_cmnd varchar(45),
luong double,
so_dien_thoai varchar(45),
email varchar(45),
dia_chi varchar(45),
ma_vi_tri int,
ma_trinh_do int,
ma_bo_phan int,
foreign key (ma_vi_tri) references vi_tri (ma_vi_tri),
foreign key (ma_trinh_do) references trinh_do (ma_trinh_do),
foreign key (ma_bo_phan) references bo_phan (ma_bo_phan)
);
create table loai_khach
(
ma_loai_khach int not null auto_increment primary key,
ten_loai_khach varchar(45)
);
create table khach_hang
(
ma_khach_hang int not null auto_increment primary key,
ma_loai_khach int,
ho_ten varchar(45),
ngay_sinh date,
gioi_tinh bit,
so_cmnd varchar(45),
so_dien_thoai varchar(45),
email varchar(45),
dia_chi varchar(45),
foreign key (ma_loai_khach) references loai_khach (ma_loai_khach)
);
create table kieu_thue
(
ma_kieu_thue int not null auto_increment primary key,
ten_kieu_thue varchar(45)
);
create table loai_dich_vu
(
ma_loai_dich_vu int not null auto_increment primary key,
ten_loai_dich_vu varchar(45)
);
create table dich_vu
(
ma_dich_vu int not null auto_increment primary key,
ten_dich_vu varchar(45),
dien_tich int,
chi_phi_thue double,
so_nguoi_toi_da int,
ma_kieu_thue int,
ma_loai_dich_vu int,
tieu_chuan_phong varchar(45),
mo_ta_tien_nghi_khac varchar(45),
dien_tich_ho_boi double,
so_tang int,
dich_vu_mien_phi_di_kem text,
foreign key (ma_kieu_thue) references kieu_thue (ma_kieu_thue),
foreign key (ma_loai_dich_vu) references loai_dich_vu (ma_loai_dich_vu)
);
create table dich_vu_di_kem
(
ma_dich_vu_di_kem int not null auto_increment primary key,
ten_dich_vu_di_kem varchar(45),
gia double,
don_vi varchar(45),
trang_thai varchar(45)
);
create table hop_dong
(
ma_hop_dong int not null auto_increment primary key,
ngay_lam_hop_dong datetime,
ngay_ket_thuc datetime,
tien_dat_coc double,
ma_nhan_vien int,
ma_khach_hang int,
ma_dich_vu int,
foreign key (ma_nhan_vien) references nhan_vien (ma_nhan_vien),
foreign key (ma_khach_hang) references khach_hang (ma_khach_hang),
foreign key (ma_dich_vu) references dich_vu (ma_dich_vu)
);
create table hop_dong_chi_tiet
(
ma_hop_dong_chi_tiet int not null auto_increment primary key,
ma_hop_dong int,
ma_dich_vu_di_kem int,
so_luong int,
foreign key (ma_dich_vu_di_kem) references dich_vu_di_kem (ma_dich_vu_di_kem),
foreign key (ma_hop_dong) references hop_dong (ma_hop_dong)
);
-- insert dữ liệu cho table vi_tri
insert into vi_tri (ma_vi_tri, ten_vi_tri)
values (1, 'Quan Ly'),
       (2, 'Nhan Vien');
-- insert du lieu cho table trinh_do
insert into trinh_do (ma_trinh_do, ten_trinh_do)
values (1, 'Trung Cap'),
	   (2, 'Cao Dang'),
       (3, 'Dai Hoc'),
       (4, 'Sau Dai Hoc');
-- insert du lieu cho table bo_phan
insert into bo_phan (ma_bo_phan, ten_bo_phan)
values (1, 'Sale Maketing'),
       (2, 'Hanh Chinh'),
       (3, 'Phuc Vu'),
       (4, 'Quan Ly');


