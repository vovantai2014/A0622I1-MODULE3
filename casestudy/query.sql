use furama_database;
-- cau 2:
select * from nhan_vien where ho_ten like 'H%' or ho_ten like 'T%' or ho_ten like 'K%'
and char_length(ho_ten) <= 15;
-- cau 3:
select * from khach_hang where (year(curdate()) - year(ngay_sinh)between 18 and 50 ) 
and dia_chi like '%Đà Nẵng' or dia_chi like '%Quảng Trị';
-- cau 4. Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select KH.ma_khach_hang, KH.ho_ten, count(KH.ma_khach_hang) as so_lan_thue 
from khach_hang KH 
join hop_dong HD on KH.ma_khach_hang = HD.ma_khach_hang
join loai_khach LK on KH.ma_loai_khach = LK.ma_loai_khach
where LK.ten_loai_khach = 'Diamond'
group by KH.ma_khach_hang
order by so_lan_thue asc;

-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, 
-- ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (Với tổng tiền được tính theo công thức như sau: 
-- Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
-- cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select DV.ma_dich_vu, DV.ten_dich_vu, DV.dien_tich, DV.chi_phi_thue, LDV.ten_loai_dich_vu;
-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, 
-- ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 
-- nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
select ho_ten
from khach_hang  
group by ho_ten;

select distinct ho_ten
from khach_hang;

-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 
-- thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(ngay_lam_hop_dong),count( month(ngay_lam_hop_dong)) as so_luong_khach_da_dat_phong_2021 from hop_dong
where year(ngay_lam_hop_dong) = 2021
group by month(ngay_lam_hop_dong)
order by month(ngay_lam_hop_dong);

-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select HD.ma_hop_dong, HD.ngay_lam_hop_dong, HD.ngay_ket_thuc, HD.tien_dat_coc, IFNULL((HDCT.so_luong),0) as so_luong_dich_vu_di_kem
from hop_dong HD
join hop_dong_chi_tiet HDCT on HD.ma_hop_dong = HDCT.ma_hop_dong
join dich_vu_di_kem DVDK on DVDK.ma_dich_vu_di_kem = HDCT.ma_dich_vu_di_kem
group by HD.ma_hop_dong
order by HD.ma_hop_dong;

-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” 
-- và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select DVDK.ma_dich_vu_di_kem, DVDK.ten_dich_vu_di_kem, DVDK.gia, DVDK.don_vi
from dich_vu_di_kem DVDK
join hop_dong_chi_tiet HDCT on HDCT.ma_dich_vu_di_kem = DVDK.ma_dich_vu_di_kem
join hop_dong HD on HD.ma_hop_dong = HDCT.ma_hop_dong
join khach_hang KH on KH.ma_khach_hang = HD.ma_khach_hang
join loai_khach LK on LK.ma_loai_khach = KH.ma_loai_khach
where LK.ten_loai_khach = 'Daimond' and (KH.dia_chi like '%Vinh' or KH.dia_chi like '%Quảng Ngãi');
