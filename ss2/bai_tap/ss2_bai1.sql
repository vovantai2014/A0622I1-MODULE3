create database ss2_bai1;
use ss2_bai1;
create table PhieuXuat(
soPX int auto_increment,
ngayXuat date,
primary key (soPX)
);
create table VatTu(
maVT int auto_increment,
tenVT varchar(50),
primary key (maVT)
);

create table ChiTietPX(
soPX int,
maVT int,
soLuong int,
donGia float,
primary key (soPX,maVT),
foreign key (soPX) references PhieuXuat(soPX),
foreign key (maVT) references VatTu(maVT)
);

create table PhieuNhap(
soPN int auto_increment,
ngayNhap date,
primary key (soPn)
);
create table ChiTietPN(
maVT int,
soPN int,
donGN float,
ngayNh date,
primary key(maVT, soPN),
foreign key (soPN) references PhieuNhap(soPN),
foreign key (maVT) references VatTu(maVT)
);
create table NhaCC(
maNCC int auto_increment,
tenNCC varchar(50),
diaChi varchar(50),
primary key (maNCC) 
);
create table DonDH(
soDH int auto_increment,
ngayDH date,
maNCC int,
primary key(soDH),
foreign key (maNCC) references NhaCC(maNCC)
);
create table ChiTietDDH(
maVT int,
soDH int,
primary key (maVT,soDH),
foreign key (maVT) references VatTu(maVT),
foreign key (soDH) references DonDH(soDH)
);
create table soDT(
id int auto_increment,
maNCC int,
soDT int,
primary key (id),
foreign key (maNCC) references NhaCC(maNCC)
);
