create database Ecommerce
go
use Ecommerce
go
create table TaiKhoanTV
(
	
	TKTV varchar(20) primary key not null,
	matKhau varchar(50) not null,
	hinhDD varchar(max) DEFAULT '',
	hoDem nvarchar(50) null,
	tenTV nvarchar(30) not null,
	ngaysinh datetime ,
	gioiTinh bit default 1,
	soDT nvarchar(20),
	email nvarchar(50),
	diaChi nvarchar(250),
	trangThai bit default 0,
	ghiChu ntext
)
go
create table GiaoHang
(
	maKH varchar(20) primary key not null foreign key references TaiKhoanTV(TKTV) on update cascade,
	tenKH nvarchar(50) not null,
	soDT varchar(20) ,
	email varchar(50),
	diaChi nvarchar(250),
	ngaySinh datetime ,
	gioiTinh bit default 1,
	ghiChu ntext
)
go
create table NganhHang
(
	maNganh int primary key not null identity,
	hinhDD varchar(max) DEFAULT '',
	tenNganh nvarchar(88) not null,
	ghiChu ntext default ''
)
go
create table LoaiSP
(
	maLoai int primary key not null identity,
	tenLoai nvarchar(88) not null,
	ghiChu ntext default '',
	maNganh int not null references NganhHang(maNganh)
)
go
create table SanPham
(
	maSP varchar(20) primary key not null,
	tenSP nvarchar(500) not NULL,
	hinhDD varchar(max) DEFAULT '',
	ndTomTat nvarchar(2000) DEFAULT '',
	ngayDang DATETIME DEFAULT CURRENT_TIMESTAMP,
	maLoai int not null references LoaiSP(maLoai),
	noiDung nvarchar(Max) DEFAULT '',
	taiKhoan varchar(20) not null foreign key references taiKhoanTV(TKTV) on update cascade,
	dvt nvarchar(32) default N'Cái',
	daDuyet bit default 0,
	giaBan INTEGER DEFAULT 0,
	giamGia INTEGER DEFAULT 0 CHECK (giamGia>=0 AND giamGia<=100),
	nhaSanXuat nvarchar(168) default ''
)
go
create table DonHang
(
	soDH varchar(20) primary key not null ,
	tktv1 varchar(20) not null foreign key references taiKhoanTV(TKTV) ,
	tktv2 varchar(20) not null foreign key references taiKhoanTV(TKTV) ,
	ngayDat datetime,
	daKichHoat bit default 1,
	ngayGH datetime,
	diaChiGH nvarchar(250),
	trangThai nvarchar(10),
	ghiChu ntext
)
go	
create table CtDonHang	
(
	soDH varchar(20) not null foreign key references donHang(soDH),
	maSP varchar(20) not null foreign key references sanPham(maSP),
	soLuong int,
	giaBan bigint,
	giamGia BIGINT,
	PRIMARY KEY (soDH, maSP)
)
go
create table ThongBao	
(
	soTB varchar(10) primary key not null,
	TKQT varchar(20) not null foreign key references TaikhoanTV(TKTV),
	TKTV varchar(20) not null foreign key references TaikhoanTV(TKTV),
	chuDe nvarchar(2000) DEFAULT '',
	noiDung ntext,
	ngayTB date,
	trangThai varchar(10),
)
go
GO
INSERT [dbo].[CtDonHang] ([soDH], [maSP], [soLuong], [giaBan], [giamGia]) VALUES (N'230426061801838', N'200423082233654', 1, 15000, 10)
INSERT [dbo].[CtDonHang] ([soDH], [maSP], [soLuong], [giaBan], [giamGia]) VALUES (N'230426061801838', N'200423082416700', 1, 17000, 10)
INSERT [dbo].[CtDonHang] ([soDH], [maSP], [soLuong], [giaBan], [giamGia]) VALUES (N'230426061813625', N'200423122223897', 1, 545000, 50)
INSERT [dbo].[CtDonHang] ([soDH], [maSP], [soLuong], [giaBan], [giamGia]) VALUES (N'230426061813625', N'200423123125319', 1, 52000, 44)
INSERT [dbo].[CtDonHang] ([soDH], [maSP], [soLuong], [giaBan], [giamGia]) VALUES (N'230426100847483', N'200423123736616', 1, 10180000, 43)
INSERT [dbo].[CtDonHang] ([soDH], [maSP], [soLuong], [giaBan], [giamGia]) VALUES (N'230426100847483', N'200423125607256', 2, 165000, 46)
INSERT [dbo].[CtDonHang] ([soDH], [maSP], [soLuong], [giaBan], [giamGia]) VALUES (N'230427042558904', N'1804230328', 2, 38000, 16)
INSERT [dbo].[CtDonHang] ([soDH], [maSP], [soLuong], [giaBan], [giamGia]) VALUES (N'230427045529912', N'200423125415272', 1, 2790000, 14)
INSERT [dbo].[CtDonHang] ([soDH], [maSP], [soLuong], [giaBan], [giamGia]) VALUES (N'230427045529912', N'200423125607256', 1, 165000, 46)
INSERT [dbo].[CtDonHang] ([soDH], [maSP], [soLuong], [giaBan], [giamGia]) VALUES (N'230427060102089', N'1804230704', 2, 15990000, 21)
INSERT [dbo].[CtDonHang] ([soDH], [maSP], [soLuong], [giaBan], [giamGia]) VALUES (N'230427062004760', N'1704231049', 1, 34700000, 9)
INSERT [dbo].[CtDonHang] ([soDH], [maSP], [soLuong], [giaBan], [giamGia]) VALUES (N'230427081828693', N'1804230704', 2, 15990000, 21)
INSERT [dbo].[CtDonHang] ([soDH], [maSP], [soLuong], [giaBan], [giamGia]) VALUES (N'230427083803874', N'1804230704', 2, 15990000, 21)
INSERT [dbo].[CtDonHang] ([soDH], [maSP], [soLuong], [giaBan], [giamGia]) VALUES (N'230427084842734', N'1804230704', 2, 15990000, 21)
GO
INSERT [dbo].[DonHang] ([soDH], [tktv1], [tktv2], [ngayDat], [daKichHoat], [ngayGH], [diaChiGH], [trangThai], [ghiChu]) VALUES (N'230426061801838', N'hai15042003', N'tphu123', CAST(N'2023-04-26T18:18:01.837' AS DateTime), 0, CAST(N'2023-04-28T18:18:01.840' AS DateTime), N'Hóc Môn, TP HCM', N'', NULL)
INSERT [dbo].[DonHang] ([soDH], [tktv1], [tktv2], [ngayDat], [daKichHoat], [ngayGH], [diaChiGH], [trangThai], [ghiChu]) VALUES (N'230426061813625', N'tamnguyen1766', N'tphu123', CAST(N'2023-04-26T18:18:13.627' AS DateTime), 0, CAST(N'2023-04-28T18:18:13.627' AS DateTime), N'Hóc Môn, TP HCM', N'', NULL)
INSERT [dbo].[DonHang] ([soDH], [tktv1], [tktv2], [ngayDat], [daKichHoat], [ngayGH], [diaChiGH], [trangThai], [ghiChu]) VALUES (N'230426100847483', N'tamnguyen1766', N'tphu123', CAST(N'2023-04-26T22:08:47.500' AS DateTime), 0, CAST(N'2023-04-28T22:08:47.500' AS DateTime), N'Hóc Môn, TP HCM', N'', NULL)
INSERT [dbo].[DonHang] ([soDH], [tktv1], [tktv2], [ngayDat], [daKichHoat], [ngayGH], [diaChiGH], [trangThai], [ghiChu]) VALUES (N'230427042558904', N'sykhang', N'bachsykhang78', CAST(N'2023-04-27T04:25:58.907' AS DateTime), 0, CAST(N'2023-04-29T04:25:58.907' AS DateTime), N'Tp.Hồ Chí Minh', N'HUY', NULL)
INSERT [dbo].[DonHang] ([soDH], [tktv1], [tktv2], [ngayDat], [daKichHoat], [ngayGH], [diaChiGH], [trangThai], [ghiChu]) VALUES (N'230427045529912', N'tamnguyen1766', N'tphu123', CAST(N'2023-04-27T04:55:29.913' AS DateTime), 0, CAST(N'2023-04-29T04:55:29.913' AS DateTime), N'Hóc Môn, TP HCM', N'', NULL)
INSERT [dbo].[DonHang] ([soDH], [tktv1], [tktv2], [ngayDat], [daKichHoat], [ngayGH], [diaChiGH], [trangThai], [ghiChu]) VALUES (N'230427060102089', N'nguyenhieu', N'hai15042003', CAST(N'2023-04-27T06:01:02.090' AS DateTime), 0, CAST(N'2023-04-29T06:01:02.090' AS DateTime), N'TP.HCM', N'', N'fasdfasdfasdfsffdfsafdasdf')
INSERT [dbo].[DonHang] ([soDH], [tktv1], [tktv2], [ngayDat], [daKichHoat], [ngayGH], [diaChiGH], [trangThai], [ghiChu]) VALUES (N'230427062004760', N'hai15042003', N'nguyenhieu', CAST(N'2023-04-27T06:20:04.760' AS DateTime), 1, CAST(N'2023-04-29T06:20:04.760' AS DateTime), N'Q12 , Tp.HCM', N'TC', N'das')
INSERT [dbo].[DonHang] ([soDH], [tktv1], [tktv2], [ngayDat], [daKichHoat], [ngayGH], [diaChiGH], [trangThai], [ghiChu]) VALUES (N'230427081828693', N'nguyenhieu', N'bachsykhang78', CAST(N'2023-04-27T08:18:28.693' AS DateTime), 0, CAST(N'2023-04-29T08:18:28.693' AS DateTime), N'Tp.Hồ Chí Minh', N'', NULL)
INSERT [dbo].[DonHang] ([soDH], [tktv1], [tktv2], [ngayDat], [daKichHoat], [ngayGH], [diaChiGH], [trangThai], [ghiChu]) VALUES (N'230427083803874', N'nguyenhieu', N'bachsykhang78', CAST(N'2023-04-27T08:38:03.877' AS DateTime), 0, CAST(N'2023-04-29T08:38:03.877' AS DateTime), N'Tp.Hồ Chí Minh', N'', NULL)
INSERT [dbo].[DonHang] ([soDH], [tktv1], [tktv2], [ngayDat], [daKichHoat], [ngayGH], [diaChiGH], [trangThai], [ghiChu]) VALUES (N'230427084842734', N'nguyenhieu', N'bachsykhang78', CAST(N'2023-04-27T08:48:42.737' AS DateTime), 1, CAST(N'2023-04-29T08:48:42.737' AS DateTime), N'Tp.Hồ Chí Minh', N'TC', NULL)
GO
INSERT [dbo].[GiaoHang] ([maKH], [tenKH], [soDT], [email], [diaChi], [ngaySinh], [gioiTinh], [ghiChu]) VALUES (N'bachsykhang', N'khang', N'0375595019', N'bachsykhang.it@gmail.com', N'sài gòn', NULL, 1, N'')
INSERT [dbo].[GiaoHang] ([maKH], [tenKH], [soDT], [email], [diaChi], [ngaySinh], [gioiTinh], [ghiChu]) VALUES (N'bachsykhang78', N'khang', N'0375595019', N'binxtin@gmail.com', N'Tp.Hồ Chí Minh', NULL, 1, N'')
INSERT [dbo].[GiaoHang] ([maKH], [tenKH], [soDT], [email], [diaChi], [ngaySinh], [gioiTinh], [ghiChu]) VALUES (N'hai15042003', N'Hai', N'0377920917', N'haikoi150423@gmail.com', N'TP.HCM', NULL, 1, N'fasdfasdfasdfsffdfsafdasdf')
INSERT [dbo].[GiaoHang] ([maKH], [tenKH], [soDT], [email], [diaChi], [ngaySinh], [gioiTinh], [ghiChu]) VALUES (N'hai555', N'hai', N'8997868', N'hai@gmail.com', N'uiouoiuiouoi', NULL, 1, N'')
INSERT [dbo].[GiaoHang] ([maKH], [tenKH], [soDT], [email], [diaChi], [ngaySinh], [gioiTinh], [ghiChu]) VALUES (N'nguyenhieu', N'Hiếu', N'0346456730', N'Sara.No.Sand@gmail.com', N'Q12 , Tp.HCM', NULL, 1, N'das')
INSERT [dbo].[GiaoHang] ([maKH], [tenKH], [soDT], [email], [diaChi], [ngaySinh], [gioiTinh], [ghiChu]) VALUES (N'sykhang', N'khang', N'0999888777', N'test1@gmail.com', N'sai gon', NULL, 1, N'')
INSERT [dbo].[GiaoHang] ([maKH], [tenKH], [soDT], [email], [diaChi], [ngaySinh], [gioiTinh], [ghiChu]) VALUES (N'tamnguyen1766', N'Tâm', N'0908373779', N'tamnguyen1766@gmail.com', N'ấp 1', NULL, 1, N'')
INSERT [dbo].[GiaoHang] ([maKH], [tenKH], [soDT], [email], [diaChi], [ngaySinh], [gioiTinh], [ghiChu]) VALUES (N'tphu123', N'Phú', N'0974613051', N'letanphu2906@gmail.com', N'Hóc Môn, TP HCM', NULL, 1, N'')
GO
SET IDENTITY_INSERT [dbo].[LoaiSP] ON 

INSERT [dbo].[LoaiSP] ([maLoai], [tenLoai], [ghiChu], [maNganh]) VALUES (2, N'Điện thoại', N'', 1)
INSERT [dbo].[LoaiSP] ([maLoai], [tenLoai], [ghiChu], [maNganh]) VALUES (3, N'Laptop', N'', 1)
INSERT [dbo].[LoaiSP] ([maLoai], [tenLoai], [ghiChu], [maNganh]) VALUES (4, N'Máy tính bảng', N'', 1)
INSERT [dbo].[LoaiSP] ([maLoai], [tenLoai], [ghiChu], [maNganh]) VALUES (5, N'Camera', N'', 1)
INSERT [dbo].[LoaiSP] ([maLoai], [tenLoai], [ghiChu], [maNganh]) VALUES (6, N'Nước ngọt', N'', 2)
INSERT [dbo].[LoaiSP] ([maLoai], [tenLoai], [ghiChu], [maNganh]) VALUES (8, N'Bia', N'', 2)
INSERT [dbo].[LoaiSP] ([maLoai], [tenLoai], [ghiChu], [maNganh]) VALUES (9, N'Vitamin', N'', 3)
INSERT [dbo].[LoaiSP] ([maLoai], [tenLoai], [ghiChu], [maNganh]) VALUES (10, N'Thuốc kháng sinh', N'', 3)
INSERT [dbo].[LoaiSP] ([maLoai], [tenLoai], [ghiChu], [maNganh]) VALUES (11, N'Sữa rửa mặt', N'', 4)
INSERT [dbo].[LoaiSP] ([maLoai], [tenLoai], [ghiChu], [maNganh]) VALUES (12, N'Kem dưỡng', N'', 4)
INSERT [dbo].[LoaiSP] ([maLoai], [tenLoai], [ghiChu], [maNganh]) VALUES (13, N'Son, phấn, đồ trang điểm', N'', 4)
INSERT [dbo].[LoaiSP] ([maLoai], [tenLoai], [ghiChu], [maNganh]) VALUES (14, N'Quần áo', N'', 5)
INSERT [dbo].[LoaiSP] ([maLoai], [tenLoai], [ghiChu], [maNganh]) VALUES (15, N'Túi xách', N'', 5)
INSERT [dbo].[LoaiSP] ([maLoai], [tenLoai], [ghiChu], [maNganh]) VALUES (16, N'Tủ lạnh', N'', 6)
INSERT [dbo].[LoaiSP] ([maLoai], [tenLoai], [ghiChu], [maNganh]) VALUES (17, N'Máy giặt', N'', 6)
INSERT [dbo].[LoaiSP] ([maLoai], [tenLoai], [ghiChu], [maNganh]) VALUES (18, N'Nồi, niêu, xoong, chảo', N'', 6)
INSERT [dbo].[LoaiSP] ([maLoai], [tenLoai], [ghiChu], [maNganh]) VALUES (19, N'Rau củ', N'', 7)
INSERT [dbo].[LoaiSP] ([maLoai], [tenLoai], [ghiChu], [maNganh]) VALUES (20, N'Trái cây', N'', 7)
INSERT [dbo].[LoaiSP] ([maLoai], [tenLoai], [ghiChu], [maNganh]) VALUES (21, N'Thuốc trị mụn', N'', 3)
INSERT [dbo].[LoaiSP] ([maLoai], [tenLoai], [ghiChu], [maNganh]) VALUES (22, N'Thuốc giảm đau', N'', 3)
INSERT [dbo].[LoaiSP] ([maLoai], [tenLoai], [ghiChu], [maNganh]) VALUES (31, N'Chăm sóc sắc đẹp', N'', 4)
SET IDENTITY_INSERT [dbo].[LoaiSP] OFF
GO
SET IDENTITY_INSERT [dbo].[NganhHang] ON 

INSERT [dbo].[NganhHang] ([maNganh], [hinhDD], [tenNganh], [ghiChu]) VALUES (1, N'/Assets/img/HDDnganhHang1.jpg', N'Điện tử', N'')
INSERT [dbo].[NganhHang] ([maNganh], [hinhDD], [tenNganh], [ghiChu]) VALUES (2, N'/Assets/img/HDDnganhHang2.jpg', N'Thức uống', N'')
INSERT [dbo].[NganhHang] ([maNganh], [hinhDD], [tenNganh], [ghiChu]) VALUES (3, N'/Assets/img/HDDnganhHang3.jpg', N'Dược phẩm', N'')
INSERT [dbo].[NganhHang] ([maNganh], [hinhDD], [tenNganh], [ghiChu]) VALUES (4, N'/Assets/img/HDDnganhHang4.jpg', N'Mỹ phẩm', N'')
INSERT [dbo].[NganhHang] ([maNganh], [hinhDD], [tenNganh], [ghiChu]) VALUES (5, N'/Assets/img/HDDnganhHang5.jpg', N'Thời trang', N'')
INSERT [dbo].[NganhHang] ([maNganh], [hinhDD], [tenNganh], [ghiChu]) VALUES (6, N'/Assets/img/HDDnganhHang6.jpg', N'Thiết bị gia dụng', N'')
INSERT [dbo].[NganhHang] ([maNganh], [hinhDD], [tenNganh], [ghiChu]) VALUES (7, N'/Assets/img/HDDnganhHang7.jpg', N'Thực phẩm', N'')
SET IDENTITY_INSERT [dbo].[NganhHang] OFF
GO
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1704231030', N'Điện thoại vivo V23 5G (8GB/128GB) - Hàng Chính Hãng', N'/Assets/img/HDD1704231030.png', N'', CAST(N'2023-04-17T22:30:29.000' AS DateTime), 2, NULL, N'bachsykhang', N'1', 0, 12990000, 10, NULL)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1704231037', N'Điện thoại Samsung Galaxy S23 Ultra 5G 256GB ', N'/Assets/img/HDD1704231037.jpg', N'Samsung Galaxy S23 Ultra 5G 256GB là chiếc smartphone cao cấp nhất của nhà Samsung, sở hữu cấu hình không tưởng với con chip khủng được Qualcomm tối ưu riêng cho dòng Galaxy và camera lên đến 200 MP, xứng danh là chiếc flagship Android được mong đợi nhất trong năm 2023.', CAST(N'2023-04-17T22:37:32.580' AS DateTime), 2, N'<h3><a title="Tham khảo điện thoại Samsung Galaxy S23 Ultra 5G 256GB tại Thế Giới Di Động" href="https://www.thegioididong.com/dtdd/samsung-galaxy-s23-ultra" target="_blank" rel="noopener">Samsung Galaxy S23 Ultra 5G 256GB</a>&nbsp;l&agrave; chiếc smartphone cao cấp nhất của nh&agrave; Samsung, sở hữu cấu h&igrave;nh kh&ocirc;ng tưởng với con chip khủng được&nbsp;Qualcomm tối ưu ri&ecirc;ng cho d&ograve;ng Galaxy&nbsp;v&agrave; camera l&ecirc;n đến 200 MP, xứng danh l&agrave; chiếc flagship Android được mong đợi nhất trong năm 2023.</h3>
<h3>Tạo h&igrave;nh sang trọng đầy tinh tế</h3>
<p>Về thiết kế th&igrave; Samsung Galaxy S23 Ultra sẽ tiếp tục thừa hưởng kiểu d&aacute;ng sang trọng đến từ thế hệ trước, vẫn l&agrave; bộ khung kim loại, mặt lưng k&iacute;nh c&ugrave;ng kiểu tạo h&igrave;nh bo cong nhẹ ở cạnh b&ecirc;n v&agrave; m&agrave;n h&igrave;nh.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020326.jpg"><img class=" ls-is-cached lazyloaded" title="Thiết kế sang trọng - Samsung Galaxy S23 Ultra 5G 256GB" src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020326.jpg" alt="Thiết kế sang trọng - Samsung Galaxy S23 Ultra 5G 256GB" data-src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020326.jpg"></a></p>
<p>Tuy nhi&ecirc;n kiểu bo cong n&agrave;y sẽ hơi thi&ecirc;n hướng phẳng một ch&uacute;t so với S22 Ultra, điều n&agrave;y mang đến cho m&igrave;nh trải nghiệm cầm nắm chắc tay hơn, song cũng mang lại cảm gi&aacute;c dễ chịu cho những l&uacute;c sử dụng li&ecirc;n tục trong thời gian d&agrave;i.</p>
<p>Về m&agrave;u sắc, năm nay Samsung cũng đ&atilde; cho ra c&aacute;c phi&ecirc;n bản m&agrave;u như: T&iacute;m, kem, xanh v&agrave; đen. Nh&igrave;n chung th&igrave; đ&acirc;y l&agrave; những m&agrave;u sắc cực kỳ sang trọng v&agrave; lịch l&atilde;m, ph&ugrave; hợp cho c&aacute;c bạn trẻ năng động, mạnh mẽ v&agrave; đặc biệt l&agrave; những kh&aacute;ch h&agrave;ng đang l&agrave; doanh nh&acirc;n bởi ngoại h&igrave;nh đẳng cấp v&agrave; thanh lịch.</p>
<p>Hiện tr&ecirc;n tay m&igrave;nh l&agrave; bản m&agrave;u xanh đặc trưng của Samsung, m&agrave;u n&agrave;y vừa đem đến sự trẻ trung tươi mới v&agrave; cũng vừa mang tr&ecirc;n m&igrave;nh một gam m&agrave;u tối để c&oacute; thể giữ được vẻ huyền b&iacute; đầy m&ecirc; hoặc.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020336.jpg"><img class=" ls-is-cached lazyloaded" title="M&agrave;u sắc m&ecirc; hoặc - Samsung Galaxy S23 Ultra 5G 256GB" src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020336.jpg" alt="M&agrave;u sắc m&ecirc; hoặc - Samsung Galaxy S23 Ultra 5G 256GB" data-src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020336.jpg"></a></p>
<p>Ở mặt lưng ta c&oacute; thể thấy Samsung trang bị cho m&aacute;y một lớp k&iacute;nh cường lực c&oacute; khả năng chống va đập tốt, được l&agrave;m theo kiểu nh&aacute;m nhẹ gi&uacute;p cho việc b&aacute;m dấu v&acirc;n tay gần như kh&ocirc;ng thấy xuất hiện trong qu&aacute; tr&igrave;nh m&igrave;nh trải nghiệm.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020340.jpg"><img class=" ls-is-cached lazyloaded" title="Mặt lưng k&iacute;nh nh&aacute;m - Samsung Galaxy S23 Ultra 5G 256GB" src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020340.jpg" alt="Mặt lưng k&iacute;nh nh&aacute;m - Samsung Galaxy S23 Ultra 5G 256GB" data-src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020340.jpg"></a></p>
<p>Về phần thiết kế camera th&igrave; năm nay h&atilde;ng gần như kh&ocirc;ng c&oacute; sự thay đổi g&igrave; so với Galaxy S22 Ultra, vẫn l&agrave; cụm camera được bố tr&iacute; ri&ecirc;ng lẻ v&agrave; được l&agrave;m nh&ocirc; l&ecirc;n kh&aacute; cao.</p>
<p>Tuy nhi&ecirc;n xung quanh c&aacute;c ống k&iacute;nh sẽ được th&ecirc;m một lớp viền cao hơn so với bề mặt camera, điều n&agrave;y gi&uacute;p hạn chế việc trầy xước bề mặt ống k&iacute;nh rất tốt n&ecirc;n m&igrave;nh cũng y&ecirc;n t&acirc;m hơn trong l&uacute;c d&ugrave;ng.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020347.jpg"><img class=" ls-is-cached lazyloaded" title="Vị tr&iacute; camera - Samsung Galaxy S23 Ultra 5G 256GB" src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020347.jpg" alt="Vị tr&iacute; camera - Samsung Galaxy S23 Ultra 5G 256GB" data-src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020347.jpg"></a></p>
<p>C&ograve;n về viền xung quanh m&aacute;y, Galaxy S23 Ultra được bao bọc bởi bộ khung l&agrave;m từ nh&ocirc;m với đặc t&iacute;nh bền bỉ, chắc chắn c&ugrave;ng trọng lượng được tối ưu cực kỳ hiệu quả.</p>
<p>Bộ khung n&agrave;y được l&agrave;m theo kiểu b&oacute;ng lo&aacute;ng gi&uacute;p m&aacute;y c&oacute; th&ecirc;m một điểm nhấn đầy nổi bật về thiết kế. Cảm gi&aacute;c khi sờ v&agrave;o bộ khung như được phủ một lớp mạ b&oacute;ng xung quanh, v&igrave; thế đ&acirc;y sẽ kh&ocirc;ng phải l&agrave; vị tr&iacute; dễ xước như một bộ phận người người d&ugrave;ng ho&agrave;i nghi.&nbsp;</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020353.jpg"><img class=" ls-is-cached lazyloaded" title="Khung viền bo cong - Samsung Galaxy S23 Ultra 5G 256GB" src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020353.jpg" alt="Khung viền bo cong - Samsung Galaxy S23 Ultra 5G 256GB" data-src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020353.jpg"></a></p>
<h3>Hiệu năng bức ph&aacute; mọi giới hạn</h3>
<p>Tại thời điểm ra mắt sản phẩm, Galaxy S23 Ultra c&oacute; thể xem l&agrave; chiếc&nbsp;<a title="Tham khảo điện thoại Android đang kinh doanh tại Thế Giới Di Động" href="https://www.thegioididong.com/dtdd?g=android" target="_blank" rel="noopener">điện thoại Android</a>&nbsp;sở hữu hiệu năng mạnh mẽ bậc nhất thị trường. Điều n&agrave;y l&agrave; do Samsung đ&atilde; trang bị con chip Snapdragon 8 Gen 2 t&acirc;n tiến được nh&agrave; Qualcomm tối ưu&nbsp;ri&ecirc;ng biệt cho d&ograve;ng sản phẩm Galaxy S series, mang lại hiệu năng vượt trội&nbsp;so với Snapdragon 8 Gen 2 th&ocirc;ng thường.</p>
<p>Trước ti&ecirc;n l&agrave; về phần trải nghiệm cơ bản với những t&aacute;c vụ như: Xem phim, lướt web, chụp ảnh hay nghe gọi nhắn tin th&igrave; dường như m&aacute;y kh&ocirc;ng gặp phải bất kỳ kh&oacute; khăn n&agrave;o cả, mọi thứ đều được diễn ra su&ocirc;n sẻ v&agrave; hết sức mượt m&agrave;.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020358.jpg"><img class=" ls-is-cached lazyloaded" title="Hiệu năng mượt m&agrave; - Samsung Galaxy S23 Ultra 5G 256GB" src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020358.jpg" alt="Hiệu năng mượt m&agrave; - Samsung Galaxy S23 Ultra 5G 256GB" data-src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020358.jpg"></a></p>
<p>Để c&oacute; thể đ&aacute;nh gi&aacute; cấu h&igrave;nh của điện thoại một c&aacute;ch trực quan hơn bằng những con số, vậy n&ecirc;n m&igrave;nh cũng đ&atilde; test qua một v&agrave;i phần mềm kiểm tra hiệu năng với kết quả đạt được như sau: 1767 (đơn nh&acirc;n), 4314 (đa nh&acirc;n) tr&ecirc;n Geekbench 6 v&agrave; 15635 điểm tr&ecirc;n PCMark.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020403.jpg"><img class=" lazyloaded" title="Điểm đ&aacute;nh gi&aacute; hiệu năng - Samsung Galaxy S23 Ultra 5G 256GB" src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020403.jpg" alt="Điểm đ&aacute;nh gi&aacute; hiệu năng - Samsung Galaxy S23 Ultra 5G 256GB" data-src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020403.jpg"></a></p>
<p>Ở thời điểm hiện tại (04/2023), đ&acirc;y quả thực l&agrave; những con số rất cao v&agrave; c&oacute; &iacute;t d&ograve;ng m&aacute;y n&agrave;o sở hữu được mức điểm lớn như vậy. Nhờ v&agrave;o đ&oacute; m&agrave; Galaxy S23 Ultra tự tin c&oacute; thể xử l&yacute; tốt bất kỳ t&aacute;c vụ n&agrave;o v&agrave;o thời điểm n&agrave;y, hay thậm ch&iacute; l&agrave; mang đến trải nghiệm sử dụng mượt m&agrave; cho tới 2 - 3 năm hoặc l&acirc;u hơn t&ugrave;y v&agrave;o mục đ&iacute;ch sử dụng.</p>
<p>Đến với phần trải nghiệm chơi game th&igrave; Snapdragon 8 Gen 2 dường như đ&atilde; c&oacute; cơ hội bộc lộ gần hết sức mạnh của chip, điều n&agrave;y được minh chứng trong l&uacute;c m&igrave;nh chơi qua c&aacute;c tựa game như Li&ecirc;n Qu&acirc;n Mobile v&agrave; Genshin Impact ở mức đồ họa cao nhất.&nbsp;</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020407.jpg"><img class=" lazyloaded" title="Trải nghiệm chơi game - Samsung Galaxy S23 Ultra 5G 256GB" src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020407.jpg" alt="Trải nghiệm chơi game - Samsung Galaxy S23 Ultra 5G 256GB" data-src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020407.jpg"></a></p>
<p>Ở Li&ecirc;n Qu&acirc;n Mobile, m&aacute;y cho ph&eacute;p c&agrave;i đặt mức đồ họa tối đa th&ocirc;ng qua c&aacute;c mức độ như sau: Độ ph&acirc;n giải si&ecirc;u cao, chất lượng h&igrave;nh ảnh HD v&agrave; chất lượng chi tiết cao. Điều n&agrave;y g&oacute;p phần l&agrave;m tăng trải nghiệm chơi game của m&igrave;nh khi mọi nội dung đều được hiển thị tốt nhất.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020412.jpg"><img class=" ls-is-cached lazyloaded" title="Bảng c&agrave;i dặt cấu h&igrave;nh - Samsung Galaxy S23 Ultra 5G 256GB" src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020412.jpg" alt="Bảng c&agrave;i dặt cấu h&igrave;nh - Samsung Galaxy S23 Ultra 5G 256GB" data-src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020412.jpg"></a></p>
<p>Sau khoảng 2 v&aacute;n game li&ecirc;n tục tr&ecirc;n Galaxy S23 Ultra th&igrave; m&igrave;nh thấy dường như m&aacute;y kh&ocirc;ng gặp phải bất kỳ hiện tượng giật lag hay chậm đơ, kể cả những l&uacute;c giao tranh tổng, khi m&agrave; mọi hiệu ứng h&igrave;nh ảnh từ mọi tướng đều được hiển thị gần như c&ugrave;ng l&uacute;c.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020646.jpg"><img class=" ls-is-cached lazyloaded" title="Trải nghiệm chơi game - Samsung Galaxy S23 Ultra 5G 256GB" src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020646.jpg" alt="Trải nghiệm chơi game - Samsung Galaxy S23 Ultra 5G 256GB" data-src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020646.jpg"></a></p>
<p>Biểu đồ ghi nhận tốc độ khung h&igrave;nh khi chơi Li&ecirc;n Qu&acirc;n ở l&uacute;c n&agrave;y thể hiện mọi thứ diễn ra rất ổn, kh&ocirc;ng c&oacute; sự biến động nhiều hay bị drop qu&aacute; s&acirc;u để g&acirc;y ra giật lag, FPS lu&ocirc;n được dao động trong khoảng 59 - 64.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020642.jpg"><img class=" ls-is-cached lazyloaded" title="Samsung Galaxy S23 Ultra 5G 256GB" src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020642.jpg" alt="Samsung Galaxy S23 Ultra 5G 256GB" data-src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020642.jpg"></a></p>
<p>Tiếp đến l&agrave; tựa game Genshin Impact c&oacute; hơi kh&oacute; khăn hơn đ&ocirc;i ch&uacute;t, mức cấu h&igrave;nh l&uacute;c n&agrave;y m&igrave;nh c&agrave;i đặt cho m&aacute;y l&agrave; gần như cao nhất. Đ&acirc;y c&oacute; thể xem l&agrave; mức đồ họa kh&ocirc;ng tưởng, chỉ c&oacute; thể c&agrave;i đặt v&agrave; hoạt động tốt tr&ecirc;n những d&ograve;ng m&aacute;y cao cấp như Galaxy S23 Ultra.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020653.jpg"><img class=" ls-is-cached lazyloaded" title="Trải nghiệm chơi game - Samsung Galaxy S23 Ultra 5G 256GB" src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020653.jpg" alt="Trải nghiệm chơi game - Samsung Galaxy S23 Ultra 5G 256GB" data-src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020653.jpg"></a></p>
<p>Th&ocirc;ng qua trải nghiệm thực tế th&igrave; m&igrave;nh thấy Galaxy S23 Ultra xử l&yacute; tựa game n&agrave;y rất tốt, tuy chỉ c&oacute; xuất hiện một ch&uacute;t khựng nhẹ trong l&uacute;c load bản đồ ở l&uacute;c đầu, nhưng n&oacute; kh&ocirc;ng phải l&agrave; điều g&igrave; qu&aacute; to t&aacute;c ảnh hưởng trải nghiệm của m&igrave;nh.</p>
<p>Mọi thứ l&uacute;c n&agrave;y được Galaxy S23 Ultra xử l&yacute; ổn, tốc độ khung h&igrave;nh lu&ocirc;n được dao động ổn định trong tầm 27 - 31 FPS, m&igrave;nh cảm thấy h&igrave;nh ảnh hiển thị rất mượt mắt, mọi thao t&aacute;c điều hướng nh&acirc;n vật cũng được phản hồi nhanh ch&oacute;ng v&agrave; gần như kh&ocirc;ng thấy xuất hiện độ trễ.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020659.jpg"><img class=" ls-is-cached lazyloaded" title="Trải nghiệm chơi game - Samsung Galaxy S23 Ultra 5G 256GB" src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020659.jpg" alt="Trải nghiệm chơi game - Samsung Galaxy S23 Ultra 5G 256GB" data-src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020659.jpg"></a></p>
<p>Về vấn đề sinh nhiệt khi sử dụng&nbsp;<a title="Tham khảo điện thoại di động đang kinh doanh tại Thế Giới Di Động" href="https://www.thegioididong.com/dtdd" target="_blank" rel="noopener">điện thoại</a>&nbsp;ở c&aacute;c t&aacute;c vụ n&acirc;ng cao th&igrave; Galaxy S23 Ultra dường như đ&atilde; tối ưu phần n&agrave;y rất tốt, trong l&uacute;c m&igrave;nh chơi game ở cấu h&igrave;nh cao li&ecirc;n tục trong 2 tiếng, c&oacute; kết nối wifi, độ s&aacute;ng m&agrave;n h&igrave;nh trung b&igrave;nh v&agrave; thực hiện trong m&ocirc;i trường c&oacute; nhiệt độ 26 - 27 độ th&igrave; m&aacute;y vẫn cho ra mức nhiệt thấp, dường như chỉ dừng lại ở mức ấm tay nhẹ.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020704.jpg"><img class=" ls-is-cached lazyloaded" title="Trải nghiệm chơi game - Samsung Galaxy S23 Ultra 5G 256GB" src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020704.jpg" alt="Trải nghiệm chơi game - Samsung Galaxy S23 Ultra 5G 256GB" data-src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020704.jpg"></a></p>
<p>L&agrave; một chiếc&nbsp;<a title="Tham khảo điện thoại RAM 8GB đang kinh doanh tại Thế Giới Di Động" href="https://www.thegioididong.com/dtdd-ram-8gb" target="_blank" rel="noopener">điện thoại RAM 8 GB</a>, Galaxy S23 Ultra ho&agrave;n to&agrave;n c&oacute; thể đủ sức xử l&yacute; t&aacute;c vụ đa nhiệm một c&aacute;ch hiệu quả v&agrave; nhanh ch&oacute;ng, với khoảng 15 - 18 ứng dụng (ngoại trừ game) được mở c&ugrave;ng l&uacute;c th&igrave; sau tầm 20 ph&uacute;t mở lại, m&aacute;y vẫn kh&ocirc;ng hề xuất hiện t&igrave;nh trạng tải lại ứng dụng từ đầu v&agrave; đ&acirc;y cũng l&agrave; điều m&igrave;nh hết sức ngạc nhi&ecirc;n khi sử dụng.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020709.jpg"><img class=" lazyloaded" title="Đa nhiệm mượt m&agrave; - Samsung Galaxy S23 Ultra 5G 256GB" src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020709.jpg" alt="Đa nhiệm mượt m&agrave; - Samsung Galaxy S23 Ultra 5G 256GB" data-src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020709.jpg"></a></p>
<h3>Trang bị camera 200 MP v&agrave; khả năng quay video 8K</h3>
<p>Về hệ thống ống k&iacute;nh, Galaxy S23 Ultra được trang bị 3 camera ở mặt sau với th&ocirc;ng số lần lượt l&agrave;: 200 MP cho camera ch&iacute;nh, một camera 12 MP g&oacute;c si&ecirc;u rộng c&ugrave;ng hai camera tele c&oacute; chung độ ph&acirc;n giải 10 MP để hỗ trợ chụp ảnh zoom quang học v&agrave; x&oacute;a ph&ocirc;ng.</p>
<p>Đầu ti&ecirc;n th&igrave; sẽ l&agrave; chế độ chụp mặc định ở điều kiện ngoại cảnh, với m&ocirc;i trường c&oacute; đầy đủ &aacute;nh s&aacute;ng th&igrave; kết quả thu lại l&agrave;m cho m&igrave;nh rất ưng, mọi thứ đều thể hiện chi tiết, m&agrave;u sắc được n&acirc;ng tone nhẹ gi&uacute;p bức h&igrave;nh tr&ocirc;ng tươi mới v&agrave; đầy sức sống hơn.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020721.jpg"><img class=" lazyloaded" title="Ảnh chụp từ camera - Samsung Galaxy S23 Ultra 5G 256GB" src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020721.jpg" alt="Ảnh chụp từ camera - Samsung Galaxy S23 Ultra 5G 256GB" data-src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020721.jpg"></a></p>
<p>Với kết quả cho ra th&igrave; m&igrave;nh ho&agrave;n to&agrave;n c&oacute; thể sử dụng ngay để đăng tải l&ecirc;n mạng x&atilde; hội m&agrave; kh&ocirc;ng cần th&ocirc;ng qua nhiều bước hậu kỳ, ngo&agrave;i ra bạn cũng c&oacute; thể sử dụng th&ecirc;m nhiều t&ugrave;y chọn bộ lọc m&agrave;u kh&aacute;c để t&igrave;m ra gam m&agrave;u ưng &yacute; nhất cho khung cảnh hay chủ đề bạn hướng tới.</p>
<p>Tiếp đến sẽ l&agrave; chế độ chụp g&oacute;c si&ecirc;u rộng, ở phần t&iacute;nh năng n&agrave;y th&igrave; m&aacute;y cho ph&eacute;p m&igrave;nh c&oacute; thể thu lại c&aacute;c bức ảnh c&oacute; độ bao qu&aacute;t lớn, kết quả chụp được gần như thu lại to&agrave;n bộ những g&igrave; xuất hiện trước mắt m&igrave;nh.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020727.jpg"><img class=" lazyloaded" title="Ảnh chụp từ camera - Samsung Galaxy S23 Ultra 5G 256GB" src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020727.jpg" alt="Ảnh chụp từ camera - Samsung Galaxy S23 Ultra 5G 256GB" data-src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020727.jpg"></a></p>
<p>Ở những vị tr&iacute; xung quanh viền mở rộng th&igrave; sẽ kh&ocirc;ng bị b&oacute;p m&eacute;o, độ chi tiết cũng được đảm bảo gi&uacute;p cho bức ảnh tr&ocirc;ng ch&acirc;n thực hơn, nghệ thuật hơn n&ecirc;n m&igrave;nh cảm thấy rất ưng &yacute;.</p>
<p>Từ trước đến nay th&igrave; c&aacute;c mẫu điện thoại flagship của Samsung lu&ocirc;n được đ&aacute;nh gi&aacute; l&agrave; những thiết bị c&oacute; khả năng zoom quang học trong chụp ảnh cực kỳ tốt, v&agrave; điều n&agrave;y cũng sẽ lặp lại một lần nữa tr&ecirc;n Galaxy S23 Ultra khi m&aacute;y hỗ trợ tới 2 cảm biến tele để hỗ trợ zoom quang học 10X v&agrave; 3X.</p>
<p>Ở những bức ảnh chụp zoom, m&igrave;nh thực sự kh&ocirc;ng cảm thấy c&oacute; sự thay đổi qu&aacute; nhiều về độ chi tiết giữa bức ảnh chụp bằng camera tele so với camera ch&iacute;nh, mọi thứ đều hết sức ch&acirc;n thực v&agrave; r&otilde; n&eacute;t, tổng thể bức ảnh tr&ocirc;ng h&agrave;i h&ograve;a từ m&agrave;u sắc cho tới &aacute;nh s&aacute;ng.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020735.jpg"><img class=" lazyloaded" title="Ảnh chụp từ camera - Samsung Galaxy S23 Ultra 5G 256GB" src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020735.jpg" alt="Ảnh chụp từ camera - Samsung Galaxy S23 Ultra 5G 256GB" data-src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-020735.jpg"></a></p>
<p><em>*Ảnh chụp từ chế độ g&oacute;c si&ecirc;u rộng</em></p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021023.jpg"><img class=" lazyloaded" title="Ảnh chụp từ camera - Samsung Galaxy S23 Ultra 5G 256GB" src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021023.jpg" alt="Ảnh chụp từ camera - Samsung Galaxy S23 Ultra 5G 256GB" data-src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021023.jpg"></a></p>
<p><em>*Ảnh chụp từ chế độ mặc định</em></p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021030.jpg"><img class=" lazyloaded" title="Ảnh chụp từ camera - Samsung Galaxy S23 Ultra 5G 256GB" src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021030.jpg" alt="Ảnh chụp từ camera - Samsung Galaxy S23 Ultra 5G 256GB" data-src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021030.jpg"></a></p>
<p><em>*Ảnh chụp từ chế độ zoom 3X</em></p>
<p>C&oacute; một điểm m&agrave; m&igrave;nh cảm thấy rất ấn tượng trong l&uacute;c chụp zoom tr&ecirc;n Galaxy S23 Ultra l&agrave; về khả năng lấy n&eacute;t tốc độ chụp. C&oacute; thể c&aacute;c bạn cũng đ&atilde; biết khi ch&uacute;ng ta chụp zoom th&igrave; camera của m&aacute;y rất dễ bị lấy n&eacute;t chậm, rung lắc hay chụp nh&ograve;e, thế nhưng tr&ecirc;n chiếc điện thoại S23 Ultra n&agrave;y th&igrave; điều n&agrave;y cũng đ&atilde; được khắc phục gần như ho&agrave;n to&agrave;n.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021035.jpg"><img class=" lazyloading" title="Ảnh chụp từ camera - Samsung Galaxy S23 Ultra 5G 256GB" src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021035.jpg" alt="Ảnh chụp từ camera - Samsung Galaxy S23 Ultra 5G 256GB" data-src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021035.jpg"></a></p>
<p><em>*Ảnh chụp từ chế độ zoom 10X</em></p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021042.jpg"><img class=" lazyloading" title="Ảnh chụp từ camera - Samsung Galaxy S23 Ultra 5G 256GB" src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021042.jpg" alt="Ảnh chụp từ camera - Samsung Galaxy S23 Ultra 5G 256GB" data-src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021042.jpg"></a></p>
<p><em>*Ảnh chụp từ chế độ zoom 10X</em></p>
<p>Với một người thường xuy&ecirc;n chụp ảnh ngoại cảnh như m&igrave;nh th&igrave; m&igrave;nh đ&aacute;nh gi&aacute; khả năng xử l&yacute; &aacute;nh s&aacute;ng tr&ecirc;n S23 Ultra hoạt động cực kỳ hiệu quả, kể cả khi chụp đối diện với mặt trời l&uacute;c nắng to th&igrave; m&aacute;y vẫn c&oacute; thể c&acirc;n bằng tốt, sự tương quan giữa chủ thể v&agrave; v&ugrave;ng s&aacute;ng ph&iacute;a sau đều được c&acirc;n bằng h&agrave;i h&ograve;a để cho bức h&igrave;nh trở n&ecirc;n v&ocirc; c&ugrave;ng đẹp mắt.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021048.jpg"><img class=" lazyloading" title="Ảnh chụp từ camera - Samsung Galaxy S23 Ultra 5G 256GB" src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021048.jpg" alt="Ảnh chụp từ camera - Samsung Galaxy S23 Ultra 5G 256GB" data-src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021048.jpg"></a></p>
<p>Một điểm th&uacute; vị tiếp theo m&agrave; m&igrave;nh muốn chia sẻ về camera của S23 Ultra l&agrave; nằm ở phần xử l&yacute; m&agrave;u sắc, như th&ocirc;ng lệ tr&ecirc;n c&aacute;c mẫu&nbsp;<a title="Tham khảo điện thoại Samsung đang kinh doanh tại Thế Giới Di Động" href="https://www.thegioididong.com/dtdd-samsung" target="_blank" rel="noopener">điện thoại Samsung</a>&nbsp;th&igrave; những bức ảnh chụp được sẽ c&oacute; xu hướng n&acirc;ng tone m&agrave;u l&ecirc;n rực rỡ hơn đ&ocirc;i ch&uacute;t để bức ảnh trở n&ecirc;n sinh động hơn.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021053.jpg"><img class=" lazyloading" title="Ảnh chụp từ camera - Samsung Galaxy S23 Ultra 5G 256GB" src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021053.jpg" alt="Ảnh chụp từ camera - Samsung Galaxy S23 Ultra 5G 256GB" data-src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021053.jpg"></a></p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021059.jpg"><img class=" lazyloading" title="Ảnh chụp từ camera - Samsung Galaxy S23 Ultra 5G 256GB" src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021059.jpg" alt="Ảnh chụp từ camera - Samsung Galaxy S23 Ultra 5G 256GB" data-src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021059.jpg"></a></p>
<p>Tuy nhi&ecirc;n th&igrave; đ&acirc;y cũng c&oacute; thể xem l&agrave; một điểm hạn chế cho một v&agrave;i t&igrave;nh huống cụ thể. Thực thế th&igrave; S23 Ultra xử l&yacute; tốt ở phần lớn c&aacute;c m&agrave;u, tuy nhi&ecirc;n th&igrave; ở những gam m&agrave;u n&oacute;ng th&igrave; m&aacute;y xử l&yacute; hơi qu&aacute; đ&agrave; một t&yacute;, n&ecirc;n thường m&agrave;u sắc l&uacute;c n&agrave;y sẽ kh&ocirc;ng c&ograve;n được ch&acirc;n thực lắm.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021107.jpg"><img class="lazyload" title="Ảnh chụp từ camera - Samsung Galaxy S23 Ultra 5G 256GB" alt="Ảnh chụp từ camera - Samsung Galaxy S23 Ultra 5G 256GB" data-src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021107.jpg"></a></p>
<p>Chuyển đến điều kiện buổi đ&ecirc;m, Galaxy S23 Ultra đ&atilde; dường như thể hiện được sức mạnh của camera v&agrave; chứng minh được l&yacute; do tại sao gọi đ&acirc;y l&agrave; &ldquo;Mắt thần b&oacute;ng đ&ecirc;m&rdquo;.</p>
<p>Thực sự m&agrave; n&oacute;i th&igrave; khả năng thu s&aacute;ng v&agrave; xử l&yacute; h&igrave;nh ảnh tr&ecirc;n chiếc m&aacute;y n&agrave;y l&agrave; cực kỳ tốt, c&aacute;c nguồn s&aacute;ng trong khi chụp đ&ecirc;m sẽ kh&ocirc;ng bị nh&ograve;e hay ch&oacute;i, hiện tượng nhiễu hạt th&igrave; cũng được cải thiện so với thế hệ trước đ&oacute; gi&uacute;p cho bức ảnh th&ecirc;m phần h&agrave;i h&ograve;a v&agrave; nịnh mắt.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021113.jpg"><img class="lazyload" title="Ảnh chụp từ camera - Samsung Galaxy S23 Ultra 5G 256GB" alt="Ảnh chụp từ camera - Samsung Galaxy S23 Ultra 5G 256GB" data-src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021113.jpg"></a></p>
<p>Một điểm ấn tượng kh&ocirc;ng k&eacute;m l&agrave; ở phần t&iacute;nh năng quay video tr&ecirc;n m&aacute;y với chuẩn quay tối đa l&ecirc;n đến 8K ở tốc độ khung h&igrave;nh 30 fps, điều n&agrave;y sẽ mang đến cho ch&uacute;ng ta những thước phim vươn tầm điện ảnh khi độ ph&acirc;n giải thu được l&uacute;c n&agrave;y l&agrave; cực kỳ lớn.</p>
<h3>T&iacute;ch hợp b&uacute;t S-Pen tiện dụng</h3>
<p>Tương tự như mẫu&nbsp;<a title="Tham khảo điện thoại Galaxy d&ograve;ng S đang kinh doanh tại Thế Giới Di Động" href="https://www.thegioididong.com/dtdd-samsung-galaxy-s" target="_blank" rel="noopener">điện thoại Galaxy d&ograve;ng S</a>&nbsp;trước đ&oacute;, S23 Ultra cũng sẽ được tiếp tục trang bị b&uacute;t S-Pen huyền thoại ngay trong th&acirc;n m&aacute;y, đ&acirc;y c&oacute; thể coi l&agrave; một điều m&agrave; những kh&aacute;ch h&agrave;ng thuộc đối tượng người d&ugrave;ng l&agrave; doanh nh&acirc;n hay người l&agrave;m s&aacute;ng tạo cực kỳ y&ecirc;u th&iacute;ch bởi độ tiện dụng.</p>
<p>Về cảm nhận nhấn để lấy b&uacute;t th&igrave; m&igrave;nh thấy kh&aacute; dễ d&agrave;ng, chỉ cần chạm nhẹ v&agrave;o v&ugrave;ng chứa b&uacute;t th&igrave; phụ kiện n&agrave;y sẽ ngay lập tức đẩy ra để m&igrave;nh c&oacute; thể r&uacute;t một c&aacute;ch dễ d&agrave;ng.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021118.jpg"><img class="lazyload" title="T&iacute;ch hợp b&uacute;t S-Pen - Samsung Galaxy S23 Ultra 5G 256GB" alt="T&iacute;ch hợp b&uacute;t S-Pen - Samsung Galaxy S23 Ultra 5G 256GB" data-src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021118.jpg"></a></p>
<p>Với một người l&agrave;m c&aacute;c c&ocirc;ng việc s&aacute;ng tạo nội dung như m&igrave;nh, b&uacute;t S-Pen sẽ rất ph&ugrave; hợp để m&igrave;nh thực hiện c&aacute;c c&ocirc;ng việc như ph&aacute;c thảo nội dung bản vẽ, tạo chữ k&yacute;, ghi ch&uacute; nhanh hay thậm ch&iacute; l&agrave; c&oacute; thể d&ugrave;ng n&oacute; thực hiện t&aacute;c vụ chỉnh sửa video, với đầu ng&ograve;i nhỏ sẽ gi&uacute;p m&igrave;nh c&oacute; thể thao t&aacute;c chỉnh sửa v&agrave; cắt gh&eacute;p video ch&iacute;nh x&aacute;c hơn.</p>
<p>Về độ trễ của b&uacute;t ra sao th&igrave; m&igrave;nh dường như kh&ocirc;ng cảm nhận được trong qu&aacute; tr&igrave;nh sử dụng, mọi thứ đều được phản hồi nhanh ch&oacute;ng v&agrave; gần như khớp tuyệt đối với c&aacute;c thao t&aacute;c của m&igrave;nh (khi ở tần số qu&eacute;t m&agrave;n h&igrave;nh 120 Hz), v&igrave; thế m&igrave;nh cũng cảm thấy hết sức thoải m&aacute;i khi sử dụng b&uacute;t S-Pen v&agrave; n&oacute; dường như trở th&agrave;nh một phần kh&ocirc;ng thể thiếu trong l&uacute;c m&igrave;nh l&agrave;m việc.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021445.jpg"><img class=" lazyloading" title="T&iacute;ch hợp b&uacute;t S-Pen - Samsung Galaxy S23 Ultra 5G 256GB" src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021445.jpg" alt="T&iacute;ch hợp b&uacute;t S-Pen - Samsung Galaxy S23 Ultra 5G 256GB" data-src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021445.jpg"></a></p>
<h3>M&agrave;n h&igrave;nh lớn mang đến kh&ocirc;ng gian bất tận</h3>
<p>Với chiếc Galaxy S23 Ultra th&igrave; nh&agrave; Samsung t&iacute;ch hợp cho chiếc m&aacute;y n&agrave;y kh&aacute; nhiều th&ocirc;ng số nổi bật, cụ thể l&agrave; c&ocirc;ng nghệ m&agrave;n h&igrave;nh Dynamic AMOLED 2X, độ ph&acirc;n giải 2K+ (1440 x 3088 Pixels) c&ugrave;ng độ s&aacute;ng tối đa 1750 nits.</p>
<p>Xem th&ecirc;m:&nbsp;<a href="https://www.thegioididong.com/hoi-dap/tim-hieu-man-hinh-dynamic-amoled-2x-tren-smartphone-1245213" target="_blank" rel="noopener">M&agrave;n h&igrave;nh Dynamic AMOLED 2X l&agrave; g&igrave;? Điểm nổi bật? C&oacute; tr&ecirc;n điện thoại n&agrave;o</a></p>
<p>Cả ba điều n&agrave;y đ&ecirc;m đến chất lượng hiển thị với m&agrave;u sắc rực rỡ, nội dung cũng được t&aacute;i hiện sắc n&eacute;t hơn khi m&igrave;nh chơi game hay xem phim. Hơn hết, độ s&aacute;ng cao cũng sẽ gi&uacute;p &iacute;ch cho m&igrave;nh trong việc xem bản đồ ở ngo&agrave;i đường hay căn g&oacute;c chụp ảnh khi đang sử dụng ở những m&ocirc;i trường c&oacute; &aacute;nh s&aacute;ng cao.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021459.jpg"><img class=" lazyloading" title="Độ s&aacute;ng m&agrave;n h&igrave;nh cao - Samsung Galaxy S23 Ultra 5G 256GB" src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021459.jpg" alt="Độ s&aacute;ng m&agrave;n h&igrave;nh cao - Samsung Galaxy S23 Ultra 5G 256GB" data-src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021459.jpg"></a></p>
<p>Th&uacute; vị hơn l&agrave; độ ph&acirc;n giải cao tr&ecirc;n S23 Ultra cho ph&eacute;p m&igrave;nh được c&agrave;i đặt được chuẩn độ ph&acirc;n giải lớn hơn khi xem những nội dung tr&ecirc;n Youtube, gi&uacute;p tận hưởng được trọn vẹn vẻ đẹp từ khung h&igrave;nh một c&aacute;ch sinh động nhất.</p>
<p>Nhờ được sử dụng m&agrave;n h&igrave;nh lớn 6.8 inch thế n&ecirc;n mọi thước phim m&igrave;nh xem đều được tr&igrave;nh chiếu với k&iacute;ch thước lớn hơn, kh&ocirc;ng gian l&uacute;c n&agrave;y cũng đ&atilde; trở n&ecirc;n rộng r&atilde;i để mọi cử chỉ, thao t&aacute;c bằng b&uacute;t S-Pen của m&igrave;nh trở n&ecirc;n thoải m&aacute;i.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021504.jpg"><img class=" lazyloading" title="Kh&ocirc;ng gian hiển thị r&otilde; r&agrave;ng - Samsung Galaxy S23 Ultra 5G 256GB" src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021504.jpg" alt="Kh&ocirc;ng gian hiển thị r&otilde; r&agrave;ng - Samsung Galaxy S23 Ultra 5G 256GB" data-src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021504.jpg"></a></p>
<h3>K&eacute;o d&agrave;i thời lượng d&ugrave;ng với vi&ecirc;n pin lớn</h3>
<p>Với một vi&ecirc;n pin c&oacute; dung lượng 5000 mAh mang lại cho m&igrave;nh thời gian d&ugrave;ng khoảng 9 tiếng 28* ph&uacute;t cho c&aacute;c t&aacute;c vụ như: Chơi game, lướt Facebook, xem YouTube,... nhưng nếu sử dụng cho c&aacute;c t&aacute;c vụ cơ bản h&agrave;ng ng&agrave;y như: Nhắn tin, nghe gọi hay lướt web cơ bản th&igrave; m&aacute;y c&oacute; thể đ&aacute;p ứng cho m&igrave;nh cả một ng&agrave;y d&agrave;i sử dụng.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021509.jpg"><img class=" lazyloading" title="Pin lớn d&ugrave;ng l&acirc;u - Samsung Galaxy S23 Ultra 5G 256GB" src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021509.jpg" alt="Pin lớn d&ugrave;ng l&acirc;u - Samsung Galaxy S23 Ultra 5G 256GB" data-src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021509.jpg"></a></p>
<p>B&ecirc;n cạnh đ&oacute;, h&atilde;ng c&ograve;n hỗ trợ t&iacute;ch hợp th&ecirc;m c&ocirc;ng nghệ sạc nhanh với c&ocirc;ng suất tối đa l&ecirc;n đến 45 W. Nhờ đ&oacute;, m&igrave;nh chỉ mất khoảng 1 tiếng 27* ph&uacute;t để sạc đầy pin m&agrave; kh&ocirc;ng cần phải chờ đợi qu&aacute; l&acirc;u.</p>
<p>Điều n&agrave;y rất tiện lợi, n&oacute; gi&uacute;p m&igrave;nh c&oacute; thể sạc đầy pin trong những l&uacute;c d&agrave;nh thời gian ăn uống hoặc nghỉ ngơi một ch&uacute;t, thay v&igrave; phải chờ đợi cho tới v&agrave;i giờ đồng hồ rất mất thời gian.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021513.jpg"><img class=" lazyloading" title="Hỗ trợ sạc si&ecirc;u nhanh - Samsung Galaxy S23 Ultra 5G 256GB" src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021513.jpg" alt="Hỗ trợ sạc si&ecirc;u nhanh - Samsung Galaxy S23 Ultra 5G 256GB" data-src="https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-150423-021513.jpg"></a></p>
<p><em>*Thời gian sử dụng/sạc c&oacute; thể thay đổi t&ugrave;y v&agrave;o t&aacute;c vụ v&agrave; c&ocirc;ng suất của thiết bị sạc</em></p>
<p>Samsung Galaxy S23 Ultra l&agrave; một mẫu smartphone được thiết kế tập trung chủ yếu d&agrave;nh cho đối tượng kh&aacute;ch h&agrave;ng l&agrave; doanh nh&acirc;n, những ai y&ecirc;u th&iacute;ch thiết kế sang trọng hay t&igrave;m mua một thiết bị c&oacute; hiệu năng mạnh. Với những g&igrave; m&agrave; m&aacute;y mang lại th&igrave; đ&acirc;y ho&agrave;n to&agrave;n thiết bị xứng đ&aacute;ng với gi&aacute; tiền để bạn đầu tư trong năm 2023.</p>', N'hai15042003', N'99', 1, 27500000, 15, N'Samsung')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1704231040', N'Điện thoại Xiaomi Redmi Note 12 Turbo (Snapdragon 7+ Gen 2', N'/Assets/img/HDD1704231040.jpg', N'Điện thoại được trang bị chipset Qualcomm Snapdragon 7+ Gen 2. Thiết bị sẽ đi kèm camera chính 50MP quay phim 4K siêu nét, màn hình OLED 68 tỷ màu với tốc độ làm tươi 120Hz, viên pin khủng 5000mAh hỗ trợ sạc nhanh có dây 67W nhanh ấn tượng.', CAST(N'2023-04-17T22:40:22.387' AS DateTime), 2, N'<p class="product-content-title">Th&ocirc;ng tin chi tiết Xiaomi Redmi Note 12 Turbo (Snapdragon 7+ Gen 2) <a title="Xiaomi Redmi Note 12 Turbo (Snapdragon 7+ Gen 2) - Gi&aacute; si&ecirc;u rẻ" href="https://mobilecity.vn/dien-thoai/xiaomi-redmi-note-12-turbo-edition.html" target="_blank" rel="noopener"><img title="Xiaomi Redmi Note 12 Turbo (Snapdragon 7+ Gen 2) - Gi&aacute; si&ecirc;u rẻ" src="https://mobilecity.vn/px.gif?utm_source=dmca_copy&amp;utm_medium=Xiaomi%20Redmi%20Note%2012%20Turbo%20(Snapdragon%207+%20Gen%202)%20-%20Gi%C3%A1%20si%C3%AAu%20r%E1%BA%BB&amp;utm_campaign=https://mobilecity.vn/dien-thoai/xiaomi-redmi-note-12-turbo-edition.html&amp;utm_content=Xiaomi%20Redmi%20Note%2012%20Turbo%20Gi%C3%A1%20r%E1%BA%BB%20nh%E1%BA%A5t%20H%C3%A0%20N%E1%BB%99i,%20%C4%90%C3%A0%20N%E1%BA%B5ng,%20Tp.HCM.%20Mua%20%C4%91i%E1%BB%87n%20tho%E1%BA%A1i%20Redmi%20ch%E1%BA%A1y%20chip%20Snapdragon%207+%20Gen%202,%20m%C3%A0n%20OLED,%20Camera%2064MP%20OIS,%20pin%205000mAh,%20tr%E1%BA%A3%20g%C3%B3p%200%25." alt="Xiaomi Redmi Note 12 Turbo (Snapdragon 7+ Gen 2) - Gi&aacute; si&ecirc;u rẻ" width="1" height="1" border="0"></a><a title="This article is referenced content from https://mobilecity.vn - Xiaomi Redmi Note 12 Turbo (Snapdragon 7+ Gen 2) - Gi&aacute; si&ecirc;u rẻ" href="https://mobilecity.vn" target="_blank" rel="noopener"><img title="This article is referenced content from https://mobilecity.vn - Xiaomi Redmi Note 12 Turbo (Snapdragon 7+ Gen 2) - Gi&aacute; si&ecirc;u rẻ" src="https://mobilecity.vn/px.gif?utm_source=dmca_copy&amp;utm_medium=Xiaomi%20Redmi%20Note%2012%20Turbo%20(Snapdragon%207+%20Gen%202)%20-%20Gi%C3%A1%20si%C3%AAu%20r%E1%BA%BB&amp;utm_campaign=https://mobilecity.vn/dien-thoai/xiaomi-redmi-note-12-turbo-edition.html&amp;utm_content=Xiaomi%20Redmi%20Note%2012%20Turbo%20Gi%C3%A1%20r%E1%BA%BB%20nh%E1%BA%A5t%20H%C3%A0%20N%E1%BB%99i,%20%C4%90%C3%A0%20N%E1%BA%B5ng,%20Tp.HCM.%20Mua%20%C4%91i%E1%BB%87n%20tho%E1%BA%A1i%20Redmi%20ch%E1%BA%A1y%20chip%20Snapdragon%207+%20Gen%202,%20m%C3%A0n%20OLED,%20Camera%2064MP%20OIS,%20pin%205000mAh,%20tr%E1%BA%A3%20g%C3%B3p%200%25." alt="This article is referenced content from https://mobilecity.vn - Xiaomi Redmi Note 12 Turbo (Snapdragon 7+ Gen 2) - Gi&aacute; si&ecirc;u rẻ" width="1" height="1" border="0"></a></p>
<div class="product-detail-content css-content more-height">
<p>Điện thoại <strong>Redmi Note 12 Turbo</strong>&nbsp;l&agrave; chiếc điện thoại đầu ti&ecirc;n trang bị chip Snapdragon 7+ Gen 2 tầm trung mạnh mẽ nhất, kết hợp dung lượng RAM lớn, bộ nhớ trong dư dả cho lưu trữ, vi&ecirc;n pin khủng, c&ugrave;ng sạc si&ecirc;u nhanh. Từ đ&oacute;, gi&uacute;p&nbsp;<a title="Redmi Note 12 Turbo" href="https://mobilecity.vn/dien-thoai/xiaomi-redmi-note-12-turbo-edition.html" target="_blank" rel="noopener noreferrer">Redmi Note 12 Turbo</a> trở th&agrave;nh chiếc m&aacute;y được ưa chuộng v&agrave; được nhiều người t&igrave;m mua.</p>
<table>
<tbody>
<tr>
<td><strong>✅ Chip</strong></td>
<td><strong>💋 Snapdragon 7+ Gen 2&nbsp;</strong></td>
</tr>
<tr>
<td><strong>✅ M&agrave;n h&igrave;nh</strong></td>
<td><strong>💋 OLED 68 tỷ m&agrave;u, 120Hz</strong></td>
</tr>
<tr>
<td><strong>✅ Camera</strong></td>
<td><strong>💋 64MP OIS, quay video 4K</strong></td>
</tr>
<tr>
<td><strong>✅ Pin, sạc</strong></td>
<td><strong>💋 5000mAh, 67W&nbsp;</strong></td>
</tr>
</tbody>
</table>
<div class="sudo-toc">
<div>Mục lục</div>
<ul>
<li><a href="#mcetoc_1gooq1iol0" rel="nofollow">Redmi Note 12 Turbo c&oacute; g&igrave;?</a>
<ul>
<li><a href="#mcetoc_1gooq2k7u8" rel="nofollow">Chip Snapdragon 7+ gen 2</a></li>
<li><a href="#mcetoc_1gooq33hma" rel="nofollow">M&agrave;n OLED 68 tỷ m&agrave;u</a></li>
<li><a href="#mcetoc_1gskaqda38" rel="nofollow">Camera 64MP OIS</a></li>
</ul>
</li>
<li><a href="#mcetoc_1gooq1t7g1" rel="nofollow">Đ&aacute;nh gi&aacute; Note 12 Turbo</a>
<ul>
<li><a href="#mcetoc_1gsk74ck71" rel="nofollow">Thiết kế tinh tế, nổi bật</a></li>
<li><a href="#mcetoc_1gskcdmaaf" rel="nofollow">M&agrave;u sắc bắt mắt</a></li>
<li><a href="#mcetoc_1gskatn1p9" rel="nofollow">B&aacute; đạo về hiệu năng</a></li>
<li><a href="#mcetoc_1gooq273l3" rel="nofollow">C&aacute;c phi&ecirc;n bản bộ nhớ</a></li>
<li><a href="#mcetoc_1gooq29654" rel="nofollow">M&agrave;n h&igrave;nh xuất sắc</a></li>
<li><a href="#mcetoc_1gskaujpba" rel="nofollow">Camera đỉnh cao với OIS</a></li>
<li><a href="#mcetoc_1gskcc27kb" rel="nofollow">Pin, sạc&nbsp;Redmi Note 12 Turbo</a></li>
<li><a href="#mcetoc_1gskccecbc" rel="nofollow">Gi&aacute; b&aacute;n&nbsp;Redmi Note 12 Turbo</a></li>
</ul>
</li>
<li><a href="#mcetoc_1gskccpi4d" rel="nofollow">Khi mua Note 12 Turbo cần lưu &yacute; g&igrave;?</a></li>
<li><a href="#mcetoc_1gskcd5ioe" rel="nofollow">N&ecirc;n mua Redmi Note 12 Turbo ở đ&acirc;u?</a></li>
</ul>
</div>
<p>Điện thoại được trang bị chipset Qualcomm Snapdragon 7+ Gen 2. Thiết bị sẽ đi k&egrave;m camera ch&iacute;nh 50MP quay phim 4K si&ecirc;u n&eacute;t, m&agrave;n h&igrave;nh OLED 68 tỷ m&agrave;u với tốc độ l&agrave;m tươi 120Hz, vi&ecirc;n pin khủng 5000mAh hỗ trợ sạc nhanh c&oacute; d&acirc;y 67W nhanh ấn tượng.</p>
<h2 id="mcetoc_1gooq1iol0">Redmi Note 12 Turbo c&oacute; g&igrave;?</h2>
<p>Note 12 phi&ecirc;n bản Turbo l&agrave; chiếc điện thoại Redmi n&acirc;ng tầm l&ecirc;n một đẳng cấp mới với chip Snapdragon 7+ Gen 2 si&ecirc;u mạnh, m&agrave;n h&igrave;nh OLED 12 bit với 68 tỷ m&agrave;u hiển thị, camera 3 ống k&iacute;nh l&ecirc;n tới 64MP với khả năng chống rung quang học OIS. Sau đ&acirc;y l&agrave; phần chi tiết.</p>
<h3 id="mcetoc_1gooq2k7u8">Chip Snapdragon 7+ gen 2</h3>
<p>Bộ xử l&yacute; Snapdragon 7+ Gen 2 đang l&agrave; chip ti&ecirc;n tiến nhất của Qualcomm. Với t&ecirc;n m&atilde; SM7475-AB v&agrave; sử dụng tiến tr&igrave;nh sản xuất 4nm của TSMC &ndash; h&atilde;ng sản xuất được đ&aacute;nh gi&aacute; l&agrave; đứng đầu trong lĩnh vực c&ocirc;ng nghệ chế tạo chip, Snapdragon 7+ Gen 2 đang trở th&agrave;nh một sản phẩm đ&aacute;ng ch&uacute; &yacute; trong ng&agrave;nh c&ocirc;ng nghệ hiện nay.</p>
<figure class="sudo-media-item"><img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2023/03/xiaomi-redmi-note-12-turbo-noi-bat-chip.jpg.webp" alt="xiaomi-redmi-note-12-turbo-noi-bat-chip" width="600" height="450" loading="lazy"></figure>
<p>Với c&aacute;c cải tiến đ&aacute;ng kể từ phi&ecirc;n bản trước, bộ xử l&yacute; n&agrave;y c&oacute; khả năng đ&aacute;p ứng mọi y&ecirc;u cầu về hiệu suất của người d&ugrave;ng, cho ph&eacute;p hoạt động ở tốc độ cao v&agrave; tiết kiệm năng lượng tối đa. N&oacute; được thiết kế để tương th&iacute;ch với c&aacute;c sản phẩm th&ocirc;ng minh như smartphone, m&aacute;y t&iacute;nh bảng kh&aacute;c.</p>
<figure class="sudo-media-item"><img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2023/03/xiaomi-redmi-note-12-turbo-diem-antutu.jpg.webp" alt="xiaomi-redmi-note-12-turbo-diem-antutu" width="600" height="450" loading="lazy"></figure>
<p>Một trong những đặc điểm nổi bật của Snapdragon 7+ Gen 2 l&agrave; điểm AnTuTu l&ecirc;n tới 1 triệu điểm. Điều n&agrave;y cho thấy rằng sản phẩm n&agrave;y c&oacute; hiệu suất mạnh mẽ để đ&aacute;p ứng nhu cầu người d&ugrave;ng, đặc biệt l&agrave; với c&aacute;c ứng dụng t&aacute;c vụ kh&oacute; khăn như chơi game đồ họa cao hay xử l&yacute; video. Với điểm số n&agrave;y, Snapdragon 7+ Gen 2 đang đứng tr&ecirc;n một số sản phẩm chip cao cấp kh&aacute;c tr&ecirc;n thị trường.</p>
<p>&nbsp;</p>
<p><strong>Bảng gi&aacute; điện thoại Redmi Note 11, Note 12 mới nhất 2023:</strong></p>
<table>
<tbody>
<tr>
<td><strong>STT</strong></td>
<td><strong>T&ecirc;n sản phẩm</strong></td>
<td><strong>Gi&aacute;</strong></td>
<td><strong>Bảo h&agrave;nh</strong></td>
</tr>
<tr>
<td colspan="4"><strong>Redmi Note 11 Series</strong></td>
</tr>
<tr>
<td>1</td>
<td><a title="Redmi Note 11" href="https://mobilecity.vn/xiaomi/xiaomi-redmi-note-11.html" target="_blank" rel="noopener noreferrer">Redmi Note 11</a></td>
<td>3.750.000 ₫</td>
<td>12 Th&aacute;ng</td>
</tr>
<tr>
<td>2</td>
<td><a title="Redmi Note 11S" href="https://mobilecity.vn/dien-thoai/xiaomi-redmi-note-11s.html" target="_blank" rel="noopener noreferrer">Redmi Note 11S</a></td>
<td>4.950.000 ₫</td>
<td>12 Th&aacute;ng</td>
</tr>
<tr>
<td>3</td>
<td><a title="Redmi Note 11E Pro" href="https://mobilecity.vn/dien-thoai/xiaomi-redmi-note-11e-pro.html" target="_blank" rel="noopener noreferrer">Redmi Note 11E Pro</a></td>
<td>4.650.000 ₫</td>
<td>12 Th&aacute;ng</td>
</tr>
<tr>
<td>4</td>
<td><a title="Redmi Note 11 Pro" href="https://mobilecity.vn/xiaomi/xiaomi-redmi-note-11-pro.html" target="_blank" rel="noopener noreferrer">Redmi Note 11 Pro</a></td>
<td>4.950.000 ₫</td>
<td>12 Th&aacute;ng</td>
</tr>
<tr>
<td>5</td>
<td><a title="Redmi Note 11T Pro" href="https://mobilecity.vn/dien-thoai/xiaomi-redmi-note-11t-pro.html" target="_blank" rel="noopener noreferrer">Redmi Note 11T Pro</a></td>
<td>5.150.000 ₫</td>
<td>12 Th&aacute;ng</td>
</tr>
<tr>
<td colspan="4"><strong>Redmi Note 12 Series</strong></td>
</tr>
<tr>
<td>1</td>
<td><a title="Redmi Note 12" href="https://mobilecity.vn/dien-thoai/xiaomi-redmi-note-12.html" target="_blank" rel="noopener noreferrer">Redmi Note 12</a></td>
<td>&nbsp;3.650.000 ₫</td>
<td>&nbsp;12 Th&aacute;ng</td>
</tr>
<tr>
<td>&nbsp;2&nbsp;</td>
<td><a title="Redmi Note 12 Pro" href="https://mobilecity.vn/dien-thoai/xiaomi-redmi-note-12-pro.html" target="_blank" rel="noopener noreferrer">Redmi Note 12 Pro</a></td>
<td>&nbsp;5.250.000 ₫</td>
<td>&nbsp;12 Th&aacute;ng</td>
</tr>
<tr>
<td>3</td>
<td><a title="Redmi Note 12 Pro Plus" href="https://mobilecity.vn/dien-thoai/xiaomi-redmi-note-12-pro-plus.html" target="_blank" rel="noopener noreferrer">Redmi Note 12 Pro Plus</a></td>
<td>&nbsp;7.650.000 ₫</td>
<td>&nbsp;12 Th&aacute;ng</td>
</tr>
<tr>
<td>&nbsp;4&nbsp;</td>
<td><a title="Redmi Note 12 Pro Speed" href="https://mobilecity.vn/dien-thoai/xiaomi-redmi-note-12-pro-speed-edition-snapdragon-778g.html" target="_blank" rel="noopener noreferrer">Redmi Note 12 Pro Speed</a></td>
<td>&nbsp;5.650.000 ₫</td>
<td>&nbsp;12 Th&aacute;ng</td>
</tr>
<tr>
<td>5</td>
<td><a title="Redmi Note 12 Turbo" href="https://mobilecity.vn/dien-thoai/xiaomi-redmi-note-12-turbo-edition.html" target="_blank" rel="noopener noreferrer">Redmi Note 12 Turbo</a></td>
<td>&nbsp;6.950.000 ₫</td>
<td>&nbsp;12 Th&aacute;ng</td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>
<h3 id="mcetoc_1gooq33hma">M&agrave;n OLED 68 tỷ m&agrave;u</h3>
<p>Tấm nền OLED (Organic Light Emitting Diode) l&agrave; c&ocirc;ng nghệ mới được sử dụng trong c&aacute;c m&agrave;n h&igrave;nh hiển thị. N&oacute; c&oacute; những ưu điểm vượt trội so với c&aacute;c c&ocirc;ng nghệ kh&aacute;c như LED hay LCD. OLED c&oacute; thể hiển thị m&agrave;u sắc rực rỡ v&agrave; s&aacute;ng hơn, v&igrave; n&oacute; kh&ocirc;ng phải d&ugrave;ng một loại &aacute;nh s&aacute;ng phụ trợ. C&aacute;c điểm ảnh tr&ecirc;n OLED c&oacute; thể tự ph&aacute;t s&aacute;ng, cho ph&eacute;p hiển thị độ phản chiếu cao hơn v&agrave; độ tương phản tốt hơn.</p>
<figure class="sudo-media-item"><img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2023/03/xiaomi-redmi-note-12-turbo-noi-bat-man-hinh.jpg.webp" alt="xiaomi-redmi-note-12-turbo-noi-bat-man-hinh" width="600" height="450" loading="lazy"></figure>
<p>M&agrave;n h&igrave;nh hiển thị 12 bit m&agrave;u được sử dụng để xử l&yacute; m&agrave;u sắc hiển thị trong thiết bị. Tấm nền cao cấp n&agrave;y c&oacute; thể xử l&yacute; đến 68 tỷ m&agrave;u sắc kh&aacute;c nhau, cho ph&eacute;p người d&ugrave;ng xem h&igrave;nh ảnh với chất lượng m&agrave;u sắc tuyệt vời. Tần số qu&eacute;t của m&agrave;n h&igrave;nh l&agrave; 120Hz, gi&uacute;p đạt được hiệu ứng h&igrave;nh ảnh mượt m&agrave;, &iacute;t nh&ograve;e h&igrave;nh v&agrave; &iacute;t m&ugrave; m&agrave;u hơn so với tần số qu&eacute;t thấp hơn.</p>
<p>C&ocirc;ng nghệ Dolby Vision v&agrave; HDR10+ gi&uacute;p tăng cường độ tương phản v&agrave; b&oacute;ng đen s&acirc;u tr&ecirc;n m&agrave;n h&igrave;nh hiển thị. Ch&iacute;nh v&igrave; vậy, h&igrave;nh ảnh tr&ecirc;n m&agrave;n h&igrave;nh tr&ocirc;ng r&otilde; r&agrave;ng v&agrave; sinh động hơn, đặc biệt khi xem c&aacute;c bộ phim hoặc chương tr&igrave;nh truyền h&igrave;nh c&oacute; t&ocirc;ng m&agrave;u s&aacute;ng tối đến ch&oacute;i mắt.</p>
<p>Độ s&aacute;ng HBM (High Brightness Mode) 1000nit gi&uacute;p tăng cường độ s&aacute;ng của m&agrave;n h&igrave;nh, đặc biệt khi xem ngo&agrave;i trời hoặc trong những điều kiện &aacute;nh s&aacute;ng mạnh.</p>
<h3 id="mcetoc_1gskaqda38">Camera 64MP OIS</h3>
<p>Cảm biến camera ch&iacute;nh 64MP c&oacute; k&iacute;ch thước cảm biến 1/2" v&agrave; độ lớn điểm ảnh 0.7&micro;m, gi&uacute;p cho việc chụp ảnh đẹp, chi tiết v&agrave; sắc n&eacute;t hơn. Cảm biến n&agrave;y cũng được trang bị t&iacute;nh năng lấy n&eacute;t tự động theo pha PDAF, gi&uacute;p cho việc lấy n&eacute;t nhanh ch&oacute;ng v&agrave; ch&iacute;nh x&aacute;c hơn.</p>
<figure class="sudo-media-item"><img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2023/03/xiaomi-redmi-note-12-turbo-noi-bat-camera-64mp.jpg.webp" alt=" xiaomi-redmi-note-12-turbo-noi-bat-camera-64mp" width="600" height="450" loading="lazy"></figure>
<p>Để hỗ trợ cho việc chụp ảnh trong điều kiện &aacute;nh s&aacute;ng yếu, cảm biến n&agrave;y cũng được trang bị chức năng chống rung quang học OIS. Nhờ vậy, c&aacute;c bức ảnh chụp ở chế độ zoom hoặc trong điều kiện thiếu &aacute;nh s&aacute;ng sẽ kh&ocirc;ng bị mờ hoặc rung.</p>
<h2 id="mcetoc_1gooq1t7g1">Đ&aacute;nh gi&aacute; Note 12 Turbo</h2>
<p>Sau đ&acirc;y l&agrave; phần đ&aacute;nh gi&aacute; chi tiết về chiếc Note 12 Turbo của <a title="Redmi" href="https://mobilecity.vn/dien-thoai-redmi" target="_blank" rel="noopener noreferrer">Redmi</a>.</p>
<h3 id="mcetoc_1gsk74ck71">Thiết kế tinh tế, nổi bật</h3>
<p>Điện thoại Note 12 Turbo được thiết kế với mặt lưng độc đ&aacute;o c&oacute; họa tiết chiếc l&aacute; đẹp mắt v&agrave; c&oacute; khả năng đổi m&agrave;u, mang đến sự sang trọng v&agrave; nổi bật. Thiết kế tinh tế, năng động đem lại cho người d&ugrave;ng cảm gi&aacute;c thoải m&aacute;i, c&aacute; t&iacute;nh khi sử dụng. B&ecirc;n cạnh đ&oacute;, cảm biến v&acirc;n tay trong m&agrave;n h&igrave;nh mang lại t&iacute;nh tiện dụng v&agrave; an to&agrave;n cho người d&ugrave;ng.</p>
<figure class="sudo-media-item"><img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2023/03/xiaomi-redmi-note-12-turbo-danh-gia-thiet-ke-truoc-sau.jpg.webp" alt="xiaomi-redmi-note-12-turbo-danh-gia-thiet-ke-truoc-sau" width="600" height="450" loading="lazy"></figure>
<p>Khung nhựa PC cao cấp mang đ&ecirc;n cảm gi&aacute;c chắc chắn khi cầm nắm với độ d&agrave;y chỉ 7,9mm v&agrave; nặng 181g, cho bạn sự nhẹ nh&agrave;ng, dễ d&agrave;ng di chuyển v&agrave; sử dụng l&acirc;u d&agrave;i kh&ocirc;ng bị mỏi tay. Đồng thời, sản phẩm cũng được trang bị jack tai nghe 3.5mm, cho ph&eacute;p người d&ugrave;ng thuận tiện kết nối với c&aacute;c thiết bị &acirc;m thanh ngo&agrave;i hoặc tai nghe độc lập. Với chất liệu nhựa PC cao cấp, sản phẩm c&oacute; độ bền cao v&agrave; kh&ocirc;ng bị tổn thương khi va chạm, gi&uacute;p bảo vệ tốt cho thiết bị b&ecirc;n trong.</p>
<figure class="sudo-media-item"><img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2023/03/xiaomi-redmi-note-12-turbo-danh-gia-thiet-ke-canh.jpg.webp" alt="xiaomi-redmi-note-12-turbo-danh-gia-thiet-ke-canh" width="600" height="450" loading="lazy"></figure>
<h3 id="mcetoc_1gskcdmaaf">M&agrave;u sắc bắt mắt</h3>
<p>M&agrave;u trắng tượng trưng cho sự sạch sẽ, tinh kh&ocirc;i v&agrave; thanh lịch. Đối với phi&ecirc;n bản đặc biệt Harry Potter của Xiaomi Note 12 Turbo, việc sử dụng m&agrave;u trắng tr&ecirc;n thiết kế cho thấy sự tinh tế v&agrave; d&agrave;nh ri&ecirc;ng cho fan h&acirc;m mộ c&aacute;c bộ phim của Harry Potter.</p>
<p>M&agrave;u đen tượng trưng cho sự b&iacute; ẩn, tối tăm v&agrave; đầy sức hấp dẫn. Đ&acirc;y l&agrave; một lựa chọn phổ biến trong thiết kế smartphone, l&agrave;m cho đường viền m&agrave;n h&igrave;nh v&agrave; c&aacute;c chi tiết kh&aacute;c trở n&ecirc;n mạnh mẽ v&agrave; đậm chất hiện đại. M&agrave;u xanh dương thể hiện t&igrave;nh y&ecirc;u với cảm gi&aacute;c suối d&ograve;ng ấm &aacute;p, tươi s&aacute;ng v&agrave; sự lạc quan.</p>
<figure class="sudo-media-item"><img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2023/03/xiaomi-redmi-note-12-turbo-danh-gia-mau-sac.jpg.webp" alt="xiaomi-redmi-note-12-turbo-danh-gia-mau-sac" width="600" height="450" loading="lazy"></figure>
<p>Với phi&ecirc;n bản đặc biệt Harry Potter của Xiaomi Note 12 Turbo, việc sử dụng m&agrave;u xanh dương bổ sung th&ecirc;m phần độc đ&aacute;o v&agrave; sự kết hợp giữa ph&eacute;p thuật v&agrave; c&ocirc;ng nghệ. D&ugrave; l&agrave; m&agrave;u sắc cơ bản hay đặc biệt, việc th&ecirc;m c&aacute;c m&agrave;u sắc v&agrave;o thiết kế sẽ gi&uacute;p tạo ra sự đa dạng v&agrave; tạo được ấn tượng với người d&ugrave;ng.</p>
<h3 id="mcetoc_1gskatn1p9">B&aacute; đạo về hiệu năng</h3>
<p>Điện thoại Note 12 Turbo l&agrave; một chiếc điện thoại th&ocirc;ng minh tầm trung với hiệu năng tốt nhờ v&agrave;o việc trang bị chip Snapdragon 7+ Gen 2, quy tr&igrave;nh 4nm ti&ecirc;n tiến v&agrave; 8 nh&acirc;n xử l&yacute;. Trong đ&oacute;, việc chia bốn nh&acirc;n Cortex-A710 th&agrave;nh 1 nh&acirc;n 2.91 GHz v&agrave; 3 nh&acirc;n 2.49 GHz gi&uacute;p điện thoại xử l&yacute; tốt c&aacute;c t&aacute;c vụ nặng, c&ograve;n 4 nh&acirc;n Cortex-A510 tiết kiệm điện năng v&agrave; đảm bảo thời lượng pin l&acirc;u hơn. GPU Adreno 725 cũng cho ph&eacute;p chiếc điện thoại hiển thị h&igrave;nh ảnh tốt hơn v&agrave; chơi game một c&aacute;ch mượt m&agrave;.</p>
<figure class="sudo-media-item"><img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2023/03/xiaomi-redmi-note-12-turbo-danh-gia-hieu-nang-1.jpg.webp" alt="xiaomi-redmi-note-12-turbo-danh-gia-hieu-nang-1" width="600" height="450" loading="lazy"></figure>
<p>Điểm AnTuTu thực tế của 929539 chỉ ra rằng Redmi Note 12 bản Turbo c&oacute; thể xử l&yacute; nhiều t&aacute;c vụ c&ugrave;ng l&uacute;c v&agrave; chơi game kh&ocirc;ng bị giật lag. Tuy nhi&ecirc;n, chỉ số n&agrave;y kh&ocirc;ng thể đ&aacute;nh gi&aacute; to&agrave;n bộ hiệu năng của chiếc điện thoại, v&igrave; n&oacute; phụ thuộc v&agrave;o cả yếu tố phần mềm v&agrave; phục vụ cho mục đ&iacute;ch so s&aacute;nh giữa c&aacute;c thiết bị kh&aacute;c nhau.</p>
<h3 id="mcetoc_1gooq273l3">C&aacute;c phi&ecirc;n bản bộ nhớ</h3>
<p>Bộ nhớ RAM LPDDR5 c&oacute; dung lượng 6GB, 12GB, 16GB được sử dụng trong c&aacute;c thiết bị di động hiện đại để cải thiện hiệu suất v&agrave; khả năng đa nhiệm. Với tốc độ truyền dữ liệu nhanh hơn so với c&aacute;c thế hệ trước đ&oacute;, LPDDR5 cung cấp khả năng xử l&yacute; đa nhiệm mượt m&agrave; v&agrave; tăng cường khả năng chơi game v&agrave; xem phim. Những mẫu điện thoại hỗ trợ RAM l&ecirc;n tới 16GB bao gồm:</p>
<table>
<tbody>
<tr>
<td>Xiaomi Note 12 Turbo</td>
<td>8-12-16GB&nbsp;</td>
</tr>
<tr>
<td>Oppo Find X6</td>
<td>12-16GB</td>
</tr>
<tr>
<td>Oppo Find X6 Pro</td>
<td>12-16GB</td>
</tr>
<tr>
<td>Realme GT Neo 5</td>
<td>8-12-16GB&nbsp;</td>
</tr>
<tr>
<td>Red Magic 8 Pro+</td>
<td>12-16GB&nbsp;</td>
</tr>
</tbody>
</table>
<figure class="sudo-media-item"><img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2023/03/xiaomi-redmi-note-12-turbo-danh-gia-bo-nho-1.jpg.webp" alt="xiaomi-redmi-note-12-turbo-danh-gia-bo-nho-1" width="600" height="450" loading="lazy"></figure>
<p>Trong khi đ&oacute;, bộ nhớ trong UFS 3.1 c&oacute; dung lượng 256GB, 512GB, 1TB được sử dụng để lưu trữ dữ liệu tr&ecirc;n thiết bị. Thế hệ UFS mới n&agrave;y cung cấp tốc độ đọc/ghi nhanh hơn, gi&uacute;p cải thiện thời gian khởi động, tải ứng dụng v&agrave; chuyển dữ liệu. Với dung lượng lưu trữ lớn, người d&ugrave;ng c&oacute; thể lưu trữ nhiều h&igrave;nh ảnh, video v&agrave; tệp dữ liệu kh&aacute;c tr&ecirc;n điện thoại của họ m&agrave; kh&ocirc;ng cần phải lo lắng về việc qu&aacute; tải bộ nhớ.</p>
<h3 id="mcetoc_1gooq29654">M&agrave;n h&igrave;nh xuất sắc</h3>
<p>Một m&agrave;n h&igrave;nh OLED rất ấn tượng được trang bị cho Note 12 Turbo, với khả năng hiển thị 68 tỷ m&agrave;u, cho chất lượng h&igrave;nh ảnh rất sống động v&agrave; đa dạng m&agrave;u sắc. Việc hỗ trợ tần số qu&eacute;t 120Hz gi&uacute;p cho c&aacute;c t&aacute;c vụ thao t&aacute;c tr&ecirc;n m&agrave;n h&igrave;nh trở n&ecirc;n mượt m&agrave; hơn. Sự hỗ trợ độ s&aacute;ng cao l&ecirc;n tới 1000 nit (HBM), Dolby Vision v&agrave; HDR10+ gi&uacute;p cho m&agrave;n h&igrave;nh c&oacute; khả năng hiển thị độ tương phản v&agrave; độ s&aacute;ng cao hơn so với m&agrave;n h&igrave;nh truyền thống.</p>
<p>Điện thoại sở hữu m&agrave;n h&igrave;nh OLED/AMOLED 68 tỷ m&agrave;u c&oacute; thể kế đến như bảng sau:</p>
<table>
<tbody>
<tr>
<td>Xiaomi Note 12 Turbo</td>
<td>OLED 68 tỷ m&agrave;u</td>
</tr>
<tr>
<td>Redmi K60</td>
<td>OLED 68 tỷ m&agrave;u</td>
</tr>
<tr>
<td>Xiaomi 12S&nbsp;</td>
<td>AMOLED 68 tỷ m&agrave;u</td>
</tr>
<tr>
<td>Redmi K50 Ultra</td>
<td>OLED 68 tỷ m&agrave;u</td>
</tr>
<tr>
<td>Redmi K60 Pro</td>
<td>OLED 68 tỷ m&agrave;u</td>
</tr>
</tbody>
</table>
<figure class="sudo-media-item"><img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2023/03/xiaomi-redmi-note-12-turbo-danh-gia-man-hinh.jpg.webp" alt="xiaomi-redmi-note-12-turbo-danh-gia-man-hinh" width="600" height="450" loading="lazy"></figure>
<p>K&iacute;ch thước m&agrave;n h&igrave;nh 6.67 inch v&agrave; độ ph&acirc;n giải 1080 x 2400 pixel c&ugrave;ng với mật độ điểm ảnh ~395 ppi mang lại trải nghiệm xem phim v&agrave; chơi game rất tốt. Với kh&ocirc;ng gian hiển thị chiếm ~88.9%, m&agrave;n h&igrave;nh trở n&ecirc;n c&agrave;ng lớn hơn v&agrave; cho ph&eacute;p người d&ugrave;ng c&oacute; thể tận hưởng nội dung tr&ecirc;n m&agrave;n h&igrave;nh lớn hơn một c&aacute;ch tuyệt vời.</p>
<figure class="sudo-media-item"></figure>
<h3 id="mcetoc_1gskaujpba">Camera đỉnh cao với OIS</h3>
<p>Thiết lập ba camera sau của điện thoại bao gồm cảm biến ch&iacute;nh 64MP, một t&iacute;nh năng quan trọng gi&uacute;p cho việc chụp ảnh được sắc n&eacute;t v&agrave; chi tiết hơn. C&ugrave;ng với Note 12 Turbo cũng c&oacute; nhiều thiết bị di động được trang bị hệ thống camera sau cảm biến ch&iacute;nh 64MP:</p>
<table>
<tbody>
<tr>
<td>Xiaomi Note 12 Turbo</td>
<td>64MP OIS</td>
</tr>
<tr>
<td>Redmi K60</td>
<td>64MP OIS</td>
</tr>
<tr>
<td>Red Magic 7</td>
<td>64MP</td>
</tr>
<tr>
<td>Red Magic 7S</td>
<td>64MP</td>
</tr>
<tr>
<td>Red Magic 7 Pro</td>
<td>64MP</td>
</tr>
</tbody>
</table>
<p>Ngo&agrave;i ra, camera n&agrave;y c&ograve;n được t&iacute;ch hợp g&oacute;c rộng để c&oacute; thể chụp được nhiều phong cảnh hơn. T&iacute;nh năng lấy n&eacute;t tự động theo pha gi&uacute;p cho m&aacute;y c&oacute; thể nhanh ch&oacute;ng lấy n&eacute;t v&agrave; chụp ảnh ch&iacute;nh x&aacute;c hơn. Chống rung quang học OIS gi&uacute;p cho h&igrave;nh ảnh kh&ocirc;ng bị mờ khi m&aacute;y rung, tạo ra một bức ảnh sắc n&eacute;t hơn.</p>
<figure class="sudo-media-item"><img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2023/03/xiaomi-redmi-note-12-turbo-danh-gia-cam-sau.jpg.webp" alt="xiaomi-redmi-note-12-turbo-danh-gia-cam-sau" width="600" height="450" loading="lazy"></figure>
<p>Camera hỗ trợ gồm một g&oacute;c si&ecirc;u rộng 8MP để c&oacute; thể chụp được nhiều phong cảnh hơn, một t&iacute;nh năng hữu &iacute;ch cho việc chụp ảnh đ&aacute;m đ&ocirc;ng hoặc phong cảnh tự nhi&ecirc;n. Macro 2MP gi&uacute;p cho người d&ugrave;ng c&oacute; thể chụp được những chi tiết nhỏ nhất của đối tượng, như hoa, ch&acirc;n dung v&agrave; c&aacute;c vật thể nhỏ kh&aacute;c. Cả hai t&iacute;nh năng n&agrave;y cũng c&oacute; thể quay video 4K, cho ph&eacute;p người d&ugrave;ng c&oacute; thể ghi lại những cảnh quan đẹp v&agrave; chất lượng cao.</p>
<figure class="sudo-media-item"><img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2023/03/xiaomi-redmi-note-12-turbo-danh-gia-cam-truoc.jpg.webp" alt="xiaomi-redmi-note-12-turbo-danh-gia-cam-truoc" width="600" height="450" loading="lazy"></figure>
<p>Camera selfie 16MP c&oacute; thể chụp ảnh ở g&oacute;c rộng để bao gồm được nhiều người hơn trong một bức ảnh. Ngo&agrave;i ra, m&aacute;y cũng c&oacute; khả năng quay video 1080p để người d&ugrave;ng c&oacute; thể ghi lại những khoảnh khắc vui vẻ v&agrave; s&aacute;ng tạo nhất. Tất cả c&aacute;c t&iacute;nh năng n&agrave;y gi&uacute;p cho người d&ugrave;ng c&oacute; thể chụp ảnh v&agrave; ghi lại video chất lượng cao từ nhiều g&oacute;c độ kh&aacute;c nhau trong mọi t&igrave;nh huống</p>
<h3 id="mcetoc_1gskcc27kb">Pin, sạc&nbsp;Redmi Note 12 Turbo</h3>
<p>Thời gian sử dụng pin phụ thuộc v&agrave;o nhiều yếu tố như mức độ sử dụng của thiết bị, độ s&aacute;ng m&agrave;n h&igrave;nh, kết nối mạng, ứng dụng chạy ngầm,.. Tuy nhi&ecirc;n, với vi&ecirc;n pin 5000mAh v&agrave; c&ocirc;ng nghệ Li-Po, thời gian sử dụng pin trung b&igrave;nh l&agrave; từ 8 đến 10 giờ với sử dụng th&ocirc;ng thường, c&ograve;n thời gian chơi game v&agrave; xem video c&oacute; thể thấp hơn.</p>
<table>
<tbody>
<tr>
<td>Xiaomi Note 12 Turbo</td>
<td>5000mAh, sạc 67W</td>
</tr>
<tr>
<td>Red Magic 7 Pro</td>
<td>5000mAh, sạc 135W</td>
</tr>
<tr>
<td>Samsung Galaxy<br>S23 Ultra</td>
<td>5000mAh, sạc 45W</td>
</tr>
<tr>
<td>Redmi Note 12 Pro+</td>
<td>5000mAh, 120W</td>
</tr>
<tr>
<td>Redmi Note 12</td>
<td>5000mAh, 33W</td>
</tr>
</tbody>
</table>
<figure class="sudo-media-item"><img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2023/03/xiaomi-redmi-note-12-turbo-danh-gia-pin-sac.jpg.webp" alt="xiaomi-redmi-note-12-turbo-danh-gia-pin-sac" width="600" height="450" loading="lazy"></figure>
<p>Đối với thời gian sạc pin, với c&ocirc;ng nghệ sạc PD3 v&agrave; QC4 v&agrave; 150 từ, thời gian sạc pin từ 0 đến 100% dựa tr&ecirc;n c&ocirc;ng suất của pin, c&ocirc;ng suất sạc v&agrave; điều kiện kết nối sạc kh&aacute;c nhau. Với c&ocirc;ng suất sạc 67W, thời gian sạc pin từ 0 đến 100% l&agrave; khoảng 1 giờ. Tuy nhi&ecirc;n, thời gian sạc c&oacute; thể tăng l&ecirc;n nếu điều kiện m&ocirc;i trường kh&ocirc;ng tốt hoặc pin bị chai.</p>
<h3 id="mcetoc_1gskccecbc">Gi&aacute; b&aacute;n&nbsp;Redmi Note 12 Turbo</h3>
<p>Gi&aacute; b&aacute;n đều xuất của chiếc điện thoại Note 12 Turbo tại Trung Quốc c&oacute; sự tăng giảm tương đối đ&aacute;ng kể t&ugrave;y thuộc v&agrave;o phi&ecirc;n bản sản phẩm. Phi&ecirc;n bản bộ nhớ thấp nhất (8/256GB) c&oacute; gi&aacute; b&aacute;n l&agrave; 6,83 triệu đồng, trong khi đ&oacute; bản cao nhất (16GB/1TB) c&oacute; gi&aacute; b&aacute;n cao nhất l&agrave; 8,88 triệu đồng.</p>
<p>Với mức gi&aacute; 6,83 triệu đồng, Note 12 Turbo được coi l&agrave; một trong những sản phẩm gi&aacute; rẻ của Xiaomi nhưng vẫn c&oacute; thiết kế đẹp, cấu h&igrave;nh tốt v&agrave; đầy đủ t&iacute;nh năng như c&aacute;c sản phẩm cao cấp hơn. Tuy nhi&ecirc;n, với mức gi&aacute; cao nhất l&ecirc;n tới 8,88 triệu đồng, sự đa dạng về cấu h&igrave;nh v&agrave; t&iacute;nh năng của sản phẩm cũng được n&acirc;ng cao, tạo n&ecirc;n sự lựa chọn ph&ugrave; hợp cho c&aacute;c người d&ugrave;ng c&oacute; nhu cầu sử dụng smartphone đa phương tiện với bộ nhớ lớn.</p>
<figure class="sudo-media-item"><img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2023/03/xiaomi-redmi-note-12-turbo-gia-ban.jpg.webp" alt="xiaomi-redmi-note-12-turbo-gia-ban" width="600" height="450" loading="lazy"></figure>
<p>Tuy nhi&ecirc;n, đối với người ti&ecirc;u d&ugrave;ng Việt Nam, gi&aacute; b&aacute;n đề xuất của&nbsp;chiếc m&aacute;y tại Trung Quốc c&oacute; thể sẽ kh&ocirc;ng &aacute;p dụng cho thị trường Việt Nam do sự kh&aacute;c biệt về thuế v&agrave; chi ph&iacute; vận chuyển n&ecirc;n khi x&aacute;ch tay về Việt Nam chiếc m&aacute;y sẽ c&oacute; gi&aacute; cao hơn. B&ecirc;n cạnh đ&oacute;, c&aacute;c sản phẩm smartphone của Xiaomi lu&ocirc;n được ưa chuộng bởi người d&ugrave;ng Việt Nam nhờ gi&aacute; cả phải chăng v&agrave; chất lượng tốt, việc chiếc Note 12 Turbo c&oacute; gi&aacute; b&aacute;n đắt hơn so với c&aacute;c sản phẩm c&ugrave;ng loại của h&atilde;ng cũng c&oacute; thể ảnh hưởng đến sự ưa chuộng của sản phẩm tại thị trường Việt Nam.</p>
<h2 id="mcetoc_1gskccpi4d">Khi mua Note 12 Turbo cần lưu &yacute; g&igrave;?</h2>
<p>Khi mua Note 12 Turbo, cần lưu &yacute; những điều sau đ&acirc;y:</p>
<p>1. Kiểm tra th&ocirc;ng số kỹ thuật của điện thoại để đảm bảo n&oacute; đ&aacute;p ứng nhu cầu sử dụng của bạn.<br>2. Kiểm tra trực tiếp sản phẩm để đảm bảo rằng n&oacute; kh&ocirc;ng c&oacute; bất kỳ lỗi kỹ thuật hay vết trầy xước n&agrave;o tr&ecirc;n m&agrave;n h&igrave;nh hay bộ phận vỏ.<br>3. Kiểm tra xem điện thoại c&oacute; bảo h&agrave;nh v&agrave; chế độ hỗ trợ kỹ thuật n&agrave;o đi k&egrave;m với sản phẩm.<br>4. T&igrave;m hiểu về thương hiệu v&agrave; uy t&iacute;n của nh&agrave; cung cấp sản phẩm để tr&aacute;nh mua phải h&agrave;ng giả hoặc k&eacute;m chất lượng.</p>
<p><img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2023/03/xiaomi-redmi-note-12-turbo-nhung-luu-y.jpg.webp" alt="xiaomi-redmi-note-12-turbo-nhung-luu-y" width="600" height="450" loading="lazy"></p>
<p>Khi kiểm tra Note 12 Turbo trực tiếp, bạn n&ecirc;n kiểm tra c&aacute;c phần sau:</p>
<p>1. Kiểm tra m&agrave;n h&igrave;nh xem c&oacute; đầy đủ, kh&ocirc;ng bị trầy xước hay vỡ k&iacute;nh.<br>2. Kiểm tra cảm biến v&acirc;n tay, đảm bảo n&oacute; hoạt động tốt v&agrave; nhận dạng v&acirc;n tay một c&aacute;ch nhanh ch&oacute;ng ch&iacute;nh x&aacute;c.<br>3. Kiểm tra camera để đảm bảo chất lượng ảnh được chụp đẹp v&agrave; sắc n&eacute;t.<br>4. Kiểm tra pin v&agrave; sạc để đảm bảo rằng điện thoại c&oacute; thể hoạt động lien tục trong thời gian d&agrave;i.<br>5. Kiểm tra c&aacute;c ph&iacute;m bấm để đảm bảo ch&uacute;ng hoạt động tốt v&agrave; kh&ocirc;ng bị kẹt.</p>
<p>T&oacute;m lại, khi mua Note 12 Turbo, điều quan trọng l&agrave; kiểm tra v&agrave; t&igrave;m hiểu thật kỹ về sản phẩm để kh&ocirc;ng mua phải h&agrave;ng giả hoặc k&eacute;m chất lượng. Ngo&agrave;i ra, kiểm tra trực tiếp sản phẩm để đảm bảo rằng n&oacute; hoạt động tốt v&agrave; kh&ocirc;ng c&oacute; lỗi kỹ thuật.</p>
<figure class="sudo-media-item"></figure>
<h2 id="mcetoc_1gskcd5ioe">N&ecirc;n mua Redmi Note 12 Turbo ở đ&acirc;u?</h2>
<p>MobileCity l&agrave; hệ thống b&aacute;n lẻ điện thoại th&ocirc;ng minh h&agrave;ng đầu tại Việt Nam, hoạt động từ gần 10 năm với uy t&iacute;n đ&atilde; được khẳng định tr&ecirc;n thị trường. Với đội ngũ nh&acirc;n vi&ecirc;n gi&agrave;u kinh nghiệm, MobileCity mang đến cho kh&aacute;ch h&agrave;ng sự y&ecirc;n t&acirc;m khi mua sắm v&agrave; bảo h&agrave;nh sản phẩm.</p>
<figure class="sudo-media-item"><img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2023/03/xiaomi-redmi-note-12-turbo-nen-mua-o-dau.jpg.webp" alt="xiaomi-redmi-note-12-turbo-nen-mua-o-dau" width="600" height="450" loading="lazy"></figure>
<p>Hệ thống cửa h&agrave;ng của ch&uacute;ng t&ocirc;i bao gồm c&aacute;c thương hiệu h&agrave;ng đầu thế giới, cung cấp đa dạng sản phẩm v&agrave; dịch vụ ph&ugrave; hợp với nhu cầu của từng kh&aacute;ch h&agrave;ng. Điều n&agrave;y đ&atilde; gi&uacute;p MobileCity trở th&agrave;nh một trong những địa chỉ tin cậy nhất cho việc mua sắm điện thoại th&ocirc;ng minh tại Việt Nam.</p>
<p><strong>Địa chỉ mua Redmi Note 12 Turbo gi&aacute; rẻ nhất tại H&agrave; Nội, Đ&agrave; Nẵng, Tp.HCM:</strong></p>
<p>&nbsp;</p>
<p><strong>Hệ thống điện thoại di động&nbsp;&nbsp;MobileCity</strong></p>
<p>Tại H&agrave; Nội</p>
<ul>
<li>CN 1:&nbsp;<strong>120 Th&aacute;i H&agrave;, Q. Đống Đa, H&agrave; Nội</strong>&nbsp;</li>
</ul>
<p>&nbsp; &nbsp; &nbsp;Hotline:&nbsp;<strong><a href="tel:0969120120">0969.120120</a></strong></p>
<ul>
<li>CN 2:&nbsp;<strong>398 Cầu Giấy, Q. Cầu Giấy, H&agrave; Nội</strong>&nbsp;</li>
</ul>
<p>&nbsp; &nbsp; &nbsp;Hotline:&nbsp;<strong><a href="tel:0961111398">096.1111.398</a></strong></p>
<ul>
<li>CN 3:&nbsp;<strong>42 Phố Vọng, Hai B&agrave; Trưng, H&agrave; Nội</strong>&nbsp;</li>
</ul>
<p>&nbsp; &nbsp; &nbsp;Hotline: <strong><a href="tel:0979884242">0979.884242</a></strong></p>
<div>
<p>Tại TP Hồ Ch&iacute; Minh</p>
<ul>
<li>CN 4:&nbsp;<strong>123 Trần Quang Khải, Quận 1, TP.HCM</strong></li>
</ul>
<p>&nbsp; &nbsp; &nbsp;Hotline:&nbsp;<strong><a href="tel:0965123123">0965.123.123</a></strong></p>
<ul>
<li>CN 5:&nbsp;<strong>602 L&ecirc; Hồng Phong, Quận 10, TP.HCM</strong>&nbsp;</li>
</ul>
<p>&nbsp; &nbsp; &nbsp;Hotline:&nbsp;<strong><a href="tel:0971111602">097.1111.602</a></strong></p>
<p>Tại Đ&agrave; Nẵng</p>
<ul>
<li>CN 6:&nbsp;<strong>97 H&agrave;m Nghi, Q.Thanh Kh&ecirc;, Đ&agrave; Nẵng</strong></li>
</ul>
<p>&nbsp; &nbsp; &nbsp;Hotline:&nbsp;<strong><a href="tel:0961239797">096.123.9797</a></strong></p>
</div>
<p>&nbsp;</p>
</div>
<div class="box_shadow">&nbsp;</div>
<div class="product-detail-show"><button id="product-detail-viewall" class="product-detail-view"> Xem th&ecirc;m chi tiết b&agrave;i viết </button> <button id="product-detail-viewdefault" class="product-detail-view"> </button></div>', N'hai15042003', N'99', 1, 6975000, 12, N'Xiaomi')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1704231049', N'Iphone 14 Pro max 256GB', N'/Assets/img/HDD1704231049.jpg', N'iPhone 14 Pro Max một siêu phẩm trong giới smartphone được nhà Táo tung ra thị trường vào tháng 09/2022. Máy trang bị con chip Apple A16 Bionic vô cùng mạnh mẽ, đi kèm theo đó là thiết kế hình màn hình mới, hứa hẹn mang lại những trải nghiệm đầy mới mẻ cho người dùng iPhone.', CAST(N'2023-04-17T22:49:47.003' AS DateTime), 2, N'<h3><a title="Tham khảo điện thoại iPhone 14 Pro Max tại Thế Giới Di Động" href="https://www.thegioididong.com/dtdd/iphone-14-pro-max" target="_blank" rel="noopener">iPhone 14 Pro Max</a>&nbsp;một si&ecirc;u phẩm trong giới smartphone được nh&agrave; T&aacute;o tung ra thị trường v&agrave;o th&aacute;ng 09/2022. M&aacute;y trang bị con chip Apple A16 Bionic v&ocirc; c&ugrave;ng mạnh mẽ, đi k&egrave;m theo đ&oacute; l&agrave; thiết kế h&igrave;nh m&agrave;n h&igrave;nh mới, hứa hẹn mang lại những trải nghiệm đầy mới mẻ cho người d&ugrave;ng iPhone.</h3>
<h3>Thiết kế cao cấp bền bỉ</h3>
<p>iPhone năm nay sẽ được thừa hưởng n&eacute;t đặc trưng từ người anh&nbsp;<a title="Tham khảo iPhone 13 Pro Max tại Thế Giới Di Động" href="https://www.thegioididong.com/dtdd/iphone-13-pro-max-1tb" target="_blank" rel="noopener">iPhone 13 Pro Max</a>, vẫn sẽ l&agrave; khung th&eacute;p kh&ocirc;ng gỉ v&agrave; mặt lưng k&iacute;nh cường lực kết hợp với tạo h&igrave;nh vu&ocirc;ng vức hiện đại th&ocirc;ng qua c&aacute;ch tạo h&igrave;nh phẳng ở c&aacute;c cạnh v&agrave; phần mặt lưng.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103221.jpg"><img class=" ls-is-cached lazyloaded" title="Thiết kế sang trọng - iPhone 14 Pro Max 128GB" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103221.jpg" alt="Thiết kế sang trọng - iPhone 14 Pro Max 128GB" data-src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103221.jpg"></a></p>
<p>D&ograve;ng Pro năm nay được ra mắt với nhiều t&ugrave;y chọn m&agrave;u sắc v&agrave; trong đ&oacute; nổi bật nhất c&oacute; lẽ l&agrave; phi&ecirc;n bản Deep Purple (t&iacute;m), bởi v&igrave; đ&acirc;y l&agrave; một m&agrave;u mới n&ecirc;n mang lại độ nhận diện kh&aacute; cao.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103227.jpg"><img class=" ls-is-cached lazyloaded" title="M&agrave;u sắc mới mẻ - iPhone 14 Pro Max 128GB" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103227.jpg" alt="M&agrave;u sắc mới mẻ - iPhone 14 Pro Max 128GB" data-src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103227.jpg"></a></p>
<h3>Nổi bật với thiết kế m&agrave;n h&igrave;nh mới</h3>
<p>Điểm ấn tượng nhất tr&ecirc;n&nbsp;<a title="Xem th&ecirc;m iPhone ch&iacute;nh h&atilde;ng đang kinh doanh tại Thế Giới Di Động" href="https://www.thegioididong.com/dtdd-apple-iphone" target="_blank" rel="noopener">điện thoại iPhone</a>&nbsp;năm nay nằm ở thiết kế m&agrave;n h&igrave;nh, c&oacute; thể dễ d&agrave;ng nhận thấy được l&agrave; h&atilde;ng cũng đ&atilde; loại bỏ cụm tai thỏ truyền thống qua bao đời iPhone bằng một h&igrave;nh d&aacute;ng mới v&ocirc; c&ugrave;ng lạ mắt.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103229.jpg"><img class=" ls-is-cached lazyloaded" title="Thiết kế h&igrave;nh notch mới - iPhone 14 Pro Max 128GB" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103229.jpg" alt="Thiết kế h&igrave;nh notch mới - iPhone 14 Pro Max 128GB" data-src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103229.jpg"></a></p>
<p>So với cụm tai thỏ h&igrave;nh notch năm nay đ&atilde; c&oacute; phần tiết kiệm diện t&iacute;ch tương đối tốt, nhưng khi so với c&aacute;c kiểu m&agrave;n h&igrave;nh dạng &ldquo;nốt ruồi&rdquo; th&igrave; đ&acirc;y vẫn chưa thực sự l&agrave; một điều qu&aacute; tối ưu cho phần m&agrave;n h&igrave;nh. Thế nhưng Apple lại rất biết c&aacute;ch tận dụng những nhược điểm để biến ch&uacute;ng trở th&agrave;nh ưu điểm một c&aacute;ch ngoạn mục bằng c&aacute;ch ph&aacute;t minh nhiều hiệu ứng th&uacute; vị.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103232.jpg"><img class=" ls-is-cached lazyloaded" title="K&iacute;ch thước nhỏ gọn - iPhone 14 Pro Max 128GB" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103232.jpg" alt="K&iacute;ch thước nhỏ gọn - iPhone 14 Pro Max 128GB" data-src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103232.jpg"></a></p>
<p>Để l&agrave;m cho ch&uacute;ng trở n&ecirc;n bắt mắt hơn Apple cũng đ&atilde; giới thiệu nhiều hiệu ứng chuyển động nhằm l&agrave;m tăng sự th&iacute;ch th&uacute; cho người d&ugrave;ng, điều n&agrave;y được k&iacute;ch hoạt trong l&uacute;c m&igrave;nh ấn giữ phần h&igrave;nh notch khi đang d&ugrave;ng c&aacute;c phần mềm hỗ trợ như: Nghe nhạc, đồng hồ hẹn giờ, ghi &acirc;m,...</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103235.jpg"><img class=" ls-is-cached lazyloaded" title="Hiệu ứng sinh động - iPhone 14 Pro Max 128GB" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103235.jpg" alt="Hiệu ứng sinh động - iPhone 14 Pro Max 128GB" data-src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103235.jpg"></a></p>
<h3>Hiển thị nội dung ch&acirc;n thực hơn th&ocirc;ng qua m&agrave;n h&igrave;nh chất lượng</h3>
<p>Từ trước đến nay, tấm nền OLED lu&ocirc;n được cộng đồng người d&ugrave;ng đ&aacute;nh gi&aacute; rất cao khi xuất hiện tr&ecirc;n c&aacute;c d&ograve;ng sản phẩm của Apple, với chiếc iPhone 14 Pro Max điều n&agrave;y cũng kh&ocirc;ng l&agrave; ngoại lệ khi h&igrave;nh ảnh m&agrave; m&aacute;y mang lại hết sức ch&acirc;n thực.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103237.jpg"><img class=" ls-is-cached lazyloaded" title="M&agrave;n h&igrave;nh cao cấp - iPhone 14 Pro Max 128GB" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103237.jpg" alt="M&agrave;n h&igrave;nh cao cấp - iPhone 14 Pro Max 128GB" data-src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103237.jpg"></a></p>
<p>Nh&igrave;n v&agrave;o m&agrave;n h&igrave;nh ta sẽ thấy được một độ trong trẻo v&ocirc; c&ugrave;ng th&iacute;ch mắt, nội dung hiển thị c&oacute; chiều s&acirc;u, cảm gi&aacute;c khi xem phim hay chơi game cũng trở n&ecirc;n sống động hơn.</p>
<p>Điểm vượt trội nhất m&agrave; c&aacute;c loại tấm nền kh&aacute;c kh&oacute; m&agrave; đạt được l&agrave; độ chuẩn c&aacute;c về m&agrave;u sắc cao, m&igrave;nh cũng đ&atilde; sử dụng iPhone 14 Pro Max để thiết kế một v&agrave;i ấn phẩm như poster hay sticker đơn giản v&agrave; th&agrave;nh quả l&uacute;c in ra sau khi đối chiếu lại với ảnh tr&ecirc;n&nbsp;<a title="Xem th&ecirc;m Điện thoại ch&iacute;nh h&atilde;ng, gi&aacute; rẻ đang kinh doanh tại Thế Giới Di Động" href="https://www.thegioididong.com/dtdd" target="_blank" rel="noopener">điện thoại</a>&nbsp;th&igrave; gần như l&agrave; bằng nhau, độ sai lệch kh&ocirc;ng qu&aacute; đ&aacute;ng kể gi&uacute;p m&igrave;nh an t&acirc;m hơn trong việc thiết kế h&igrave;nh ảnh.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103240.jpg"><img class=" ls-is-cached lazyloaded" title="Độ chuẩn x&aacute;c về m&agrave;u cao - iPhone 14 Pro Max 128GB" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103240.jpg" alt="Độ chuẩn x&aacute;c về m&agrave;u cao - iPhone 14 Pro Max 128GB" data-src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103240.jpg"></a></p>
<p>Độ ph&acirc;n giải m&agrave;n h&igrave;nh đạt mức 2796 x 1290 Pixels n&ecirc;n việc t&aacute;i tạo h&igrave;nh ảnh c&oacute; độ chi tiết cao l&agrave; điều hết sức dễ d&agrave;ng, hiện tượng như rỗ m&agrave;n h&igrave;nh l&agrave; điều m&agrave; m&igrave;nh chưa từng thấy xuất hiện tr&ecirc;n điện thoại trong 2 tuần trải nghiệm.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103242.jpg"><img class=" ls-is-cached lazyloaded" title="Độ chi tiết cực lớn - iPhone 14 Pro Max 128GB" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103242.jpg" alt="Độ chi tiết cực lớn - iPhone 14 Pro Max 128GB" data-src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103242.jpg"></a></p>
<h4><strong>Hỗ trợ t&iacute;nh năng Always On Display</strong></h4>
<p>B&ecirc;n cạnh sự đổi mới về h&igrave;nh notch, năm nay Apple c&ograve;n trang bị cho d&ograve;ng Pro v&agrave; Pro Max th&ecirc;m c&ocirc;ng nghệ m&agrave;n h&igrave;nh Always On Display, điều n&agrave;y cho ph&eacute;p thiết bị kh&ocirc;ng tắt m&agrave;n h&igrave;nh hẳn m&agrave; vẫn hiển thị m&agrave;n h&igrave;nh kh&oacute;a với một độ s&aacute;ng kh&aacute; nhỏ, đủ để m&igrave;nh c&oacute; thể đọc th&ocirc;ng b&aacute;o nhanh xem ng&agrave;y giờ kh&aacute; thuận tiện.</p>
<p>Xem th&ecirc;m:&nbsp;<a href="https://www.thegioididong.com/hoi-dap/always-on-display-la-gi-co-hao-pin-khong-huong-dan-1169208" target="_blank" rel="noopener">Always On Display l&agrave; g&igrave;? C&oacute; tốn pin kh&ocirc;ng? C&aacute;ch bật, tắt</a></p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103239.jpg"><img class=" ls-is-cached lazyloaded" title="T&Iacute;nh năng tr&ecirc;n m&agrave;n h&igrave;nh - iPhone 14 Pro Max 128GB" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103239.jpg" alt="T&Iacute;nh năng tr&ecirc;n m&agrave;n h&igrave;nh - iPhone 14 Pro Max 128GB" data-src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103239.jpg"></a></p>
<p>Tuy nhi&ecirc;n m&agrave;n h&igrave;nh l&uacute;c n&agrave;y kh&aacute; tối n&ecirc;n d&ugrave;ng ngo&agrave;i trời sẽ hơi kh&oacute; nh&igrave;n đ&ocirc;i ch&uacute;t. B&ecirc;n cạnh đ&oacute;, t&iacute;nh năng n&agrave;y cũng sẽ giảm tuổi thọ pin hơn so với th&ocirc;ng thường, để điện thoại qua đ&ecirc;m khoảng 7 tiếng ở chế độ Always On Display th&igrave; m&aacute;y mất khoảng 3 - 4% dung lượng pin.</p>
<h4><strong>Tần số qu&eacute;t 120 Hz</strong></h4>
<p>iPhone 14 Pro Max c&oacute; tần số qu&eacute;t rất cao vậy n&ecirc;n mọi thao t&aacute;c hằng ng&agrave;y của m&igrave;nh đều được phản hồi nhanh ch&oacute;ng, cảm gi&aacute;c vuốt chạm cũng trở n&ecirc;n th&iacute;ch hơn, hiện tượng khựng hay độ trễ trong l&uacute;c vuốt đ&atilde; được cải thiện đ&aacute;ng kể so với những chuẩn m&agrave;n h&igrave;nh 60 Hz.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103244.jpg"><img class=" ls-is-cached lazyloaded" title="Vuốt chạm mượt m&agrave; - iPhone 14 Pro Max 128GB" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103244.jpg" alt="Vuốt chạm mượt m&agrave; - iPhone 14 Pro Max 128GB" data-src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103244.jpg"></a></p>
<p>Ngo&agrave;i ra, Apple c&ograve;n bổ sung t&ugrave;y chọn để gi&uacute;p bạn c&oacute; thể dễ d&agrave;ng điều chỉnh tần số qu&eacute;t l&ecirc;n 120 Hz hay xuống 60 Hz t&ugrave;y v&agrave;o nhu cầu sử dụng, ph&ugrave; hợp để d&ugrave;ng trong những t&igrave;nh huống khẩn cấp như đang muốn tiết kiệm pin nhằm đảm bảo thiết bị c&oacute; thể duy tr&igrave; sử dụng d&agrave;i l&acirc;u.</p>
<h4><strong>Độ s&aacute;ng 2000 nits</strong></h4>
<p>So với những đối thủ kh&aacute;c trong ph&acirc;n kh&uacute;c th&igrave; độ s&aacute;ng 2000 nits được xem l&agrave; ưu điểm vượt trội m&agrave; &iacute;t c&oacute; h&atilde;ng n&agrave;o c&oacute; thể s&aacute;nh kịp, thế liệu n&oacute; gi&uacute;p &iacute;ch được g&igrave; v&agrave; c&oacute; thực sự hiệu quả hay kh&ocirc;ng chắc hẳn l&agrave; điều được rất nhiều người thắc mắc.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103246.jpg"><img class=" ls-is-cached lazyloaded" title="Độ s&aacute;ng m&agrave;n h&igrave;nh cao - iPhone 14 Pro Max 128GB" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103246.jpg" alt="Độ s&aacute;ng m&agrave;n h&igrave;nh cao - iPhone 14 Pro Max 128GB" data-src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103246.jpg"></a></p>
<p>Cụ thể l&agrave; m&agrave;n h&igrave;nh c&oacute; độ s&aacute;ng cao đ&atilde; gi&uacute;p &iacute;ch cho m&igrave;nh rất nhiều trong mọi nhu cầu sử dụng hằng ng&agrave;y của m&igrave;nh, kể từ khi sử dụng iPhone 14 Pro Max việc xem bản đồ khi đang ở ngo&agrave;i đường l&uacute;c trời nắng gắt cũng trở n&ecirc;n dễ d&agrave;ng, m&agrave;n h&igrave;nh l&uacute;c n&agrave;y kh&ocirc;ng qu&aacute; sập tối hay l&oacute;a, c&aacute;c th&ocirc;ng b&aacute;o chỉ dẫn đường đi cũng đều được thể hiện r&otilde; r&agrave;ng.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103249.jpg"><img class=" ls-is-cached lazyloaded" title="Độ s&aacute;ng m&agrave;n h&igrave;nh cao - iPhone 14 Pro Max 128GB" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103249.jpg" alt="Độ s&aacute;ng m&agrave;n h&igrave;nh cao - iPhone 14 Pro Max 128GB" data-src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103249.jpg"></a></p>
<p>B&ecirc;n cạnh đ&oacute;, khi chụp ảnh ở ngo&agrave;i trời nắng độ s&aacute;ng m&agrave;n h&igrave;nh cao cũng sẽ l&agrave; một lợi thế, n&oacute; hữu &iacute;ch trong l&uacute;c m&igrave;nh căn chỉnh g&oacute;c chụp khi mọi đường lưới đều được hiển thị r&otilde;, chủ thể đ&atilde; được lấy n&eacute;t hay chưa th&igrave; m&igrave;nh cũng c&oacute; thể dễ d&agrave;ng quan s&aacute;t trực tiếp ngay tr&ecirc;n m&agrave;n h&igrave;nh m&agrave; kh&ocirc;ng cần d&ugrave;ng tay để che chắn &aacute;nh s&aacute;ng chiếu v&agrave;o như phần lớn c&aacute;c d&ograve;ng điện thoại kh&aacute;c.</p>
<h4><strong>Mặt k&iacute;nh cường lực Ceramic Shield</strong></h4>
<p>Ceramic Shield c&oacute; lẽ kh&ocirc;ng c&ograve;n l&agrave; thuật ngữ qu&aacute; xa lạ đối với phần lớn người d&ugrave;ng khi đ&acirc;y được xem l&agrave; loại c&ocirc;ng nghệ đ&atilde; từng xuất hiện ở thế hệ iPhone 12, chuẩn n&agrave;y nổi tiếng với độ bền bỉ cực cao v&agrave; khả năng kh&aacute;ng lại vết xước rất tốt.</p>
<p>Thực tế, m&igrave;nh đ&atilde; kiểm tra độ bền của mặt k&iacute;nh n&agrave;y th&ocirc;ng qua việc x&acirc;y x&aacute;t c&aacute;c loại vật dụng kh&aacute;c dễ tiếp x&uacute;c như: M&oacute;c kh&oacute;a, đầu d&acirc;y sạc, b&uacute;t bi v&agrave; cả gọng k&iacute;nh. Kết quả m&agrave; m&igrave;nh nhận được cũng hết sức ấn tượng, m&agrave;n h&igrave;nh gần như kh&ocirc;ng bị tổn hại khi kh&ocirc;ng thấy xuất hiện của bất kỳ một vết xước n&agrave;o cả.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103250.jpg"><img class=" ls-is-cached lazyloaded" title="Mặt k&iacute;nh kh&aacute;ng xước - iPhone 14 Pro Max 128GB" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103250.jpg" alt="Mặt k&iacute;nh kh&aacute;ng xước - iPhone 14 Pro Max 128GB" data-src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103250.jpg"></a></p>
<p>Tuy nhi&ecirc;n đ&acirc;y cũng l&agrave; một b&agrave;i kiểm tra n&ecirc;n lực d&ugrave;ng để x&acirc;y x&aacute;t l&agrave; kh&ocirc;ng qu&aacute; lớn, v&igrave; thế người d&ugrave;ng cũng kh&ocirc;ng n&ecirc;n qu&aacute; chủ quan trước những t&igrave;nh huống l&agrave;m rơi. Điều n&agrave;y chỉ gi&uacute;p m&igrave;nh an t&acirc;m hơn trong việc đặt &uacute;p điện thoại l&ecirc;n mặt phẳng hay để c&ugrave;ng với c&aacute;c loại vật dụng kh&aacute;c m&agrave; kh&ocirc;ng lo bị trầy xước.</p>
<h3>Bắt trọn mọi khoảnh khắc th&ocirc;ng qua camera ch&iacute;nh 48 MP</h3>
<h4><strong>Ảnh chụp chế độ thường</strong></h4>
<p>Trước khi đi v&agrave;o phần đ&aacute;nh gi&aacute; trải nghiệm m&igrave;nh c&ugrave;ng điểm sơ qua th&ocirc;ng số camera của iPhone 14 Pro Max, thiết bị năm nay vẫn sẽ được bố tr&iacute; với cụm 3 camera, trong đ&oacute; cảm biến ch&iacute;nh c&oacute; độ ph&acirc;n giải 48 MP, cảm biến g&oacute;c rộng 12 MP v&agrave; cuối c&ugrave;ng l&agrave; ống k&iacute;nh tele 12 MP. Với th&ocirc;ng số ấn tượng như vậy n&ecirc;n m&aacute;y hứa hẹn sẽ trở th&agrave;nh&nbsp;<a title="Tham khảo điện thoại chụp ảnh, quay phim tại Thế Giới Di Động" href="https://www.thegioididong.com/dtdd-chup-anh-quay-phim" target="_blank" rel="noopener">điện thoại chụp ảnh, quay phim</a>&nbsp;h&agrave;ng đầu trong năm 2022.</p>
<p>Ảnh chụp từ điều kiện thường cho ra kết quả l&agrave;m m&igrave;nh rất ưng &yacute;, h&igrave;nh ảnh được t&aacute;i tạo với độ chi tiết cao, m&agrave;u sắc hiển thị rất ch&acirc;n thực, ảnh khi zoom sẽ kh&ocirc;ng bị bể qu&aacute; nhiều gi&uacute;p cho t&aacute;c vụ ph&oacute;ng to hay thay đổi khung h&igrave;nh kh&ocirc;ng bị thay đổi qu&aacute; nhiều về mặt chất lượng.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103252.jpg"><img class=" lazyloaded" title="Ảnh chụp từ camera - iPhone 14 Pro Max 128GB" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103252.jpg" alt="Ảnh chụp từ camera - iPhone 14 Pro Max 128GB" data-src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103252.jpg"></a></p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103256.jpg"><img class=" lazyloaded" title="Ảnh chụp từ camera - iPhone 14 Pro Max 128GB" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103256.jpg" alt="Ảnh chụp từ camera - iPhone 14 Pro Max 128GB" data-src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103256.jpg"></a></p>
<p>Điểm ưng &yacute; nhất về phần camera ch&iacute;nh l&agrave; về khả năng c&acirc;n bằng m&agrave;u cực tốt, chất lượng ảnh cho ra c&oacute; gam m&agrave;u trung t&iacute;nh, kh&ocirc;ng xảy ra hiện tượng &aacute;m v&agrave;ng hay &aacute;m xanh như tr&ecirc;n một v&agrave;i chiếc smartphone của những đối thủ kh&aacute;c tr&ecirc;n thị trường. Điều n&agrave;y gi&uacute;p việc chỉnh sửa ảnh trở n&ecirc;n dễ d&agrave;ng hơn bởi m&igrave;nh kh&ocirc;ng cần tinh chỉnh sắc độ để đưa ch&uacute;ng về m&agrave;u ban đầu nữa.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103259.jpg"><img class=" lazyloaded" title="Ảnh chụp từ camera - iPhone 14 Pro Max 128GB" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103259.jpg" alt="Ảnh chụp từ camera - iPhone 14 Pro Max 128GB" data-src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103259.jpg"></a></p>
<h4><strong>Ảnh chụp g&oacute;c si&ecirc;u rộng</strong></h4>
<p>C&ograve;n đối với chế độ chụp g&oacute;c si&ecirc;u rộng th&ocirc;ng qua cảm biến phụ 12 MP kết quả thu được l&agrave;m m&igrave;nh rất ưng &yacute;, bức ảnh chụp vẫn c&oacute; độ chi tiết cao, mọi khung cảnh trước mắt m&igrave;nh gần như được đưa hết v&agrave;o trong bức ảnh, những v&ugrave;ng mở rộng cũng kh&ocirc;ng hề bị b&oacute;p m&eacute;o hay giảm chất lượng ảnh gi&uacute;p cho tổng thể bức h&igrave;nh trở n&ecirc;n rất chất lượng.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103301.jpg"><img class=" lazyloaded" title="Ảnh chụp từ camera - iPhone 14 Pro Max 128GB" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103301.jpg" alt="Ảnh chụp từ camera - iPhone 14 Pro Max 128GB" data-src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103301.jpg"></a></p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103303.jpg"><img class=" lazyloaded" title="Ảnh chụp từ camera - iPhone 14 Pro Max 128GB" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103303.jpg" alt="Ảnh chụp từ camera - iPhone 14 Pro Max 128GB" data-src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103303.jpg"></a></p>
<h4><strong>Ảnh chụp ngược s&aacute;ng</strong></h4>
<p>Bị tối mặt hay l&oacute;a s&aacute;ng được xem l&agrave; t&igrave;nh huống phổ biến đối với c&aacute;c smartphone th&ocirc;ng thường, thế nhưng tr&ecirc;n chiếc iPhone 14 Pro Max th&igrave; điều n&agrave;y đ&atilde; được cải thiện đi đ&aacute;ng kể th&ocirc;ng qua t&iacute;nh năng Smart HDR 4.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103306.jpg"><img class=" lazyloaded" title="Ảnh chụp từ camera - iPhone 14 Pro Max 128GB" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103306.jpg" alt="Ảnh chụp từ camera - iPhone 14 Pro Max 128GB" data-src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103306.jpg"></a></p>
<p>Khi đối mặt với những nguồn c&oacute; độ s&aacute;ng cao điện thoại sẽ tự động nhận diện chủ thể v&agrave; khung cảnh, từ đ&oacute; tăng s&aacute;ng những v&ugrave;ng cần lấy n&eacute;t tập trung v&agrave; giảm độ s&aacute;ng cho những vị tr&iacute; c&ograve;n lại để gi&uacute;p cho bức ảnh của m&igrave;nh trở n&ecirc;n dễ nh&igrave;n hơn, ngo&agrave;i ra n&oacute; c&ograve;n gi&uacute;p cho bức ảnh của m&igrave;nh được tăng th&ecirc;m phần nghệ thuật.</p>
<h4><strong>Ảnh chụp tele</strong></h4>
<p>Ở chế độ chụp tele điện thoại hỗ trợ cho ch&uacute;ng ta kh&aacute; nhiều mức độ điều chỉnh từ 2X, 3X cho đến 5X v&agrave; 10X,...Tuy nhi&ecirc;n m&aacute;y sẽ chỉ hỗ trợ zoom quang học tối đa l&ecirc;n đến 3X v&agrave; với c&aacute;c mức độ lớn hơn th&igrave; điện thoại sẽ chuyển sang chế độ zoom kỹ thuật số.</p>
<p>Ảnh chụp từ chế độ zoom quang học m&aacute;y sẽ sử dụng một camera ri&ecirc;ng biệt c&oacute; độ ph&acirc;n giải 12 MP để lấy n&eacute;t, chất lượng ảnh cho ra vẫn sẽ c&oacute; độ chi tiết cao, mọi thứ được lưu giữ gần như nguy&ecirc;n bản v&agrave; kh&ocirc;ng mấy kh&aacute;c biệt so với những bức ảnh chụp từ chế độ mặc định, tuy nhi&ecirc;n để tr&aacute;nh hiểu lầm th&igrave; đ&acirc;y cũng chỉ l&agrave; một v&iacute; dụ so s&aacute;nh nếu như kh&ocirc;ng soi x&eacute;t qu&aacute; kỹ về tỷ lệ độ ph&acirc;n giải của cả hai.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103308.jpg"><img class=" lazyloaded" title="Ảnh chụp từ camera - iPhone 14 Pro Max 128GB" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103308.jpg" alt="Ảnh chụp từ camera - iPhone 14 Pro Max 128GB" data-src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103308.jpg"></a></p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103310.jpg"><img class=" lazyloaded" title="Ảnh chụp từ camera - iPhone 14 Pro Max 128GB" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103310.jpg" alt="Ảnh chụp từ camera - iPhone 14 Pro Max 128GB" data-src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103310.jpg"></a></p>
<p>C&ograve;n ở bức ảnh chụp từ t&iacute;nh năng zoom kỹ thuật số bức ảnh m&agrave; m&igrave;nh c&oacute; chụp được vẫn kh&aacute; ổn, ở đ&acirc;y camera của điện thoại sẽ l&agrave;m việc với nguy&ecirc;n l&yacute; tương tự như bạn đang crop bức ảnh của m&igrave;nh với khung h&igrave;nh v&agrave; tỷ lệ nhỏ hơn, v&igrave; thế chất lượng ảnh sẽ c&oacute; phần k&eacute;m hơn so với chụp mặc định.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103312.jpg"><img class=" lazyloaded" title="Ảnh chụp từ camera - iPhone 14 Pro Max 128GB" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103312.jpg" alt="Ảnh chụp từ camera - iPhone 14 Pro Max 128GB" data-src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103312.jpg"></a></p>
<p>Nhưng nhờ camera ch&iacute;nh c&oacute; độ ph&acirc;n giải lớn v&agrave; độ chi tiết thu được kh&aacute; cao, cho n&ecirc;n khi chụp bằng chế độ zoom kỹ thuật số th&igrave; ảnh vẫn c&oacute; độ chi tiết tốt, mọi vật thể v&agrave; khung cảnh đều được thu lại tương đối r&otilde; r&agrave;ng.</p>
<h4><strong>Ảnh chụp khung cảnh nhiều m&agrave;u sắc</strong></h4>
<p>Năm nay th&igrave; Apple truyền th&ocirc;ng kh&aacute; nhiều về c&aacute;c t&iacute;nh năng phụ cũng như loại c&ocirc;ng nghệ tr&ecirc;n camera của iPhone 14 Pro Max, được nhắc đến nhiều c&oacute; lẽ l&agrave; những c&aacute;i t&ecirc;n như: Deep Fusion, Smart HDR 4 v&agrave; Dolby Vision HDR.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103314.jpg"><img class=" lazyloaded" title="Ảnh chụp từ camera - iPhone 14 Pro Max 128GB" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103314.jpg" alt="Ảnh chụp từ camera - iPhone 14 Pro Max 128GB" data-src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103314.jpg"></a></p>
<p>Đ&acirc;y được xem l&agrave; những loại c&ocirc;ng nghệ gần như chưa c&oacute; mặt tr&ecirc;n bất kỳ một chiếc điện thoại Android n&agrave;o cả, vậy n&ecirc;n đ&acirc;y ch&iacute;nh l&agrave; lợi thế vượt trội m&agrave; m&igrave;nh đ&aacute;nh gi&aacute; rất cao tr&ecirc;n camera của iPhone 14 Pro Max.</p>
<p>Thực tế th&igrave; ảnh chụp của điện thoại cho ra c&oacute; m&agrave;u rất giống so với ngo&agrave;i đời thật, độ chi tiết cực cao, những v&ugrave;ng c&oacute; m&agrave;u sắc ri&ecirc;ng biệt kh&ocirc;ng thấy xảy ra t&igrave;nh trạng pha trộn lẫn nhau, tổng thể bức ảnh l&agrave;m cho m&igrave;nh c&oacute; cảm gi&aacute;c nh&igrave;n rất đ&atilde; mắt.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103316.jpg"><img class=" lazyloaded" title="Ảnh chụp từ camera - iPhone 14 Pro Max 128GB" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103316.jpg" alt="Ảnh chụp từ camera - iPhone 14 Pro Max 128GB" data-src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103316.jpg"></a></p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103318.jpg"><img class="lazyload" title="Ảnh chụp từ camera - iPhone 14 Pro Max 128GB" alt="Ảnh chụp từ camera - iPhone 14 Pro Max 128GB" data-src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103318.jpg"></a></p>
<p>Bởi v&igrave; được hỗ trợ t&iacute;nh năng Deep Fusion n&ecirc;n m&aacute;y c&oacute; khả năng chụp tổng cộng l&agrave; 9 tấm trong qu&aacute; tr&igrave;nh m&igrave;nh chụp một bức h&igrave;nh, từ đ&oacute; m&aacute;y sẽ tự động ph&acirc;n t&iacute;ch để đưa ra bức h&igrave;nh c&oacute; độ chi tiết cũng như chất lượng tốt nhất để hiển thị. Vậy n&ecirc;n trong kh&uacute;c chụp m&igrave;nh c&oacute; xảy ra t&igrave;nh trạng run tay nhẹ th&igrave; ảnh cho ra vẫn kh&ocirc;ng hề bị nh&ograve;e hay mất n&eacute;t.</p>
<h3>Hiệu năng đ&aacute;ng kinh ngạc với chip set Apple A16 Bionic</h3>
<p>Theo th&ocirc;ng lệ từ trước đến nay của Apple th&igrave; mỗi lần ra mắt d&ograve;ng điện thoại mới l&agrave; nh&agrave; t&aacute;o lại tr&igrave;nh l&agrave;ng th&ecirc;m một con chip với hiệu năng cực khủng v&agrave; ở thế hệ điện iPhone 14 Series sẽ l&agrave; con chip Apple A16 Bionic 6 nh&acirc;n với xung nhịp tối đa l&ecirc;n đến 3.46 GHz.</p>
<p>Xem th&ecirc;m:&nbsp;<a href="https://www.thegioididong.com/hoi-dap/chip-a16-bionic-giup-iphone-14-lan-at-hieu-nang-1461587" target="_blank" rel="noopener">Đ&aacute;nh gi&aacute; chip Apple A16 Bionic chi tiết về th&ocirc;ng số v&agrave; hiệu năng</a></p>
<p>Theo như th&ocirc;ng số m&igrave;nh đo được qua c&aacute;c phần mềm con chip Apple A16 Bionic đạt được mức điểm như sau: 1887 (đơn nh&acirc;n), 5354 (đa nh&acirc;n) tr&ecirc;n Benchmark v&agrave; 15508 điểm đ&aacute;nh gi&aacute; tổng thể. Đ&acirc;y quả thực l&agrave; những con số qu&aacute; khủng khiếp, dường như chip đ&atilde; vượt mặt gần như to&agrave;n bộ c&aacute;c vi xử l&yacute; hiện đang c&oacute; mặt tr&ecirc;n thị trường di động trong năm 2022.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103320.jpg"><img class=" lazyloaded" title="Ảnh chụp từ camera - iPhone 14 Pro Max 128GB" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103320.jpg" alt="Hiệu năng mạnh mẽ - iPhone 14 Pro Max 128GB" data-src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103320.jpg"></a></p>
<p>Bởi v&igrave; cầm tr&ecirc;n tay một chiếc m&aacute;y c&oacute; hiệu năng v&ocirc; đối như vậy cho n&ecirc;n m&igrave;nh cũng đ&atilde; tự tin mở ngay Genshin Impact với mức đồ họa cao nhất để trải nghiệm, chất lượng h&igrave;nh ảnh cho ra phải n&oacute;i l&agrave; v&ocirc; c&ugrave;ng đẹp mắt, mọi hiệu ứng đồ họa trong game đều được t&aacute;i hiện r&otilde; n&eacute;t, c&aacute;c pha h&agrave;nh động như đ&aacute;nh nhau, tung chi&ecirc;u đều được thể hiện mượt m&agrave; v&agrave; ổn định.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103323.jpg"><img class=" lazyloaded" title="Ảnh chụp từ camera - iPhone 14 Pro Max 128GB" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103323.jpg" alt="Hiệu năng mạnh mẽ - iPhone 14 Pro Max 128GB" data-src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103323.jpg"></a></p>
<p>B&ecirc;n cạnh đ&oacute;, đ&acirc;y c&ograve;n l&agrave; một chiếc&nbsp;<a title="Tham khảo điện thoại đang kinh doanh tại Thế Giới Di Động" href="https://www.thegioididong.com/dtdd-ram-6gb" target="_blank" rel="noopener">điện thoại RAM 6 GB</a>&nbsp;cho n&ecirc;n c&aacute;c thao t&aacute;c về phần đa nhiệm đều được m&aacute;y xử l&yacute; dễ d&agrave;ng, d&ugrave;ng đồng thời nhiều ứng dụng cũng kh&ocirc;ng hề xảy ra t&igrave;nh trạng khựng hay load lại từ đầu mỗi khi m&igrave;nh mở lại.</p>
<p>Ở phi&ecirc;n bản n&agrave;y điện thoại sẽ được t&iacute;ch hợp sẵn hệ điều h&agrave;nh iOS 16 kể từ khi k&iacute;ch hoạt m&aacute;y, được bổ sung h&agrave;ng loạt c&aacute;c t&iacute;nh năng mới mẻ n&ecirc;n m&igrave;nh cảm thấy rất l&agrave; hứng khởi trong qu&aacute; tr&igrave;nh trải nghiệm m&aacute;y.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103324.jpg"><img class=" lazyloaded" title="Hiệu năng mạnh mẽ - iPhone 14 Pro Max 128GB" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103324.jpg" alt="Hiệu năng mạnh mẽ - iPhone 14 Pro Max 128GB" data-src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103324.jpg"></a></p>
<p>Những t&iacute;nh năng nổi bật v&agrave; cực kỳ hữu &iacute;ch tr&ecirc;n iOS 16 c&oacute; thể kể đến như: T&ugrave;y chỉnh m&agrave;n h&igrave;nh kh&oacute;a, th&ecirc;m widget mới cho m&agrave;n h&igrave;nh kh&oacute;a, Live Text, t&aacute;ch nền ảnh,... đều được m&igrave;nh sử dụng hằng ng&agrave;y một c&aacute;ch tiện lợi cho c&ocirc;ng việc v&agrave; kể cả những nhu cầu giải tr&iacute;.</p>
<p>B&ecirc;n trong điện thoại sẽ được t&iacute;ch hợp vi&ecirc;n pin c&oacute; dung lượng l&ecirc;n tới 4323 mAh n&ecirc;n m&igrave;nh cũng đ&atilde; an t&acirc;m hơn trong việc sử dụng m&aacute;y phục vụ c&aacute;c t&aacute;c vụ cơ bản cả ng&agrave;y. Cụ thể l&agrave; trong một ng&agrave;y trải nghiệm m&aacute;y m&igrave;nh đ&atilde; mất khoảng 7 giờ 23 ph&uacute;t sử dụng li&ecirc;n tục để c&oacute; thể d&ugrave;ng hết 100% pin tr&ecirc;n điện thoại.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103327.jpg"><img class=" lazyloaded" title="Pin tr&acirc;u d&ugrave;ng l&acirc;u - iPhone 14 Pro Max 128GB" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103327.jpg" alt="Pin tr&acirc;u d&ugrave;ng l&acirc;u - iPhone 14 Pro Max 128GB" data-src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103327.jpg"></a></p>
<p>Với những bạn đang mong muốn c&oacute; cho m&igrave;nh một thiết bị c&oacute; ngoại h&igrave;nh đẹp, hiệu năng cao v&agrave; kể cả chụp ảnh quay phim chuy&ecirc;n nghiệm th&igrave; iPhone 14 Pro Max c&oacute; thể coi l&agrave; sự lựa chọn rất ph&ugrave; hợp cho năm 2022 v&agrave; 2023 sắp tới. So với những g&igrave; m&agrave; thiết bị mang lại cho ch&uacute;ng ta th&igrave; mức gi&aacute; b&aacute;n của điện thoại được xem l&agrave; cực kỳ xứng đ&aacute;ng.</p>', N'hai15042003', N'99', 1, 34700000, 9, N'Iphone')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1804230311', N'Trái cây sấy giòn Vinamit gói 250g', N'/Assets/img/HDD1804230311.jpg', N'', CAST(N'2023-04-18T15:11:23.023' AS DateTime), 20, N'<p><a href="https://www.bachhoaxanh.com/trai-cay-say">Tr&aacute;i c&acirc;y sấy</a>&nbsp;gi&ograve;n gi&ograve;n, thơm v&agrave; giữ được độ ngọt tự nhi&ecirc;n của chuối, ăn rất th&iacute;ch.&nbsp;<a href="https://www.bachhoaxanh.com/trai-cay-say/trai-cay-say-vinamit-goi-250g">Tr&aacute;i c&acirc;y sấy gi&ograve;n Vinamit g&oacute;i 250g</a>&nbsp;vừa ăn vừa xem phim, đọc s&aacute;ch rất ph&ugrave; hợp hoặc thưởng tr&agrave;.&nbsp;<a href="https://www.bachhoaxanh.com/trai-cay-say-vinamit">Tr&aacute;i c&acirc;y sấy&nbsp;Vinamit</a>&nbsp;chất lượng, vệ sinh v&agrave; dinh dưỡng, l&agrave; m&oacute;n ăn tiện lợi v&agrave; thơm ngon</p>', N'sykhang', N'1', 1, 72500, 30, NULL)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1804230315', N'Xoài Thái sấy dẻo Thaifruitz gói 100g', N'/Assets/img/HDD1804230315.jpg', N'', CAST(N'2023-04-18T15:15:10.967' AS DateTime), 20, NULL, N'sykhang', N'1', 1, 57000, 20, NULL)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1804230317', N'Khoai lang vàng sấy Rộp Rộp gói 100g', N'/Assets/img/HDD1804230317.jpg', N'', CAST(N'2023-04-18T15:17:17.827' AS DateTime), 20, NULL, N'sykhang', N'1', 1, 25000, 0, NULL)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1804230319', N'Khoai môn sấy Rộp Rộp gói 100g', N'/Assets/img/HDD1804230319.jpg', N'', CAST(N'2023-04-18T15:19:39.343' AS DateTime), 20, NULL, N'sykhang', NULL, 1, 30000, 0, NULL)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1804230328', N'6 chai nước ngọt Mirinda hương cam 390ml', N'/Assets/img/HDD1804230328.jpg', N'', CAST(N'2023-04-18T15:28:31.753' AS DateTime), 6, NULL, N'sykhang', NULL, 1, 38000, 16, NULL)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1804230329', N'2 chai nước ngọt Mirinda xá xị 1.5 lít', N'/Assets/img/HDD1804230329.jpg', N'', CAST(N'2023-04-18T15:29:15.703' AS DateTime), 6, NULL, N'sykhang', N'2', 1, 40000, 0, NULL)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1804230331', N'6 lon nước ngọt Mirinda hương xá xị 320ml', N'/Assets/img/HDD1804230331.jpg', N'', CAST(N'2023-04-18T15:31:04.617' AS DateTime), 6, NULL, N'sykhang', N'6', 1, 48000, 8, NULL)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1804230333', N'6 lon nước ngọt Fanta hương cam 320ml', N'/Assets/img/HDD1804230333.jpg', N'', CAST(N'2023-04-18T15:33:34.073' AS DateTime), 6, NULL, N'sykhang', N'6', 1, 40000, 25, NULL)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1804230338', N'Tủ lạnh Toshiba Inverter 180 lít GR-B22VU UKG', N'/Assets/img/HDD1804230338.jpg', N'', CAST(N'2023-04-18T15:38:12.787' AS DateTime), 16, NULL, N'sykhang', N'1', 1, 5290000, 7, NULL)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1804230339', N'Tủ lạnh Toshiba Inverter 194 lít GR-A25VM(UKG1) ', N'/Assets/img/HDD1804230339.jpg', N'', CAST(N'2023-04-18T15:39:10.847' AS DateTime), 16, NULL, N'sykhang', N'1', 1, 5790000, 12, NULL)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1804230341', N'Tủ lạnh Toshiba Inverter 233 lít GR-A28VM(UKG1) ', N'/Assets/img/HDD1804230341.jpg', N'', CAST(N'2023-04-18T15:41:15.170' AS DateTime), 16, NULL, N'sykhang', N'1', 1, 6290000, 0, NULL)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1804230342', N'Tủ lạnh Aqua Inverter 245 lít AQR-T259FA(FB)', N'/Assets/img/HDD1804230342.jpg', N'', CAST(N'2023-04-18T15:42:05.357' AS DateTime), 16, NULL, N'sykhang', N'1', 0, 6990000, 10, NULL)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1804230704', N'Laptop Acer Aspire 7 Gaming A715 42G R05G R5 5500U/8GB/512GB/4GB GTX1650/144Hz/Win11', N'/Assets/img/HDD1804230704.jpg', N'Laptop Acer Aspire 7 Gaming A715 42G R05G (NH.QAYSV.007) sở hữu phong cách thiết kế độc đáo, thời thượng cùng hiệu năng mạnh mẽ, đáp ứng tối đa mọi nhu cầu của người dùng từ cơ bản đến nâng cao.', CAST(N'2023-04-18T19:04:10.737' AS DateTime), 3, N'<h3><a title="Laptop Acer Aspire 7 Gaming A715 42G R05G (NH.QAYSV.007) đang b&aacute;n tại thegioididong.com" href="https://www.thegioididong.com/laptop/acer-aspire-7-gaming-a715-42g-r05g-r5-nhqaysv007" target="_blank" rel="noopener">Laptop Acer Aspire 7 Gaming A715 42G R05G (NH.QAYSV.007)&nbsp;</a>sở hữu phong c&aacute;ch thiết kế độc đ&aacute;o, thời thượng c&ugrave;ng hiệu năng mạnh mẽ, đ&aacute;p ứng tối đa mọi nhu cầu của người d&ugrave;ng từ cơ bản đến n&acirc;ng cao.</h3>
<p>&bull; Giải quyết nhẹ nh&agrave;ng c&aacute;c c&ocirc;ng việc cơ bản tr&ecirc;n Word, Excel, PowerPoint,... đến những t&aacute;c vụ nặng hơn như thiết kế đồ họa hay chiến c&aacute;c con game hấp dẫn nhờ&nbsp;<a title="Xem th&ecirc;m c&aacute;c mẫu Laptop AMD Ryzen 5 hiện đang kinh doanh tại thegioididong.com" href="https://www.thegioididong.com/laptop-ryzen-5" target="_blank" rel="noopener">laptop AMD Ryzen 5</a><strong>&nbsp;5500U&nbsp;</strong>c&ugrave;ng card đồ họa rời&nbsp;<strong>NVIDIA GeForce GTX 1650 4 GB&nbsp;</strong>mạnh mẽ. &nbsp;</p>
<p>&bull; Độ ph&acirc;n giải&nbsp;<strong>Full HD (1920 x 1080)</strong>&nbsp;cung cấp những khung h&igrave;nh sắc n&eacute;t đến từng chi tiết với gam m&agrave;u sắc tươi tắn, tần số qu&eacute;t&nbsp;<strong>144 Hz&nbsp;</strong>gi&uacute;p những chuyển động trở n&ecirc;n mượt m&agrave;, hạn chế nh&ograve;e h&igrave;nh, đ&aacute;p ứng tốt nhu cầu của một chiếc&nbsp;<a title="Xem th&ecirc;m c&aacute;c mẫu Laptop đồ họa - kỹ thuật hiện đang kinh doanh tại thegioididong.com" href="https://www.thegioididong.com/laptop?g=do-hoa-ky-thuat" target="_blank" rel="noopener">laptop đồ họa - kỹ thuật</a>&nbsp;chuy&ecirc;n s&acirc;u.&nbsp;</p>
<p>&bull; M&agrave;n h&igrave;nh&nbsp;<strong>15.6 inch</strong>&nbsp;c&oacute; tấm nền<strong>&nbsp;IPS&nbsp;</strong>v&agrave; c&ocirc;ng nghệ&nbsp;<strong>Acer ComfyView</strong>&nbsp;mang đến cho&nbsp;<a title="Xem th&ecirc;m c&aacute;c mẫu Laptop Acer hiện đang kinh doanh tại thegioididong.com" href="https://www.thegioididong.com/laptop-acer" target="_blank" rel="noopener">laptop Acer</a>&nbsp;g&oacute;c nh&igrave;n rộng l&ecirc;n đến&nbsp;<strong>178 độ</strong>&nbsp;nhưng vẫn giữ nguy&ecirc;n vẹn chất lượng khung h&igrave;nh kh&ocirc;ng bị nh&ograve;e hay m&eacute;o m&oacute;, đồng thời c&ograve;n bảo vệ thị gi&aacute;c người xem trước những nơi c&oacute; &aacute;nh s&aacute;ng xanh độc hại nhờ m&agrave;n h&igrave;nh chống ch&oacute;i<strong>&nbsp;Anti Glare</strong>.&nbsp;</p>
<p>&bull; Bộ nhớ&nbsp;<strong>RAM 8 GB</strong>&nbsp;cho ph&eacute;p mở nhiều tab l&agrave;m việc kh&aacute;c nhau m&agrave; kh&ocirc;ng lo đơ m&aacute;y. Ổ cứng&nbsp;<strong>SSD 512 GB</strong>&nbsp;cung cấp kh&ocirc;ng gian lưu trữ đủ d&ugrave;ng, r&uacute;t ngắn thời gian truy cập ứng dụng.</p>
<p>&bull; Chiến game cực đ&atilde; với chất lượng &acirc;m thanh sống động như thật với &acirc;m bass to r&otilde;, chắc khỏe c&ugrave;ng độ lọc khử tiếng ồn tốt đến từ c&ocirc;ng nghệ&nbsp;<strong>Acer TrueHarmony</strong>.&nbsp;</p>
<p>&bull; To&aacute;t l&ecirc;n thần th&aacute;i mạnh mẽ với lớp&nbsp;<strong>vỏ nhựa</strong>&nbsp;m&agrave;u đen bền chắc, khối lượng<strong>&nbsp;2.1 kg&nbsp;</strong>vẫn c&oacute; thể chấp nhận được trong d&ograve;ng&nbsp;<a title="Xem th&ecirc;m c&aacute;c mẫu Laptop Gaming hiện đang kinh doanh tại thegioididong.com" href="https://www.thegioididong.com/laptop?g=laptop-gaming" target="_blank" rel="noopener">laptop gaming</a>, gi&uacute;p Acer Aspire lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh c&ugrave;ng bạn mọi l&uacute;c mọi nơi m&agrave; kh&ocirc;ng lo cồng kềnh, nặng nhọc. ​&nbsp;</p>
<p>&bull; Đa dạng c&aacute;c cổng kết nối được trang bị dọc 2 b&ecirc;n&nbsp;<a title="Xem th&ecirc;m c&aacute;c mẫu Laptop hiện đang kinh doanh tại thegioididong.com" href="https://www.thegioididong.com/laptop" target="_blank" rel="noopener">laptop</a>&nbsp;như 2 x USB 3.2, HDMI, Jack tai nghe 3.5 mm, LAN (RJ45), USB 2.0 v&agrave; USB Type-C.</p>
<p>&bull;&nbsp;<strong>Đ&egrave;n nền</strong>&nbsp;b&agrave;n ph&iacute;m đơn sắc được trang bị tr&ecirc;n&nbsp;<a title="Xem th&ecirc;m c&aacute;c mẫu Laptop Acer Aspire hiện đang kinh doanh tại thegioididong.com" href="https://www.thegioididong.com/laptop-acer-aspire" target="_blank" rel="noopener">laptop Acer Aspire</a>&nbsp;mang đến trải nghiệm g&otilde; ph&iacute;m chuẩn x&aacute;c d&ugrave; l&agrave;m việc trong m&ocirc;i trường thiếu s&aacute;ng. Đặc biệt l&agrave;&nbsp;<strong>bản lề mở 180 độ</strong>&nbsp;cho ph&eacute;p bạn dễ d&agrave;ng chia sẻ th&ocirc;ng tin v&agrave; l&agrave;m việc với mọi tư thế kh&aacute;c nhau. ​&nbsp;</p>
<p>&bull; Hệ điều h&agrave;nh&nbsp;<strong>Windows 11 Home SL&nbsp;</strong>được c&agrave;i đặt sẵn&nbsp;c&aacute;c phần mềm tiện &iacute;ch gi&uacute;p tối ưu hiệu suất của bạn.</p>', N'nguyenhieu', N'1 sản phẩm / hộp', 1, 15990000, 21, N'Acer')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1804230706', N'Laptop Dell Gaming G15 5511 i5 11400H/8GB/256GB/4GB RTX3050/120Hz/OfficeHS/Win11', N'/Assets/img/HDD1804230706.jpg', N'Không những mang đến cho người dùng hiệu năng ấn tượng nhờ con chip Intel thế hệ 11 tân tiến cùng card rời RTX 30 series, laptop Dell Gaming G15 5511 i5 11400H (70266676) còn sở hữu thiết kế thời thượng, lôi cuốn, hứa hẹn sẽ là người cộng sự lý tưởng cùng bạn chinh phục mọi chiến trường.', CAST(N'2023-04-18T19:06:09.457' AS DateTime), 3, N'<h3>Kh&ocirc;ng những mang đến cho người d&ugrave;ng hiệu năng ấn tượng nhờ con chip&nbsp;<strong>Intel thế hệ 11</strong>&nbsp;t&acirc;n tiến c&ugrave;ng&nbsp;<a title="Laptop sở hữu Card rời RTX 30 series đang kinh doanh tại Thegioididong.com" href="https://www.thegioididong.com/laptop-card-roi-rtx-30-series" target="_blank" rel="noopener">card rời RTX 30 series</a>,&nbsp;<a title="Laptop Dell Gaming G15 5511 i5 (70266676) đang b&aacute;n tại thegioididong.com" href="https://www.thegioididong.com/laptop/dell-gaming-g15-5511-i5-70266676" target="_blank" rel="noopener">laptop Dell Gaming G15 5511 i5 11400H (70266676)</a>&nbsp;c&ograve;n sở hữu thiết kế thời thượng, l&ocirc;i cuốn, hứa hẹn sẽ l&agrave; người cộng sự l&yacute; tưởng c&ugrave;ng bạn chinh phục mọi chiến trường.</h3>
<h3>Thu h&uacute;t mọi &aacute;nh nh&igrave;n c&ugrave;ng vẻ ngo&agrave;i nổi bật</h3>
<p>Đến với chiếc&nbsp;<a title="Xem th&ecirc;m c&aacute;c mẫu Laptop hiện đang kinh doanh tại thegioididong.com" href="https://www.thegioididong.com/laptop" target="_blank" rel="noopener">laptop</a>, ng&ocirc;n ngữ thiết kế đ&atilde; được thay đổi so với c&aacute;c phi&ecirc;n bản tiền nhiệm, hầm hố hơn, c&aacute;c đường n&eacute;t cắt xẻ tăng th&ecirc;m phần gaming cho chiếc m&aacute;y. Lớp&nbsp;<strong>vỏ nhựa</strong>&nbsp;m&agrave;u x&aacute;m bao bọc b&ecirc;n ngo&agrave;i chiếc&nbsp;<a title="Xem th&ecirc;m c&aacute;c mẫu Laptop Dell Gaming G-series hiện đang kinh doanh tại thegioididong.com" href="https://www.thegioididong.com/laptop-dell-gaming-g-series" target="_blank" rel="noopener">laptop Dell Gaming</a>&nbsp;n&agrave;y mang đến sự bền bỉ ho&agrave;n mỹ c&ugrave;ng khối lượng&nbsp;<strong>2.81 kg</strong>&nbsp;v&agrave; d&agrave;y&nbsp;<strong>25 mm</strong>, với m&igrave;nh đ&acirc;y l&agrave; một con số vừa đủ để c&oacute; thể mang theo b&ecirc;n người, phục vụ cho nhu cầu l&agrave;m việc cũng như giải tr&iacute; cho bản th&acirc;n.&nbsp;</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/44/264354/dell-gaming-g15-5511-i5-70266676-7-3.jpg"><img class=" ls-is-cached lazyloaded" title="Dell Gaming G15 5511 i5 11400H (70266676) - Thiết kế" src="https://cdn.tgdd.vn/Products/Images/44/264354/dell-gaming-g15-5511-i5-70266676-7-3.jpg" alt="Dell Gaming G15 5511 i5 11400H (70266676) - Thiết kế" data-src="https://cdn.tgdd.vn/Products/Images/44/264354/dell-gaming-g15-5511-i5-70266676-7-3.jpg"></a></p>
<p><a title="Laptop, m&aacute;y t&iacute;nh x&aacute;ch tay trang bị đ&egrave;n b&agrave;n ph&iacute;m đang kinh doanh tại Thegioididong.com" href="https://www.thegioididong.com/laptop-den-ban-phim" target="_blank" rel="noopener">Đ&egrave;n nền</a>&nbsp;tiện lợi c&ugrave;ng c&aacute;c ph&iacute;m g&otilde; s&acirc;u, độ nảy tốt được trang bị ở chiếc&nbsp;<a title="Xem th&ecirc;m c&aacute;c mẫu Laptop Dell hiện đang kinh doanh tại thegioididong.com" href="https://www.thegioididong.com/laptop-dell" target="_blank" rel="noopener">laptop Dell</a>&nbsp;n&agrave;y hỗ trợ người d&ugrave;ng tối đa trong qu&aacute; tr&igrave;nh học tập, l&agrave;m việc cũng như chơi c&aacute;c tựa game m&agrave; kh&ocirc;ng lo nhầm lẫn, n&acirc;ng cao hiệu suất l&agrave;m việc d&ugrave; ở bất kỳ điều kiện &aacute;nh s&aacute;ng n&agrave;o.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/44/264354/dell-gaming-g15-5511-i5-70266676-2-3.jpg"><img class=" ls-is-cached lazyloaded" title="Dell Gaming G15 5511 i5 11400H (70266676) - B&agrave;n ph&iacute;m" src="https://cdn.tgdd.vn/Products/Images/44/264354/dell-gaming-g15-5511-i5-70266676-2-3.jpg" alt="Dell Gaming G15 5511 i5 11400H (70266676) - B&agrave;n ph&iacute;m" data-src="https://cdn.tgdd.vn/Products/Images/44/264354/dell-gaming-g15-5511-i5-70266676-2-3.jpg"></a></p>
<p>Phi&ecirc;n bản laptop n&agrave;y c&ograve;n được trang bị h&agrave;ng loạt những cổng giao tiếp th&ocirc;ng dụng dọc hai b&ecirc;n m&aacute;y như USB 3.2, HDMI, Jack tai nghe 3.5 mm, LAN (RJ45) v&agrave; USB Type-C, cho ph&eacute;p bạn kết nối hay truyền xuất dữ liệu đến nhiều loại thiết bị ngoại vi tương th&iacute;ch một c&aacute;ch dễ d&agrave;ng hơn. Nh&agrave; Dell đ&atilde; t&acirc;m l&yacute; khi mang những cổng kết nối về ph&iacute;a sau m&aacute;y, gi&uacute;p m&igrave;nh kh&ocirc;ng bị vướng v&iacute;u khi vừa l&agrave;m việc tr&ecirc;n m&aacute;y vừa phải cắm sạc.</p>
<h3>Chiến mọi tựa game đ&igrave;nh đ&aacute;m mượt m&agrave;</h3>
<p>Bộ vi xử l&yacute;&nbsp;<strong>Intel Core i5 Tiger Lake</strong>&nbsp;đ&atilde; mang lại hiệu năng tốt, tuy nhi&ecirc;n chiếc m&aacute;y khi trải nghiệm tựa game&nbsp;<a title="Link tải game Cyberpunk " href="https://www.thegioididong.com/game-app/cyberpunk-2077-231286" target="_blank" rel="noopener">Cyberpunk</a>&nbsp;th&igrave; đ&atilde; hơi &ldquo;đuối&rdquo; nếu để mức c&agrave;i đặt cao nhất. M&igrave;nh khuyến kh&iacute;ch c&aacute;c bạn h&atilde;y hạ mức đồ hoạ của game xuống thấp để c&oacute; trải nghiệm tốt hơn nh&eacute;.&nbsp;</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/44/264354/dell-gaming-g15-5511-i5-70266676-4-3.jpg"><img class=" lazyloaded" title="Dell Gaming G15 5511 i5 11400H (70266676) - Cyberpunk" src="https://cdn.tgdd.vn/Products/Images/44/264354/dell-gaming-g15-5511-i5-70266676-4-3.jpg" alt="Dell Gaming G15 5511 i5 11400H (70266676) - Cyberpunk" data-src="https://cdn.tgdd.vn/Products/Images/44/264354/dell-gaming-g15-5511-i5-70266676-4-3.jpg"></a></p>
<p>Đến với tựa game&nbsp;<a title="Link tải game CS:GO" href="https://www.thegioididong.com/game-app/cs-go-game-ban-sung-nhieu-nguoi-choi-nhat-tren-the-gioi-221745" target="_blank" rel="noopener">CS:GO</a>, m&aacute;y đ&atilde; ổn định hơn với mức FPS l&agrave;&nbsp;<strong>90</strong>. Qua trải nghiệm chơi game, c&aacute;c thao t&aacute;c như di chuột, qua lại đều rất trơn tru, cảm gi&aacute;c chơi game vẫn phấn kh&iacute;ch, ấn tượng trong khi mức c&agrave;i đặt của m&igrave;nh lu&ocirc;n để cao hoặc tối đa.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/44/264354/dell-gaming-g15-5511-i5-70266676-3-2.jpg"><img class=" lazyloaded" title="Dell Gaming G15 5511 i5 11400H (70266676) - CS:GO" src="https://cdn.tgdd.vn/Products/Images/44/264354/dell-gaming-g15-5511-i5-70266676-3-2.jpg" alt="Dell Gaming G15 5511 i5 11400H (70266676) - CS:GO" data-src="https://cdn.tgdd.vn/Products/Images/44/264354/dell-gaming-g15-5511-i5-70266676-3-2.jpg"></a></p>
<p>Cho ph&eacute;p bạn mở c&ugrave;ng l&uacute;c nhiều ứng dụng, h&agrave;ng loạt tab v&agrave; chuyển đổi qua lại m&agrave; kh&ocirc;ng lo giật lag nhờ sự đa nhiệm đến từ&nbsp;<a title="Xem th&ecirc;m c&aacute;c mẫu Laptop c&oacute; RAM 8 GB hiện đang kinh doanh tại thegioididong.com" href="https://www.thegioididong.com/laptop-8-gb" target="_blank" rel="noopener">laptop&nbsp;RAM 8 GB</a>&nbsp;chuẩn&nbsp;<strong>DDR4 2 khe</strong>&nbsp;(1 khe&nbsp;<strong>8 GB</strong>&nbsp;+ 1 khe rời). Tuy nhi&ecirc;n c&aacute;c t&aacute;c vụ d&oacute; chỉ dừng lại ở mức cơ bản, n&ecirc;n để c&oacute; thể khai th&aacute;c tốt sức mạnh của CPU v&agrave; GPU th&igrave; m&igrave;nh khuy&ecirc;n c&aacute;c bạn h&atilde;y n&acirc;ng cấp th&ecirc;m RAM nh&eacute;.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/44/264354/dell-gaming-g15-5511-i5-70266676-4.jpg"><img class=" lazyloaded" title="Dell Gaming G15 5511 i5 11400H (70266676) - Hiệu năng" src="https://cdn.tgdd.vn/Products/Images/44/264354/dell-gaming-g15-5511-i5-70266676-4.jpg" alt="Dell Gaming G15 5511 i5 11400H (70266676) - Hiệu năng" data-src="https://cdn.tgdd.vn/Products/Images/44/264354/dell-gaming-g15-5511-i5-70266676-4.jpg"></a></p>
<p>C&ugrave;ng bạn tạo n&ecirc;n những t&aacute;c phẩm ấn tượng với chất lượng đồ họa vượt trội, h&igrave;nh ảnh ch&acirc;n thật nhờ card đồ họa rời&nbsp;<strong>NVIDIA GeForce RTX 3050 4 GB</strong>, cho bạn thỏa sức chỉnh sửa h&igrave;nh ảnh, render video,... chuy&ecirc;n nghiệp tr&ecirc;n Photoshop, AI,... đồng thời mang đến trải nghiệm c&aacute;c tựa game một c&aacute;ch trơn tru ở cả mức đồ họa thấp hay cao như PUBG: Battlegrounds, LOL,...</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/44/264354/dell-gaming-g15-5511-i5-70266676-5.jpg"><img class=" lazyloaded" title="Dell Gaming G15 5511 i5 11400H (70266676) - Card m&agrave;n h&igrave;nh" src="https://cdn.tgdd.vn/Products/Images/44/264354/dell-gaming-g15-5511-i5-70266676-5.jpg" alt="Dell Gaming G15 5511 i5 11400H (70266676) - Card m&agrave;n h&igrave;nh" data-src="https://cdn.tgdd.vn/Products/Images/44/264354/dell-gaming-g15-5511-i5-70266676-5.jpg"></a></p>
<p>Chiếc m&aacute;y được m&igrave;nh thử th&aacute;ch kiểm tra qua phần mềm&nbsp;<strong>Intel Processor Diagnostic Tool</strong>, qua đ&oacute; nhận thấy mức xung nhịp tăng l&ecirc;n đến&nbsp;<strong>3.15 Ghz</strong>&nbsp;so với th&ocirc;ng số cơ bản m&agrave; h&atilde;ng cung cấp l&agrave;&nbsp;<strong>2.7 Ghz</strong>.&nbsp;</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/44/264354/dell-gaming-g15-5511-i5-70266676-1-2.jpg"><img class=" lazyloaded" title="Dell Gaming G15 5511 i5 11400H (70266676) - CPU" src="https://cdn.tgdd.vn/Products/Images/44/264354/dell-gaming-g15-5511-i5-70266676-1-2.jpg" alt="Dell Gaming G15 5511 i5 11400H (70266676) - CPU" data-src="https://cdn.tgdd.vn/Products/Images/44/264354/dell-gaming-g15-5511-i5-70266676-1-2.jpg"></a></p>
<p>Đến với khả năng test GPU, m&igrave;nh chọn phần mềm&nbsp;<strong>Fur Mark</strong>&nbsp;để kiểm tra th&igrave; kết quả cho thấy m&aacute;y sẽ xử l&yacute; loanh quanh&nbsp;<strong>33 FPS</strong>. Đ&acirc;y l&agrave; mức điểm chấp nhận được với chiếc m&aacute;y gaming gi&aacute; rẻ. Như m&igrave;nh đ&atilde; n&oacute;i, để khai th&aacute;c hết sức mạnh của card m&agrave;n h&igrave;nh th&igrave; c&aacute;c bạn h&atilde;y n&acirc;ng cấp RAM để c&oacute; trải nghiệm tốt nhất nha.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/44/264354/dell-gaming-g15-5511-i5-70266676-6-3.jpg"><img class=" lazyloaded" title="Dell Gaming G15 5511 i5 11400H (70266676) - 3D test" src="https://cdn.tgdd.vn/Products/Images/44/264354/dell-gaming-g15-5511-i5-70266676-6-3.jpg" alt="Dell Gaming G15 5511 i5 11400H (70266676) - 3D test " data-src="https://cdn.tgdd.vn/Products/Images/44/264354/dell-gaming-g15-5511-i5-70266676-6-3.jpg"></a></p>
<p>Ổ cứng&nbsp;<strong>SSD 256 GB</strong>&nbsp;mang lại kh&ocirc;ng gian lưu trữ thấp, với nhu cầu sử dụng hằng ng&agrave;y của m&igrave;nh ở mức đơn giản, m&igrave;nh khuy&ecirc;n c&aacute;c bạn h&atilde;y n&acirc;ng cấp SSD để mở rộng khả năng lưu trữ, c&agrave;i game, ứng dụng thoả th&iacute;ch m&agrave; kh&ocirc;ng lo phải giải ph&oacute;ng.</p>
<h3>Chuẩn x&aacute;c hơn cả về h&igrave;nh ảnh lẫn &acirc;m thanh</h3>
<p>M&agrave;n h&igrave;nh viền mỏng&nbsp;<strong>15.6 inch</strong>&nbsp;sở hữu độ ph&acirc;n giải&nbsp;<strong>Full HD (1920 x 1080)</strong>&nbsp;cho h&igrave;nh ảnh hiển thị r&otilde; n&eacute;t, ch&acirc;n thật hơn&nbsp;ở những nơi c&oacute; điều kiện &aacute;nh s&aacute;ng b&igrave;nh thường như trong nh&agrave;, ph&ograve;ng học,...&nbsp;đồng thời mở rộng kh&ocirc;ng gian đến&nbsp;<strong>178 độ</strong>&nbsp;nhờ c&ocirc;ng nghệ&nbsp;<strong>WVA</strong>&nbsp;kết hợp c&ugrave;ng độ s&aacute;ng&nbsp;<strong>250 nits</strong>, mang đến những trải nghiệm trọn vẹn hơn. Theo m&igrave;nh m&agrave;n h&igrave;nh m&aacute;y sẽ đ&aacute;p ứng tốt nhu cầu giải tr&iacute; cơ bản như xem phim, chơi game nhẹ nh&agrave;ng.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/44/264354/dell-gaming-g15-5511-i5-70266676-8.jpg"><img class=" lazyloaded" title="Dell Gaming G15 5511 i5 11400H (70266676) - C&ocirc;ng nghệ m&agrave;n h&igrave;nh" src="https://cdn.tgdd.vn/Products/Images/44/264354/dell-gaming-g15-5511-i5-70266676-8.jpg" alt="Dell Gaming G15 5511 i5 11400H (70266676) - C&ocirc;ng nghệ m&agrave;n h&igrave;nh" data-src="https://cdn.tgdd.vn/Products/Images/44/264354/dell-gaming-g15-5511-i5-70266676-8.jpg"></a></p>
<p><a title="Xem th&ecirc;m c&aacute;c mẫu Laptop c&oacute; m&agrave;n h&igrave;nh 120 Hz hiện đang kinh doanh tại thegioididong.com" href="https://www.thegioididong.com/laptop-120-hz" target="_blank" rel="noopener">M&agrave;n h&igrave;nh laptop 120 Hz</a>&nbsp;cho bạn m&atilde;n nh&atilde;n với từng chuyển động của những bộ phim h&agrave;nh động đầy kịch t&iacute;nh hay c&aacute;c tựa game rượt đuổi hấp dẫn m&agrave; kh&ocirc;ng lo xảy ra t&igrave;nh trạng giật, x&eacute; h&igrave;nh, kết hợp c&ugrave;ng c&ocirc;ng nghệ chống ch&oacute;i&nbsp;<strong>Anti Glare</strong>, hỗ trợ bạn giải tr&iacute; ở cả điều kiện &aacute;nh s&aacute;ng bất lợi m&agrave; kh&ocirc;ng sợ ảnh hưởng ti&ecirc;u cực đến mắt nhưng vẫn tiết kiệm điện năng tối ưu nhờ c&ocirc;ng nghệ&nbsp;<strong>LED Backlit</strong>.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/44/264354/dell-gaming-g15-5511-i5-70266676-9.jpg"><img class=" lazyloaded" title="Dell Gaming G15 5511 i5 11400H (70266676) - Tần số qu&eacute;t m&agrave;n h&igrave;nh" src="https://cdn.tgdd.vn/Products/Images/44/264354/dell-gaming-g15-5511-i5-70266676-9.jpg" alt="Dell Gaming G15 5511 i5 11400H (70266676) - Tần số qu&eacute;t m&agrave;n h&igrave;nh" data-src="https://cdn.tgdd.vn/Products/Images/44/264354/dell-gaming-g15-5511-i5-70266676-9.jpg"></a></p>
<p>&Acirc;m thanh to r&otilde; c&ugrave;ng khả năng khử tiếng ồn t&acirc;n tiến đến từ c&ocirc;ng nghệ&nbsp;<strong>Nahimic Audio</strong>, cho bạn những trải nghiệm kh&oacute; qu&ecirc;n với kh&ocirc;ng gian &acirc;m nhạc đặc sắc, sống động, mang đến cảm gi&aacute;c thư gi&atilde;n hơn bao giờ hết.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/44/264354/dell-gaming-g15-5511-i5-70266676-10.jpg"><img class=" lazyloaded" title="Dell Gaming G15 5511 i5 11400H (70266676) - C&ocirc;ng nghệ &acirc;m thanh " src="https://cdn.tgdd.vn/Products/Images/44/264354/dell-gaming-g15-5511-i5-70266676-10.jpg" alt="Dell Gaming G15 5511 i5 11400H (70266676) - C&ocirc;ng nghệ &acirc;m thanh " data-src="https://cdn.tgdd.vn/Products/Images/44/264354/dell-gaming-g15-5511-i5-70266676-10.jpg"></a></p>
<p>Dell Gaming G15 5511 i5 11400H (70266676) l&agrave; phi&ecirc;n bản&nbsp;<a title="Xem th&ecirc;m c&aacute;c mẫu Laptop Gaming hiện đang kinh doanh tại thegioididong.com" href="https://www.thegioididong.com/laptop?g=laptop-gaming" target="_blank" rel="noopener">laptop gaming</a>&nbsp;m&agrave; c&aacute;c game thủ n&ecirc;n c&acirc;n nhắc chọn mua bởi cấu h&igrave;nh mạnh mẽ c&ugrave;ng kiểu d&aacute;ng hiện đại. B&ecirc;n cạnh đ&oacute; th&igrave; Dell đ&atilde; mang đến một sản phẩm gaming c&oacute; mức gi&aacute; dễ tiếp cận hơn với người d&ugrave;ng n&ecirc;n đ&acirc;y vẫn c&oacute; thể l&agrave; sự lựa chọn l&yacute; tưởng cho những ai c&oacute; nhu cầu về đồ họa - kỹ thuật.</p>', N'nguyenhieu', N'1 sản phẩm / hộp', 1, 23290000, 15, N'Dell')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1804230707', N'Laptop Asus TUF Gaming F15 FX506HC i5 11400H/8GB/512GB/4GB RTX3050/144Hz/Win11', N'/Assets/img/HDD1804230707.jpg', N'Laptop Asus TUF Gaming F15 FX506HC i5 (HN144W) với CPU Intel dòng H và card rời RTX 30 series, thiết kế độc đáo cùng khả năng chiến tốt các tựa game hiện hành là sự lựa chọn phù hợp cho bạn. ', CAST(N'2023-04-18T19:07:48.627' AS DateTime), 3, N'<h3><a title="Laptop Asus TUF Gaming F15 FX506HC i5 (HN144W) đang b&aacute;n tại thegioididong.com" href="https://www.thegioididong.com/laptop/asus-tuf-gaming-fx506hc-i5-hn144w" target="_blank" rel="noopener">Laptop Asus TUF Gaming F15 FX506HC i5 (HN144W)</a>&nbsp;với CPU Intel d&ograve;ng H v&agrave;&nbsp;<a title="Laptop sở hữu Card rời RTX 30 series đang kinh doanh tại Thegioididong.com" href="https://www.thegioididong.com/laptop-card-roi-rtx-30-series" target="_blank" rel="noopener">card rời RTX 30 series</a>, thiết kế độc đ&aacute;o c&ugrave;ng khả năng chiến tốt c&aacute;c tựa game hiện h&agrave;nh l&agrave; sự lựa chọn ph&ugrave; hợp cho bạn.&nbsp;</h3>
<p>&bull;&nbsp;<a title="Xem th&ecirc;m laptop Asus đang b&aacute;n tại thegioididong.com" href="https://www.thegioididong.com/laptop-asus" target="_blank" rel="noopener">Laptop Asus</a>&nbsp;mang trong m&igrave;nh&nbsp;<strong>CPU Intel Core i5 11400H</strong>&nbsp;mạnh mẽ c&ugrave;ng card rời<strong>&nbsp;RTX 3050&nbsp;4 GB</strong>&nbsp;đảm bảo trải nghiệm chơi game của bạn hay thiết kế đồ hoạ chuy&ecirc;n s&acirc;u được mượt m&agrave; nhất.</p>
<p>&bull;&nbsp;<a title="Xem th&ecirc;m laptop Asus TUF gaming đang b&aacute;n tại thegioididong.com" href="https://www.thegioididong.com/laptop-asus-tuf-gaming" target="_blank" rel="noopener">Laptop Asus TUF gaming</a>&nbsp;sở hữu&nbsp;<strong>RAM 8 GB</strong>&nbsp;cho khả năng đa nhiệm ổn định, khuyến kh&iacute;ch n&acirc;ng cấp để c&oacute; trải nghiệm tốt nhất.&nbsp;<strong>SSD 512 GB</strong>&nbsp;tăng tốc độ truy xuất dữ liệu, khởi động ứng dụng,&nbsp;<a title="Xem th&ecirc;m laptop đang b&aacute;n tại thegioididong.com" href="https://www.thegioididong.com/laptop" target="_blank" rel="noopener">laptop</a>&nbsp;nhanh ch&oacute;ng.</p>
<p>&bull; Chiếc m&aacute;y được trang bị m&agrave;n h&igrave;nh&nbsp;<strong>15.6 inch</strong>&nbsp;ch&acirc;n thật, tần số qu&eacute;t&nbsp;<strong>144 Hz</strong>&nbsp;kết hợp c&ocirc;ng nghệ&nbsp;<strong>Adaptive Sync</strong>&nbsp;gi&uacute;p hạn chế t&igrave;nh trạng giật x&eacute; m&agrave;n h&igrave;nh.&nbsp;</p>
<p>&bull; Thiết kế nổi bật của d&ograve;ng&nbsp;<a title="Xem th&ecirc;m laptop gaming đang b&aacute;n tại thegioididong.com" href="https://www.thegioididong.com/laptop?g=laptop-gaming" target="_blank" rel="noopener">laptop gaming</a>&nbsp;với logo c&aacute;nh TUF in đậm tr&ecirc;n nền m&agrave;u đen c&ugrave;ng hoạ tiết xước ph&acirc;y sang trọng.</p>
<p>&bull; Đa dạng cổng giao tiếp với 3 x USB 3.2, Thunderbolt 4, HDMI, LAN.</p>
<p>&bull; C&ocirc;ng nghệ &acirc;m thanh<strong>&nbsp;DTS&nbsp;</strong>gi&uacute;p kh&ocirc;ng gian giải tr&iacute; sống động hơn.</p>', N'nguyenhieu', N'1 sản phẩm / hộp', 1, 25990000, 0, N'Asus')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1804230709', N'Laptop Lenovo Ideapad Gaming 3 15IAH7 i5 12500H/8GB/512GB/4GB RTX3050/120Hz/Win11', N'/Assets/img/HDD1804230709.jpg', N'Laptop Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) thuộc dòng laptop gaming mang vẻ đẹp ấn tượng, cuốn hút nhưng không kém phần mạnh mẽ nhờ vào CPU Intel Gen 12, sẵn sàng đồng hành cùng bạn trên mọi đấu trường game hiện nay.
', CAST(N'2023-04-18T19:09:26.900' AS DateTime), 3, N'<h3><a title="Laptop Lenovo Ideapad Gaming 3 15IAH7 i5 12500H/8GB/512GB/4GB RTX3050/120Hz/Win11 (82S9007TVN) đang b&aacute;n tại thegioididong.com" href="https://www.thegioididong.com/laptop/lenovo-ideapad-gaming-3-15iah7-i5-82s9007tvn" target="_blank" rel="noopener">Laptop Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN)</a>&nbsp;thuộc d&ograve;ng&nbsp;<a title="Xem th&ecirc;m c&aacute;c mẫu Laptop Gaming hiện đang kinh doanh tại thegioididong.com" href="https://www.thegioididong.com/laptop?g=laptop-gaming" target="_blank" rel="noopener">laptop gaming</a>&nbsp;mang vẻ đẹp ấn tượng, cuốn h&uacute;t nhưng kh&ocirc;ng k&eacute;m phần mạnh mẽ nhờ v&agrave;o CPU Intel Gen 12, sẵn s&agrave;ng đồng h&agrave;nh c&ugrave;ng bạn tr&ecirc;n mọi đấu trường game hiện nay.</h3>
<h3>Thiết kế hầm hố, c&aacute; t&iacute;nh với gam m&agrave;u trắng cuốn h&uacute;t</h3>
<p>Lenovo IdeaPad Gaming 3 sở hữu một thiết kế g&oacute;c cạnh c&ugrave;ng gam m&agrave;u trắng pha lẫn c&aacute;c chi tiết xanh tạo n&ecirc;n một tổng thể v&ocirc; c&ugrave;ng mạnh mẽ, hầm hố nhưng kh&ocirc;ng k&eacute;m phần sang trọng. Tuy c&oacute; lớp vỏ từ nhựa nhưng cảm gi&aacute;c cầm nắm, x&aacute;ch l&ecirc;n di chuyển rất chắc chắn v&agrave; kh&ocirc;ng ọp ẹp.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/44/283775/lenovo-ideapad-gaming-3-15iah7-i5-82s9007tvn-220822-021256.jpg"><img class=" ls-is-cached lazyloaded" title="Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) - thiết kế" src="https://cdn.tgdd.vn/Products/Images/44/283775/lenovo-ideapad-gaming-3-15iah7-i5-82s9007tvn-220822-021256.jpg" alt="Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) - thiết kế" data-src="https://cdn.tgdd.vn/Products/Images/44/283775/lenovo-ideapad-gaming-3-15iah7-i5-82s9007tvn-220822-021256.jpg"></a></p>
<p>Thiết kế từ tản nhiệt của m&aacute;y l&agrave;m thiết bị n&agrave;y trở n&ecirc;n nổi bật hơn bao giờ,&nbsp;<strong>2 khe h&uacute;t gi&oacute;</strong>&nbsp;v&agrave;&nbsp;<strong>2 khe tản nhiệt</strong>&nbsp;được đặt tinh tế đối xứng đi với t&ocirc;ng m&agrave;u xanh l&agrave;m chiếc m&aacute;y tr&ocirc;ng rất hầm hố v&agrave; tương lai. C&aacute;c trải nghiệm chơi game cũng được hệ thống tản nhiệt l&agrave;m việc rất tốt gi&uacute;p m&igrave;nh kh&ocirc;ng c&oacute; cảm gi&aacute;c bị hơi n&oacute;ng tỏa ra l&agrave;m kh&oacute; chịu.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/44/283775/lenovo-ideapad-gaming-3-15iah7-i5-82s9007tvn-220822-021254.jpg"><img class=" ls-is-cached lazyloaded" title="Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) - khe tản nhiệt" src="https://cdn.tgdd.vn/Products/Images/44/283775/lenovo-ideapad-gaming-3-15iah7-i5-82s9007tvn-220822-021254.jpg" alt="Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) - khe tản nhiệt" data-src="https://cdn.tgdd.vn/Products/Images/44/283775/lenovo-ideapad-gaming-3-15iah7-i5-82s9007tvn-220822-021254.jpg"></a></p>
<p>Sở hữu cho m&igrave;nh c&acirc;n nặng&nbsp;<strong>2.315 kg</strong>&nbsp;v&agrave; độ d&agrave;y&nbsp;<strong>21.8 mm</strong>, mức trọng lượng n&agrave;y c&oacute; phần nặng hơn so với người đ&agrave;n anh của m&igrave;nh tuy nhi&ecirc;n kh&ocirc;ng nhiều. Với hiệu năng mạnh mẽ từ chiếc m&aacute;y n&agrave;y, th&ecirc;m một &iacute;t khối lượng cũng kh&ocirc;ng l&agrave;m ch&uacute;ng ta qu&aacute; kh&oacute; khăn khi di chuyển.&nbsp;C&aacute;c thao t&aacute;c gập l&ecirc;n, gập xuống của bản lề tr&ecirc;n m&aacute;y được ho&agrave;n thiện rất tốt, m&igrave;nh c&oacute; thể cảm thấy được sự mượt m&agrave; v&agrave; trơn tru. Tuy nhi&ecirc;n, bản lề chưa thật sự tạo cho m&igrave;nh cảm gi&aacute;c chắc chắn, m&agrave;n h&igrave;nh c&oacute; phần hơi rung nhẹ với c&aacute;c t&aacute;c động.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/44/283775/vi-vn-lenovo-ideapad-gaming-3-15iah7-i5-82s9007tvn-2.jpg"><img class=" ls-is-cached lazyloaded" title="Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) - trọng lượng" src="https://cdn.tgdd.vn/Products/Images/44/283775/vi-vn-lenovo-ideapad-gaming-3-15iah7-i5-82s9007tvn-2.jpg" alt="Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) - trọng lượng" data-src="https://cdn.tgdd.vn/Products/Images/44/283775/vi-vn-lenovo-ideapad-gaming-3-15iah7-i5-82s9007tvn-2.jpg"></a></p>
<p>B&agrave;n ph&iacute;m của c&aacute;c chiếc&nbsp;<a title="Xem th&ecirc;m c&aacute;c mẫu Laptop hiện đang kinh doanh tại thegioididong.com" href="https://www.thegioididong.com/laptop" target="_blank" rel="noopener">laptop</a>&nbsp;từ h&atilde;ng Lenovo lu&ocirc;n mang đến một trải nghiệm g&otilde; rất tuyệt vời. Với IdeaPad Gaming 3, b&agrave;n ph&iacute;m sử dụng layout&nbsp;<strong>FullSize</strong>&nbsp;với t&ocirc;ng m&agrave;u trắng liền mạch với m&agrave;u của m&aacute;y, tạo n&ecirc;n một tổng thể v&ocirc; c&ugrave;ng sang trọng v&agrave; bắt mắt. Hơn hết, h&agrave;nh tr&igrave;nh ph&iacute;m v&agrave; độ nảy của ph&iacute;m được Lenovo l&agrave;m rất tốt, bạn c&oacute; thể g&otilde; văn bản hằng giờ liền m&agrave; kh&ocirc;ng cảm thấy nh&agrave;m ch&aacute;n.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/44/283775/lenovo-ideapad-gaming-3-15iah7-i5-82s9007tvn-220822-021253.jpg"><img class=" lazyloaded" title="Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) - b&agrave;n ph&iacute;m" src="https://cdn.tgdd.vn/Products/Images/44/283775/lenovo-ideapad-gaming-3-15iah7-i5-82s9007tvn-220822-021253.jpg" alt="Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) - b&agrave;n ph&iacute;m" data-src="https://cdn.tgdd.vn/Products/Images/44/283775/lenovo-ideapad-gaming-3-15iah7-i5-82s9007tvn-220822-021253.jpg"></a></p>
<p>Cảm gi&aacute;c đ&acirc;y l&agrave; một chiếc m&aacute;y đến từ tương lai khi bật đ&egrave;n nền b&agrave;n ph&iacute;m l&ecirc;n, m&aacute;y trang bị cho ch&uacute;ng ta đ&egrave;n nền m&agrave;u xanh l&agrave;m chiếc m&aacute;y tr&ocirc;ng rất nổi bật v&agrave; cuốn h&uacute;t. Đ&egrave;n ở ph&iacute;m hỗ trợ rất nhiều cho m&igrave;nh khi l&agrave;m việc ở những điều kiện thiếu s&aacute;ng. B&ecirc;n cạnh đ&oacute;, b&agrave;n di chuột tr&ecirc;n m&aacute;y cũng mượt m&agrave; v&agrave; ch&iacute;nh x&aacute;c, c&oacute; thể thay thế chuột rời l&agrave;m một số t&aacute;c vụ cơ bản.</p>
<p>C&aacute;c cổng kết nối c&oacute; k&iacute;ch thước lớn như HDMI, LAN (RJ45), Thunderbolt 4 v&agrave; Jack sạc được Lenovo tinh tế đặt ở ph&iacute;a sau gi&uacute;p bạn dễ d&agrave;ng giấu d&acirc;y, tạo n&ecirc;n một kh&ocirc;ng gian l&agrave;m việc gọn g&agrave;ng. B&ecirc;n cạnh đ&oacute; m&aacute;y cũng trang bị đầy đủ Jack tai nghe 3.5 mm, USB 3.2 xung quanh hai cạnh gi&uacute;p bạn sử dụng dễ d&agrave;ng v&agrave; tiện lợi hơn.</p>
<h3>Cấu h&igrave;nh mạnh mẽ, chiến game v&ocirc; tư c&ugrave;ng bạn</h3>
<p><a title="Xem th&ecirc;m c&aacute;c mẫu Laptop Lenovo IdeaPad Gaming hiện đang kinh doanh tại thegioididong.com" href="https://www.thegioididong.com/laptop-lenovo-ideapad-gaming" target="_blank" rel="noopener">Laptop Lenovo Ideapad Gaming</a>&nbsp;trang bị bộ vi xử l&yacute;&nbsp;<strong>Intel Core i5 Alder Lake 12500H</strong>, với sự kết hợp giữa nh&acirc;n hiệu năng mạnh P-core v&agrave; nh&acirc;n tiết kiệm E-core gi&uacute;p hiệu suất hoạt động của CPU cao hơn đ&aacute;ng kể so với c&aacute;c thế hệ đi trước, từ đ&oacute; c&oacute; thể giải quyết c&aacute;c t&aacute;c vụ l&agrave;m việc, chơi game của bạn một c&aacute;ch nhẹ nh&agrave;ng v&agrave; nhanh ch&oacute;ng. C&aacute;c th&ocirc;ng số thu được khi m&igrave;nh sử dụng phần mềm&nbsp;<strong>Cinebench R23</strong>&nbsp;lần lượt l&agrave;&nbsp;<strong>1597</strong>&nbsp;ở đơn nh&acirc;n v&agrave;&nbsp;<strong>10461</strong>&nbsp;ở đa nh&acirc;n. Một số điểm tương đối cao so với d&ograve;ng laptop gaming c&oacute; mức gi&aacute; phổ th&ocirc;ng.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/44/283775/lenovo-ideapad-gaming-3-15iah7-i5-82s9007tvn-220822-021246.jpg"><img class=" lazyloaded" title="Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) - hiệu năng" src="https://cdn.tgdd.vn/Products/Images/44/283775/lenovo-ideapad-gaming-3-15iah7-i5-82s9007tvn-220822-021246.jpg" alt="Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) - hiệu năng" data-src="https://cdn.tgdd.vn/Products/Images/44/283775/lenovo-ideapad-gaming-3-15iah7-i5-82s9007tvn-220822-021246.jpg"></a></p>
<p>Card đồ họa rời&nbsp;<strong>NVIDIA GeForce RTX 3050 4 GB</strong>&nbsp;c&oacute; thể c&acirc;n tốt cho bạn c&aacute;c tựa game thịnh h&agrave;nh hiện nay như Li&ecirc;n Minh Huyền Thoại, CS:GO, GTA V,... hơn hết bạn c&oacute; thể thỏa sức s&aacute;ng tạo với c&aacute;c phần mềm thiết kế của Adobe: Photoshop, Illustrator, Premiere,... một c&aacute;ch mượt m&agrave; v&agrave; nhẹ nh&agrave;ng.</p>
<p>Với&nbsp;<a title="Xem th&ecirc;m c&aacute;c mẫu Laptop RAM 8 GB hiện đang kinh doanh tại thegioididong.com" href="https://www.thegioididong.com/laptop-8-gb" target="_blank" rel="noopener">laptop RAM 8 GB</a>, bạn c&oacute; thể sử dụng c&aacute;c t&aacute;c vụ đa nhiệm một c&aacute;ch cơ bản như vừa chơi game vừa nghe nhạc thoải m&aacute;i. Nếu bạn cần tăng dung lượng bộ nhớ để sử dụng nhiều hơn đa nhiệm, m&aacute;y cho ph&eacute;p n&acirc;ng cấp v&igrave; c&ograve;n dư một 1 khe RAM rời.</p>
<p><a title="Xem th&ecirc;m c&aacute;c mẫu Laptop Lenovo hiện đang kinh doanh tại thegioididong.com" href="https://www.thegioididong.com/laptop-lenovo" target="_blank" rel="noopener">Laptop Lenovo</a>&nbsp;được trang bị ổ cứng&nbsp;<strong>512 GB SSD NVMe PCIe</strong>&nbsp;(C&oacute; thể th&aacute;o ra, lắp thanh kh&aacute;c tối đa&nbsp;<strong>1 TB</strong>), việc lưu trữ c&aacute;c tựa game hoặc c&aacute;c tập tin t&agrave;i liệu cơ bản c&oacute; thể vừa đủ với bạn. Th&ecirc;m v&agrave;o đ&oacute;, với chuẩn PCIe, việc truy xuất dữ liệu hoặc tắt mở c&aacute;c ứng dụng được cải thiện rất đ&aacute;ng kể, từ đ&oacute; gi&uacute;p bạn tiết kiệm được rất nhiều thời gian.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/44/283775/lenovo-ideapad-gaming-3-15iah7-i5-82s9007tvn-220822-021248.jpg"><img class=" lazyloaded" title="Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) - SSD" src="https://cdn.tgdd.vn/Products/Images/44/283775/lenovo-ideapad-gaming-3-15iah7-i5-82s9007tvn-220822-021248.jpg" alt="Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) - SSD" data-src="https://cdn.tgdd.vn/Products/Images/44/283775/lenovo-ideapad-gaming-3-15iah7-i5-82s9007tvn-220822-021248.jpg"></a></p>
<p>Với c&aacute;c th&ocirc;ng số tr&ecirc;n l&yacute; thuyết l&agrave; vậy, m&igrave;nh sẽ trực tiếp trải nghiệm game tr&ecirc;n chiếc m&aacute;y n&agrave;y để c&oacute; được hiệu năng thực tế tr&ecirc;n laptop Lenovo Ideapad Gaming. Tựa game đầu ti&ecirc;n m&igrave;nh chơi l&agrave;&nbsp;<strong>CS:GO</strong>, tốc độ khung h&igrave;nh ở tựa game n&agrave;y cho ra khoảng&nbsp;<strong>130 - 145 FPS</strong>&nbsp;khi kết hợp với m&agrave;n h&igrave;nh&nbsp;<strong>120 Hz</strong>&nbsp;l&agrave; rất mượt m&agrave;, c&aacute;c thao t&aacute;c ch&iacute;nh x&aacute;c gần như tuyệt đối.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/44/283775/lenovo-ideapad-gaming-3-15iah7-i5-82s9007tvn-220822-021244.jpg"><img class=" lazyloaded" title="Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) - CS:GO" src="https://cdn.tgdd.vn/Products/Images/44/283775/lenovo-ideapad-gaming-3-15iah7-i5-82s9007tvn-220822-021244.jpg" alt="Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) - CS:GO" data-src="https://cdn.tgdd.vn/Products/Images/44/283775/lenovo-ideapad-gaming-3-15iah7-i5-82s9007tvn-220822-021244.jpg"></a></p>
<p>Tựa game thứ hai m&igrave;nh trải nghiệm l&agrave;&nbsp;<strong>Valorant</strong>, một tựa game c&oacute; nhiều hiệu ứng hơn để c&oacute; thể thử xem hệ thống tản nhiệt tr&ecirc;n m&aacute;y hoạt động đ&atilde; tốt chưa. Mức FPS dao động khoảng&nbsp;<strong>110 - 120 FPS</strong>&nbsp;với mức c&agrave;i đặt cấu h&igrave;nh rất cao. B&ecirc;n cạnh đ&oacute;, hệ thống tản nhiệt của laptop IdeaPad Gaming 3 l&agrave;m kh&aacute; tốt khi ổn định ở&nbsp;<strong>56 độ</strong>&nbsp;cho CPU v&agrave;&nbsp;<strong>67 độ</strong>&nbsp;GPU.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/44/283775/lenovo-ideapad-gaming-3-15iah7-i5-82s9007tvn-220822-021243.jpg"><img class=" lazyloaded" title="Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) - Valorant" src="https://cdn.tgdd.vn/Products/Images/44/283775/lenovo-ideapad-gaming-3-15iah7-i5-82s9007tvn-220822-021243.jpg" alt="Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) - Valorant" data-src="https://cdn.tgdd.vn/Products/Images/44/283775/lenovo-ideapad-gaming-3-15iah7-i5-82s9007tvn-220822-021243.jpg"></a></p>
<p>Với m&agrave;n h&igrave;nh&nbsp;<strong>120 Hz</strong>&nbsp;v&agrave; hiệu năng tương đối tốt khi chơi game m&igrave;nh quyết định chọn&nbsp;<strong>MotoGP&trade;22</strong>&nbsp;để trải nghiệm. Ở tựa game đua xe n&agrave;y, m&agrave;n h&igrave;nh v&agrave; hiệu năng của m&aacute;y ph&aacute;t huy rất tốt khi mang đến mức FPS ổn định ở&nbsp;<strong>126 - 130</strong>, c&aacute;c thao t&aacute;c &ocirc;m cua, điều khiển đều được mượt m&agrave; v&agrave; chuẩn x&aacute;c.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/44/283775/lenovo-ideapad-gaming-3-15iah7-i5-82s9007tvn-220822-021241.jpg"><img class=" lazyloaded" title="Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) - MotoGP&trade;22" src="https://cdn.tgdd.vn/Products/Images/44/283775/lenovo-ideapad-gaming-3-15iah7-i5-82s9007tvn-220822-021241.jpg" alt="Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) - MotoGP&trade;22" data-src="https://cdn.tgdd.vn/Products/Images/44/283775/lenovo-ideapad-gaming-3-15iah7-i5-82s9007tvn-220822-021241.jpg"></a></p>
<h3>Hiển thị h&igrave;nh ảnh chuy&ecirc;n nghiệp hơn</h3>
<p>Laptop sở hữu m&agrave;n h&igrave;nh&nbsp;<strong>15.6 inch</strong>&nbsp;c&ugrave;ng độ ph&acirc;n giải&nbsp;<strong>Full HD</strong>, c&aacute;c h&igrave;nh ảnh được hiển thị đều rất r&otilde; r&agrave;ng v&agrave; sắc n&eacute;t. Trang bị đầy đủ c&aacute;c c&ocirc;ng nghệ phần mềm nổi bật hiện nay như&nbsp;<strong>250 nits</strong>, chống ch&oacute;i&nbsp;<strong>Anti Glare</strong>,&nbsp;<strong>tấm nền IPS</strong>&nbsp;gi&uacute;p bạn thoải m&aacute;i trải nghiệm chơi game ở mọi m&ocirc;i trường, mọi g&oacute;c nh&igrave;n.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/44/283775/vi-vn-lenovo-ideapad-gaming-3-15iah7-i5-82s9007tvn-5.jpg"><img class=" lazyloaded" title="Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) - m&agrave;n h&igrave;nh" src="https://cdn.tgdd.vn/Products/Images/44/283775/vi-vn-lenovo-ideapad-gaming-3-15iah7-i5-82s9007tvn-5.jpg" alt="Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) - m&agrave;n h&igrave;nh" data-src="https://cdn.tgdd.vn/Products/Images/44/283775/vi-vn-lenovo-ideapad-gaming-3-15iah7-i5-82s9007tvn-5.jpg"></a></p>
<p>Thuộc d&ograve;ng laptop gaming c&oacute; vi&ecirc;n pin dung lượng&nbsp;<strong>60 Wh</strong>, tuy nhi&ecirc;n khi sử dụng m&aacute;y chỉ c&oacute; thể trụ được khoảng&nbsp;<strong>2 tiếng</strong>&nbsp;khi m&igrave;nh l&agrave;m việc tr&ecirc;n Excel v&agrave; xem YouTube. Nếu bạn trải nghiệm game hoặc c&aacute;c t&aacute;c vụ nặng, h&atilde;y cắm sạc để m&aacute;y đạt được hiệu năng tốt nhất nh&eacute;.</p>
<p>Tổng kết lại, mang cho m&igrave;nh thiết kế &ldquo;phi thuyền&rdquo; đầy c&aacute; t&iacute;nh v&agrave; mạnh mẽ. Bạn c&ograve;n chần chờ g&igrave; nữa m&agrave; chưa sở hữu cho m&igrave;nh laptop Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) để c&oacute; thể chiến game hoặc khoe với bạn b&egrave; v&igrave; thiết kế nổi bật c&ugrave;ng hiệu năng ấn tượng của n&oacute;.</p>', N'nguyenhieu', N'1 sản phẩm / hộp', 1, 20990000, 22, N'Lenovo')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1804230719', N'Máy tính bảng iPad 9 WiFi 64GB ', N'/Assets/img/HDD1804230719.jpg', N'Sau thành công của iPad 8, Apple cho đã cho ra mắt máy tính bảng iPad 9 WiFi 64GB - phiên bản tiếp theo của dòng iPad 10.2 inch, về cơ bản nó kế thừa những điểm mạnh từ các phiên bản trước đó và được cải tiến thêm hiệu suất, trải nghiệm người dùng nhằm giúp nhu cầu sử dụng giải trí và làm việc tiện lợi, linh hoạt hơn.', CAST(N'2023-04-18T19:19:13.833' AS DateTime), 4, N'<h3>Sau th&agrave;nh c&ocirc;ng của&nbsp;iPad 8,&nbsp;<a title="Tham khảo sản phẩm Apple ch&iacute;nh h&atilde;ng tại Thegioididong.com" href="https://www.thegioididong.com/apple" target="_blank" rel="noopener">Apple</a>&nbsp;cho đ&atilde; cho ra mắt&nbsp;<a title="Tham khảo một số mẫu m&aacute;y t&iacute;nh bảng IPad 9 WiFi 64GB đang kinh doanh tại Thế Giới Di Động " href="https://www.thegioididong.com/may-tinh-bang/ipad-gen-9" target="_blank" rel="noopener">m&aacute;y t&iacute;nh bảng&nbsp;iPad 9 WiFi 64GB</a>&nbsp;- phi&ecirc;n bản tiếp theo của d&ograve;ng iPad 10.2 inch, về cơ bản n&oacute; kế thừa những điểm mạnh từ c&aacute;c phi&ecirc;n bản trước đ&oacute; v&agrave; được cải tiến th&ecirc;m hiệu suất, trải nghiệm người d&ugrave;ng nhằm gi&uacute;p nhu cầu sử dụng giải tr&iacute; v&agrave; l&agrave;m việc tiện lợi, linh hoạt hơn.</h3>
<h3>Thiết kế quen thuộc của d&ograve;ng iPad</h3>
<p>iPad 9 sở hữu&nbsp;h&igrave;nh dạng chữ nhật k&egrave;m viền tr&ecirc;n dưới quen thuộc, c&oacute; 2 m&agrave;u sắc ch&iacute;nh để bạn lựa chọn l&agrave; x&aacute;m thanh lịch v&agrave; m&agrave;u bạc thời thượng cho bạn t&ugrave;y chọn theo sở th&iacute;ch của m&igrave;nh.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-1.jpg"><img class=" ls-is-cached lazyloaded" title="Kiểu d&aacute;ng thanh lịch, sang trọng - iPad 9 WiFi 64GB " src="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-1.jpg" alt="Kiểu d&aacute;ng thanh lịch, sang trọng - iPad 9 WiFi 64GB " data-src="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-1.jpg"></a></p>
<p>Vỏ ngo&agrave;i bằng aluminum s&aacute;ng b&oacute;ng, bền bỉ, chịu lực v&agrave; tản nhiệt tốt, bảo vệ to&agrave;n diện c&aacute;c linh kiện b&ecirc;n trong v&agrave; tăng t&iacute;nh thẩm mỹ cho sản phẩm.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-2.jpg"><img class=" ls-is-cached lazyloaded" title="Vỏ ngo&agrave;i tối giản bền bỉ - iPad 9 WiFi 64GB " src="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-2.jpg" alt="Vỏ ngo&agrave;i tối giản bền bỉ - iPad 9 WiFi 64GB " data-src="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-2.jpg"></a></p>
<p>Thiết kế n&uacute;t Home ở giữa viền dưới của m&agrave;n h&igrave;nh cho bạn thao t&aacute;c nhanh khi cần. Cảm biến v&acirc;n tay Touch ID được t&iacute;ch hợp ở trong ph&iacute;m Home, cho bạn mở kh&oacute;a một c&aacute;ch nhanh ch&oacute;ng v&agrave; an to&agrave;n.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-3.jpg"><img class=" ls-is-cached lazyloaded" title="Cảm biến v&acirc;n tay - iPad 9 WiFi 64GB " src="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-3.jpg" alt="Cảm biến v&acirc;n tay - iPad 9 WiFi 64GB " data-src="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-3.jpg"></a></p>
<h3>M&agrave;n h&igrave;nh hiển thị r&otilde; r&agrave;ng</h3>
<p>Nổi bật với k&iacute;ch thước m&agrave;n h&igrave;nh l&ecirc;n đến 10.2 inch cho khu vực hiển thị c&aacute;c nội dung rộng r&atilde;i hơn, người d&ugrave;ng c&oacute; thể theo d&otilde;i c&aacute;c chương tr&igrave;nh giải tr&iacute;, xử l&yacute; c&aacute;c văn bản tiện lợi hơn.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-4.jpg"><img class=" lazyloaded" title="M&agrave;n h&igrave;nh 10.2 inch sắc n&eacute;t - iPad 9 WiFi 64GB " src="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-4.jpg" alt="M&agrave;n h&igrave;nh 10.2 inch sắc n&eacute;t - iPad 9 WiFi 64GB " data-src="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-4.jpg"></a></p>
<p>Sử dụng m&agrave;n h&igrave;nh Retina c&oacute; độ tương phản cao, độ ph&acirc;n giải 1620 x 2160 Pixels t&aacute;i hiện h&igrave;nh ảnh một c&aacute;ch sinh động. Hơn nữa, bề mặt m&agrave;n h&igrave;nh c&oacute; lớp phủ oleophobic hạn chế b&aacute;m v&acirc;n tay, giữ cho m&agrave;n h&igrave;nh lu&ocirc;n sạch sẽ, nh&igrave;n r&otilde; hơn.&nbsp;</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-5.jpg"><img class=" lazyloaded" title="M&agrave;n h&igrave;nh Retina với độ ph&acirc;n giải cao - iPad 9 WiFi 64GB " src="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-5.jpg" alt="M&agrave;n h&igrave;nh Retina với độ ph&acirc;n giải cao - iPad 9 WiFi 64GB " data-src="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-5.jpg"></a></p>
<p>Ngo&agrave;i ra&nbsp;<a title="Tham khảo một số mẫu m&aacute;y t&iacute;nh bảng đang kinh doanh tại Thế Giới Di Động " href="https://www.thegioididong.com/may-tinh-bang-apple-ipad" target="_blank" rel="noopener">m&aacute;y t&iacute;nh bảng&nbsp;iPad&nbsp;</a>n&agrave;y c&ograve;n hỗ trợ c&ocirc;ng nghệ True Tone, c&aacute;c cảm biến xung quanh sẽ nhận biết &aacute;nh s&aacute;ng, m&agrave;u sắc xung quanh gi&uacute;p hệ thống tinh chỉnh độ s&aacute;ng theo nhiệt độ m&agrave;u ph&ugrave; hợp với m&ocirc;i trường đang sử dụng gi&uacute;p h&igrave;nh ảnh hiển thị tự nhi&ecirc;n, xem thoải m&aacute;i trong mọi điều kiện.</p>
<p>C&ugrave;ng với trải nghiệm h&igrave;nh ảnh tuyệt vời th&igrave; iPad 9 c&ograve;n được trang bị loa stereo cực hay, khiến cho mọi trải nghiệm của bạn tr&ecirc;n chiếc m&aacute;y t&iacute;nh bảng n&agrave;y trở n&ecirc;n trọn vẹn hơn.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-6.jpg"><img class=" lazyloaded" title="Được trang bị loa Stereo - iPad 9 WiFi 64GB " src="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-6.jpg" alt="Được trang bị loa Stereo - iPad 9 WiFi 64GB " data-src="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-6.jpg"></a></p>
<h3>FaceTime chất lượng cao&nbsp;</h3>
<p>Camera Ultra Wide ph&iacute;a trước c&oacute; độ ph&acirc;n giải 12 MP c&oacute; g&oacute;c nh&igrave;n rộng đến 122&deg;, cho bạn chụp ảnh HDR, quay video Full HD với tốc độ khung h&igrave;nh tới 60 fps, hỗ quay video tua nhanh thời gian (Time‑lapse).</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-7.jpg"><img class=" lazyloaded" title="Camera Ultra Wide 12 MP - Camera Ultra Wide" src="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-7.jpg" alt="Camera Ultra Wide 12 MP - Camera Ultra Wide" data-src="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-7.jpg"></a></p>
<p>C&ocirc;ng nghệ&nbsp;Center Stage ở camera trước sẽ đảm bảo bạn lu&ocirc;n hiện diện đầy nổi bật trong cuộc gọi video, khi bạn thay đổi vị tr&iacute; th&igrave; khung h&igrave;nh sẽ tự động di chuyển, zoom theo để giữ bạn trong tầm nh&igrave;n, nếu c&oacute; người kh&aacute;c tham gia, ống k&iacute;nh ph&aacute;t hiện v&agrave; tự thu nhỏ để đưa họ v&agrave;o m&agrave;n h&igrave;nh, gi&uacute;p trải nghiệm gọi video được tối ưu hơn.&nbsp;</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-8.jpg"><img class=" lazyloaded" title="C&ocirc;ng nghệ Center Stage - iPad 9 WiFi 64GB " src="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-8.jpg" alt="C&ocirc;ng nghệ Center Stage - iPad 9 WiFi 64GB " data-src="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-8.jpg"></a></p>
<p>Camera sau độ ph&acirc;n giải&nbsp;8 MP, c&oacute; khả năng&nbsp;zoom kỹ thuật số 5x, hỗ trợ chụp to&agrave;n cảnh Panorama v&agrave; chụp ảnh HDR. C&ocirc;ng nghệ ổn định h&igrave;nh ảnh tự động gi&uacute;p bạn tạo ra những bức h&igrave;nh từ phong cảnh đến h&igrave;nh ch&acirc;n dung đều trở n&ecirc;n đẹp mắt hơn.&nbsp;</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-9.jpg"><img class=" lazyloaded" title="Camera sau 8 MP - iPad 9 WiFi 64GB " src="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-9.jpg" alt="Camera sau 8 MP - iPad 9 WiFi 64GB " data-src="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-9.jpg"></a></p>
<p><a title="Tham khảo một số mẫu m&aacute;y t&iacute;nh bảng đang kinh doanh tại Thế Giới Di Động " href="https://www.thegioididong.com/may-tinh-bang" target="_blank" rel="noopener">M&aacute;y t&iacute;nh bảng</a>&nbsp;hỗ trợ quay video chất lượng Full HD v&agrave; c&oacute; thể zoom 3x, ngo&agrave;i ra c&ograve;n c&oacute; thể quay video chuyển động chậm, video tua nhanh thời gian.&nbsp;B&ecirc;n cạnh đ&oacute;, hệ thống camera sau đa năng cũng cho ph&eacute;p bạn qu&eacute;t t&agrave;i liệu v&agrave; trải nghiệm c&aacute;c ứng dụng AR linh hoạt.&nbsp;</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-10.jpg"><img class=" lazyloaded" title="Hỗ trợ nhiều t&iacute;nh năng - iPad 9 WiFi 64GB " src="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-10.jpg" alt="Hỗ trợ nhiều t&iacute;nh năng - iPad 9 WiFi 64GB " data-src="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-10.jpg"></a></p>
<h3>Trang bị cấu h&igrave;nh mạnh mẽ</h3>
<p>M&aacute;y được t&iacute;ch hợp con chip Apple A13 Bionic 6 nh&acirc;n cho hiệu suất cao đến 20% so với thế hệ trước bao gồm&nbsp;CPU, GPU đến Neural Engine. Kết hợp c&ugrave;ng RAM 3 GB th&igrave; với hiệu năng n&agrave;y iPad Gen 9 64GB sẽ mang đến những trải nghiệm tr&ograve; chơi sống động, mượt m&agrave; v&agrave; c&oacute; độ chi tiết cao, c&aacute;c t&aacute;c vụ 3D cũng sẽ được xử l&yacute; một c&aacute;ch nhanh ch&oacute;ng nhất.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-11.jpg"><img class=" lazyloaded" title="Chip Apple A13 Bionic 6 nh&acirc;n - iPad 9 WiFi 64GB " src="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-11.jpg" alt="Chip Apple A13 Bionic 6 nh&acirc;n - iPad 9 WiFi 64GB " data-src="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-11.jpg"></a></p>
<p>Về khả năng kết nối iPad 9 hỗ trợ Wi-Fi 802.11 a/b/g/n/ac v&agrave; Bluetooth v4.2 cung cấp đường truyền kết nối kh&ocirc;ng d&acirc;y ổn định cho bạn gh&eacute;p nối v&agrave; sử dụng c&ugrave;ng c&aacute;c thiết bị kh&aacute;c một c&aacute;ch dễ d&agrave;ng.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-12.jpg"><img class=" lazyloaded" title="Đường truyền ổn định - iPad 9 WiFi 64GB " src="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-12.jpg" alt="Đường truyền ổn định - iPad 9 WiFi 64GB " data-src="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-12.jpg"></a></p>
<p>M&aacute;y c&oacute; bộ nhớ trong 64 GB&nbsp;cho người d&ugrave;ng c&oacute; nhu cầu ghi lại nhiều video, h&igrave;nh ảnh, tr&ograve; chơi hơn. Hỗ trợ&nbsp;iCloud - dịch vụ lưu trữ đ&aacute;m m&acirc;y cho trường hợp bạn cần th&ecirc;m kh&ocirc;ng gian lưu trữ dữ liệu.&nbsp;</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-13.jpg"><img class=" lazyloaded" title="Dung lượng bộ nhớ - iPad 9 WiFi 64GB " src="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-13.jpg" alt="Dung lượng bộ nhớ - iPad 9 WiFi 64GB " data-src="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-13.jpg"></a></p>
<p>Thiết lập iPadOS 15 với khả năng đa nhiệm ấn tượng,&nbsp;bố cục widget trực quan cho m&agrave;n h&igrave;nh ch&iacute;nh v&agrave; ghi ch&uacute; Quick Note tr&ecirc;n to&agrave;n hệ thống, thư viện ứng dụng phong ph&uacute; cho bạn dễ d&agrave;ng c&aacute; nh&acirc;n h&oacute;a trải nghiệm ph&ugrave; hợp với nhu cầu của m&igrave;nh.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-14.jpg"><img class=" lazyloaded" title="iPadOS đa nhiệm ổn định - iPad 9 WiFi 64GB " src="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-14.jpg" alt="iPadOS đa nhiệm ổn định - iPad 9 WiFi 64GB " data-src="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-14.jpg"></a></p>
<p>Hệ điều h&agrave;nh n&agrave;y c&ograve;n cung cấp th&ecirc;m nhiều t&iacute;nh năng kh&aacute;c như ứng dụng dịch với khả năng tự động, chế độ xem trực diện, t&iacute;nh năng Live Text nhận dạng văn bản b&ecirc;n trong ảnh v&agrave; Focus lọc th&ocirc;ng b&aacute;o dựa v&agrave;o hoạt động bạn đang l&agrave;m,...&nbsp;</p>
<p>Tương th&iacute;ch với&nbsp;<a title="B&uacute;t cảm ứng Apple Pencil 1 MK0C2" href="https://www.thegioididong.com/phu-kien-thong-minh/but-cam-ung-apple-pencil-1-mk0c2" target="_blank" rel="noopener">Apple Pencil 1</a>&nbsp;v&agrave;&nbsp;b&agrave;n ph&iacute;m th&ocirc;ng minh của h&atilde;ng, cho bạn biến m&aacute;y t&iacute;nh bảng th&agrave;nh tập vẽ, hoặc sử dụng như một chiếc laptop thực thụ, bạn c&oacute; thể l&agrave;m việc giải tr&iacute; với iPad 9 mọi l&uacute;c mọi nơi.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-15.jpg"><img class=" lazyloaded" title="Tương th&iacute;ch với Apple Pencil 1 - iPad 9 WiFi 64GB " src="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-15.jpg" alt="Tương th&iacute;ch với Apple Pencil 1 - iPad 9 WiFi 64GB " data-src="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-15.jpg"></a></p>
<h3>Thời lượng pin tốt</h3>
<p>Thiết bị cho dung lượng pin 32.4 Wh (~ 8600 mAh) bạn c&oacute; thể chơi game, xem phim, đọc tin tức, kiểm tra email, xử l&yacute; c&ocirc;ng việc ngay tr&ecirc;n m&aacute;y t&iacute;nh bảng&nbsp;dễ d&agrave;ng cả ng&agrave;y.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-16.jpg"><img class=" lazyloaded" title="Dung lượng pin 32.4 Wh - iPad 9 WiFi 64GB " src="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-16.jpg" alt="Dung lượng pin 32.4 Wh - iPad 9 WiFi 64GB " data-src="https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-16.jpg"></a></p>
<p>Người d&ugrave;ng dễ d&agrave;ng sạc lại qua cổng&nbsp;Lightning,&nbsp;<a title="Tham khảo một số mẫu m&aacute;y t&iacute;nh bảng c&oacute; sạc nhanh đang kinh doanh tại Thế Giới Di Động " href="https://www.thegioididong.com/may-tinh-bang-sac-pin-nhanh" target="_blank" rel="noopener">m&aacute;y t&iacute;nh bảng c&oacute;&nbsp;sạc nhanh</a>&nbsp;với d&ograve;ng sạc l&ecirc;n đến 20 W, gi&uacute;p tiết kiệm thời gian sạc v&agrave; cho bạn tận dụng tối đa c&ocirc;ng năng của thiết bị.&nbsp;</p>
<p>M&aacute;y t&iacute;nh bảng iPad 9 WiFi 64GB sang trọng về thiết kế, ổn định về cấu h&igrave;nh, tiện lợi về loạt t&iacute;nh năng th&ocirc;ng minh, camera chất lượng, dung lượng pin ấn tượng, lựa chọn ph&ugrave; hợp cho mọi người d&ugrave;ng.</p>', N'nguyenhieu', N'1 sản phẩm / hộp', 1, 7990000, 20, N'Apple')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1804230721', N'Máy tính bảng Samsung Galaxy Tab S7 FE 4G', N'/Assets/img/HDD1804230721.jpg', N'Samsung chính thức trình làng mẫu máy tính bảng có tên Galaxy Tab S7 FE, máy trang bị cấu hình mạnh mẽ, màn hình giải trí siêu lớn và điểm ấn tượng nhất là viên pin siêu khủng được tích hợp bên trong, giúp tăng hiệu suất làm việc nhưng vẫn có tính di động cực cao.', CAST(N'2023-04-18T19:21:03.893' AS DateTime), 4, N'<h3><a title="Tham khảo sản phẩm Samsung ch&iacute;nh h&atilde;ng tại Thegioididong.com" href="https://www.thegioididong.com/samsung" target="_blank" rel="noopener" type="Tham khảo sản phẩm Samsung ch&iacute;nh h&atilde;ng tại Thegioididong.com">Samsung</a>&nbsp;ch&iacute;nh thức tr&igrave;nh l&agrave;ng mẫu&nbsp;<a title="Tham khảo gi&aacute; m&aacute;y t&iacute;nh bảng, tablet ch&iacute;nh h&atilde;ng, nhiều khuyến m&atilde;i hấp dẫn tại Thegioididong.com" href="https://www.thegioididong.com/may-tinh-bang" target="_blank" rel="noopener" type="Tham khảo gi&aacute; m&aacute;y t&iacute;nh bảng, tablet ch&iacute;nh h&atilde;ng, nhiều khuyến m&atilde;i hấp dẫn tại Thegioididong.com">m&aacute;y t&iacute;nh bảng</a>&nbsp;c&oacute; t&ecirc;n&nbsp;Galaxy Tab S7 FE, m&aacute;y trang bị cấu h&igrave;nh mạnh mẽ, m&agrave;n h&igrave;nh giải tr&iacute; si&ecirc;u lớn v&agrave; điểm ấn tượng nhất l&agrave; vi&ecirc;n pin si&ecirc;u khủng được t&iacute;ch hợp b&ecirc;n trong, gi&uacute;p tăng hiệu suất l&agrave;m việc nhưng vẫn c&oacute; t&iacute;nh di động cực cao.</h3>
<h3>Vi&ecirc;n pin &ldquo;khủng long&rdquo; vượt mốc 10000 mAh</h3>
<p>Galaxy Tab S7 FE sẽ khiến bạn cho&aacute;ng ngợp với dụng lượng&nbsp;pin cực khủng&nbsp;10090 mAh đảm bảo cho cường độ l&agrave;m việc, giải tr&iacute; li&ecirc;n tục trong nhiều giờ liền.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/240254/samsung-galaxy-tab-s7-fan-editon-05.jpg"><img class=" ls-is-cached lazyloaded" title="Galaxy Tab S7 FE | Dung lượng pin lớn 10.090 mAh" src="https://cdn.tgdd.vn/Products/Images/522/240254/samsung-galaxy-tab-s7-fan-editon-05.jpg" alt="Galaxy Tab S7 FE | Dung lượng pin lớn 10.090 mAh" data-src="https://cdn.tgdd.vn/Products/Images/522/240254/samsung-galaxy-tab-s7-fan-editon-05.jpg"></a></p>
<p>Theo c&ocirc;ng bố từ Samsung, với dung lượng lớn n&agrave;y gi&uacute;p cho Galaxy Tab S7 FE c&oacute; thể d&ugrave;ng l&ecirc;n tới 12 giờ lướt web với mạng LTE v&agrave; 13 giờ xem video trực tuyến qua wifi.</p>
<p>B&ecirc;n cạnh đ&oacute;, thời gian sạc cũng được r&uacute;t ngắn đ&aacute;ng kể khi&nbsp;<a title="Tham khảo một số mẫu m&aacute;y t&iacute;nh bảng c&oacute; sạc nhanh đang kinh doanh tại Thế Giới Di Động " href="https://www.thegioididong.com/may-tinh-bang-sac-pin-nhanh" target="_blank" rel="noopener">m&aacute;y t&iacute;nh bảng c&oacute;&nbsp;sạc nhanh</a>&nbsp;c&ocirc;ng suất tối đa l&ecirc;n đến 45 W, tuy nhi&ecirc;n để sạc với tốc độ n&agrave;y bạn cần mua củ sạc ph&ugrave; hợp v&igrave; sạc k&egrave;m theo m&aacute;y chỉ 15 W.</p>
<h3>Chơi hết sức, l&agrave;m việc hết m&igrave;nh với m&agrave;n h&igrave;nh si&ecirc;u lớn</h3>
<p><a title="Tham khảo một số mẫu m&aacute;y t&iacute;nh bảng Samsung Galaxy Tab S7 FE đang kinh doanh tại Thế Giới Di Động " href="https://www.thegioididong.com/may-tinh-bang/samsung-galaxy-tab-s7-fan-editon" target="_blank" rel="noopener">M&aacute;y t&iacute;nh bảng Samsung Galaxy Tab S7 FE</a>&nbsp;c&oacute; một phi&ecirc;n bản m&agrave;n h&igrave;nh duy nhất với&nbsp;k&iacute;ch thước lớn 12.4 inch, phần viền bao quanh được thu nhỏ, tạo n&ecirc;n kh&ocirc;ng gian rộng r&atilde;i, thoải m&aacute;i cho bạn l&agrave;m việc hay giải tr&iacute;.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/240254/samsung-galaxy-tab-s7-fan-editon-03.jpg"><img class=" ls-is-cached lazyloaded" title="Galaxy Tab S7 FE | M&agrave;n h&igrave;nh k&iacute;ch thước lớn 12.4 inch" src="https://cdn.tgdd.vn/Products/Images/522/240254/samsung-galaxy-tab-s7-fan-editon-03.jpg" alt="Galaxy Tab S7 FE | M&agrave;n h&igrave;nh k&iacute;ch thước lớn 12.4 inch" data-src="https://cdn.tgdd.vn/Products/Images/522/240254/samsung-galaxy-tab-s7-fan-editon-03.jpg"></a></p>
<p>M&agrave;n h&igrave;nh của m&aacute;y c&oacute; độ ph&acirc;n giải&nbsp;1600 x 2560 pixels đảm bảo cho chất lượng h&igrave;nh ảnh sắc n&eacute;t tr&ecirc;n m&agrave;n h&igrave;nh lớn. M&agrave;n h&igrave;nh lớn gi&uacute;p c&aacute;c nội dung giải tr&iacute; được hiển thị tối ưu khi cầm m&aacute;y ở cả chiều ngang hay dọc, cho bạn trải nghiệm chơi game v&agrave; xem phim tuyệt vời nhất.</p>
<h3>Thiết kế cao cấp, t&iacute;nh di động cao</h3>
<p>Galaxy Tab S7 FE vẫn sử dụng thiết kế v&aacute;t thẳng mạnh mẽ ở phần cạnh viền tương tự&nbsp;<a title="Tham khảo gi&aacute; m&aacute;y t&iacute;nh bảng Samsung Galaxy Tab S7 ch&iacute;nh h&atilde;ng tại Thegioididong.com" href="https://www.thegioididong.com/may-tinh-bang/samsung-galaxy-tab-s7" target="_blank" rel="noopener" type="Tham khảo gi&aacute; m&aacute;y t&iacute;nh bảng Samsung Galaxy Tab S7 ch&iacute;nh h&atilde;ng tại Thegioididong.com">Galaxy Tab S7</a>.&nbsp;Tuy vậy, cảm gi&aacute;c cầm S7 FE vẫn rất tốt, c&aacute;c g&oacute;c cạnh đều đ&atilde; được xử l&yacute; mềm mại hơn, để kh&ocirc;ng g&acirc;y bất kỳ sự kh&oacute; chịu hay cấn tay khi cầm.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/240254/samsung-galaxy-tab-s7-fan-editon-01.jpg"><img class=" lazyloaded" title="Galaxy Tab S7 FE | Thiết kế tổng thể" src="https://cdn.tgdd.vn/Products/Images/522/240254/samsung-galaxy-tab-s7-fan-editon-01.jpg" alt="Galaxy Tab S7 FE | Thiết kế tổng thể" data-src="https://cdn.tgdd.vn/Products/Images/522/240254/samsung-galaxy-tab-s7-fan-editon-01.jpg"></a></p>
<p>Th&acirc;n m&aacute;y được ho&agrave;n thiện nguy&ecirc;n khối, được gia c&ocirc;ng bề mặt v&ocirc; c&ugrave;ng ho&agrave;n hảo, dải anten được bố tr&iacute; v&agrave; l&agrave;m đồng m&agrave;u với th&acirc;n m&aacute;y tạo n&ecirc;n thiết kế liền mạch v&agrave; đẳng cấp.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/240254/tab-s7-fe-1.jpg"><img class=" lazyloaded" title="Galaxy Tab S7 FE | Xử l&yacute; tốt c&ocirc;ng việc tr&ecirc;n m&agrave;n h&igrave;nh lớn" src="https://cdn.tgdd.vn/Products/Images/522/240254/tab-s7-fe-1.jpg" alt="Galaxy Tab S7 FE | Xử l&yacute; tốt c&ocirc;ng việc tr&ecirc;n m&agrave;n h&igrave;nh lớn" data-src="https://cdn.tgdd.vn/Products/Images/522/240254/tab-s7-fe-1.jpg"></a></p>
<p>Galaxy Tab S7 FE cũng l&agrave; chiếc m&aacute;y t&iacute;nh bảng c&oacute; độ mỏng ấn tượng 6.3 mm, d&ugrave; được trang bị vi&ecirc;n pin cực khủng. Khối lượng 608 g nhẹ hơn nhiều so với&nbsp;<a title="Tham khảo gi&aacute; Laptop, m&aacute;y t&iacute;nh x&aacute;ch tay ch&iacute;nh h&atilde;ng, nhiều khuyến m&atilde;i tại thegioididong.com" href="https://www.thegioididong.com/laptop" target="_blank" rel="noopener" type="Tham khảo gi&aacute; Laptop, m&aacute;y t&iacute;nh x&aacute;ch tay ch&iacute;nh h&atilde;ng, nhiều khuyến m&atilde;i tại thegioididong.com">laptop</a>, thoải m&aacute;i để bạn mang theo b&ecirc;n m&igrave;nh v&agrave; xử l&yacute; c&ocirc;ng việc, kiểm tra email ở bất cứ đ&acirc;u.</p>
<h3>Cấu h&igrave;nh mạnh mẽ</h3>
<p>Cấu h&igrave;nh của Galaxy Tab S7 FE phần n&agrave;o đ&atilde; được cắt giảm so với phi&ecirc;n bản ti&ecirc;u chuẩn, nhưng c&aacute;c tựa game đồ họa cao v&agrave; ứng dụng văn ph&ograve;ng vẫn kh&ocirc;ng l&agrave;m kh&oacute; được mẫu m&aacute;y n&agrave;y, nhờ trang bị&nbsp;vi xử l&yacute; Snapdragon 750G gi&uacute;p cho m&aacute;y c&oacute; tốc độ mở ứng dụng kh&aacute; nhanh v&agrave; chơi game 3D mượt m&agrave;.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/240254/tab-s7-fe-2.jpg"><img class=" lazyloaded" title="Galaxy Tab S7 FE | Trang bị con chip Snapdragon 750G" src="https://cdn.tgdd.vn/Products/Images/522/240254/tab-s7-fe-2.jpg" alt="Galaxy Tab S7 FE | Trang bị con chip Snapdragon 750G" data-src="https://cdn.tgdd.vn/Products/Images/522/240254/tab-s7-fe-2.jpg"></a></p>
<p><a title="Tham khảo một số mẫu m&aacute;y t&iacute;nh bảng c&oacute; RAM 4 GB đang kinh doanh tại Thế Giới Di Động " href="https://www.thegioididong.com/may-tinh-bang-ram-4gb" target="_blank" rel="noopener">M&aacute;y t&iacute;nh bảng c&oacute;&nbsp;RAM 4 GB</a>&nbsp;đ&aacute;p ứng tốt nhu cầu đa nhiệm của m&aacute;y v&agrave;&nbsp;bộ nhớ trong 64 GB&nbsp;hỗ trợ mở rộng th&ecirc;m dung lượng qua thẻ nhớ cho bạn thoải m&aacute;i lưu trữ dữ liệu.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/240254/samsung-galaxy-tab-s7-fan-editon-08.jpg"><img class=" lazyloaded" title="Galaxy Tab S7 FE | Nhu cầu đa nhiệm tốt" src="https://cdn.tgdd.vn/Products/Images/522/240254/samsung-galaxy-tab-s7-fan-editon-08.jpg" alt="Galaxy Tab S7 FE | Nhu cầu đa nhiệm tốt" data-src="https://cdn.tgdd.vn/Products/Images/522/240254/samsung-galaxy-tab-s7-fan-editon-08.jpg"></a></p>
<p>Samsung tiếp tục mang&nbsp;l&ecirc;n d&ograve;ng Tab S7 FE&nbsp;hệ thống loa AKG chuẩn Dolby Atmos gi&uacute;p n&acirc;ng tầm trải nghiệm như nghe nhạc, xem phim với chất &acirc;m cao cấp được tinh chỉnh bởi c&aacute;c chuy&ecirc;n gia &acirc;m thanh h&agrave;ng đầu.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/240254/samsung-galaxy-tab-s7-fan-editon-02.jpg"><img class=" lazyloaded" title="Galaxy Tab S7 FE | Trang bị hệ thống loa AKG" src="https://cdn.tgdd.vn/Products/Images/522/240254/samsung-galaxy-tab-s7-fan-editon-02.jpg" alt="Galaxy Tab S7 FE | Trang bị hệ thống loa AKG" data-src="https://cdn.tgdd.vn/Products/Images/522/240254/samsung-galaxy-tab-s7-fan-editon-02.jpg"></a></p>
<h3>Thỏa m&atilde;n s&aacute;ng tạo với b&uacute;t S-Pen</h3>
<p>Galaxy Tab S7 FE tương th&iacute;ch với b&uacute;t S-Pen thế hệ mới, cải tiến với độ trễ cực thấp mang đến những n&eacute;t vẽ tự nhi&ecirc;n v&agrave; ch&acirc;n thật cho ph&eacute;p bạn thỏa sức s&aacute;ng tạo, thực hiện c&aacute;c &yacute; tưởng của m&igrave;nh mọi l&uacute;c mọi nơi.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/240254/samsung-galaxy-tab-s7-fan-editon-11.jpg"><img class=" lazyloaded" title="Galaxy Tab S7 FE | Hỗ trợ với b&uacute;t S-Pen" src="https://cdn.tgdd.vn/Products/Images/522/240254/samsung-galaxy-tab-s7-fan-editon-11.jpg" alt="Galaxy Tab S7 FE | Hỗ trợ với b&uacute;t S-Pen" data-src="https://cdn.tgdd.vn/Products/Images/522/240254/samsung-galaxy-tab-s7-fan-editon-11.jpg"></a></p>
<p>Hỗ trợ chế độ Samsung DeX c&ugrave;ng b&agrave;n ph&iacute;m rời, gi&uacute;p cho Galaxy Tab S7 FE trở th&agrave;nh một chiếc m&aacute;y t&iacute;nh c&aacute; nh&acirc;n với giao diện đa cửa sổ tương tự Window, gi&uacute;p bạn xử l&yacute; nhiều c&ocirc;ng việc c&ugrave;ng l&uacute;c tr&ecirc;n 1 m&agrave;n h&igrave;nh.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/240254/samsung-galaxy-tab-s7-fan-editon-07.jpg"><img class=" lazyloaded" title="Galaxy Tab S7 FE | Hỗ trợ kết nối với b&agrave;n ph&iacute;m ngo&agrave;i" src="https://cdn.tgdd.vn/Products/Images/522/240254/samsung-galaxy-tab-s7-fan-editon-07.jpg" alt="Galaxy Tab S7 FE | Hỗ trợ kết nối với b&agrave;n ph&iacute;m ngo&agrave;i" data-src="https://cdn.tgdd.vn/Products/Images/522/240254/samsung-galaxy-tab-s7-fan-editon-07.jpg"></a></p>
<p>Lưu &yacute;: C&aacute;c phụ kiện hỗ trợ như b&agrave;n ph&iacute;m sẽ kh&ocirc;ng đi k&egrave;m trong hộp.</p>
<p>T&oacute;m lại, Galaxy Tab S7 FE được xem l&agrave; phi&ecirc;n bản r&uacute;t gọn Galaxy Tab S7 mang đến một thiết bị c&oacute; mức gi&aacute; hợp l&yacute; hơn những vẫn đầy đủ những t&iacute;nh năng của d&ograve;ng Galaxy Tab. Để t&igrave;m một chiếc tablet vừa mạnh mẽ vừa c&oacute; thể linh động sẵn s&agrave;ng mang đi đến bất kỳ đ&acirc;u, th&igrave; Galaxy Tab S7 FE sẽ l&agrave; c&aacute;i t&ecirc;n s&aacute;ng gi&aacute; m&agrave; bạn n&ecirc;n c&acirc;n nhắc.</p>', N'nguyenhieu', N'1 sản phẩm / hộp', 1, 11990000, 14, N'Samsung')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1804230722', N'Máy tính bảng OPPO Pad Air 128GB', N'/Assets/img/HDD1804230722.jpg', N'OPPO Pad Air 128GB là một máy tính bảng đáng chú ý, được thiết kế để đáp ứng nhu cầu đa dạng của người dùng. Với một số thông tin nổi bật như màn hình lớn và hiệu năng ổn định, OPPO Pad Air có thể là lựa chọn tuyệt vời cho những người dùng cần một máy tính bảng đa năng và tiện lợi.', CAST(N'2023-04-18T19:22:55.313' AS DateTime), 4, N'<h3><a title="Tham khảo OPPO Pad Air 128GB tại Thế Giới Di Động" href="https://www.thegioididong.com/may-tinh-bang/oppo-pad-air-128gb" target="_blank" rel="noopener">OPPO Pad Air 128GB</a>&nbsp;l&agrave; một m&aacute;y t&iacute;nh bảng đ&aacute;ng ch&uacute; &yacute;, được thiết kế để đ&aacute;p ứng nhu cầu đa dạng của người d&ugrave;ng. Với một số th&ocirc;ng tin nổi bật như m&agrave;n h&igrave;nh lớn v&agrave; hiệu năng ổn định, OPPO Pad Air c&oacute; thể l&agrave; lựa chọn tuyệt vời cho những người d&ugrave;ng cần một m&aacute;y t&iacute;nh bảng đa năng v&agrave; tiện lợi.</h3>
<h3>Thiết kế trẻ trung hiện đại</h3>
<p>OPPO Pad Air được thiết kế mỏng nhẹ với khung nhựa nh&aacute;m tạo n&ecirc;n vẻ ngo&agrave;i sang trọng v&agrave; chắc chắn. Với độ d&agrave;y chỉ 6.94 mm v&agrave; khối lượng 440 g, v&igrave; thế m&aacute;y t&iacute;nh bảng n&agrave;y dễ d&agrave;ng mang theo b&ecirc;n m&igrave;nh để c&oacute; thể sử dụng ở bất kỳ đ&acirc;u.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/305838/oppo-pad-air-128gb-150423-104114.jpg"><img class=" ls-is-cached lazyloaded" title="Thiết kế đẹp mắt - OPPO Pad Air 128GB" src="https://cdn.tgdd.vn/Products/Images/522/305838/oppo-pad-air-128gb-150423-104114.jpg" alt="Thiết kế đẹp mắt - OPPO Pad Air 128GB" data-src="https://cdn.tgdd.vn/Products/Images/522/305838/oppo-pad-air-128gb-150423-104114.jpg"></a></p>
<p>Thiết kế của OPPO Pad Air cũng rất tiện dụng với c&aacute;c n&uacute;t bấm được đặt hợp l&yacute; tr&ecirc;n viền m&aacute;y, cho ph&eacute;p người d&ugrave;ng dễ d&agrave;ng điều khiển v&agrave; sử dụng. Ngo&agrave;i ra, c&aacute;ch tạo h&igrave;nh vu&ocirc;ng vắn cũng sẽ đem đến c&aacute;i nh&igrave;n ấn tượng hơn gi&uacute;p tăng độ sang trọng v&agrave; cao cấp.</p>
<h3>Thoải m&aacute;i xem phim với m&agrave;n h&igrave;nh lớn</h3>
<p>M&agrave;n h&igrave;nh IPS LCD rộng 10.36 inch với độ ph&acirc;n giải 1200 x 2000 Pixels mang lại trải nghiệm h&igrave;nh ảnh chất lượng cao, bởi độ chi tiết cực lớn c&ugrave;ng kh&ocirc;ng gian hiển thị rộng r&atilde;i gi&uacute;p cho mọi nội dung bạn xem đều c&oacute; thể trở n&ecirc;n ch&acirc;n thực.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/305838/oppo-pad-air-128gb-150423-104120.jpg"><img class=" ls-is-cached lazyloaded" title="Trải nghiệm tốt hơn với m&agrave;n h&igrave;nh lớn - OPPO Pad Air 128GB" src="https://cdn.tgdd.vn/Products/Images/522/305838/oppo-pad-air-128gb-150423-104120.jpg" alt="Trải nghiệm tốt hơn với m&agrave;n h&igrave;nh lớn - OPPO Pad Air 128GB" data-src="https://cdn.tgdd.vn/Products/Images/522/305838/oppo-pad-air-128gb-150423-104120.jpg"></a></p>
<p>M&agrave;n h&igrave;nh của OPPO Pad Air c&oacute; độ tương phản tốt, độ s&aacute;ng cao v&agrave; m&agrave;u sắc bắt mắt cho ph&eacute;p người d&ugrave;ng tận hưởng c&aacute;c nội dung giải tr&iacute; v&agrave; l&agrave;m việc một c&aacute;ch dễ d&agrave;ng.&nbsp;</p>
<h3>Hỗ trợ khả năng chụp ảnh v&agrave; quay video Full HD</h3>
<p>OPPO Pad Air c&oacute; camera sau 8 MP v&agrave; camera trước 5 MP cho ph&eacute;p người d&ugrave;ng chụp ảnh v&agrave; quay video với chất lượng tốt. Camera sau của m&aacute;y được tinh chỉnh bởi nhiều t&iacute;nh năng, gi&uacute;p bạn chụp ảnh tốt hơn trong điều kiện &aacute;nh s&aacute;ng yếu.&nbsp;</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/305838/oppo-pad-air-128gb-150423-104131.jpg"><img class=" lazyloaded" title="T&iacute;ch hợp camera sau - OPPO Pad Air 128GB" src="https://cdn.tgdd.vn/Products/Images/522/305838/oppo-pad-air-128gb-150423-104131.jpg" alt="T&iacute;ch hợp camera sau - OPPO Pad Air 128GB" data-src="https://cdn.tgdd.vn/Products/Images/522/305838/oppo-pad-air-128gb-150423-104131.jpg"></a></p>
<p>Ngo&agrave;i ra, OPPO Pad Air cũng hỗ trợ chế độ chụp ảnh HDR v&agrave; Panorama c&ugrave;ng nhiều chế độ kh&aacute;c gi&uacute;p bạn chụp ảnh đẹp hơn v&agrave; đầy đủ hơn.</p>
<h3>Hiệu năng đ&aacute;p ứng tốt nhiều t&aacute;c vụ cơ bản</h3>
<p>OPPO Pad Air được trang bị bộ vi xử l&yacute; Qualcomm Snapdragon 680 v&agrave; RAM 4 GB cho ph&eacute;p m&aacute;y t&iacute;nh bảng n&agrave;y hoạt động mượt m&agrave; v&agrave; xử l&yacute; tốt c&aacute;c t&aacute;c vụ đa nhiệm.&nbsp;</p>
<p>Chiếc&nbsp;<a title="Tham khảo m&aacute;y t&iacute;nh bảng OPPO tại Thế Giới Di Động" href="https://www.thegioididong.com/may-tinh-bang-oppo" target="_blank" rel="noopener">m&aacute;y t&iacute;nh bảng OPPO</a>&nbsp;n&agrave;y cũng sẽ c&oacute; bộ nhớ trong 128 GB v&agrave; hỗ trợ thẻ nhớ ngo&agrave;i l&ecirc;n đến 512 GB gi&uacute;p người d&ugrave;ng lưu trữ nhiều hơn c&aacute;c tập tin, ảnh v&agrave; video y&ecirc;u th&iacute;ch của m&igrave;nh.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/305838/oppo-pad-air-128gb-150423-104138.jpg"><img class=" lazyloaded" title="Hiệu năng ổn định - OPPO Pad Air 128GB" src="https://cdn.tgdd.vn/Products/Images/522/305838/oppo-pad-air-128gb-150423-104138.jpg" alt="Hiệu năng ổn định - OPPO Pad Air 128GB" data-src="https://cdn.tgdd.vn/Products/Images/522/305838/oppo-pad-air-128gb-150423-104138.jpg"></a></p>
<h3>Sử dụng d&agrave;i l&acirc;u với vi&ecirc;n pin lớn&nbsp;</h3>
<p><a title="Tham khảo m&aacute;y t&iacute;nh bảng tại Thế Giới Di Động" href="https://www.thegioididong.com/may-tinh-bang" target="_blank" rel="noopener">M&aacute;y t&iacute;nh bảng</a>&nbsp;sử dụng pin Li-Po 7100 mAh, cho thời lượng sử dụng l&acirc;u hơn so với c&aacute;c thiết bị kh&aacute;c c&ugrave;ng ph&acirc;n kh&uacute;c. Ngo&agrave;i ra, đ&acirc;y c&ograve;n l&agrave; mẫu&nbsp;<a title="Tham khảo m&aacute;y t&iacute;nh bảng sạc pin nhanh tại Thế Giới Di Động" href="https://www.thegioididong.com/may-tinh-bang-sac-pin-nhanh" target="_blank" rel="noopener">m&aacute;y t&iacute;nh bảng sạc pin nhanh</a>&nbsp;th&ocirc;ng qua cổng Type-C với c&ocirc;ng suất 18 W, gi&uacute;p bạn tiết kiệm thời gian sạc để c&oacute; thể sử dụng một c&aacute;ch thoải m&aacute;i.&nbsp;</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/281821/oppo-pad-air-10-1.jpg"><img class=" lazyloaded" title="OPPO Pad Air sạc nhanh 18 W" src="https://cdn.tgdd.vn/Products/Images/522/281821/oppo-pad-air-10-1.jpg" alt="OPPO Pad Air sạc nhanh 18 W" data-src="https://cdn.tgdd.vn/Products/Images/522/281821/oppo-pad-air-10-1.jpg"></a></p>
<p>Với thiết kế mỏng nhẹ v&agrave; tiện dụng, m&agrave;n h&igrave;nh chất lượng cao, camera tốt, hiệu năng mạnh mẽ v&agrave; pin l&acirc;u d&agrave;i, OPPO Pad Air l&agrave; sự lựa chọn ho&agrave;n hảo cho những người d&ugrave;ng y&ecirc;u th&iacute;ch c&ocirc;ng nghệ v&agrave; giải tr&iacute; di động.</p>', N'nguyenhieu', N'1 sản phẩm / hộp', 1, 7990000, 0, N'OPPO')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1804230731', N'Máy tính bảng Lenovo Tab M10 - Gen 2', N'/Assets/img/HDD1804230731.jpg', N'Lenovo Tab M10 Gen 2 từ hãng tablet Lenovo nổi bật trong phân khúc tầm trung khi sở hữu thiết kế gọn nhẹ, hiện đại cùng khả năng kết nối mạnh mẽ, viên pin ấn tượng và cấu hình ổn định trong tầm giá.', CAST(N'2023-04-18T19:31:44.060' AS DateTime), 4, N'<h3>Lenovo Tab M10 Gen 2 từ h&atilde;ng&nbsp;<a title="Tham khảo một số mẫu m&aacute;y t&iacute;nh bảng Lenovo đang kinh doanh tại Thế Giới Di Động " href="https://www.thegioididong.com/may-tinh-bang-lenovo" target="_blank" rel="noopener">tablet&nbsp;Lenovo</a>&nbsp;nổi bật trong ph&acirc;n kh&uacute;c tầm trung khi sở hữu thiết kế gọn nhẹ, hiện đại c&ugrave;ng khả năng kết nối mạnh mẽ, vi&ecirc;n pin ấn tượng v&agrave; cấu h&igrave;nh ổn định trong tầm gi&aacute;.</h3>
<h3>Thiết kế hiện đại, th&acirc;n thiện với người d&ugrave;ng</h3>
<p><a title="Tham khảo một số mẫu m&aacute;y t&iacute;nh bảng Lenovo Tab M10 Gen 2 đang kinh doanh tại Thế Giới Di Động " href="https://www.thegioididong.com/may-tinh-bang/lenovo-tab-m10-gen-2" target="_blank" rel="noopener">M&aacute;y t&iacute;nh bảng Lenovo Tab M10 Gen 2</a>&nbsp;được l&agrave;m từ khung kim loại, nổi bật với những đường n&eacute;t cứng c&aacute;p, vu&ocirc;ng vức kết hợp với c&aacute;c g&oacute;c được bo tr&ograve;n tinh tế mang lại vẻ sang trọng cho thiết bị.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/235366/lenovo-tab-m10-gen-2-002-1.jpg"><img class=" ls-is-cached lazyloaded" title="Lenovo Tab M10 - Gen 2 | Thiết kế tinh tế, sang trọng" src="https://cdn.tgdd.vn/Products/Images/522/235366/lenovo-tab-m10-gen-2-002-1.jpg" alt="Lenovo Tab M10 - Gen 2 | Thiết kế tinh tế, sang trọng" data-src="https://cdn.tgdd.vn/Products/Images/522/235366/lenovo-tab-m10-gen-2-002-1.jpg"></a></p>
<p><a title="Tham khảo một số mẫu m&aacute;y t&iacute;nh bảng đang kinh doanh tại Thế Giới Di Động " href="https://www.thegioididong.com/may-tinh-bang" target="_blank" rel="noopener">M&aacute;y t&iacute;nh bảng</a>&nbsp;c&oacute; k&iacute;ch thước 241.54 x 149.38 x 8.25 mm tương đối nhỏ gọn để c&oacute; thể thoải m&aacute;i cầm nắm bằng một tay. Đặc biệt, với khối lượng chỉ 420 g n&ecirc;n người d&ugrave;ng ho&agrave;n to&agrave;n c&oacute; thể y&ecirc;n t&acirc;m mang theo b&ecirc;n m&igrave;nh mỗi khi ra ngo&agrave;i l&agrave;m việc hoặc đi c&ocirc;ng t&aacute;c.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/235366/lenovo-tab-m10-gen-2-004.jpg"><img class=" ls-is-cached lazyloaded" title="Lenovo Tab M10 - Gen 2 | Thiết kế cạnh viền" src="https://cdn.tgdd.vn/Products/Images/522/235366/lenovo-tab-m10-gen-2-004.jpg" alt="Lenovo Tab M10 - Gen 2 | Thiết kế cạnh viền" data-src="https://cdn.tgdd.vn/Products/Images/522/235366/lenovo-tab-m10-gen-2-004.jpg"></a></p>
<p>Đ&aacute;ng ch&uacute; &yacute; l&agrave; hệ thống loa hai b&ecirc;n của Lenovo Tab M10 Gen 2 được t&iacute;ch hợp c&ocirc;ng nghệ &acirc;m thanh v&ograve;m Dolby Atmos, gi&uacute;p bạn đắm ch&igrave;m v&agrave;o kh&ocirc;ng gian bao quanh nhờ chất lượng &acirc;m thanh sống động hơn bao giờ hết.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/235366/lenovo-tab-m10-gen-2-009.jpg"><img class=" lazyloaded" title="Lenovo Tab M10 - Gen 2 | &Acirc;m thanh v&ograve;m sống động" src="https://cdn.tgdd.vn/Products/Images/522/235366/lenovo-tab-m10-gen-2-009.jpg" alt="Lenovo Tab M10 - Gen 2 | &Acirc;m thanh v&ograve;m sống động" data-src="https://cdn.tgdd.vn/Products/Images/522/235366/lenovo-tab-m10-gen-2-009.jpg"></a></p>
<h3>Trải nghiệm th&uacute; vị hơn với m&agrave;n h&igrave;nh lớn</h3>
<p>Lenovo Tab M10 Gen 2 sở hữu m&agrave;n h&igrave;nh k&iacute;ch thước lớn l&ecirc;n tới 10.1 inch với phần viền bezel được l&agrave;m mỏng tối ưu gi&uacute;p người d&ugrave;ng c&oacute; thể tận hưởng những khung h&igrave;nh ảnh bắt mắt hơn th&ocirc;ng qua trải nghiệm giải tr&iacute; h&agrave;ng ng&agrave;y.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/235366/lenovo-tab-m10-gen-2-001-1.jpg"><img class=" lazyloaded" title="Lenovo Tab M10 - Gen 2 | Sở hữu m&agrave;n h&igrave;nh k&iacute;ch thước lớn l&ecirc;n tới 10 inch" src="https://cdn.tgdd.vn/Products/Images/522/235366/lenovo-tab-m10-gen-2-001-1.jpg" alt="Lenovo Tab M10 - Gen 2 | Sở hữu m&agrave;n h&igrave;nh k&iacute;ch thước lớn l&ecirc;n tới 10 inch" data-src="https://cdn.tgdd.vn/Products/Images/522/235366/lenovo-tab-m10-gen-2-001-1.jpg"></a></p>
<p>Tấm nền IPS LCD cho độ ph&acirc;n giải 800 x 1280 pixel mang đến h&igrave;nh ảnh kh&aacute; ch&acirc;n thực, rực rỡ nhờ khả năng t&aacute;i tạo m&agrave;u sắc, độ chi tiết v&agrave; tương phản cao ở c&aacute;c g&oacute;c nh&igrave;n.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/235366/lenovo-tab-m10-gen-2-007.jpg"><img class=" lazyloaded" title="Lenovo Tab M10 - Gen 2 | Tấm nền IPS LCD cho độ ph&acirc;n giải 800 x 1280 pixel" src="https://cdn.tgdd.vn/Products/Images/522/235366/lenovo-tab-m10-gen-2-007.jpg" alt="Lenovo Tab M10 - Gen 2 | Tấm nền IPS LCD cho độ ph&acirc;n giải 800 x 1280 pixel" data-src="https://cdn.tgdd.vn/Products/Images/522/235366/lenovo-tab-m10-gen-2-007.jpg"></a></p>
<p>C&ugrave;ng với đ&oacute;, m&agrave;n h&igrave;nh n&agrave;y cũng được chứng nhận từ tổ chức T&Uuml;V Rheinland với c&ocirc;ng nghệ bảo vệ mắt người d&ugrave;ng nhờ khả năng giảm thiểu &aacute;nh s&aacute;ng xanh độc hại g&acirc;y hiện tượng mỏi mắt.</p>
<h3>Đ&aacute;p ứng tốt nhu cầu sử dụng cơ bản</h3>
<p>Sức mạnh từ bộ vi xử l&yacute; MediaTek Helio P22T 8 nh&acirc;n gi&uacute;p m&aacute;y hoạt động hiệu quả ở hầu hết c&aacute;c t&aacute;c vụ trong cuộc sống h&agrave;ng ng&agrave;y.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/235366/lenovotabm10-gen27.jpg"><img class=" lazyloaded" title="Lenovo Tab M10 - Gen 2 | Trang bị vi xử l&yacute; MediaTek Helio P22T 8 nh&acirc;n" src="https://cdn.tgdd.vn/Products/Images/522/235366/lenovotabm10-gen27.jpg" alt="Lenovo Tab M10 - Gen 2 | Trang bị vi xử l&yacute; MediaTek Helio P22T 8 nh&acirc;n" data-src="https://cdn.tgdd.vn/Products/Images/522/235366/lenovotabm10-gen27.jpg"></a></p>
<p>Trang bị dung lượng RAM 2 GB cho ph&eacute;p hoạt động đa nhiệm ổn, &iacute;t xảy ra hiện tượng giật lag. Ngo&agrave;i ra,&nbsp;<a title="Tham khảo một số mẫu m&aacute;y t&iacute;nh bảng c&oacute; ROM 32 GB đang kinh doanh tại Thế Giới Di Động " href="https://www.thegioididong.com/may-tinh-bang-rom-32gb" target="_blank" rel="noopener">m&aacute;y t&iacute;nh bảng c&oacute;&nbsp;bộ nhớ trong 32 GB</a>&nbsp;v&agrave; được hỗ trợ mở rộng dung lượng qua thẻ nhớ MicroSD tối đa 1 TB gi&uacute;p người d&ugrave;ng lưu trữ thoải m&aacute;i.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/235366/lenovo-tab-m10-gen-2-006.jpg"><img class=" lazyloaded" title="Lenovo Tab M10 - Gen 2 | Hỗ trợ thẻ nhớ ngo&agrave;i" src="https://cdn.tgdd.vn/Products/Images/522/235366/lenovo-tab-m10-gen-2-006.jpg" alt="Lenovo Tab M10 - Gen 2 | Hỗ trợ thẻ nhớ ngo&agrave;i" data-src="https://cdn.tgdd.vn/Products/Images/522/235366/lenovo-tab-m10-gen-2-006.jpg"></a></p>
<p>Với cấu h&igrave;nh n&agrave;y, m&aacute;y chơi tốt hầu hết mọi tựa game nhẹ cơ bản. Đối với những game đ&ograve;i hỏi cấu h&igrave;nh cao, người d&ugrave;ng cần điều chỉnh mức đồ họa thấp hơn để trải nghiệm game được tốt hơn.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/235366/lenovotabm10-gen24.jpg"><img class=" lazyloaded" title="Lenovo Tab M10 - Gen 2 | Đ&aacute;p ứng tốt hầu hết mọi tựa game nhẹ cơ bản" src="https://cdn.tgdd.vn/Products/Images/522/235366/lenovotabm10-gen24.jpg" alt="Lenovo Tab M10 - Gen 2 | Đ&aacute;p ứng tốt hầu hết mọi tựa game nhẹ cơ bản" data-src="https://cdn.tgdd.vn/Products/Images/522/235366/lenovotabm10-gen24.jpg"></a></p>
<p>Trang bị chế độ Kid Mode, bằng việc k&iacute;ch hoạt, phụ huynh ho&agrave;n to&agrave;n y&ecirc;n t&acirc;m khi đưa m&aacute;y cho con trẻ bởi sự bảo đảm về nội dung ph&ugrave; hợp, cũng như kiểm so&aacute;t thời gian sử dụng.</p>
<h3>Khả năng nhiếp ảnh ở mức đủ d&ugrave;ng</h3>
<p>Lenovo Tab M10 Gen 2 được nh&agrave; sản xuất trang bị cả camera trước v&agrave; sau nhằm phục vụ cho nhu cầu chụp ảnh kh&aacute;c nhau. Camera trước 5 MP nằm ở vị tr&iacute; trung t&acirc;m, chủ yếu phục vụ cho nhu cầu selfie nhanh ch&oacute;ng hay gọi video call tr&ograve; chuyện c&ugrave;ng bạn b&egrave;, người th&acirc;n.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/235366/lenovotabm10-gen25.jpg"><img class=" lazyloaded" title="Lenovo Tab M10 - Gen 2 | Camera trước 5 MP phục vụ cho nhu cầu selfie, gọi video call tr&ograve; chuyện" src="https://cdn.tgdd.vn/Products/Images/522/235366/lenovotabm10-gen25.jpg" alt="Lenovo Tab M10 - Gen 2 | Camera trước 5 MP phục vụ cho nhu cầu selfie, gọi video call tr&ograve; chuyện" data-src="https://cdn.tgdd.vn/Products/Images/522/235366/lenovotabm10-gen25.jpg"></a></p>
<p>Trong khi đ&oacute;, camera sau với độ ph&acirc;n giải 8 MP vừa đủ nhu cầu sử dụng v&agrave; m&aacute;y cũng cung cấp đầy đủ c&aacute;c t&iacute;nh năng chụp ảnh kh&ocirc;ng k&eacute;m g&igrave;&nbsp;<a title="Tham khảo điện thoại ch&iacute;nh h&atilde;ng tại Thegioididong.com " href="https://www.thegioididong.com/dtdd" target="_blank" rel="noopener">smartphone</a>.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/235366/lenovo-tab-m10-gen-2-003.jpg"><img class=" lazyloaded" title="Lenovo Tab M10 - Gen 2 | Camera sau với độ ph&acirc;n giải 8 MP" src="https://cdn.tgdd.vn/Products/Images/522/235366/lenovo-tab-m10-gen-2-003.jpg" alt="Lenovo Tab M10 - Gen 2 | Camera sau với độ ph&acirc;n giải 8 MP" data-src="https://cdn.tgdd.vn/Products/Images/522/235366/lenovo-tab-m10-gen-2-003.jpg"></a></p>
<p>Nh&igrave;n chung, ở điều kiện &aacute;nh s&aacute;ng tốt, m&aacute;y lấy n&eacute;t kh&aacute; nhanh, chất lượng ảnh với độ chi tiết tốt, m&agrave;u sắc trung thực trong tầm gi&aacute;. Ngược lại, h&igrave;nh ảnh thu được trong điều kiện &aacute;nh s&aacute;ng phức tạp, thiếu s&aacute;ng th&igrave; chất lượng kh&ocirc;ng qu&aacute; tốt, nhưng vẫn c&oacute; thể chấp nhận được.</p>
<h3>Kh&ocirc;ng lo gi&aacute;n đoạn v&igrave; cạn kiệt pin</h3>
<p>Để đảm bảo nhu cầu học tập, giải tr&iacute; v&agrave; l&agrave;m việc li&ecirc;n tục cả ng&agrave;y d&agrave;i, nh&agrave; sản xuất ưu &aacute;i trang bị vi&ecirc;n pin khủng 5000 mAh tr&ecirc;n chiếc tablet của m&igrave;nh. Với cấu h&igrave;nh vừa phải v&agrave; m&agrave;n h&igrave;nh chỉ dừng ở mức HD th&igrave; thời lượng sử dụng của Lenovo Tab M10 Gen 2 kh&aacute; ấn tượng.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/235366/lenovo-tab-m10-gen-2-005-1.jpg"><img class=" lazyloaded" title="Lenovo Tab M10 - Gen 2 | Trang bị vi&ecirc;n pin khủng 5000 mAh" src="https://cdn.tgdd.vn/Products/Images/522/235366/lenovo-tab-m10-gen-2-005-1.jpg" alt="Lenovo Tab M10 - Gen 2 | Trang bị vi&ecirc;n pin khủng 5000 mAh" data-src="https://cdn.tgdd.vn/Products/Images/522/235366/lenovo-tab-m10-gen-2-005-1.jpg"></a></p>
<p>Nếu chỉ sử dụng c&aacute;c t&aacute;c vụ cơ bản, dung lượng pin n&agrave;y cho thời gian trải nghiệm tương đương k&eacute;o d&agrave;i đến ba ng&agrave;y. Ngo&agrave;i ra, m&aacute;y cũng hỗ trợ kết nối OTG để sạc cho c&aacute;c thiết bị kh&aacute;c hoặc lắp th&ecirc;m chuột, b&agrave;n ph&iacute;m.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/235366/lenovotabm10-gen214.jpg"><img class=" lazyloaded" title="Lenovo Tab M10 - Gen 2 | Hỗ trợ kết nối OTG để sạc cho c&aacute;c thiết bị kh&aacute;c hoặc lắp th&ecirc;m chuột, b&agrave;n ph&iacute;m" src="https://cdn.tgdd.vn/Products/Images/522/235366/lenovotabm10-gen214.jpg" alt="Lenovo Tab M10 - Gen 2 | Hỗ trợ kết nối OTG để sạc cho c&aacute;c thiết bị kh&aacute;c hoặc lắp th&ecirc;m chuột, b&agrave;n ph&iacute;m" data-src="https://cdn.tgdd.vn/Products/Images/522/235366/lenovotabm10-gen214.jpg"></a></p>
<p>Với những ai đang t&igrave;m kiếm một chiếc tablet tương đối nhỏ gọn phục vụ cho việc học, l&agrave;m việc v&agrave; giải tr&iacute; cơ bản th&igrave; kh&ocirc;ng n&ecirc;n bỏ qua Lenovo Tab M10 Gen 2 bởi những ưu điểm như đ&atilde; n&ecirc;u tr&ecirc;n cũng như sự uy t&iacute;n đến từ thương hiệu Lenovo.</p>', N'nguyenhieu', N'1 sản phẩm / hộp', 1, 3990000, 23, N'Lenovo')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1904230845', N'Dorogyne trị nhiễm khuẩn răng miệng (2 vỉ x 10 viên)', N'/Assets/img/HDD1904230845.jpg', N'Sản phẩm này chỉ bán khi có chỉ định của bác sĩ, mọi thông tin trên Website, App chỉ mang tính chất tham khảo. Vui lòng liên hệ với dược sĩ, bác sĩ hoặc nhân viên y tế để được tư vấn thêm.', CAST(N'2023-04-19T08:45:43.327' AS DateTime), 10, N'<div id="s0" class="box-textdt" data-index="0">
<h2>Th&agrave;nh phần</h2>
<p>Mỗi vi&ecirc;n n&eacute;n bao phim chứa:</p>
<p>- Spiramycin base 750.000IU</p>
<p>- Metronidazol 125mg</p>
<p>- T&aacute; dược: Lactose, Starch 1500, Povidon, Croscarmellose sodium, Avicel, Magnesi stearat, Aerosil, Hydroxypropylmethyl cellulose 15cP, Hydroxypropylmethyl cellulose 6cP, Polyethylen glycol 6000, Talc, Titan dioxyd, M&agrave;u Ponceau lake... vừa đủ 1 vi&ecirc;n n&eacute;n bao phim.</p>
</div>
<div id="s1" class="box-textdt" data-index="1">
<h2>C&ocirc;ng dụng (Chỉ định)</h2>
<p>- C&aacute;c bệnh nhiễm tr&ugrave;ng răng miệng cấp, mạn t&iacute;nh hoặc t&aacute;i ph&aacute;t như &aacute;p xe răng, vi&ecirc;m tấy, vi&ecirc;m m&ocirc; tế b&agrave;o quanh xương h&agrave;m, vi&ecirc;m quanh th&acirc;n răng, vi&ecirc;m nướu, vi&ecirc;m nha chu, vi&ecirc;m miệng, vi&ecirc;m tuyến mang tai, vi&ecirc;m dưới h&agrave;m.</p>
<p>- Ph&ograve;ng c&aacute;c bệnh nhiễm khuẩn răng miệng sau phẫu thuật.</p>
<p>- Dự ph&ograve;ng trước khi phẫu thuật v&agrave; ph&ograve;ng ngừa ở bệnh nh&acirc;n bị giảm sức đề kh&aacute;ng của cơ thể.</p>
</div>
<div id="s2" class="box-textdt" data-index="2">
<h2>C&aacute;ch d&ugrave;ng - Liều d&ugrave;ng</h2>
<p>D&ugrave;ng uống.</p>
<p>D&ugrave;ng uống trong c&aacute;c bữa ăn</p>
<p>- Người lớn: uống 4 - 6 vi&ecirc;n/ng&agrave;y, chia 2 - 3 lần. Trường hợp nặng, c&oacute; thể tới 8 vi&ecirc;n/ng&agrave;y.</p>
<p>- Trẻ em:</p>
<p>Từ 6-9 tuổi: 2 vi&ecirc;n/ng&agrave;y, chia 2 lần.</p>
<p>Từ 10-15 tuổi: 3 vi&ecirc;n/ng&agrave;y, chia 3 lần.</p>
</div>
<div id="s3" class="box-textdt" data-index="3">
<h2>Kh&ocirc;ng sử dụng trong trường hợp sau (Chống chỉ định)</h2>
<p>- Qu&aacute; mẫn cảm với imidazol hoặc spiramycin, erythromycin.</p>
<p>- Trẻ dưới 6 tuổi.</p>
<p>- Disulfiram, cồn.</p>
</div>
<div id="s4" class="box-textdt" data-index="4">
<h2>Lưu &yacute; khi sử dụng (Cảnh b&aacute;o v&agrave; thận trọng)</h2>
<p>- Ngừng điều trị, khi mất điều h&ograve;a vận động, ch&oacute;ng mặt, lẫn t&acirc;m thần.</p>
<p>- Lưu &yacute; nguy cơ c&oacute; thể trầm trọng th&ecirc;m trạng th&aacute;i t&acirc;m thần ở người bị bệnh thần kinh trung ương v&agrave; ngoại bi&ecirc;n, ổn định hay tiến triển.</p>
<p>- Tr&aacute;nh uống rượu (hiệu ứng antabuse). Theo d&otilde;i c&ocirc;ng thức bạch cầu, nếu trường hợp c&oacute; tiền sử loạn thể tạng m&aacute;u hoặc điều trị với liều cao v&agrave; k&eacute;o d&agrave;i.</p>
<p>- Nếu bị giảm bạch cầu, việc tiếp tục điều trị hay kh&ocirc;ng t&ugrave;y thuộc v&agrave;o mức độ nhiễm tr&ugrave;ng.</p>
<p>- Kh&ocirc;ng n&ecirc;n d&ugrave;ng cho phụ nữ c&oacute; thai trong 3 th&aacute;ng đầu hoặc đang nu&ocirc;i con b&uacute;.</p>
<p>- Thận trọng khi d&ugrave;ng spiramycin cho người rối loạn chức năng gan v&igrave; thuốc c&oacute; thể g&acirc;y độc cho gan.</p>
<p>- D&ugrave;ng liều cao điều trị c&aacute;c nhiễm khuẩn kỵ kh&iacute; v&agrave; điều trị bệnh do amip v&agrave; do Giardia c&oacute; thể g&acirc;y rối loạn tạng m&aacute;u v&agrave; c&aacute;c bệnh thần kinh thể hoạt động.</p>
<p>- Metronidazol c&oacute; thể g&acirc;y bất động Treponema pallidum tạo n&ecirc;n phản ứng dương t&iacute;nh giả của nghiệm ph&aacute;p Nelson.</p>
</div>
<div id="s5" class="box-textdt" data-index="5">
<h2>T&aacute;c dụng kh&ocirc;ng mong muốn (T&aacute;c dụng phụ)</h2>
<p>- Rối loạn ti&ecirc;u h&oacute;a như đau dạ d&agrave;y, buồn n&ocirc;n, n&ocirc;n mửa, ti&ecirc;u chảy.</p>
<p>- C&aacute;c phản ứng dị ứng: nổi mề đay.</p>
<p>- Vị kim loại trong miệng, vi&ecirc;m lưỡi, vi&ecirc;m miệng, giảm bạch cầu vừa phải phục hồi ngay sau khi ngừng thuốc.</p>
<p>- Hiếm khi ch&oacute;ng mặt, hiện tượng mất điều h&ograve;a vận động, dị cảm, vi&ecirc;m đa thần kinh cảm gi&aacute;c v&agrave; vận động do thời gian điều trị k&eacute;o d&agrave;i.</p>
<p>Th&ocirc;ng b&aacute;o cho B&aacute;c sĩ những t&aacute;c dụng kh&ocirc;ng mong muốn gặp phải khi sử dụng thuốc.</p>
</div>
<div id="s6" class="box-textdt" data-index="6">
<h2>Tương t&aacute;c với c&aacute;c thuốc kh&aacute;c</h2>
<p>- Khi kết hợp với Disulfiram sẽ dẫn đến cơn hoang tưởng v&agrave; rối loạn t&acirc;m thần.</p>
<p>- Thận trọng khi phối hợp với c&aacute;c thuốc chống đ&ocirc;ng m&aacute;u (warfarin), dẫn chất cura kh&ocirc;ng khử cực (Vecuronium), Fluoro-uracil.</p>
<p>- Metronidazol c&oacute; thể l&agrave;m tăng nồng độ lithium huyết, l&agrave;m bất động xoắn khuẩn, do đ&oacute; c&oacute; thể l&agrave;m sai kết quả x&eacute;t nghiệm Nelson.</p>
</div>
<div id="s7" class="box-textdt" data-index="7">
<h2>Qu&aacute; liều</h2>
<p><strong>Metronidazol:</strong></p>
<p>- Metronidazol uống 1 liều duy nhất tới 15g đ&atilde; được b&aacute;o c&aacute;o. Triệu chứng bao gồm buồn n&ocirc;n, n&ocirc;n v&agrave; mất điều h&ograve;a. T&aacute;c dụng độc thần kinh gồm c&oacute; co giật, vi&ecirc;m d&acirc;y thần kinh ngoại bi&ecirc;n đ&atilde; được b&aacute;o c&aacute;o sau 5 tới 7 ng&agrave;y d&ugrave;ng liều 6 - 10, 4g c&aacute;ch 2 ng&agrave;y/lần.</p>
<p>- Điều trị: Kh&ocirc;ng c&oacute; thuốc giải độc đặc hiệu, điều trị triệu chứng v&agrave; hỗ trợ.</p>
<p><strong>Spiramycin:</strong></p>
<p>Triệu chứng của qu&aacute; liều c&oacute; thể bao gồm buồn n&ocirc;n, n&ocirc;n, ti&ecirc;u chảy.<br>B&aacute;o ngay cho B&aacute;c sĩ th&ocirc;ng tin về qu&aacute; liều spiramycin v&agrave; đưa bệnh nh&acirc;n đến bệnh viện.</p>
</div>
<div id="s8" class="box-textdt" data-index="8">
<h2>L&aacute;i xe v&agrave; vận h&agrave;nh m&aacute;y m&oacute;c</h2>
<p>THUỐC KH&Ocirc;NG ẢNH HƯỞNG KHI L&Aacute;I XE V&Agrave; VẬN H&Agrave;NH M&Aacute;Y M&Oacute;C.</p>
</div>
<div id="s9" class="box-textdt" data-index="9">
<h2>Thai kỳ v&agrave; cho con b&uacute;</h2>
<p>- Thuốc qua được nhau thai, do đ&oacute; tr&aacute;nh d&ugrave;ng thuốc trong 3 th&aacute;ng đầu của thai kỳ.</p>
<p>- Metronidazol v&agrave; spiramycin qua sữa mẹ, do đ&oacute; tr&aacute;nh sử dụng thuốc trong thời gian cho con b&uacute;.</p>
</div>
<div id="s10" class="box-textdt" data-index="10">
<h2>Bảo quản</h2>
<p>Dưới 30&deg;C, tr&aacute;nh &aacute;nh s&aacute;ng trực tiếp.</p>
</div>
<div id="s11" class="box-textdt" data-index="11">
<h2>Quy c&aacute;ch đ&oacute;ng g&oacute;i</h2>
<p>Hộp 2 vỉ x 10 vi&ecirc;n.</p>
<p>&nbsp;</p>
</div>
<div id="s12" class="box-textdt" data-index="12">
<h2>Hạn d&ugrave;ng</h2>
<p>36 th&aacute;ng kể từ ng&agrave;y sản xuất.</p>
</div>
<div id="s13" class="box-textdt" data-index="13">
<h2>Dược lực học</h2>
<p>L&agrave; thuốc phối hợp giữa Spiramycin kh&aacute;ng sinh nh&oacute;m Macrolid v&agrave; Metronidazol kh&aacute;ng sinh nh&oacute;m Nitro-5-imidazol, đặc trị c&aacute;c bệnh nhiễm tr&ugrave;ng răng miệng.</p>
<p><strong>Spiramycin:</strong></p>
<p>Spiramycin c&oacute; t&aacute;c dụng k&igrave;m khuẩn tr&ecirc;n vi khuẩn đang ph&acirc;n chia tế b&agrave;o. Ở c&aacute;c nồng độ trong huyết thanh, thuốc c&oacute; t&aacute;c dụng k&igrave;m khuẩn, nhưng khi đạt nồng độ ở m&ocirc; thuốc c&oacute; t&aacute;c dụng diệt khuẩn. Cơ chế t&aacute;c dụng của thuốc l&agrave; t&aacute;c dụng tr&ecirc;n c&aacute;c tiểu đơn vị 50S của ribosom vi khuẩn v&agrave; ngăn cản vi khuẩn tổng hợp protein. Spiramycin c&oacute; t&aacute;c dụng kh&aacute;ng c&aacute;c chủng Gram dương như&nbsp;<em>Staphylococcus, Pneumococcus, Meningococcus, Gonococcus, Streptococcus, Enterococcus, Bordetella pertussis, Corynebacteria, Chlamydia, Actinomyces, Mycoplasma, Toxoplasma.</em></p>
<p><strong>Metronidazol:</strong></p>
<p>- Metronidazol l&agrave; một dẫn chất 5-nitro-imidazol, c&oacute; phổ hoạt t&iacute;nh rộng tr&ecirc;n động vật nguy&ecirc;n sinh như am&iacute;p, Giardia v&agrave; tr&ecirc;n vi khuẩn kỵ kh&iacute;.</p>
<p>- Cơ chế t&aacute;c dụng của metronidazol c&ograve;n chưa thật r&otilde;. Trong k&yacute; sinh tr&ugrave;ng, nh&oacute;m 5-nitro của thuốc bị khử th&agrave;nh c&aacute;c chất trung gian độc với tế b&agrave;o. C&aacute;c chất n&agrave;y li&ecirc;n kết với cấu tr&uacute;c xoắn của ph&acirc;n tử DNA l&agrave;m vỡ c&aacute;c sợi n&agrave;y v&agrave; cuối c&ugrave;ng l&agrave;m tế b&agrave;o chết. Nồng độ trung b&igrave;nh c&oacute; hiệu quả của metronidazol l&agrave; &le; 8microgam/ml đối với hầu hết c&aacute;c động vật nguy&ecirc;n sinh v&agrave; c&aacute;c vi khuẩn nhạy cảm. Nồng độ tối thiểu ức chế c&aacute;c chủng nhạy cảm khoảng 0,5microgam/ml.</p>
<p>- Metronidazol l&agrave; một thuốc rất mạnh trong điều trị nhiễm động vật nguy&ecirc;n sinh như Entamoeba histolytica, Giardia lamblia v&agrave; Trichomonas vaginalis. Metronidazol diệt khuẩn tr&ecirc;n Bacteroides, Fusobacterium v&agrave; c&aacute;c vi khuẩn kỵ kh&iacute; bắt buộc kh&aacute;c nhưng kh&ocirc;ng c&oacute; t&aacute;c dụng tr&ecirc;n vi khuẩn &aacute;i kh&iacute;.</p>
<p>- Nhiễm Trichomonas vaginalis điều trị bằng uống metronidazol. Cả phụ nữ v&agrave; nam giới đều phải điều trị v&igrave; nam giới c&oacute; thể mang mầm bệnh m&agrave; kh&ocirc;ng c&oacute; triệu chứng.</p>
<p>- Metronidazol l&agrave;m cho hệ vi khuẩn &acirc;m đạo trở lại b&igrave;nh thường, khi bị vi&ecirc;m cổ tử cung/&acirc;m đạo v&agrave; kh&ocirc;ng t&aacute;c động tr&ecirc;n hệ vi khuẩn b&igrave;nh thường ở &acirc;m đạo.</p>
<p>- Metronidazol điều trị ti&ecirc;u chảy k&eacute;o d&agrave;i v&agrave; s&uacute;t c&acirc;n do Giardia. Metronidazol l&agrave; thuốc được lựa chọn đầu ti&ecirc;n để điều trị lỵ cấp t&iacute;nh v&agrave; &aacute;p xe gan nặng do am&iacute;p.</p>
<p>- Metronidazol t&aacute;c dụng tốt chống Bacteroides n&ecirc;n thường d&ugrave;ng l&agrave;m thuốc chuẩn để ph&ograve;ng bệnh trước phẫu thuật dạ d&agrave;y - ruột.</p>
<p>- Metronidazol được chọn d&ugrave;ng trong ti&ecirc;u chảy do Clostridium difficile.</p>
</div>
<div id="s14" class="box-textdt" data-index="14">
<h2>Dược động học</h2>
<p><strong>Spiramycin:</strong></p>
<p>- Spiramycin hấp thu kh&ocirc;ng ho&agrave;n to&agrave;n ở đường ti&ecirc;u h&oacute;a, thuốc được hấp thu khoảng 20 - 50% liều sử dụng. Nồng độ đỉnh trong huyết tương đạt trong v&ograve;ng 2 - 4 giờ sau khi uống. Nồng độ đỉnh trong huyết tương sau khi uống liều 1g đạt được 1microgam/ml. Uống spiramycin khi c&oacute; thức ăn trong dạ d&agrave;y l&agrave;m giảm nhiều đến sinh khả dụng của thuốc. Thức ăn l&agrave;m giảm khoảng 70% nồng độ tối đa của thuốc trong huyết thanh v&agrave; l&agrave;m cho thời gian đạt đỉnh chậm 2 giờ.</p>
<p>- Spiramycin ph&acirc;n bố rộng khắp cơ thể. Thuốc đạt nồng độ cao trong phổi, amiđan, phế quản v&agrave; c&aacute;c xoang, spiramycin &iacute;t th&acirc;m nhập v&agrave;o dịch n&atilde;o tủy. Nồng độ thuốc trong huyết thanh c&oacute; t&aacute;c dụng k&igrave;m khuẩn trong khoảng 0,1 - 3,0microgam/ml v&agrave; nồng độ thuốc trong m&ocirc; c&oacute; t&aacute;c dụng diệt khuẩn trong khoảng 8 - 64microgam/ml. Spiramycin c&oacute; thời gian b&aacute;n thải ph&acirc;n bố ngắn (10,2 &plusmn; 3,72 ph&uacute;t). Thời gian b&aacute;n thải trung b&igrave;nh l&agrave; 5 - 8 giờ. Thuốc thải trừ chủ yếu ở mật. Nồng độ thuốc trong mật lớn gấp 15 - 40 lần nồng độ trong huyết thanh. Sau 36 giờ chỉ c&oacute; khoảng 2% tổng liều uống t&igrave;m thấy trong nước tiểu.</p>
<p><strong>Metronidazol:</strong></p>
<p>- Metronidazol hấp thu nhanh v&agrave; ho&agrave;n to&agrave;n sau khi uống, đạt tới nồng độ trong huyết tương khoảng 10microgam/ml, khoảng 1 giờ sau khi uống 500mg. Mối tương quan tuyến t&iacute;nh giữa liều d&ugrave;ng v&agrave; nồng độ trong huyết tương diễn ra trong phạm vi liều từ 200 - 2000mg. Liều d&ugrave;ng lặp lại cứ 6 - 8 giờ/lần sẽ g&acirc;y t&iacute;ch lũy thuốc. Thời gian b&aacute;n thải của metronidazol trong huyết tương khoảng 8 giờ v&agrave; thể t&iacute;ch ph&acirc;n bố xấp xỉ thể t&iacute;ch nước trong cơ thể (0.6 - 0.8l&iacute;t/kg). Khoảng 10 - 20% thuốc li&ecirc;n kết với protein huyết tương. Metronidazol th&acirc;m nhập tốt v&agrave;o c&aacute;c m&ocirc; v&agrave; dịch cơ thể, v&agrave;o nước bọt v&agrave; sữa mẹ. Nồng độ điều trị cũng đạt được trong dịch n&atilde;o tủy.</p>
<p>- Metronidazol chuyển h&oacute;a ở gan th&agrave;nh c&aacute;c chất chuyển h&oacute;a dạng hydroxy v&agrave; acid, thải trừ qua nước tiểu một phần dưới dạng glucuronid. C&aacute;c chất chuyển h&oacute;a vẫn c&ograve;n phần n&agrave;o t&aacute;c dụng dược l&yacute;.</p>
<p>- Thời gian b&aacute;n thải trung b&igrave;nh trong huyết tương khoảng 7 giờ. Thời gian b&aacute;n thải của chất chuyển h&oacute;a hydroxy l&agrave; 9,5 - 19,2 giờ ở người bệnh c&oacute; chức năng thận b&igrave;nh thường. Tr&ecirc;n 90% liều uống được thải trừ qua thận trong 24 giờ, chủ yếu l&agrave; c&aacute;c chất chuyển h&oacute;a hydroxy (30 - 40%), dạng acid (10 - 22%). Dưới 10% thải trừ ở dạng chất mẹ, 14% liều d&ugrave;ng thải trừ qua ph&acirc;n.</p>
<p>- Ở người suy thận thời gian b&aacute;n thải của chất mẹ kh&ocirc;ng thay đổi, nhưng thời gian b&aacute;n thải của chất chuyển h&oacute;a hydroxy k&eacute;o d&agrave;i gấp 4 - 17 lần. Chuyển h&oacute;a của metronidazol c&oacute; thể bị ảnh hưởng nhiều khi bị suy gan nặng. Metronidazol c&oacute; thể loại khỏi cơ thể c&oacute; hiệu quả bằng thẩm t&aacute;ch m&aacute;u.</p>
</div>', N'hai15042003', N'99', 1, 324000, 26, N'Dorogyne')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1904230848', N'Camera IP 360 Độ 1536P TP-Link Tapo C210', N'/Assets/img/HDD1904230848.jpg', N'Kiểu dáng camera gọn chắc, chân đế phẳng dễ dàng cho việc lắp đặt ở nhiều vị trí từ để bàn, kệ đến gắn tường, trần. ', CAST(N'2023-04-19T08:48:15.193' AS DateTime), 5, N'<h3>Kiểu d&aacute;ng tr&ograve;n trĩnh, thiết kế sang trọng với gam m&agrave;u trắng tươi s&aacute;ng</h3>
<div>
<p>Kiểu d&aacute;ng&nbsp;<a title="Camera gi&aacute;m s&aacute;t ch&iacute;nh h&atilde;ng, gi&aacute; rẻ, b&aacute;n tại thegioididong.com" href="https://www.thegioididong.com/camera-giam-sat" target="_blank" rel="noopener">camera</a>&nbsp;gọn chắc, ch&acirc;n đế phẳng dễ d&agrave;ng cho việc lắp đặt ở nhiều vị tr&iacute; từ để b&agrave;n, kệ đến gắn tường, trần.&nbsp;</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/4728/242566/camera-ip-360-do-3mp-tp-link-tapo-c210-1.jpg"><img class=" ls-is-cached lazyloaded" title="Camera IP 360 độ 3MP TP-Link Tapo C210 - Thiết kế tr&ograve;n trĩnh, sang trọng với gam m&agrave;u trắng tươi s&aacute;ng" src="https://cdn.tgdd.vn/Products/Images/4728/242566/camera-ip-360-do-3mp-tp-link-tapo-c210-1.jpg" alt="Camera IP 360 độ 3MP TP-Link Tapo C210 - Thiết kế tr&ograve;n trĩnh, sang trọng với gam m&agrave;u trắng tươi s&aacute;ng" data-src="https://cdn.tgdd.vn/Products/Images/4728/242566/camera-ip-360-do-3mp-tp-link-tapo-c210-1.jpg"></a></p>
<h3>V&ugrave;ng quan s&aacute;t trải rộng với g&oacute;c quay v&agrave; qu&eacute;t ngang 360 độ, dọc 114 độ</h3>
<p>TP-Link Tapo C210 quay bao qu&aacute;t to&agrave;n bộ kh&ocirc;ng gian, kh&ocirc;ng những gi&uacute;p bạn thu thập dữ liệu gi&aacute; trị tối ưu m&agrave; c&ograve;n tiết kiệm chi ph&iacute; khi kh&ocirc;ng cần phải mua nhiều camera gi&aacute;m s&aacute;t cho 1 khu vực nhất định.&nbsp;</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/4728/242566/camera-ip-360-do-3mp-tp-link-tapo-c210-2.jpg"><img class=" ls-is-cached lazyloaded" title="Camera IP 360 độ 3MP TP-Link Tapo C210 - V&ugrave;ng quan s&aacute;t trải rộng với g&oacute;c quay v&agrave; qu&eacute;t ngang 360 độ, dọc 114 độ" src="https://cdn.tgdd.vn/Products/Images/4728/242566/camera-ip-360-do-3mp-tp-link-tapo-c210-2.jpg" alt="Camera IP 360 độ 3MP TP-Link Tapo C210 - V&ugrave;ng quan s&aacute;t trải rộng với g&oacute;c quay v&agrave; qu&eacute;t ngang 360 độ, dọc 114 độ" data-src="https://cdn.tgdd.vn/Products/Images/4728/242566/camera-ip-360-do-3mp-tp-link-tapo-c210-2.jpg"></a></p>
<h3>Mọi chi tiết đều được ghi lại sắc n&eacute;t với độ ph&acirc;n giải cực cao&nbsp;3MP</h3>
<p>Số lượng điểm ảnh&nbsp;2048 x 1536, bất kỳ hoạt động g&igrave; diễn ra trước ống k&iacute;nh camera đều được thu lại r&otilde; r&agrave;ng với độ chuẩn x&aacute;c cao, gi&uacute;p bạn nhận ra nhanh c&aacute;c nguy hiểm c&oacute; thể xảy ra, bảo vệ gia đ&igrave;nh m&igrave;nh tốt hơn.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/4728/242566/camera-ip-360-do-3mp-tp-link-tapo-c210-3.jpg"><img class=" ls-is-cached lazyloaded" title="Camera IP 360 độ 3MP TP-Link Tapo C210 - Mọi chi tiết đều được ghi lại sắc n&eacute;t với độ ph&acirc;n giải cực cao 3MP" src="https://cdn.tgdd.vn/Products/Images/4728/242566/camera-ip-360-do-3mp-tp-link-tapo-c210-3.jpg" alt="Camera IP 360 độ 3MP TP-Link Tapo C210 - Mọi chi tiết đều được ghi lại sắc n&eacute;t với độ ph&acirc;n giải cực cao 3MP" data-src="https://cdn.tgdd.vn/Products/Images/4728/242566/camera-ip-360-do-3mp-tp-link-tapo-c210-3.jpg"></a></p>
<p>Thiết lập chế độ quan s&aacute;t ban đ&ecirc;m c&oacute;&nbsp;<strong>tầm nh&igrave;n xa hồng ngoại 850 nm</strong>, bộ lọc chuyển đổi m&agrave;u tự động khi &aacute;nh s&aacute;ng k&eacute;m cho khả năng thu h&igrave;nh r&otilde; n&eacute;t v&agrave;o ban đ&ecirc;m ở<strong>&nbsp;khoảng c&aacute;ch tối đa 9 m</strong>,&nbsp;<a title="Camera TP-Link đang b&aacute;n tại thegioididong.com" href="https://www.thegioididong.com/camera-giam-sat-tp-link" target="_blank" rel="noopener">camera TP-Link</a>&nbsp;gi&uacute;p bạn y&ecirc;n t&acirc;m ngủ ngon v&agrave;o đ&ecirc;m xuống.&nbsp;</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/4728/242566/camera-ip-360-do-3mp-tp-link-tapo-c210-7.jpg"><img class=" lazyloaded" title="Camera IP 360 độ 3MP TP-Link Tapo C210 - Tầm nh&igrave;n xa hồng ngoại 850 nm" src="https://cdn.tgdd.vn/Products/Images/4728/242566/camera-ip-360-do-3mp-tp-link-tapo-c210-7.jpg" alt="Camera IP 360 độ 3MP TP-Link Tapo C210 - Tầm nh&igrave;n xa hồng ngoại 850 nm" data-src="https://cdn.tgdd.vn/Products/Images/4728/242566/camera-ip-360-do-3mp-tp-link-tapo-c210-7.jpg"></a></p>
<h3>Gi&aacute;m s&aacute;t chặt chẽ với khả năng ph&aacute;t hiện chuyển động th&ocirc;ng minh</h3>
<p><a title="Xem th&ecirc;m về hướng dẫn Camera IP WiFi l&agrave; g&igrave;?" href="https://www.thegioididong.com/hoi-dap/camera-ip-wifi-la-gi-uu-nhuoc-diem-ra-sao-co-nen-mua-1229534" target="_blank" rel="noopener">Camera IP</a>&nbsp;d&otilde;i theo chuyển động trong tầm quan s&aacute;t,&nbsp;<strong>gửi ngay th&ocirc;ng b&aacute;o&nbsp;</strong>để bạn biết c&oacute; người lạ tiếp cận ng&ocirc;i nh&agrave; m&igrave;nh. Đặc biệt, hiệu ứng đ&egrave;n v&agrave; &acirc;m b&aacute;o động ph&aacute;t ra sẽ khiến c&aacute;c vị kh&aacute;ch lạ d&egrave; chừng m&agrave; kh&ocirc;ng x&acirc;m nhập v&agrave;o b&ecirc;n trong để lấy cắp t&agrave;i sản hay g&acirc;y hại cho người th&acirc;n của bạn.&nbsp;</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/4728/242566/camera-ip-360-do-3mp-tp-link-tapo-c210-4.jpg"><img class=" lazyloaded" title="Camera IP 360 độ 3MP TP-Link Tapo C210 - Gi&aacute;m s&aacute;t chặt chẽ với khả năng ph&aacute;t hiện chuyển động th&ocirc;ng minh" src="https://cdn.tgdd.vn/Products/Images/4728/242566/camera-ip-360-do-3mp-tp-link-tapo-c210-4.jpg" alt="Camera IP 360 độ 3MP TP-Link Tapo C210 - Gi&aacute;m s&aacute;t chặt chẽ với khả năng ph&aacute;t hiện chuyển động th&ocirc;ng minh" data-src="https://cdn.tgdd.vn/Products/Images/4728/242566/camera-ip-360-do-3mp-tp-link-tapo-c210-4.jpg"></a></p>
<h3>Thực hiện c&aacute;c cuộc tr&ograve; chuyện 2 chiều dễ d&agrave;ng với loa v&agrave; mic gắn tr&ecirc;n camera</h3>
<p>Nghe v&agrave; được nghe thuận lợi, bạn c&oacute; thể giao tiếp với người nh&agrave; từ cơ quan hoặc kiểm tra th&uacute; cưng, ngăn ch&uacute;ng ăn vụng đồ ăn của bạn từ xa dễ d&agrave;ng.&nbsp;</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/4728/242566/camera-ip-360-do-3mp-tp-link-tapo-c210-6.jpg"><img class=" lazyloaded" title="Camera IP 360 độ 3MP TP-Link Tapo C210 - Thực hiện c&aacute;c cuộc tr&ograve; chuyện 2 chiều dễ d&agrave;ng với loa v&agrave; mic gắn tr&ecirc;n camera" src="https://cdn.tgdd.vn/Products/Images/4728/242566/camera-ip-360-do-3mp-tp-link-tapo-c210-6.jpg" alt="Camera IP 360 độ 3MP TP-Link Tapo C210 - Thực hiện c&aacute;c cuộc tr&ograve; chuyện 2 chiều dễ d&agrave;ng với loa v&agrave; mic gắn tr&ecirc;n camera" data-src="https://cdn.tgdd.vn/Products/Images/4728/242566/camera-ip-360-do-3mp-tp-link-tapo-c210-6.jpg"></a></p>
<h3>Cho thời gian lưu trữ video l&acirc;u từ 21 - 30 ng&agrave;y với khả năng hỗ trợ thẻ nhớ MicroSD đến 256 GB</h3>
<p>Với dung lượng thẻ nhớ lớn, bạn kh&ocirc;ng cần thường xuy&ecirc;n x&oacute;a bớt video tốn thời gian. Lưu &yacute;, thẻ nhớ kh&ocirc;ng đ&iacute;nh k&egrave;m&nbsp;<a title="Tham khảo camera gi&aacute;m s&aacute;t tại thegioididong.com" href="https://www.thegioididong.com/camera-giam-sat?g=camera-giam-sat" target="_blank" rel="noopener">camera gi&aacute;m s&aacute;t</a>,&nbsp;bạn cần mua th&ecirc;m khi sử dụng.&nbsp;</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/4728/242566/camera-ip-360-do-3mp-tp-link-tapo-c210-8.jpg"><img class=" lazyloaded" title="Camera IP 360 độ 3MP TP-Link Tapo C210 - Cho thời gian lưu trữ video l&acirc;u từ 35 - 45 ng&agrave;y với khả năng hỗ trợ thẻ nhớ MicroSD đến 256 GB" src="https://cdn.tgdd.vn/Products/Images/4728/242566/camera-ip-360-do-3mp-tp-link-tapo-c210-8.jpg" alt="Camera IP 360 độ 3MP TP-Link Tapo C210 - Cho thời gian lưu trữ video l&acirc;u từ 35 - 45 ng&agrave;y với khả năng hỗ trợ thẻ nhớ MicroSD đến 256 GB" data-src="https://cdn.tgdd.vn/Products/Images/4728/242566/camera-ip-360-do-3mp-tp-link-tapo-c210-8.jpg"></a></p>
<h3>Quản l&yacute; hiệu quả tr&ecirc;n điện thoại qua ứng dụng&nbsp;Tapo</h3>
<p>Chỉ v&agrave;i thao t&aacute;c nhẹ nh&agrave;ng tr&ecirc;n điện thoại l&agrave; bạn c&oacute; thể điều khiển camera t&ugrave;y &yacute; như thiết lập chế độ ri&ecirc;ng tư (tắt t&iacute;nh năng gi&aacute;m s&aacute;t để bảo vệ sự ri&ecirc;ng tư của bạn), kiểm tra thư mục video để ph&aacute;t lại video thu trước đ&oacute;, đặt lịch kiểm tra bản ghi định kỳ, x&aacute;c định v&agrave; giữ vị tr&iacute; quay cố định,...</p>
<p>Giải ph&oacute;ng đ&ocirc;i tay với t&iacute;nh năng điều khiển bằng giọng n&oacute;i hiện đại, sử dụng với cả trợ l&yacute; Google v&agrave; Amazon Alexa.&nbsp;</p>
<p>Ứng dụng n&agrave;y hỗ trợ cho hệ điều h&agrave;nh&nbsp;<strong>iOS 9+, Android 4.4+</strong>. C&agrave;i đặt đơn giản: Tải ứng dụng - Bật Camera - C&agrave;i đặt theo chỉ dẫn tr&ecirc;n m&agrave;n h&igrave;nh.&nbsp;</p>
<p>Link tải ứng dụng:&nbsp;<a title="Tapo tr&ecirc;n iOS" href="https://apps.apple.com/us/app/tp-link-tapo/id1472718009" target="_blank" rel="noopener">iOS</a>&nbsp;|&nbsp;<a title="Tapo tr&ecirc;n Android" href="https://play.google.com/store/apps/details?id=com.tplink.iot&amp;hl=en&amp;gl=US" target="_blank" rel="noopener">Android</a>.</p>
<p>Xem th&ecirc;m:&nbsp;<a title="Tapo: Ứng dụng quản l&yacute;, điều khiển thiết bị gia đ&igrave;nh th&ocirc;ng minh" href="https://www.thegioididong.com/game-app/tapo-ung-dung-quan-ly-dieu-khien-thiet-bi-gia-dinh-239412" target="_blank" rel="noopener">Tapo: Ứng dụng quản l&yacute;, điều khiển thiết bị gia đ&igrave;nh th&ocirc;ng minh</a></p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/4728/242566/camera-ip-360-do-3mp-tp-link-tapo-c210-5.jpg"><img class=" lazyloaded" title="Camera IP 360 độ 3MP TP-Link Tapo C210 - Quản l&yacute; hiệu quả tr&ecirc;n điện thoại qua ứng dụng Tapo" src="https://cdn.tgdd.vn/Products/Images/4728/242566/camera-ip-360-do-3mp-tp-link-tapo-c210-5.jpg" alt="Camera IP 360 độ 3MP TP-Link Tapo C210 - Quản l&yacute; hiệu quả tr&ecirc;n điện thoại qua ứng dụng Tapo" data-src="https://cdn.tgdd.vn/Products/Images/4728/242566/camera-ip-360-do-3mp-tp-link-tapo-c210-5.jpg"></a></p>
<p>T&oacute;m lại,&nbsp;<a title="camera IP 360 độ 3MP TP-Link Tapo C210" href="https://www.thegioididong.com/camera-giam-sat/camera-ip-360-do-3mp-tp-link-tapo-c210" target="_blank" rel="noopener">camera IP 360 độ 3MP TP-Link Tapo C210</a>&nbsp;c&oacute; thiết kế nhỏ nhắn, tầm quan s&aacute;t rộng, thu h&igrave;nh với độ ph&acirc;n giải 3MP, lưu trữ dữ liệu lớn, ph&aacute;t hiện chuyển động th&ocirc;ng minh, quản l&yacute; thuận tiện bằng ứng dụng Tapo, lựa chọn đ&uacute;ng đắn để bảo vệ ng&ocirc;i nh&agrave; Việt.&nbsp;</p>
</div>', N'nguyenhieu', N'1 sản phẩm / hộp', 1, 810000, 10, N'TP-Link')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1904230849', N'Camera IP Ngoài Trời 3MP TP-link Tapo C310', N'/Assets/img/HDD1904230849.jpg', N'Với độ nét cao, camera TP-Link mang đến hình ảnh sống động, rõ ràng, không bị mờ, nhòe khi phóng to, nhờ đó người dùng dễ dàng xác minh và nhận dạng tình huống qua camera từ xa mọi lúc.', CAST(N'2023-04-19T08:49:32.467' AS DateTime), 5, N'<h3>Thu ph&aacute;t video cực n&eacute;t với&nbsp;độ ph&acirc;n giải 3MP</h3>
<p>Với độ n&eacute;t cao,&nbsp;<a title="Camera TP-Link đang b&aacute;n tại thegioididong.com" href="https://www.thegioididong.com/camera-giam-sat-tp-link" target="_blank" rel="noopener">camera TP-Link</a>&nbsp;mang đến h&igrave;nh ảnh sống động, r&otilde; r&agrave;ng, kh&ocirc;ng bị mờ, nh&ograve;e khi ph&oacute;ng to, nhờ đ&oacute; người d&ugrave;ng dễ d&agrave;ng x&aacute;c minh v&agrave; nhận dạng t&igrave;nh huống qua camera từ xa mọi l&uacute;c.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/4728/236573/camera-giam-sat-ngoai-troi-3mp-tp-link-tapo-c310-4-1.jpg"><img class=" ls-is-cached lazyloaded" title="Camera Gi&aacute;m S&aacute;t Ngo&agrave;i Trời 3MP TP-link Tapo C310 - Thu ph&aacute;t video cực n&eacute;t với độ ph&acirc;n giải 3MP" src="https://cdn.tgdd.vn/Products/Images/4728/236573/camera-giam-sat-ngoai-troi-3mp-tp-link-tapo-c310-4-1.jpg" alt="Camera Gi&aacute;m S&aacute;t Ngo&agrave;i Trời 3MP TP-link Tapo C310 - Thu ph&aacute;t video cực n&eacute;t với độ ph&acirc;n giải 3MP" data-src="https://cdn.tgdd.vn/Products/Images/4728/236573/camera-giam-sat-ngoai-troi-3mp-tp-link-tapo-c310-4-1.jpg"></a></p>
<h3>Quan s&aacute;t hiệu quả v&agrave;o ban đ&ecirc;m với đ&egrave;n hồng ngoại cho tầm nh&igrave;n xa đến 30 m</h3>
<p><a title="Tham khảo camera gi&aacute;m s&aacute;t tại thegioididong.com" href="https://www.thegioididong.com/camera-giam-sat?g=camera-giam-sat" target="_blank" rel="noopener">Camera gi&aacute;m s&aacute;t</a>&nbsp;cung cấp tầm nh&igrave;n thực tế tối đa&nbsp;<strong>30 m</strong>&nbsp;trong điều kiện đủ s&aacute;ng v&agrave; trong b&oacute;ng tối, cho bạn ho&agrave;n to&agrave;n an t&acirc;m khi đi ra ngo&agrave;i hay ngủ ngon suốt đ&ecirc;m.&nbsp;</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/4728/236573/camera-giam-sat-ngoai-troi-3mp-tp-link-tapo-c310-7-1.jpg"><img class=" ls-is-cached lazyloaded" title="Camera Gi&aacute;m S&aacute;t Ngo&agrave;i Trời 3MP TP-link Tapo C310 - Quan s&aacute;t hiệu quả v&agrave;o ban đ&ecirc;m với đ&egrave;n hồng ngoại cho tầm nh&igrave;n xa đến 30 m" src="https://cdn.tgdd.vn/Products/Images/4728/236573/camera-giam-sat-ngoai-troi-3mp-tp-link-tapo-c310-7-1.jpg" alt="Camera Gi&aacute;m S&aacute;t Ngo&agrave;i Trời 3MP TP-link Tapo C310 - Quan s&aacute;t hiệu quả v&agrave;o ban đ&ecirc;m với đ&egrave;n hồng ngoại cho tầm nh&igrave;n xa đến 30 m" data-src="https://cdn.tgdd.vn/Products/Images/4728/236573/camera-giam-sat-ngoai-troi-3mp-tp-link-tapo-c310-7-1.jpg"></a></p>
<h3>Kết nối v&agrave; c&agrave;i đặt camera thuận tiện th&ocirc;ng qua Ethernet hoặc WiFi&nbsp;</h3>
<p>Lựa chọn mạng c&oacute; d&acirc;y hoặc kh&ocirc;ng d&acirc;y t&ugrave;y theo nhu cầu, t&igrave;nh trạng hệ thống mạng hiện tại của bạn.&nbsp;</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/4728/236573/camera-giam-sat-ngoai-troi-3mp-tp-link-tapo-c310-6-1.jpg"><img class=" ls-is-cached lazyloaded" title="Camera Gi&aacute;m S&aacute;t Ngo&agrave;i Trời 3MP TP-link Tapo C310 - Kết nối v&agrave; c&agrave;i đặt camera thuận tiện th&ocirc;ng qua Ethernet hoặc WiFi" src="https://cdn.tgdd.vn/Products/Images/4728/236573/camera-giam-sat-ngoai-troi-3mp-tp-link-tapo-c310-6-1.jpg" alt="Camera Gi&aacute;m S&aacute;t Ngo&agrave;i Trời 3MP TP-link Tapo C310 - Kết nối v&agrave; c&agrave;i đặt camera thuận tiện th&ocirc;ng qua Ethernet hoặc WiFi" data-src="https://cdn.tgdd.vn/Products/Images/4728/236573/camera-giam-sat-ngoai-troi-3mp-tp-link-tapo-c310-6-1.jpg"></a></p>
<h3>Điều khiển&nbsp;<a title="Xem th&ecirc;m về hướng dẫn Camera IP WiFi l&agrave; g&igrave;?" href="https://www.thegioididong.com/hoi-dap/camera-ip-wifi-la-gi-uu-nhuoc-diem-ra-sao-co-nen-mua-1229534" target="_blank" rel="noopener">camera IP</a>&nbsp;tiện lợi bằng điện thoại qua ứng dụng&nbsp;Tapo&nbsp;</h3>
<p>Ứng dụng ph&ugrave; hợp cho thiết bị chạy hệ điều h&agrave;nh Android 4.4 trở l&ecirc;n hoặc iOS 9.0 trở l&ecirc;n, sau khi c&agrave;i đặt, bạn c&oacute; thể xem trực tiếp h&igrave;nh ảnh từ camera, ph&aacute;t lại, lưu video, nhận th&ocirc;ng b&aacute;o khi camera ph&aacute;t hiện chuyển động, giao tiếp,...&nbsp;</p>
<p>Tải ứng dụng&nbsp;Tapo:&nbsp;<a title="Tapo cho Android" href="https://play.google.com/store/apps/details?id=com.tplink.iot&amp;hl=vi&amp;gl=US" target="_blank" rel="noopener">Android</a>&nbsp;|&nbsp;<a title="Tapo cho iOS" href="https://apps.apple.com/vn/app/tp-link-tapo/id1472718009?l=vi" target="_blank" rel="noopener">iOS</a>.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/4728/236573/camera-giam-sat-ngoai-troi-3mp-tp-link-tapo-c310-9-1.jpg"><img class=" lazyloaded" title="Camera Gi&aacute;m S&aacute;t Ngo&agrave;i Trời 3MP TP-link Tapo C310 - Điều khiển camera IP tiện lợi bằng điện thoại qua ứng dụng Tapo" src="https://cdn.tgdd.vn/Products/Images/4728/236573/camera-giam-sat-ngoai-troi-3mp-tp-link-tapo-c310-9-1.jpg" alt="Camera Gi&aacute;m S&aacute;t Ngo&agrave;i Trời 3MP TP-link Tapo C310 - Điều khiển camera IP tiện lợi bằng điện thoại qua ứng dụng Tapo" data-src="https://cdn.tgdd.vn/Products/Images/4728/236573/camera-giam-sat-ngoai-troi-3mp-tp-link-tapo-c310-9-1.jpg"></a></p>
<h3>Gửi th&ocirc;ng b&aacute;o, b&aacute;o động tự động khi camera ph&aacute;t hiện chuyển động</h3>
<p>Ngay khi c&oacute; chuyển động trước thiết bị,&nbsp;<a title="Camera Gi&aacute;m S&aacute;t Ngo&agrave;i Trời 3MP TP-link Tapo C310" href="https://www.thegioididong.com/camera-giam-sat/camera-giam-sat-ngoai-troi-3mp-tp-link-tapo-c310" target="_blank" rel="noopener">camera Gi&aacute;m S&aacute;t Ngo&agrave;i Trời 3MP TP-link Tapo C310</a>&nbsp;sẽ gửi th&ocirc;ng b&aacute;o đến điện thoại của bạn trong t&iacute;ch tắc, gi&uacute;p người d&ugrave;ng theo d&otilde;i v&agrave; xử l&yacute; c&aacute;c t&igrave;nh huống ph&aacute;t sinh chủ động.&nbsp;</p>
<p>Hơn nữa, thiết bị c&ograve;n&nbsp;<strong>tự động ph&aacute;t cảnh b&aacute;o bằng &aacute;nh s&aacute;ng v&agrave; &acirc;m thanh</strong>&nbsp;đến những "kh&aacute;ch kh&ocirc;ng mời" khi ph&aacute;t hiện c&oacute; sự chuyển động trong tầm gi&aacute;m s&aacute;t để họ tr&aacute;nh xa ng&ocirc;i nh&agrave; bạn.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/4728/236573/camera-giam-sat-ngoai-troi-3mp-tp-link-tapo-c310--3.jpg"><img class=" lazyloaded" title="Camera Gi&aacute;m S&aacute;t Ngo&agrave;i Trời 3MP TP-link Tapo C310 - Gửi th&ocirc;ng b&aacute;o, b&aacute;o động tự động khi camera ph&aacute;t hiện chuyển động" src="https://cdn.tgdd.vn/Products/Images/4728/236573/camera-giam-sat-ngoai-troi-3mp-tp-link-tapo-c310--3.jpg" alt="Camera Gi&aacute;m S&aacute;t Ngo&agrave;i Trời 3MP TP-link Tapo C310 - Gửi th&ocirc;ng b&aacute;o, b&aacute;o động tự động khi camera ph&aacute;t hiện chuyển động" data-src="https://cdn.tgdd.vn/Products/Images/4728/236573/camera-giam-sat-ngoai-troi-3mp-tp-link-tapo-c310--3.jpg"></a></p>
<h3>Giao tiếp th&ocirc;ng qua micro v&agrave; loa t&iacute;ch hợp dễ d&agrave;ng với &acirc;m thanh 2 chiều</h3>
<p>Với micro v&agrave; loa t&iacute;ch hợp, mang đến giải ph&aacute;p giao tiếp linh động, từ nay bạn kh&ocirc;ng cần phải mở cửa để nhận bưu kiện khi c&oacute; thể tr&ograve; chuyện với người giao h&agrave;ng qua camera khi họ đứng trong khu vực quan s&aacute;t của thiết bị hoặc ph&aacute;t cảnh b&aacute;o, nhắc nhở đến camera qua ứng dụng Tapo tr&ecirc;n điện thoại.&nbsp;</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/4728/236573/camera-giam-sat-ngoai-troi-3mp-tp-link-tapo-c310-5-1.jpg"><img class=" lazyloaded" title="Camera Gi&aacute;m S&aacute;t Ngo&agrave;i Trời 3MP TP-link Tapo C310 - Giao tiếp th&ocirc;ng qua micro v&agrave; loa t&iacute;ch hợp dễ d&agrave;ng với &acirc;m thanh 2 chiều" src="https://cdn.tgdd.vn/Products/Images/4728/236573/camera-giam-sat-ngoai-troi-3mp-tp-link-tapo-c310-5-1.jpg" alt="Camera Gi&aacute;m S&aacute;t Ngo&agrave;i Trời 3MP TP-link Tapo C310 - Giao tiếp th&ocirc;ng qua micro v&agrave; loa t&iacute;ch hợp dễ d&agrave;ng với &acirc;m thanh 2 chiều" data-src="https://cdn.tgdd.vn/Products/Images/4728/236573/camera-giam-sat-ngoai-troi-3mp-tp-link-tapo-c310-5-1.jpg"></a></p>
<h3>Thiết kế ngộ nghĩnh, hiện đại, ph&ugrave; hợp bố tr&iacute; ở ngo&agrave;i trời</h3>
<p>H&igrave;nh dạng của&nbsp;<a title="Camera gi&aacute;m s&aacute;t ch&iacute;nh h&atilde;ng, gi&aacute; rẻ, b&aacute;n tại thegioididong.com" href="https://www.thegioididong.com/camera-giam-sat" target="_blank" rel="noopener">camera</a>&nbsp;tr&ocirc;ng như một người l&iacute;nh nhỏ sẵn s&agrave;ng đứng canh g&aacute;c b&ecirc;n ngo&agrave;i ng&ocirc;i nh&agrave; bạn để đảm bảo kh&ocirc;ng c&oacute; kẻ xấu n&agrave;o x&acirc;m nhập v&agrave;o b&ecirc;n trong. K&iacute;ch thước nhỏ nhắn, bạn c&oacute; thể&nbsp;<strong>cầm được bằng 1 b&agrave;n tay</strong>, ch&acirc;n đế tr&ograve;n c&acirc;n bằng cho ph&eacute;p bạn đặt thiết bị l&ecirc;n b&agrave;n, lắp treo tường hoặc tr&ecirc;n trần nh&agrave; linh hoạt.&nbsp;</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/4728/236573/camera-giam-sat-ngoai-troi-3mp-tp-link-tapo-c310-1-1.jpg"><img class=" lazyloaded" title="Camera Gi&aacute;m S&aacute;t Ngo&agrave;i Trời 3MP TP-link Tapo C310 - Thiết kế ngộ nghĩnh, hiện đại, ph&ugrave; hợp bố tr&iacute; ở ngo&agrave;i trời" src="https://cdn.tgdd.vn/Products/Images/4728/236573/camera-giam-sat-ngoai-troi-3mp-tp-link-tapo-c310-1-1.jpg" alt="Camera Gi&aacute;m S&aacute;t Ngo&agrave;i Trời 3MP TP-link Tapo C310 - Thiết kế ngộ nghĩnh, hiện đại, ph&ugrave; hợp bố tr&iacute; ở ngo&agrave;i trời" data-src="https://cdn.tgdd.vn/Products/Images/4728/236573/camera-giam-sat-ngoai-troi-3mp-tp-link-tapo-c310-1-1.jpg"></a></p>
<p>Thiết bị đạt&nbsp;<strong>chuẩn chống nước chống bụi IP66</strong>&nbsp;cho khả năng hoạt động tốt ngay cả trong điều kiện thời tiết khắc nghiệt thường xuy&ecirc;n mưa gi&oacute;, c&oacute; nhiều bụi bẩn.&nbsp;</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/4728/236573/camera-giam-sat-ngoai-troi-3mp-tp-link-tapo-c310-2-1.jpg"><img class=" lazyloaded" title="Camera Gi&aacute;m S&aacute;t Ngo&agrave;i Trời 3MP TP-link Tapo C310 - Thiết bị đạt chuẩn chống nước chống bụi IP66" src="https://cdn.tgdd.vn/Products/Images/4728/236573/camera-giam-sat-ngoai-troi-3mp-tp-link-tapo-c310-2-1.jpg" alt="Camera Gi&aacute;m S&aacute;t Ngo&agrave;i Trời 3MP TP-link Tapo C310 - Thiết bị đạt chuẩn chống nước chống bụi IP66" data-src="https://cdn.tgdd.vn/Products/Images/4728/236573/camera-giam-sat-ngoai-troi-3mp-tp-link-tapo-c310-2-1.jpg"></a></p>
<h3>Lưu trữ c&aacute;c dữ liệu trong 15 đến 20 ng&agrave;y qua thẻ nhớ&nbsp;MicroSD 128 GB</h3>
<p>T&iacute;ch hợp thẻ nhớ v&agrave;o khe cắm nằm ở mặt lưng của camera trước khi sử dụng, bạn c&oacute; thể lưu trữ lượng lớn video 3MP, tiện truy cập v&agrave;o xem bất cứ l&uacute;c n&agrave;o bạn muốn.&nbsp;</p>
<p><strong>Lưu &yacute;</strong>: Bạn cần mua th&ecirc;m thẻ&nbsp;nhớ MicroSD để lưu trữ th&ocirc;ng tin.&nbsp;</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/4728/236573/camera-giam-sat-ngoai-troi-3mp-tp-link-tapo-c310-8-1.jpg"><img class=" lazyloaded" title="Camera Gi&aacute;m S&aacute;t Ngo&agrave;i Trời 3MP TP-link Tapo C310 - Lưu trữ c&aacute;c dữ liệu trong 15 đến 20 ng&agrave;y qua thẻ nhớ MicroSD 128 GB" src="https://cdn.tgdd.vn/Products/Images/4728/236573/camera-giam-sat-ngoai-troi-3mp-tp-link-tapo-c310-8-1.jpg" alt="Camera Gi&aacute;m S&aacute;t Ngo&agrave;i Trời 3MP TP-link Tapo C310 - Lưu trữ c&aacute;c dữ liệu trong 15 đến 20 ng&agrave;y qua thẻ nhớ MicroSD 128 GB" data-src="https://cdn.tgdd.vn/Products/Images/4728/236573/camera-giam-sat-ngoai-troi-3mp-tp-link-tapo-c310-8-1.jpg"></a></p>
<p>TP-link Tapo C310 thiết kế đẹp mắt, nhỏ nhắn, tầm nh&igrave;n sắc n&eacute;t ngay cả v&agrave;o ban đ&ecirc;m, t&iacute;ch hợp nhiều t&iacute;nh năng tiện &iacute;ch, lựa chọn đ&uacute;ng đắn cho mọi gia chủ.&nbsp;</p>', N'nguyenhieu', N'1 sản phẩm / hộp', 1, 900000, 10, N'TP-Link')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1904230850', N'Thùng 24 lon bia Kronenbourg 1664 Blanc 330ml', N'/Assets/img/HDD1904230850.jpg', N'Tinh túy bia Pháp từ năm 1664.  Bia Kronenbourg 1664 Blanc sản xuất trên dây chuyền hiện đại cùng bí quyết nấu bia tuyệt hảo cho cảm giác uống sảng khoái đầy thích thú. Bia lon tiện dụng, thiết kế hiện đại, 24 lon bia Kronenbourg 1664 Blanc 330ml dạng thùng tiết kiệm hơn cho những cuộc vui kéo dài', CAST(N'2023-04-19T08:50:38.123' AS DateTime), 8, N'<div class="short-description">Tinh t&uacute;y&nbsp;<a href="https://www.bachhoaxanh.com/bia">bia</a>&nbsp;Ph&aacute;p từ năm 1664. &nbsp; sản xuất tr&ecirc;n d&acirc;y chuyền hiện đại c&ugrave;ng b&iacute; quyết nấu bia tuyệt hảo cho cảm gi&aacute;c uống sảng kho&aacute;i đầy th&iacute;ch th&uacute;. Bia lon tiện dụng, thiết kế hiện đại,&nbsp;&nbsp;dạng th&ugrave;ng tiết kiệm hơn cho những cuộc vui k&eacute;o d&agrave;i</div>
<ul class="infoproduct nospeci">
<li>Thương hiệu
<div>Kronenbourg 1664 Blanc (Ph&aacute;p)</div>
</li>
<li>Sản xuất tại
<div>Ph&aacute;p</div>
</li>
<li>Loại sản phẩm
<div>Bia c&aacute;c loại</div>
</li>
<li>Thể t&iacute;ch
<div>330ml</div>
</li>
<li>Đ&oacute;ng g&oacute;i
<div>Lon</div>
</li>
<li>Số lượng
<div>Th&ugrave;ng 24 lon</div>
</li>
<li>Lưu &yacute;
<div>Sản phẩm d&agrave;nh cho người tr&ecirc;n 18 tuổi v&agrave; kh&ocirc;ng d&agrave;nh cho phụ nữ mang thai. Thưởng thức c&oacute; tr&aacute;ch nhiệm, đ&atilde; uống đồ uống c&oacute; cồn th&igrave; kh&ocirc;ng l&aacute;i xe!</div>
</li>
</ul>', N'hai15042003', N'1', 1, 333000, 25, N'Kronenbourg')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1904230853', N'Webcam 480P A4Tech PK-710G', N'/Assets/img/HDD1904230853.jpg', N'Nhờ kết cấu gọn gàng cùng với màu đen mang lại nét hiện đại cho Webcam 480p A4Tech PK-710G Đen', CAST(N'2023-04-19T08:53:06.007' AS DateTime), 5, N'<h3>Thiết kế Compact nhỏ gọn, hiện đại</h3>
<p>Nhờ kết cấu gọn g&agrave;ng c&ugrave;ng với m&agrave;u đen mang lại n&eacute;t hiện đại cho&nbsp;<a title="Webcam đang được b&aacute;n tại thegioididong.com" href="https://www.thegioididong.com/camera-giam-sat" target="_blank" rel="noopener">Webcam</a>&nbsp;480p A4Tech PK-710G Đen.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/4728/253161/webcam-480p-a4tech-pk-710g-den-191021-113835.jpg"><img class=" ls-is-cached lazyloaded" title="Thiết kế Compact hiện đại, gọn g&agrave;ng - Webcam 480p A4Tech PK-710G Đen" src="https://cdn.tgdd.vn/Products/Images/4728/253161/webcam-480p-a4tech-pk-710g-den-191021-113835.jpg" alt="Thiết kế Compact hiện đại, gọn g&agrave;ng - Webcam 480p A4Tech PK-710G Đen" data-src="https://cdn.tgdd.vn/Products/Images/4728/253161/webcam-480p-a4tech-pk-710g-den-191021-113835.jpg"></a></p>
<h3>Chất lượng h&igrave;nh ảnh r&otilde; n&eacute;t với&nbsp;<a title="độ ph&acirc;n giải" href="https://www.thegioididong.com/hoi-dap/tim-hieu-ve-cac-loai-do-phan-giai-man-hinh-1196142" target="_blank" rel="noopener">độ ph&acirc;n giải</a>&nbsp;480p, c&ocirc;ng nghệ chống ch&oacute;i v&agrave; khử răng cưa</h3>
<p>Webcam c&oacute; độ ph&acirc;n giải 480p, tốc độ khung h&igrave;nh 30&nbsp;<a title="FPS" href="https://www.thegioididong.com/hoi-dap/fps-la-gi-fps-bao-nhieu-choi-game-la-phu-hop-nhat-1341209" target="_blank" rel="noopener">FPS</a>, cung cấp chất lượng h&igrave;nh ảnh trung thực, m&agrave;u sắc tươi s&aacute;ng. Khả năng&nbsp;<strong>khử răng cưa</strong>&nbsp;gi&uacute;p chất lượng h&igrave;nh ảnh mượt m&agrave;, kh&ocirc;ng bị đứt g&atilde;y.</p>
<p>Ngo&agrave;i ra PK-710G c&ograve;n được trang bị lớp phủ&nbsp;<strong>chống ch&oacute;i</strong>&nbsp;để tr&aacute;nh phản xạ v&agrave; mang lại h&igrave;nh ảnh sống động với m&agrave;u sắc ch&acirc;n thực.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/4728/253161/webcam-480p-a4tech-pk-710g-den-181021-010642.jpg"><img class=" ls-is-cached lazyloaded" title="Độ ph&acirc;n giải 480p, c&oacute; lớp chống ch&oacute;i, khử răng cưa - Webcam 480p A4Tech PK-710G Đen" src="https://cdn.tgdd.vn/Products/Images/4728/253161/webcam-480p-a4tech-pk-710g-den-181021-010642.jpg" alt="Độ ph&acirc;n giải 480p, c&oacute; lớp chống ch&oacute;i, khử răng cưa - Webcam 480p A4Tech PK-710G Đen" data-src="https://cdn.tgdd.vn/Products/Images/4728/253161/webcam-480p-a4tech-pk-710g-den-181021-010642.jpg"></a></p>
<h3>Tầm quan s&aacute;t tốt nhờ ống k&iacute;nh rộng 60 độ, hoạt động tốt ngay cả khi thiếu s&aacute;ng</h3>
<p>Cho kh&ocirc;ng gian hiển thị rộng hơn với g&oacute;c ống k&iacute;nh rộng&nbsp;<strong>60&nbsp;độ</strong>. Ngo&agrave;i ra A4Tech PK-710G c&ograve;n cung cấp chất lượng h&igrave;nh ảnh tốt nhất ngay trong m&ocirc;i trường thiếu s&aacute;ng, gi&uacute;p bạn thoải m&aacute;i gọi video, tr&ograve; chuyện với bạn b&egrave;, đồng nghiệp.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/4728/253161/webcam-480p-a4tech-pk-710g-den-191021-102700.jpg"><img class=" ls-is-cached lazyloaded" title="Quan s&aacute;t bao qu&aacute;t, ống k&iacute;nh 60 độ - Webcam 480p A4Tech PK-710G Đen" src="https://cdn.tgdd.vn/Products/Images/4728/253161/webcam-480p-a4tech-pk-710g-den-191021-102700.jpg" alt="Quan s&aacute;t bao qu&aacute;t, ống k&iacute;nh 60 độ - Webcam 480p A4Tech PK-710G Đen" data-src="https://cdn.tgdd.vn/Products/Images/4728/253161/webcam-480p-a4tech-pk-710g-den-191021-102700.jpg"></a></p>
<h3>Loại bỏ tạp &acirc;m khi đ&agrave;m thoại với micro t&iacute;ch hợp</h3>
<p>Thu nhận &acirc;m thanh từ mọi hướng với chất lượng trong trẻo, duy tr&igrave; độ ổn định, ch&iacute;nh x&aacute;c khi đ&agrave;m thoại với t&iacute;nh năng lọc bỏ những tạp &acirc;m với micro được t&iacute;ch hợp trực tiếp b&ecirc;n trong webcam.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/4728/253161/webcam-480p-a4tech-pk-710g-den-181021-114909.jpg"><img class=" ls-is-cached lazyloaded" title="Loại bỏ tạp &acirc;m với micro t&iacute;ch hợp sẵn - Webcam 480p A4Tech PK-710G Đen" src="https://cdn.tgdd.vn/Products/Images/4728/253161/webcam-480p-a4tech-pk-710g-den-181021-114909.jpg" alt="Loại bỏ tạp &acirc;m với micro t&iacute;ch hợp sẵn - Webcam 480p A4Tech PK-710G Đen" data-src="https://cdn.tgdd.vn/Products/Images/4728/253161/webcam-480p-a4tech-pk-710g-den-181021-114909.jpg"></a></p>
<h3>Kết nối th&ocirc;ng minh qua USB, hỗ trợ nhiều hệ điều h&agrave;nh</h3>
<p>Bạn c&oacute; thể kết nối v&agrave; sử dụng&nbsp;<a title="Tham khảo Webcam 480p A4Tech PK-710G Đen được b&aacute;n tại thegioididong.com" href="https://www.thegioididong.com/camera-giam-sat/webcam-480p-a4tech-pk-710g-den#top-article" target="_blank" rel="noopener">Webcam 480p A4Tech PK-710G Đen</a>&nbsp;ngay m&agrave; kh&ocirc;ng cần phải c&agrave;i đặt th&ecirc;m bất kỳ phần mềm g&igrave; để điều khiển.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/4728/253161/webcam-480p-a4tech-pk-710g-den-191021-042530.jpg"><img class=" lazyloaded" title="Kết nối th&ocirc;ng minh, hỗ trợ nhiều hệ điều h&agrave;nh - Webcam 480p A4Tech PK-710G Đen" src="https://cdn.tgdd.vn/Products/Images/4728/253161/webcam-480p-a4tech-pk-710g-den-191021-042530.jpg" alt="Kết nối th&ocirc;ng minh, hỗ trợ nhiều hệ điều h&agrave;nh - Webcam 480p A4Tech PK-710G Đen" data-src="https://cdn.tgdd.vn/Products/Images/4728/253161/webcam-480p-a4tech-pk-710g-den-191021-042530.jpg"></a></p>
<p><a title="Tham khảo webcam A4Tech đang b&aacute;n tại thegioididong.com" href="https://www.thegioididong.com/camera-giam-sat-a4tech" target="_blank" rel="noopener">Webcam A4Tech</a>&nbsp;nổi bật với thiết kế Compact, dễ sử dụng, độ ph&acirc;n giải 480p, g&oacute;c ống k&iacute;nh 60 độ, micro t&iacute;ch hợp khử tiếng ồn sẽ l&agrave; sản phẩm ph&ugrave; hợp cho người d&ugrave;ng muốn sử dụng webcam để l&agrave;m việc cũng như học tập.</p>', N'nguyenhieu', N'1 sản phẩm / hộp', 1, 275000, 50, N'A4Tech')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1904230854', N'Camera IP 360 Độ 2K Pro Xiaomi Mi Home BHR4193GL', N'/Assets/img/HDD1904230854.jpg', N'Camera IP Mi Home 360 Độ 2K Pro Xiaomi BHR4193GL thiết kế nhỏ gọn, kiểu dáng hiện đại, tinh tế, sử dụng để bàn, kệ tủ hay lắp gắn trần dễ dàng, quan sát hiệu quả, chất lượng hình ảnh tốt, chống rung hiệu quả.', CAST(N'2023-04-19T08:54:32.387' AS DateTime), 5, N'<h3>Camera th&ocirc;ng minh sử dụng hiệu quả cho m&ocirc;i trường trong nh&agrave;</h3>
<p>Camera IP Mi Home 360 Độ 2K Pro Xiaomi BHR4193GL thiết kế nhỏ gọn, kiểu d&aacute;ng hiện đại, tinh tế, sử dụng để b&agrave;n, kệ tủ hay lắp gắn trần dễ d&agrave;ng, quan s&aacute;t hiệu quả, chất lượng h&igrave;nh ảnh tốt, chống rung hiệu quả.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/4728/242192/ip-mi-home-360-do-2k-pro-xiaomi-bhr4193gl-1-1.jpg"><img class=" ls-is-cached lazyloaded" title="Nhỏ gọn - Xiaomi BHR4193GL" src="https://cdn.tgdd.vn/Products/Images/4728/242192/ip-mi-home-360-do-2k-pro-xiaomi-bhr4193gl-1-1.jpg" alt="Nhỏ gọn - Xiaomi BHR4193GL" data-src="https://cdn.tgdd.vn/Products/Images/4728/242192/ip-mi-home-360-do-2k-pro-xiaomi-bhr4193gl-1-1.jpg"></a></p>
<h3><a title="Tham khảo camera gi&aacute;m s&aacute;t tại thegioididong.com" href="https://www.thegioididong.com/camera-giam-sat?g=camera-giam-sat" target="_blank" rel="noopener">Camera gi&aacute;m s&aacute;t</a>&nbsp;quan s&aacute;t tốt cả ng&agrave;y lẫn đ&ecirc;m với h&igrave;nh ảnh chất lượng cao</h3>
<p>Dữ liệu quan s&aacute;t đạt độ ph&acirc;n giải ấn tượng l&ecirc;n đến 2K (2304 x 1296) mang đến khung h&igrave;nh sắc n&eacute;t trong từng chi tiết, kh&ocirc;ng nh&ograve;e mờ cả khi được ph&oacute;ng lớn, hỗ trợ t&iacute;ch cực khi cần tầm so&aacute;t th&ocirc;ng tin tr&ecirc;n dữ liệu lưu trữ.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/4728/242192/ip-mi-home-360-do-2k-pro-xiaomi-bhr4193gl-4.jpg"><img class=" ls-is-cached lazyloaded" title="H&igrave;nh ảnh sắc n&eacute;t - Xiaomi BHR4193GL" src="https://cdn.tgdd.vn/Products/Images/4728/242192/ip-mi-home-360-do-2k-pro-xiaomi-bhr4193gl-4.jpg" alt="H&igrave;nh ảnh sắc n&eacute;t - Xiaomi BHR4193GL" data-src="https://cdn.tgdd.vn/Products/Images/4728/242192/ip-mi-home-360-do-2k-pro-xiaomi-bhr4193gl-4.jpg"></a></p>
<p>Nhờ khẩu độ lớn F1.4 v&agrave; thấu k&iacute;nh 6 th&agrave;nh phần v&agrave; t&iacute;ch hợp tầm nh&igrave;n hồng ngoại, Xiaomi BHR4193GL dễ d&agrave;ng thu dữ th&ocirc;ng tin quan s&aacute;t trong cả b&oacute;ng tối, thể hiện h&igrave;nh ảnh quan s&aacute;t trắng đen, th&ocirc;ng tin r&otilde; r&agrave;ng.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/4728/242192/ip-mi-home-360-do-2k-pro-xiaomi-bhr4193gl-2-1.jpg"><img class=" ls-is-cached lazyloaded" title="Quan s&aacute;t hồng ngoại - Xiaomi BHR4193GL" src="https://cdn.tgdd.vn/Products/Images/4728/242192/ip-mi-home-360-do-2k-pro-xiaomi-bhr4193gl-2-1.jpg" alt="Quan s&aacute;t hồng ngoại - Xiaomi BHR4193GL" data-src="https://cdn.tgdd.vn/Products/Images/4728/242192/ip-mi-home-360-do-2k-pro-xiaomi-bhr4193gl-2-1.jpg"></a></p>
<h3>Bao qu&aacute;t to&agrave;n bộ kh&ocirc;ng gian với g&oacute;c nh&igrave;n rộng</h3>
<p>Khả năng xoay ngang 360 độ&nbsp;v&agrave;&nbsp;g&oacute;c dọc đến 118 độ cho ph&eacute;p&nbsp;<a title="Camera gi&aacute;m s&aacute;t ch&iacute;nh h&atilde;ng, gi&aacute; rẻ, b&aacute;n tại thegioididong.com" href="https://www.thegioididong.com/camera-giam-sat" target="_blank" rel="noopener">camera</a>&nbsp;quan s&aacute;t tốt to&agrave;n bộ kh&ocirc;ng gian, thu giữ gần như đầy đủ mọi th&ocirc;ng tin cần thiết m&agrave; kh&ocirc;ng cần hỗ trợ của nhiều camera đồng thời, tiết kiệm hiệu quả chi ph&iacute; lắp đặt.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/4728/242192/ip-mi-home-360-do-2k-pro-xiaomi-bhr4193gl-3-1.jpg"><img class=" lazyloaded" title="Bao qu&aacute;t tốt - Xiaomi BHR4193GL" src="https://cdn.tgdd.vn/Products/Images/4728/242192/ip-mi-home-360-do-2k-pro-xiaomi-bhr4193gl-3-1.jpg" alt="Bao qu&aacute;t tốt - Xiaomi BHR4193GL" data-src="https://cdn.tgdd.vn/Products/Images/4728/242192/ip-mi-home-360-do-2k-pro-xiaomi-bhr4193gl-3-1.jpg"></a></p>
<h3>Cho ph&eacute;p bảo vệ quyền ri&ecirc;ng tư với chế độ tấm chắn vật l&yacute;</h3>
<p>Khi cần bảo vệ kh&ocirc;ng gian ri&ecirc;ng tư của bạn, h&atilde;y k&iacute;ch hoạt chế độ tấm chắn vật l&yacute; tr&ecirc;n camera qua ứng dụng Mi Home, chế độ n&agrave;y sẽ điều khiển ống k&iacute;nh camera quay v&agrave;o b&ecirc;n trong, đảm bảo sự ri&ecirc;ng tư đối đa, an to&agrave;n cho kh&ocirc;ng gian đang lắp đặt quan s&aacute;t.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/4728/242192/ip-mi-home-360-do-2k-pro-xiaomi-bhr4193gl-7.jpg"><img class=" lazyloaded" title="Tấm chắn vật l&yacute; - Xiaomi BHR4193GL" src="https://cdn.tgdd.vn/Products/Images/4728/242192/ip-mi-home-360-do-2k-pro-xiaomi-bhr4193gl-7.jpg" alt="Tấm chắn vật l&yacute; - Xiaomi BHR4193GL" data-src="https://cdn.tgdd.vn/Products/Images/4728/242192/ip-mi-home-360-do-2k-pro-xiaomi-bhr4193gl-7.jpg"></a></p>
<h3>C&agrave;i đặt điều khiển, quản l&yacute; qua ứng dụng Mi Home</h3>
<p>C&oacute; thể c&agrave;i đặt ứng dụng n&agrave;y tr&ecirc;n điện thoại th&ocirc;ng minh, laptop, m&aacute;y t&iacute;nh bảng của bạn để thực hiện việc c&agrave;i đặt, quản l&yacute; dữ liệu v&agrave; điều khiển gi&aacute;m s&aacute;t cho camera ngay từ xa.</p>
<p>C&agrave;i đặt v&agrave; sử dụng ứng dụng Mi Home đơn giản:</p>
<p>- Tải xuống ứng dụng MiHome.</p>
<p>-&nbsp;Bật nguồn camera.</p>
<p>- Mở ứng dụng v&agrave; kết nối với camera.</p>
<p>Xem th&ecirc;m chi tiết tại đ&acirc;y:&nbsp;<a title="Hướng dẫn sử dụng chi tiết ứng dụng Mi Home" href="https://www.thegioididong.com/hoi-dap/huong-dan-su-dung-chi-tiet-ung-dung-mi-home-1209528" target="_blank" rel="noopener">Hướng dẫn sử dụng chi tiết ứng dụng Mi Home</a>.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/4728/242192/ip-mi-home-360-do-2k-pro-xiaomi-bhr4193gl-5.jpg"><img class=" lazyloaded" title="Mi Home - Xiaomi BHR4193GL" src="https://cdn.tgdd.vn/Products/Images/4728/242192/ip-mi-home-360-do-2k-pro-xiaomi-bhr4193gl-5.jpg" alt="Mi Home - Xiaomi BHR4193GL" data-src="https://cdn.tgdd.vn/Products/Images/4728/242192/ip-mi-home-360-do-2k-pro-xiaomi-bhr4193gl-5.jpg"></a></p>
<h3>Đ&agrave;m thoại 2 chiều với &acirc;m thanh r&otilde; r&agrave;ng th&ocirc;ng qua micro k&eacute;p tr&ecirc;n camera</h3>
<p>Được t&iacute;ch hợp micro k&eacute;p c&oacute; khả năng khử ồn,&nbsp;<a title="camera Xiaomi ch&iacute;nh h&atilde;ng, gi&aacute; rẻ, b&aacute;n tại thegioididong.com" href="https://www.thegioididong.com/camera-giam-sat-xiaomi" target="_blank" rel="noopener">camera Xiaomi</a>&nbsp;cho ph&eacute;p giao tiếp đ&agrave;m thoại trực tiếp th&ocirc;ng qua ứng dụng Mi Home tr&ecirc;n điện thoại, tr&ograve; chuyện tốt hơn, trao đổi th&ocirc;ng tin nhanh ch&oacute;ng hơn.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/4728/242192/ip-mi-home-360-do-2k-pro-xiaomi-bhr4193gl-6.jpg"><img class=" lazyloaded" title="Đ&agrave;m thoại 2 chiều - Xiaomi BHR4193GL" src="https://cdn.tgdd.vn/Products/Images/4728/242192/ip-mi-home-360-do-2k-pro-xiaomi-bhr4193gl-6.jpg" alt="Đ&agrave;m thoại 2 chiều - Xiaomi BHR4193GL" data-src="https://cdn.tgdd.vn/Products/Images/4728/242192/ip-mi-home-360-do-2k-pro-xiaomi-bhr4193gl-6.jpg"></a></p>
<h3>Ph&aacute;t cảnh b&aacute;o chuyển động tức th&igrave; đến thiết bị di động quản l&yacute;</h3>
<p>Khi ph&aacute;t hiện chuyển động bất thường trong khu vực gi&aacute;m s&aacute;t, nhanh ch&oacute;ng, camera sẽ ph&aacute;t cảnh b&aacute;o bằng &acirc;m b&aacute;o v&agrave; biểu tượng đến điện thoại th&ocirc;ng minh c&oacute; kết nối qua Mi Home của bạn, để người d&ugrave;ng nhanh ch&oacute;ng nắm bắt t&igrave;nh huống, đ&aacute;nh gi&aacute; nguy cơ v&agrave; c&oacute; hướng xử l&yacute; an to&agrave;n nhất.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/4728/242192/ip-mi-home-360-do-2k-pro-xiaomi-bhr4193gl-8.jpg"><img class=" lazyloaded" title="Ph&aacute;t hiện chuyển động - Xiaomi BHR4193GL" src="https://cdn.tgdd.vn/Products/Images/4728/242192/ip-mi-home-360-do-2k-pro-xiaomi-bhr4193gl-8.jpg" alt="Ph&aacute;t hiện chuyển động - Xiaomi BHR4193GL" data-src="https://cdn.tgdd.vn/Products/Images/4728/242192/ip-mi-home-360-do-2k-pro-xiaomi-bhr4193gl-8.jpg"></a></p>
<h3>Hỗ trợ lưu trữ dữ liệu tr&ecirc;n thẻ nhớ Micro SD, dung lượng tối đa đến&nbsp;&le; 32 GB (4 - 5 ng&agrave;y dữ liệu quan s&aacute;t)</h3>
<p>Lưu &yacute;:&nbsp;trước khi d&ugrave;ng thiết bị, bạn cần mua th&ecirc;m thẻ nhớ&nbsp;MicroSD.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/4728/242192/ip-mi-home-360-do-2k-pro-xiaomi-bhr4193gl-89.jpg"><img class=" lazyloaded" title="Micro SD - Xiaomi BHR4193GL" src="https://cdn.tgdd.vn/Products/Images/4728/242192/ip-mi-home-360-do-2k-pro-xiaomi-bhr4193gl-89.jpg" alt="Micro SD - Xiaomi BHR4193GL" data-src="https://cdn.tgdd.vn/Products/Images/4728/242192/ip-mi-home-360-do-2k-pro-xiaomi-bhr4193gl-89.jpg"></a></p>
<p>Lắp đặt v&agrave; sử dụng&nbsp;<a title="Camera IP Mi Home 360 Độ 2K Pro Xiaomi BHR4193GL" href="https://www.thegioididong.com/camera-giam-sat/ip-mi-home-360-do-2k-pro-xiaomi-bhr4193gl" target="_blank" rel="noopener">Camera IP Mi Home 360 Độ 2K Pro Xiaomi BHR4193GL</a>&nbsp;để an t&acirc;m với hệ thống bảo vệ an ninh th&ocirc;ng minh, hoạt động hiệu quả, tiết kiệm chi ph&iacute; đầu tư tốt.</p>', N'nguyenhieu', N'1 sản phẩm / hộp', 1, 1590000, 0, N'Xiaomi')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1904230910', N'Thùng 24 lon bia Sài Gòn Special Sleek 330ml', N'/Assets/img/HDD1904230910.jpg', N'Bia ngon chất lượng quen thuộc với người dân Việt Nam đặc biệt là người dân miền Nam. Thùng 24 lon bia Sài Gòn Special Sleek 330ml chính hãng bia Sài Gòn với hương vị truyền thống thơm ngon, cân bằng, dễ uống, thiết kế lon cao thanh lịch sang trọng, hiện đại', CAST(N'2023-04-19T09:10:43.197' AS DateTime), 8, N'<h2><strong>Giới thiệu thương hiệu bia S&agrave;i G&ograve;n</strong></h2>
<p>Nhắc đến c&aacute;c thương hiệu bia Việt, chắc hẳn những người s&agrave;nh uống n&oacute;i ri&ecirc;ng v&agrave; người ti&ecirc;u d&ugrave;ng n&oacute;i chung đều đ&atilde; qu&aacute; quen thuộc với c&aacute;i t&ecirc;n bia S&agrave;i G&ograve;n. L&agrave; thương hiệu c&oacute; lịch sử từ l&acirc;u, đến nay bia S&agrave;i G&ograve;n vẫn rất th&agrave;nh c&ocirc;ng vang dội v&agrave; khẳng định được vị thế của m&igrave;nh tr&ecirc;n thị trường với những sản phẩm đạt chất lượng tốt nhất.</p>
<h2><strong><img class="lazy initial loaded" src="https://cdn.tgdd.vn/Products/Images//2282/276229/bhx/files/special%203(1).jpg" alt="Th&ugrave;ng 24 lon bia S&agrave;i G&ograve;n Special Sleek 330ml 0" data-src="//cdn.tgdd.vn/Products/Images//2282/276229/bhx/files/special%203(1).jpg" data-was-processed="true"><br>Bia S&agrave;i G&ograve;n Special</strong></h2>
<p>D&uacute;ng với c&aacute;i c&aacute;i t&ecirc;n, d&ograve;ng sản phẩm Saigon Special mang đến một sự đặc biệt từ bao b&igrave; đến chất lượng sản phẩm. Bia S&agrave;i G&ograve;n Special c&oacute; thiết&nbsp;kế nam t&iacute;nh m&agrave; sang trọng với m&agrave;u xanh l&aacute; ấn tượng. Sản phẩm được sản xuất từ 100% l&uacute;a mạch với d&acirc;y truyền c&ocirc;ng nghệ mới.<br><img class="lazy initial loaded" src="https://cdn.tgdd.vn/Products/Images//2282/276229/bhx/files/special%201(1).jpg" alt="Th&ugrave;ng 24 lon bia S&agrave;i G&ograve;n Special Sleek 330ml 1" data-src="//cdn.tgdd.vn/Products/Images//2282/276229/bhx/files/special%201(1).jpg" data-was-processed="true"><br>Bia Saigon Special ra đời để chinh phục v&agrave; trở n&ecirc;n quen thuộc với giới trẻ năng động. Bia c&oacute; cả dạng chai v&agrave; lon tiện tiện dụng, nồng độ cồn l&agrave; 4.9%.<br><img class="lazy initial loaded" src="https://cdn.tgdd.vn/Products/Images//2282/276229/bhx/files/special%202(1).jpg" alt="Th&ugrave;ng 24 lon bia S&agrave;i G&ograve;n Special Sleek 330ml 2" data-src="//cdn.tgdd.vn/Products/Images//2282/276229/bhx/files/special%202(1).jpg" data-was-processed="true"><br>Sản phẩm được thiết kế bao b&igrave; dạng lon cao th&ecirc;m phần thanh lịch v&agrave; sang trọng hơn.<br>Hương vị bia Saigon c&oacute; sự đậm đ&agrave; v&agrave; hương bia thơm nồng, cho bạn cảm gi&aacute;c uống sảng kho&aacute;i.</p>', N'nguyenhieu', N'24 lon/thùng', 1, 335000, 0, N'Sài Gòn')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1904230936', N'Thùng 12 lon bia Tiger 500ml', N'/Assets/img/HDD1904230936.jpg', N'Hương vị bia truyền thống thơm ngon từ năm 1932, được nhiều người yêu thích tại Việt Nam. Thùng 12 lon bia Tiger 500ml chính hãng bia Tiger lon lớn cực đã, uống sảng khoái hơn cho bạn những giây phút thư giãn thoải mái cùng gia đình, bạn bè, đồng nghiệp', CAST(N'2023-04-19T09:36:56.273' AS DateTime), 8, N'<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu Tiger</strong></h3>
<ul>
<li>
<p>Tiger l&agrave; thương hiệu bia nổi tiếng tại Việt Nam xuất xứ từ Singapore, được giới thiệu từ năm 1932, hiện nay Tiger thuộc sở hữu của tập đo&agrave;n Heineken. Tiger tự h&agrave;o được mệnh danh l&agrave; nh&atilde;n hiệu bia số 1 tại ch&acirc;u &Aacute; từ năm 1992</p>
</li>
<li>
<p>Hương vị bia đậm đ&agrave; thơm ngon ph&ugrave; hợp khẩu vị người Việt c&ugrave;ng chất lượng, uy t&iacute;n được khẳng định qua nhiều thập kỷ, Tiger lu&ocirc;n nỗ lực mang đến những sản phẩm tốt nhất, ngo&agrave;i hương vị Tiger lager nguy&ecirc;n bản c&ograve;n c&oacute; Tiger bạc, Tiger l&uacute;a m&igrave; Platinum rất được người d&ugrave;ng Việt y&ecirc;u th&iacute;ch.</p>
</li>
</ul>
<div><img class="lazy initial loaded" src="https://cdn.tgdd.vn/Products/Images//2282/285976/bhx/files/bia-tiger-lon-500ml-202208160953246721.jpg" alt="Th&ugrave;ng 12 lon bia Tiger 500ml 0" data-src="//cdn.tgdd.vn/Products/Images//2282/285976/bhx/files/bia-tiger-lon-500ml-202208160953246721.jpg" data-was-processed="true"></div>
<h3><strong>Th&agrave;nh phần dinh dưỡng trong sản phẩm</strong></h3>
<ul>
<li>
<p>Bia được l&agrave;m từ những nguy&ecirc;n liệu quen thuộc, được chọn lọc kỹ từ c&aacute;c th&agrave;nh phần nước, đại mạch, ngũ cốc v&agrave; hoa bia.</p>
</li>
<li>
<p>Nồng độ ethanol khoảng 5%, ngo&agrave;i ra trong bia c&ograve;n chứa nhiều loại acid amin ph&ograve;ng ph&uacute; v&agrave; c&oacute; lợi</p>
</li>
</ul>
<h3><strong>T&aacute;c dụng của sản phẩm với sức khỏe</strong></h3>
<ul>
<li>
<p>Giải kh&aacute;t giải nhiệt cơ thể</p>
</li>
<li>
<p>Giảm căng thẳng mệt mỏi</p>
</li>
<li>
<p>Thư gi&atilde;n tinh thần</p>
</li>
<li>
<p>Hạn chế nguy cơ mắc tiểu đường</p>
</li>
<li>
<p>Giảm sỏi thận</p>
</li>
<li>
<p>&hellip;</p>
</li>
</ul>
<h3><img class="lazy initial loaded" src="https://cdn.tgdd.vn/Products/Images//2282/285976/bhx/files/thung-12-lon-bia-tiger-500ml-202208161004116024.jpg" alt="Th&ugrave;ng 12 lon bia Tiger 500ml 1" data-src="//cdn.tgdd.vn/Products/Images//2282/285976/bhx/files/thung-12-lon-bia-tiger-500ml-202208161004116024.jpg" data-was-processed="true"><br><strong>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản sản phẩm</strong></h3>
<ul>
<li>
<p>Bảo quản nơi kh&ocirc; r&aacute;o tho&aacute;ng m&aacute;t</p>
</li>
<li>
<p>Tr&aacute;nh &aacute;nh nắng trực tiếp</p>
</li>
<li>
<p>Kh&ocirc;ng để bia trong ngăn đ&aacute; tủ lạnh</p>
</li>
<li>
<p>Bia c&oacute; dung t&iacute;ch lớn hơn th&ocirc;ng thường n&ecirc;n c&acirc;n nhắc về số lượng sử dụng</p>
</li>
<li>
<p>Uống bia c&oacute; tr&aacute;ch nhiệm, kh&ocirc;ng l&aacute;i xe sau khi sử dụng</p>
</li>
<li>
<p>Kh&ocirc;ng d&ugrave;ng cho người dưới 18 tuổi, người dị ứng cồn, phụ nữ c&oacute; thai v&agrave; đang cho con b&uacute;</p>
</li>
</ul>
<h3><strong>C&aacute;c m&oacute;n ăn ngon với sản phẩm</strong></h3>
<p>Ngo&agrave;i sử dụng bia để uống bạn c&ograve;n c&oacute; thể d&ugrave;ng bia Tiger trong một số m&oacute;n ăn như:</p>
<ul>
<li>
<p>T&ocirc;m hấp bia</p>
</li>
<li>
<p>G&agrave; hấp bia h&agrave;nh</p>
</li>
<li>
<p>C&aacute; ch&eacute;p hấp bia</p>
</li>
<li>
<p>Cua hấp bia</p>
</li>
<li>
<p>G&agrave; nấu bia</p>
</li>
<li>
<p>&hellip;</p>
</li>
</ul>', N'nguyenhieu', N'12 lon/ thùng', 1, 210000, 24, N'Tiger')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1904230945', N'Thùng 24 lon bia Larue Special 330ml', N'/Assets/img/HDD1904230945.jpg', N'Bia Larue sản xuất theo công nghệ hiện đại từ tuyển chọn nguyên liệu tới chế biến, đóng gói đều diễn ra khép kín dưới sự giám sát và kiểm tra nghiêm ngặt. Thùng 24 lon bia Larue Special 330ml hương vị bia đậm đà thơm ngon hấp dẫn. Bia cam kết chính hãng, uy tín chất lượng', CAST(N'2023-04-19T09:45:33.923' AS DateTime), 8, N'<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu Larue</strong></h3>
<p>Larue l&agrave; thương hiệu bia được th&agrave;nh lập từ năm 1909, tại Việt Nam,&nbsp; sản xuất theo c&ocirc;ng nghệ ch&acirc;u &Acirc;u v&agrave; hiện thuộc sở hữu của Heineken - t&ecirc;n tuổi lớn tr&ecirc;n thị trường bia to&agrave;n cầu.</p>
<p>C&ocirc;ng nghệ ch&acirc;u &Acirc;u, nguy&ecirc;n liệu thượng hạng đầu v&agrave;o c&ugrave;ng quy tr&igrave;nh kiểm so&aacute;t chất lượng nghi&ecirc;m ngặt, đạt chuẩn quốc tế, Larue mang đến cho bạn những sản phẩm thật sự chất lượng, ngon v&agrave; đậm đ&agrave;</p>
<h3><img class="lazy initial loaded" src="https://cdn.tgdd.vn/Products/Images/2282/182389/bhx/thung-24-lon-bia-larue-special-330ml-202103162306028163.jpg" alt="Th&ugrave;ng 24 lon bia Larue Special 330ml 0" data-src="https://cdn.tgdd.vn/Products/Images/2282/182389/bhx/thung-24-lon-bia-larue-special-330ml-202103162306028163.jpg" data-was-processed="true"><br><strong>Th&agrave;nh phần dinh dưỡng trong Th&ugrave;ng 24 lon bia Larue Special 330ml</strong></h3>
<ul>
<li>
<p>Trong bia Larue được tạo th&agrave;nh từ nước, đại mạch, ngũ cốc, hoa bia v&agrave; hương tr&aacute;i tổng hợp. Ngo&agrave;i ra trong qu&aacute; tr&igrave;nh l&ecirc;n men c&ograve;n tạo ra nhiều axit amin v&agrave; hệ men tốt cho cơ thể.</p>
</li>
<li>
<p>Mỗi lon bia sẽ mang đến cho cơ thể khoảng&nbsp;<strong>150 calo</strong></p>
</li>
</ul>
<h3><strong>&nbsp;T&aacute;c dụng của sản phẩm với sức khỏe</strong></h3>
<ul>
<li>
<p>Uống bia gi&uacute;p tốt cho hệ ti&ecirc;u h&oacute;a</p>
</li>
<li>
<p>L&agrave; thức uống giải kh&aacute;t</p>
</li>
<li>
<p>Hỗ trợ chắc xương v&agrave; chắc răng.</p>
</li>
<li>
<p>Bia c&ograve;n l&agrave; nguy&ecirc;n liệu l&agrave;m đẹp cho da v&agrave; t&oacute;c</p>
</li>
</ul>
<h3><br><img class="lazy initial loaded" src="https://cdn.tgdd.vn/Products/Images/2282/182389/bhx/bia-larue-lager-special-lon-330ml-th24-4-org.jpg" alt="Th&ugrave;ng 24 lon bia Larue Special 330ml 1" data-src="https://cdn.tgdd.vn/Products/Images/2282/182389/bhx/bia-larue-lager-special-lon-330ml-th24-4-org.jpg" data-was-processed="true"><strong>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản Th&ugrave;ng 24 lon bia Larue Special 330ml</strong></h3>
<ul>
<li>
<p>Chỉ sử dụng cho người từ 18 tuổi trở l&ecirc;n</p>
</li>
<li>
<p>Kh&ocirc;ng l&aacute;i xe khi đ&atilde; uống bia</p>
</li>
<li>
<p>Ngon hơn khi uống lạnh</p>
</li>
<li>
<p>C&oacute; thể bảo quản trong m&ocirc;i trường ngo&agrave;i hoặc bảo quản trong tủ m&aacute;t</p>
</li>
<li>
<p>&hellip;</p>
</li>
</ul>
<h3><strong>C&aacute;c m&oacute;n ăn ngon với sản phẩm</strong></h3>
<ul>
<li>
<p>T&ocirc;m s&uacute; hấp bia</p>
</li>
<li>
<p>Mực hấp bia v&agrave; h&agrave;nh</p>
</li>
<li>
<p>G&agrave; luộc bia chấm muối ti&ecirc;u chanh</p>
</li>
<li>
<p>&hellip;</p>
</li>
</ul>', N'nguyenhieu', N'24 lon/thùng', 1, 260000, 0, N'Larue')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1904230952', N'Thùng 24 lon bia tuyết Edelweiss 330ml', N'/Assets/img/HDD1904230952.jpg', N'Bia tuyết thơm ngon làm từ lúa mì, đại mạch, thảo mộc thiên nhiên và nguồn nước tinh khiết tại những ngọn núi tuyết châu Âu. Thùng 24 lon bia tuyết Edelweiss 330ml chính hãng bia Edelweiss sở hữu công nghệ bia lâu đời từ năm 1646 mang đến hương vị bia thơm ngon hấp dẫn', CAST(N'2023-04-19T09:52:38.780' AS DateTime), 8, N'<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu</strong></h3>
<p>Edelweiss l&agrave; đứa con xuất sắc của đại gia đ&igrave;nh Heineken đ&igrave;nh đ&aacute;m thế giới. Được ra đời từ năm 1646 tại n&uacute;i An-pơ, được tạo ra nhờ c&ocirc;ng nghệ ủ bia truyền thống của ch&acirc;u &Acirc;u từ l&uacute;a m&igrave; v&agrave; c&aacute;c loại thảo mộc c&oacute; hương vị m&aacute;t lạnh sảng kho&aacute;i, bia Edelweiss c&ograve;n được gọi l&agrave; bia tuyết</p>
<h3><strong>Th&agrave;nh phần dinh dưỡng trong sản phẩm</strong></h3>
<ul>
<li>
<p>Nước, l&uacute;a m&igrave;, đại mạch, chiết xuất t&aacute;o, hương thảo mộc tự nhi&ecirc;n, hoa bia v&agrave; men l&agrave; những th&agrave;nh phần ch&iacute;nh tạo n&ecirc;n hương vị bia</p>
</li>
<li>
<p>H&agrave;m lượng dinh dưỡng trong bia c&oacute; chứa&nbsp;3.8g carbohydrates, 0.6g chất đạm trong mỗi 100ml v&agrave; cung cấp cho cơ thể mức năng lượng tương đương khoảng 48 calo</p>
</li>
</ul>
<h3><strong><img class="lazy initial loaded" src="https://cdn.tgdd.vn/Products/Images//2282/290453/bhx/files/kham-pha-huong-vi-an-tuong-cua-bia-tuyet-edelweiss-den-tu-chau-au-202208021311150257.jpg" alt="Th&ugrave;ng 24 lon bia tuyết Edelweiss 330ml 0" data-src="//cdn.tgdd.vn/Products/Images//2282/290453/bhx/files/kham-pha-huong-vi-an-tuong-cua-bia-tuyet-edelweiss-den-tu-chau-au-202208021311150257.jpg" data-was-processed="true"><br>T&aacute;c dụng của sản phẩm với sức khỏe</strong></h3>
<ul>
<li>
<p>Giải kh&aacute;t, mang đến cảm gi&aacute;c m&aacute;t lạnh sảng kho&aacute;i</p>
</li>
<li>
<p>Giải tỏa căng thẳng mệt mỏi</p>
</li>
<li>
<p>Trong bia c&oacute; chưa vitamin B cho bạn cảm giacis ngon miệng, gi&uacute;p t&aacute;i tạo tế b&agrave;o</p>
</li>
<li>
<p>Ph&ograve;ng ngừa một số bệnh nguy hiểm như:&nbsp; tiểu đường, sỏi thận, ung thư, c&aacute;c bệnh l&yacute; tim mạch</p>
</li>
<li>
<p>Ứng dụng trong l&agrave;m đẹp, chăm s&oacute;c da v&agrave; t&oacute;c</p>
</li>
</ul>
<h3><strong>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản sản phẩm</strong></h3>
<ul>
<li>
<p>Để nơi kh&ocirc; r&aacute;o tho&aacute;ng m&aacute;t</p>
</li>
<li>
<p>Tr&aacute;nh &aacute;nh nắng trực tiếp</p>
</li>
<li>
<p>Kh&ocirc;ng để trong ngăn đ&aacute;</p>
</li>
<li>
<p>Kh&ocirc;ng d&ugrave;ng khi đ&oacute;i bụng</p>
</li>
<li>
<p>Kh&ocirc;ng lạm dụng uống qu&aacute; nhiều sản phẩm ngược lại sẽ ảnh hưởng kh&ocirc;ng tốt đến sức khỏe</p>
</li>
<li>
<p>Kh&ocirc;ng d&ugrave;ng cho người dưới 18 tuổi, phụ nữ c&oacute; thai</p>
</li>
</ul>
<h3><strong><img class="lazy initial loaded" src="https://cdn.tgdd.vn/Products/Images//2282/290453/bhx/files/bia-tuyet-edelweiss-lon-330ml-202209200814362331.jpg" alt="Th&ugrave;ng 24 lon bia tuyết Edelweiss 330ml 1" data-src="//cdn.tgdd.vn/Products/Images//2282/290453/bhx/files/bia-tuyet-edelweiss-lon-330ml-202209200814362331.jpg" data-was-processed="true"><br>C&aacute;c m&oacute;n ăn ngon với sản phẩm</strong></h3>
<ul>
<li>
<p>Hải sản hấp bia</p>
</li>
<li>
<p>G&agrave; hấp bia</p>
</li>
<li>
<p>G&agrave; om bia</p>
</li>
<li>
<p>B&ecirc;n cạnh đ&oacute; bạn c&oacute; thể d&ugrave;ng bia để pha chế nước sốt, pha bột b&aacute;nh x&egrave;o, bột chi&ecirc;n gi&ograve;n,...</p>
</li>
</ul>', N'nguyenhieu', N'24 lon/thùng', 1, 528000, 0, N'Edelweiss')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1904231002', N'Tắm gội toàn thân cho bé Pureen Pro-Vitamin B5 & vitamin e 500ml', N'/Assets/img/HDD1904231002.jpg', N'Tắm gội cho bé Pureen với công thức đặc biệt không cay mắt và nhẹ nhàng với da. Tắm gội cho bé giúp sạch bụi bẩn, dưỡng da và da đầu của bé hiệu quả. Tắm gội toàn thân cho bé Pureen Pro-Vitamin B5 & Vitamin E 500ml cho da mềm mại và trắng sáng.', CAST(N'2023-04-19T10:02:30.697' AS DateTime), 9, NULL, N'nguyenhieu', N'1 sản phẩm / hộp', 1, 113500, 0, N'Pureen')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1904231009', N'Mặt nạ mắt tinh chất vitamin và vàng ròng Hani Hani 60 miếng', N'/Assets/img/HDD1904231009.jpg', N'Mặt nạ Hani Hani được sản xuất tại Hàn Quốc. Mặt nạ với công thức cải tiến vượt trội đem lại hiệu quả chăm sóc da tốt hơn với nhiều dòng sản phẩm khác nhau, được chị em ưa chuộng. Mặt nạ mắt tinh chất vitamin và vàng ròng Hani Hani 60 miếng giúp làm giảm nếp nhăn, bọng mắt, quầng thâm', CAST(N'2023-04-19T10:09:15.067' AS DateTime), 9, N'<h2><a title="Mặt nạ" href="https://www.bachhoaxanh.com/mat-na-danh-cho-mat" target="_blank" rel="noopener">Mặt nạ</a>&nbsp;mắt x&oacute;a th&acirc;m v&agrave; nếp nhăn</h2>
<p>Với th&agrave;nh phần chủ yếu l&agrave; vitamin v&agrave; tinh chất v&agrave;ng r&ograve;ng c&ocirc; đặc cung cấp dưỡng chất cho v&ugrave;ng da kh&ocirc; quanh mắt gi&uacute;p l&agrave;m&nbsp;<strong>giảm nếp nhăn, bọng mắt, kh&oacute;e miệng v&agrave; quầng th&acirc;m</strong>, gi&uacute;p l&agrave;n da trở n&ecirc;n mềm mại, trắng trẻo v&agrave; trẻ khỏe. Cho da của bạn th&ecirc;m tr&agrave;n đầy sức sống v&agrave; tự tin.<br>Tham khảo:&nbsp;<a title="C&oacute; n&ecirc;n để mặt nạ trong tủ lạnh? Liệu l&agrave;m vậy c&oacute; l&agrave;m mặt nạ mất đi dưỡng chất?" href="https://www.bachhoaxanh.com/kinh-nghiem-hay/10-cach-che-bien-mon-an-sieu-la-va-ngon-tu-nhuy-hoa-nghe-tay-1285520" target="_blank" rel="noopener">C&oacute; n&ecirc;n để mặt nạ trong tủ lạnh? Liệu l&agrave;m vậy c&oacute; l&agrave;m mặt nạ mất đi dưỡng chất?</a><br><img class="lazy initial loaded" src="https://cdn.tgdd.vn/Products/Images//6653/231997/bhx/files/Untitled-4.jpg" alt="Mặt nạ mắt tinh chất vitamin v&agrave; v&agrave;ng r&ograve;ng Hani Hani 60 miếng 0" data-src="//cdn.tgdd.vn/Products/Images//6653/231997/bhx/files/Untitled-4.jpg" data-was-processed="true"></p>
<h2>Hũ 60 miếng mặt nạ,&nbsp;sử dụng l&acirc;u</h2>
<p><a title="Mặt nạ mắt tinh chất vitamin v&agrave; v&agrave;ng r&ograve;ng Hani Hani 60 miếng" href="https://www.bachhoaxanh.com/mat-na-danh-cho-mat/mat-na-mat-tinh-chat-vitamin-va-vang-rong-hani-hani-60-mieng" target="_blank" rel="noopener">Mặt nạ mắt tinh chất vitamin v&agrave; v&agrave;ng r&ograve;ng Hani Hani 60 miếng</a>&nbsp;cho bạn&nbsp;<strong>sử dụng nhiều lần v&agrave; tiết kiệm</strong>. C&aacute;ch đắp mặt nạ mắt:&nbsp;Đầu ti&ecirc;n bạn&nbsp;l&agrave;m sạch mặt, đắp mặt nạ l&ecirc;n sao cho vừa v&ugrave;ng mắt/kh&oacute;e miệng, thư gi&atilde;n 30 ph&uacute;t. Sau đ&oacute; gỡ mặt nạ ra v&agrave; vỗ nhẹ l&ecirc;n v&ugrave;ng da vừa đắp để hấp thu tốt c&aacute;c dưỡng chất vừa thẩm thấu. Rửa lại với nước sạch.<br>T&igrave;m hiểu:&nbsp;<a title="Đắp mặt nạ xong c&oacute; n&ecirc;n rửa mặt kh&ocirc;ng?" href="https://www.bachhoaxanh.com/kinh-nghiem-hay/dap-mat-na-xong-co-nen-rua-mat-khong-1137395" target="_blank" rel="noopener">Đắp mặt nạ xong c&oacute; n&ecirc;n rửa mặt kh&ocirc;ng?</a><br><img class="lazy initial loaded" src="https://cdn.tgdd.vn/Products/Images//6653/231997/bhx/files/mat-na-mat-chiet-xuat-mat-ong-jmsolution-honey-luminous-4-600x600.jpg" alt="Mặt nạ mắt tinh chất vitamin v&agrave; v&agrave;ng r&ograve;ng Hani Hani 60 miếng 1" data-src="//cdn.tgdd.vn/Products/Images//6653/231997/bhx/files/mat-na-mat-chiet-xuat-mat-ong-jmsolution-honey-luminous-4-600x600.jpg" data-was-processed="true"><br><a title="Mặt nạ mắt Hani Hani" href="https://www.bachhoaxanh.com/mat-na-danh-cho-mat-hani-hani" target="_blank" rel="noopener">Mặt nạ mắt Hani Hani</a>&nbsp;xuất xứ&nbsp;từ H&agrave;n Quốc, l&agrave; thương hiệu mỹ phẩm sinh học với c&ocirc;ng nghệ ti&ecirc;n tiến c&ugrave;ng c&aacute;c th&agrave;nh phần thi&ecirc;n nhi&ecirc;n được nhiều người ưu chuộng.</p>', N'nguyenhieu', N'60 miếng/hũ', 1, 365000, 0, N'Hani Hani')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1904231019', N'Sữa tắm giữ ẩm The Bol Vitamin E và hoa hồng 900g', N'/Assets/img/HDD1904231019.jpg', N'Sữa tắm The Bol là loại sữa tắm được sản xuất tại Việt Nam. Sữa tắm giữ ẩm The Bol Vitamin E và hoa hồng 900g mang lại cho bạn một mùi hương quyến rũ và khả năng làm sạch, bảo vệ làn da khỏi các tác nhân gây hại, đồng thời tạo độ ẩm duy trì cho da', CAST(N'2023-04-19T10:19:46.927' AS DateTime), 9, NULL, N'nguyenhieu', N'1 sản phẩm / hộp', 1, 138, 0, N'The Bol ')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1904231044', N'Kem dưỡng 9 Wishes Pine Treatment Cream dưỡng ẩm 50ml', N'/Assets/img/HDD1904231044.jpg', N'Kem dưỡng da 9 Wishes an toàn, là sự lựa chọn hoàn hảo cho bạn. Kem dưỡng 9 Wishes Pine Treatment Cream dưỡng ẩm 50ml giúp cung cấp độ ẩm cho làn da đồng bổ sung các dưỡng chất cho da luôn tươi trẻ. Kem dưỡng da hỗ trợ phục hồi làn da thêm tươi trắng rạng ngời.', CAST(N'2023-04-19T10:44:11.953' AS DateTime), 12, N'<p>9 Wishes l&agrave; thương hiệu mỹ phẩm H&agrave;n Quốc c&oacute; chất lượng high-end với mức gi&aacute; v&ocirc; c&ugrave;ng b&igrave;nh d&acirc;n. Đặc biệt c&aacute;c sản phẩm mang thương hiệu n&agrave;y c&oacute; th&agrave;nh phần chiết xuất từ thi&ecirc;n nhi&ecirc;n n&ecirc;n kh&aacute; l&agrave;nh t&iacute;nh cho da. Hầu hết c&aacute;c sản phẩm đều c&oacute; thiết kế bao b&igrave; đơn giảm tuy nhi&ecirc;n m&agrave;u sắc lại to&aacute;t l&ecirc;n vẻ đẹp nhẹ nh&agrave;ng v&agrave; sang trọng.<br><img class="lazy initial loaded" src="https://cdn.tgdd.vn/Products/Images//7199/275530/bhx/files/b%c3%a0i%202.jpg" alt="Kem dưỡng 9 Wishes Pine Treatment Cream dưỡng ẩm 50ml 0" data-src="//cdn.tgdd.vn/Products/Images//7199/275530/bhx/files/b%c3%a0i%202.jpg" data-was-processed="true"></p>
<h3><strong>Ưu điểm của sản phẩm</strong></h3>
<ul>
<li>
<p>Chất kem mỏng nhẹ dễ t&aacute;n</p>
</li>
<li>
<p>Kh&ocirc;ng g&acirc;y cảm gi&aacute;c kh&oacute; chịu tr&ecirc;n da</p>
</li>
<li>
<p>Chiết xuất l&aacute; th&ocirc;ng tự nhi&ecirc;n</p>
</li>
<li>
<p>Cải thiện l&agrave;n da mụn vi&ecirc;m</p>
</li>
<li>
<p>Bổ sung độ ẩm cho da</p>
</li>
</ul>
<h3><strong>Đối tượng sử dụng</strong></h3>
<p>Kem dưỡng 9 Wish đặc biệt th&iacute;ch hợp sử dụng cho những l&agrave;n da dầu mụn để l&agrave;m dịu c&aacute;c vết đỏ, bởi kết cấu kem mỏng nhẹ, thấm nhanh n&ecirc;n kh&ocirc;ng l&agrave;m b&iacute;t tắc lỗ ch&acirc;n l&ocirc;ng. Những l&agrave;n da kh&ocirc;, bong tr&oacute;c, thiếu ẩm c&oacute; thể sử dụng để cải thiện l&agrave;n da. Sản phẩm đặc biệt ph&ugrave; hợp với da dầu, da dầu mụn.</p>
<h3><strong>Hướng dẫn sử dụng</strong></h3>
<p>Sau khi sử dụng c&aacute;c loại tinh chất, serum trước đ&oacute;, cho một lượng sản phẩm vừa đủ ra tay v&agrave; chấm 5 điểm tr&ecirc;n gương mặt ( tr&aacute;n, 2 b&ecirc;n m&aacute;, cằm v&agrave; mũi) thoa đều hoặc vỗ nhẹ sản phẩm để kem thấm đều v&agrave;o da. N&ecirc;n sử dung cả buổi s&aacute;ng v&agrave; tối v&agrave; d&ugrave;ng th&ecirc;m kem chống nắng để bảo vệ da được tốt nhất.<br><img class="lazy initial loaded" src="https://cdn.tgdd.vn/Products/Images//7199/275530/bhx/files/b%c3%a0i%202%27.jpg" alt="Kem dưỡng 9 Wishes Pine Treatment Cream dưỡng ẩm 50ml 1" data-src="//cdn.tgdd.vn/Products/Images//7199/275530/bhx/files/b%c3%a0i%202%27.jpg" data-was-processed="true"></p>
<h3><strong>C&aacute;ch bảo quản v&agrave; lưu &yacute; khi sử dụng kem dưỡng 9 Wishes thanh lọc da Pine Treatment Cream 50ml</strong></h3>
<p>Kem dưỡng chỉ cần được bảo quản ở nhiệt độ thường, tuyệt đối kh&ocirc;ng đặt sản phẩm ở nơi c&oacute; nhiệt độ cao, tiếp x&uacute;c trực tiếp với &aacute;nh nắng mặt trời. Đậy k&iacute;n nắp sau khi sử dụng để tr&aacute;nh bụi bẩn l&agrave;m ảnh hưởng đến sản phẩm b&ecirc;n trong.<br>Lưu &yacute;: N&ecirc;n sử dụng sau c&aacute;c bước tinh chất, serum để sản phẩm ph&aacute;t huy tốt nhất c&ocirc;ng dụng. Sử dụng một lượng kem vừa đủ để kh&ocirc;ng l&agrave;m b&iacute; da khi sử dụng.</p>', N'nguyenhieu', N'1 sản phẩm/tuýp', 1, 399000, 0, N'9 Wishes')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1904231045', N'Kem dưỡng Bom Eight Tea Capsule Cream cấp ẩm 50g', N'/Assets/img/HDD1904231045.jpg', N'Kem dưỡng Bom với thành phần từ các loại trà được nhiều người lựa chọn tin dùng.Kem dưỡng Bom Eight Tea Capsule Cream cấp ẩm 50g giúp cung cấp độ ẩm, chống tình trạng lão hóa và cải thiện tình trạng mụn, là kem dưỡng tuyệt vời cho làn da của bạn.', CAST(N'2023-04-19T10:45:19.627' AS DateTime), 12, N'<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu Bom&nbsp;</strong></h3>
<p>Bom l&agrave; một trong những thương hiệu mỹ phẩm ra đời tại H&agrave;n Quốc, được nhiều người y&ecirc;u th&iacute;ch với c&ocirc;ng thức thuần t&uacute;y độc quyền với 8 loại tr&agrave; thi&ecirc;n nhi&ecirc;n an to&agrave;n cho người sử dụng. C&aacute;c sản phẩm của Bom được sản xuất tr&ecirc;n d&acirc;y chuyền c&ocirc;ng nghệ hiện đại, nghi&ecirc;n cứu ph&ugrave; hợp với l&agrave;n da người Ch&acirc;u &Aacute;</p>
<h3><img class="lazy initial loaded" src="https://cdn.tgdd.vn/Products/Images/6562/273342/bhx/kem-duong-cap-nuoc-8-loai-tra-bom-eight-tea-capsule-cream-50g-202204262327259251.jpg" alt="Kem dưỡng Bom Eight Tea Capsule Cream cấp ẩm 50g 0" data-src="https://cdn.tgdd.vn/Products/Images/6562/273342/bhx/kem-duong-cap-nuoc-8-loai-tra-bom-eight-tea-capsule-cream-50g-202204262327259251.jpg" data-was-processed="true"><br><strong>Ưu điểm của Kem dưỡng cấp nước 8 loại tr&agrave; Bom Eight Tea Capsule Cream 50g</strong></h3>
<ul>
<li>
<p>Gi&uacute;p chống oxy h&oacute;a, hạn chế t&igrave;nh trạng mụn, cải thiện vẻ đẹp l&agrave;n da.</p>
</li>
<li>
<p>Gi&uacute;p cấp ẩm chuy&ecirc;n s&acirc;u cho l&agrave;n da thiếu ẩm v&agrave; da nhạy cảm.</p>
</li>
<li>
<p>Sử dụng cho ng&agrave;y v&agrave; đ&ecirc;m, tiện lợi</p>
</li>
<li>
<p>Sử dụng cho cả tay, ch&acirc;n v&agrave; mặt</p>
</li>
<li>
<p>Với 8 loại tr&agrave; thi&ecirc;n nhi&ecirc;n, cung cấp ẩm hiệu quả cho l&agrave;n da, gi&uacute;p da căng b&oacute;ng tức th&igrave;</p>
</li>
<li>
<p>&hellip;</p>
</li>
</ul>
<h3><img class="lazy initial loaded" src="https://cdn.tgdd.vn/Products/Images/6562/273342/bhx/kem-duong-cap-nuoc-8-loai-tra-bom-eight-tea-capsule-cream-50g-202204262327271163.JPG" alt="Kem dưỡng Bom Eight Tea Capsule Cream cấp ẩm 50g 1" data-src="https://cdn.tgdd.vn/Products/Images/6562/273342/bhx/kem-duong-cap-nuoc-8-loai-tra-bom-eight-tea-capsule-cream-50g-202204262327271163.JPG" data-was-processed="true"><br><strong>Đối tượng sử dụng</strong></h3>
<p>Kem dưỡng th&iacute;ch hợp sử dụng cho mọi l&agrave;n da, th&iacute;ch hợp d&ugrave;ng cho cả ban ng&agrave;y v&agrave; ban đ&ecirc;m, tiện lợi, tiết kiệm.</p>
<h3><strong>Hướng dẫn sử dụng</strong></h3>
<p>Lấy một lượng kem vừa đủ thoa đều khắp mặt v&agrave; cổ, sau đ&oacute; massage để gi&uacute;p tinh chất được thấm nhiều v&agrave; nhanh hơn. Sử dụng mỗi s&aacute;ng v&agrave; tối.</p>
<h3><strong>C&aacute;ch bảo quản v&agrave; lưu &yacute; Kem dưỡng cấp nước 8 loại tr&agrave; Bom Eight Tea Capsule Cream 50g</strong></h3>
<ul>
<li>
<p>Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp của mặt trời</p>
</li>
<li>
<p>Nếu c&oacute; bất kỳ k&iacute;ch ứng n&agrave;o, ngưng sử dụng v&agrave; hỏi &yacute; kiến b&aacute;c sĩ da liễu.</p>
</li>
<li>
<p>Kh&ocirc;ng d&ugrave;ng cho trẻ dưới 3 tuổi</p>
</li>
</ul>', N'nguyenhieu', N'1 sản phẩm/tuýp', 1, 458000, 0, N'Bom')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1904231052', N'Kem dưỡng Cetaphil Moisturizing Cream dưỡng ẩm 50g', N'/Assets/img/HDD1904231052.jpg', N'Kem dưỡng Cetaphil là thương hiệu kem dưỡng da nổi tiếng và uy tín từ Canada. Kem dưỡng Cetaphil Moisturizing Cream dưỡng ẩm 50g nguyên liệu hoàn toàn lành tính, kết cấu nhẹ giúp khôi phục hàng rào bảo vệ tự nhiên của làn da, giúp đem lại làn da mềm mại, mịn màng.', CAST(N'2023-04-19T10:52:02.227' AS DateTime), 12, N'<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu&nbsp;</strong></h3>
<p>Cetaphil được biết đến l&agrave; một thương hiệu nổi tiếng tại Canada được th&agrave;nh lập từ năm 1947. Nhắc đến thương hiệu n&agrave;y mọi người sẽ nghĩ ngay đến &nbsp;c&aacute;c sản phẩm đ&igrave;nh đ&aacute;m như: kem dưỡng ẩm&nbsp;hay sữa rửa mặt Cetaphil. Đ&acirc;y l&agrave; thương hiệu được l&agrave;m từ c&aacute;c th&agrave;nh phần vừa an to&agrave;n, l&agrave;nh t&iacute;nh cho da v&agrave; ph&ugrave; hợp với những l&agrave;n da nhạy cảm.<br><img class="lazy initial loaded" src="https://cdn.tgdd.vn/Products/Images//6562/130986/bhx/files/kem-duong-am-galderma-moisturizing-cream-50g-202202151102426487.jpg" alt="Kem dưỡng Cetaphil Moisturizing Cream dưỡng ẩm 50g 0" data-src="//cdn.tgdd.vn/Products/Images//6562/130986/bhx/files/kem-duong-am-galderma-moisturizing-cream-50g-202202151102426487.jpg" data-was-processed="true"></p>
<h3><strong>Ưu điểm của sản phẩm</strong></h3>
<p>Kem dưỡng ẩm Cetaphil c&oacute; một số ưu điểm nổi bật như:</p>
<ul>
<li>
<p>Th&agrave;nh phần an to&agrave;n v&agrave; l&agrave;nh t&iacute;nh</p>
</li>
<li>
<p>Ph&ugrave; hợp với nhiều loại da</p>
</li>
<li>
<p>Kết cấu kem mỏng nhẹ</p>
</li>
<li>
<p>Tạo lớp bảo vệ cho da</p>
</li>
<li>
<p>Cung cấp độ ẩm gi&uacute;p da mềm mại</p>
</li>
<li>
<p>Bổ sung vitamin E gi&uacute;p da s&aacute;ng mịn</p>
</li>
</ul>
<h3><strong>Đối tượng sử dụng</strong></h3>
<p>Kem dưỡng ẩm l&agrave; sản phẩm cần thiết cho da, với sản phẩm n&agrave;y sẽ đặc biệt ph&ugrave; hợp với c&aacute;c loại da thường v&agrave; da kh&ocirc; với th&agrave;nh phần cung cấp nhiều độ ẩm gi&uacute;p da mềm mượt v&agrave; mịn m&agrave;ng.</p>
<h3><strong>Hướng dẫn sử dụng</strong></h3>
<p>Th&ocirc;ng thường trong chu tr&igrave;nh dưỡng da, kem dưỡng sẽ l&agrave; bước gần cuối để gi&uacute;p giữ chặt c&aacute;c lớp dưỡng trước đ&oacute; v&agrave; gi&uacute;p da ẩm mượt. Sau khi đ&atilde; sử dụng tẩy trang, sữa rửa mặt, nước hoa hồng, serum bạn sẽ sử dụng kem dưỡng.&nbsp;<br><img class="lazy initial loaded" src="https://cdn.tgdd.vn/Products/Images//6562/130986/bhx/files/kem-duong-am-cetaphil-moisturizing-cream-50g-202105071016525575.jpg" alt="Kem dưỡng Cetaphil Moisturizing Cream dưỡng ẩm 50g 1" data-src="//cdn.tgdd.vn/Products/Images//6562/130986/bhx/files/kem-duong-am-cetaphil-moisturizing-cream-50g-202105071016525575.jpg" data-was-processed="true"><br>Lấy một lượng kem vừa đủ ra tay, chấm đều c&aacute;c điểm tr&ecirc;n gương mặt, d&ugrave;ng tay t&aacute;n đều v&agrave; vỗ nhẹ để lớp kem nhanh ch&oacute;ng thẩm thấu. Kết hợp m&aacute;t xa để gi&uacute;p da tươi trẻ hơn.<br>Ch&uacute; &yacute; sử dụng kem dưỡng trước khi d&ugrave;ng kem chống nắng cho buổi s&aacute;ng v&agrave; kem mắt v&agrave; mặt nạ ngủ cho buổi tối.</p>
<h3><strong>C&aacute;ch bảo quản v&agrave; lưu &yacute; khi sử dụng kem dưỡng ẩm Cetaphil Moisturizing Cream 50g</strong></h3>
<p>Bạn chỉ cần bảo quản sản phẩm ở nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh nhiệt độ cao hoặc &aacute;nh nắng trực tiếp. Khi lấy đủ lượng kem cần d&ugrave;ng n&ecirc;n đ&oacute;ng k&iacute;n nắp để tr&aacute;nh bụi bẩn rơi v&agrave;o l&agrave;m ảnh hưởng đến chất lượng sản phẩm.<br>Ch&uacute; &yacute;: Kh&ocirc;ng sử dụng khi sản phẩm hết hạn d&ugrave;ng, sản phẩm c&oacute; dấu hiệu hỏng hay kết cấu lạ. Nếu c&oacute; bất kỳ k&iacute;ch ứng n&agrave;o, ngưng sử dụng v&agrave; hỏi &yacute; kiến b&aacute;c sĩ da liễu.</p>', N'nguyenhieu', N'1 sản phẩm/tuýp', 1, 160000, 30, N'Cetaphil - Canada')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1904231057', N'Kem dưỡng da Rebirth Placenta dưỡng trắng và giảm nếp nhăn 100ml', N'/Assets/img/HDD1904231057.jpg', N'Kem dưỡng da Rebirth là sự lựa chọn tuyệt vời cho làn da của bạn. Kem dưỡng da Rebirth Placenta dưỡng trắng và giảm nếp nhăn 100ml chứa các dưỡng chất giúp trắng da, mờ vết thâm, tàn nhang hiệu quả. Kem dưỡng da được nhập khẩu tại Úc, với thành phần an toàn cho người sử dụng.', CAST(N'2023-04-19T10:57:10.917' AS DateTime), 12, NULL, N'nguyenhieu', N'1 sản phẩm / hộp', 1, 139000, 30, N'Rebirth - Australia')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1904231059', N'Sữa rửa mặt tạo bọt sáng da Garnier Skin Natural Light 100ml', N'/Assets/img/HDD1904231059.jpg', N'Sữa rửa mặt Garnier an toàn lành tính được nhà nhà lựa chọn tin dùng. Sữa rửa mặt tạo bọt sáng da Garnier Skin Natural Light 100ml giúp làm sạch sâu bụi bẩn, bã nhờn một cách hiệu quả nhất. Sữa rửa mặt với thành phần an toàn lành tính nên bạn hoàn toàn có thể yên tâm sử dụng.', CAST(N'2023-04-19T10:59:26.127' AS DateTime), 11, N'<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu Garnier</strong></h3>
<p>Garnier l&agrave; thương hiệu mỹ phẩm nổi tiếng c&oacute; xuất xứ tại Ph&aacute;p, th&agrave;nh lập năm&nbsp;1914 v&agrave; sau đ&oacute; được mua lại bởi tập đo&agrave;n L''Oreal v&agrave;o năm 1980. Garnier chuy&ecirc;n cung cấp c&aacute;c sản phẩm như sữa rửa mặt, kem dưỡng da, kem chống nắng,...với chất lượng cao c&ugrave;ng mức gi&aacute; tốt n&ecirc;n rất được ưa chuộng tr&ecirc;n thị trường.<img class="lazy initial loaded" src="https://cdn.tgdd.vn/Products/Images/2504/279797/bhx/sua-rua-mat-tao-bot-sang-da-garnier-skin-natural-light-100ml-202205170842501692.jpg" alt="Sữa rửa mặt tạo bọt s&aacute;ng da Garnier Skin Natural Light 100ml 0" data-src="https://cdn.tgdd.vn/Products/Images/2504/279797/bhx/sua-rua-mat-tao-bot-sang-da-garnier-skin-natural-light-100ml-202205170842501692.jpg" data-was-processed="true"></p>
<h3><strong>Ưu điểm của sản phẩm</strong></h3>
<p>Kh&ocirc;ng những c&oacute; hiệu quả l&agrave;m sạch bụi bẩn v&agrave; vi khuẩn tr&ecirc;n da hiệu quả, m&agrave; sữa rửa mặt Garnier c&ograve;n c&oacute; nhiều ưu điểm như:</p>
<ul>
<li>
<p>Bổ sung Vitamin C v&agrave; tinh chất quả Yuzu gi&uacute;p l&agrave;m sạch s&acirc;u v&agrave; dưỡng s&aacute;ng l&agrave;n da, khiến da trắng đều m&agrave;u hơn.</p>
</li>
<li>
<p>C&ocirc;ng thức kh&ocirc;ng chứa cồn, kh&ocirc;ng g&acirc;y k&iacute;ch ứng,&nbsp;kh&ocirc;ng l&agrave;m kh&ocirc; da.</p>
</li>
<li>
<p>Cấu tr&uacute;c bọt si&ecirc;u mịn, len lỏi tận s&acirc;u trong lỗ ch&acirc;n l&ocirc;ng, mang đến l&agrave;n da sạch bụi bẩn v&agrave; b&atilde; nhờn.</p>
</li>
</ul>
<h3><strong>Đối tượng sử dụng</strong></h3>
<p>Sữa rửa mặt Garnier th&iacute;ch hợp sử dụng với mọi l&agrave;n da, đặc biệt l&agrave; những l&agrave;n da sạm, kh&ocirc;ng đều m&agrave;u, da bị th&acirc;m do mụn.</p>
<h3><strong>Hướng dẫn sử dụng</strong></h3>
<p>Rửa sạch tay v&agrave; l&agrave;m ướt mặt với nước sạch, sau đ&oacute; cho một lượng vừa đủ sữa rửa mặt ra tay để tạo bọt c&ugrave;ng với nước, m&aacute;t-xa bọt l&ecirc;n da mặt theo chuyển động tr&ograve;n&nbsp;v&agrave; rửa sạch lại với nước.<img class="lazy initial loaded" src="https://cdn.tgdd.vn/Products/Images/2504/279797/bhx/sua-rua-mat-tao-bot-sang-da-garnier-skin-natural-light-100ml-202205170842515128.jpg" alt="Sữa rửa mặt tạo bọt s&aacute;ng da Garnier Skin Natural Light 100ml 1" data-src="https://cdn.tgdd.vn/Products/Images/2504/279797/bhx/sua-rua-mat-tao-bot-sang-da-garnier-skin-natural-light-100ml-202205170842515128.jpg" data-was-processed="true"></p>
<h3><strong>C&aacute;ch bảo quản v&agrave; lưu &yacute; khi sử dụng sữa rửa mặt tạo bọt s&aacute;ng da Garnier Skin Natural Light 100ml</strong></h3>
<ul>
<li>
<p>Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp của mặt trời.</p>
</li>
<li>
<p>Nếu sản phẩm d&iacute;nh v&agrave;o mắt, rửa lại ngay với nước sạch.</p>
</li>
<li>
<p>Ngưng&nbsp;sử dụng nếu bị dị ứng với bất k&igrave; th&agrave;nh phần n&agrave;o của sản phẩm.</p>
</li>
</ul>', N'nguyenhieu', N'1 sản phẩm / hộp', 1, 99000, 0, N'Garnier')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1904231101', N'Kem rửa mặt tút trắng Oxy White Complete 100g', N'/Assets/img/HDD1904231101.jpg', N'Là dòng sữa rửa mặt đến từ Oxy của Nhật Bản được nhiều người sử dụng. Kem rửa mặt tút trắng Oxy White Complete 100g khoáng chất từ biển chết cuốn trôi bã nhờn - bụi bẩn - lớp sừng già, tút da sáng khoẻ, tạo tế bào mới, trẻ hoá làn da', CAST(N'2023-04-19T11:01:21.107' AS DateTime), 11, N'<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu</strong></h3>
<p>Oxy l&agrave; thương hiệu sở hữu c&aacute;c d&ograve;ng mỹ phẩm chăm s&oacute;c da d&agrave;nh cho nam giới, thuộc tập đo&agrave;n Rohto&nbsp;Mentholatum được th&agrave;nh lập năm 1989 tại Osaka - Nhật Bản. C&oacute; nhiều năm kinh nghiệm trong việc sản xuất c&aacute;c sản phẩm chăm s&oacute;c da, v&igrave; thế c&aacute;c sản phẩm của Oxy lu&ocirc;n đ&aacute;p ứng được những nhu cầu chăm s&oacute;c da kh&aacute;c nhau của kh&aacute;ch h&agrave;ng.</p>
<h3><strong>Ưu điểm của sản phẩm</strong></h3>
<ul>
<li>
<p>Đất s&eacute;t trắng gi&agrave;u kho&aacute;ng chất, gi&uacute;p rửa sạch b&atilde; nhờn, bụi bẩn, s&acirc;u b&ecirc;n trong lỗ ch&acirc;n l&ocirc;ng.</p>
</li>
<li>
<p>Rửa sạch b&atilde; nhờn cũng như lớp sừng da tr&ecirc;n da.</p>
</li>
<li>
<p>Vitamin B3 c&ugrave;ng Hyaluronic Acid gi&uacute;p c&acirc;n bằng độ ẩm, l&agrave;m mờ c&aacute;c vết th&acirc;m mụn v&agrave; gi&uacute;p thu nhỏ lỗ ch&acirc;n l&ocirc;ng.</p>
</li>
<li>
<p>Sản phẩm c&ograve;n chứa AHA v&agrave; BHA gi&uacute;p t&aacute;i tạo&nbsp;tế b&agrave;o mới, trẻ h&oacute;a da.</p>
</li>
</ul>
<p><img class="lazy initial loaded" src="https://cdn.tgdd.vn/Products/Images/2504/81944/bhx/kem-rua-mat-tut-trang-oxy-white-complete-100g-202105030837312058.jpg" data-src="https://cdn.tgdd.vn/Products/Images/2504/81944/bhx/kem-rua-mat-tut-trang-oxy-white-complete-100g-202105030837312058.jpg" data-was-processed="true"></p>
<h3><strong>Đối tượng sử dụng</strong></h3>
<p>Sản phẩm th&iacute;ch hợp d&ugrave;ng cho da thường, th&ocirc; r&aacute;p v&agrave; sạm.</p>
<h3><strong>Hướng dẫn sử dụng</strong></h3>
<p>Sau khi l&agrave;m ướt mặt, cho một lượng kem rửa mặt vừa đủ v&agrave;o l&ograve;ng b&agrave;n tay để tạo bọt rồi thoa đều, nhẹ nh&agrave;ng l&ecirc;n da, rồi rửa sạch lại với nước.</p>
<h3><strong>C&aacute;ch bảo quản v&agrave; lưu &yacute; khi sử dụng kem rửa mặt t&uacute;t trắng Oxy White Complete 100g</strong></h3>
<p>Như c&aacute;c d&ograve;ng sữa rửa mặt kh&aacute;c, n&ecirc;n bảo quản ở nơi tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp chiếu v&agrave;o sản phẩm. Kh&ocirc;ng để sản phẩm tiếp x&uacute;c v&agrave;o mắt.<br><img class="lazy initial loaded" src="https://cdn.tgdd.vn/Products/Images//2504/81944/bhx/files/image.png" data-src="//cdn.tgdd.vn/Products/Images//2504/81944/bhx/files/image.png" data-was-processed="true"><br>&gt;&gt;&gt; Sữa rửa mặt OXY c&oacute; rất nhiều loại, đ&aacute;p ứng mọi nhu cầu chăm s&oacute;c da của người kh&aacute;ch h&agrave;ng như l&agrave;m sạch, tẩy tế b&agrave;o chết, ngăn ngừa mụn,... Để c&oacute; thể lựa chọn loại sữa rửa mặt ph&ugrave; hợp, bạn h&atilde;y t&igrave;m hiểu th&ecirc;m b&agrave;i viết sau nh&eacute;:&nbsp;<a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cac-loai-sua-rua-mat-oxy-loai-nao-duoc-nam-gioi-yeu-thich-nhat-1181078" target="_blank" rel="noopener">c&aacute;c loại sữa rửa mặt OXY, loại n&agrave;o được nam giới y&ecirc;u th&iacute;ch nhất</a>.</p>', N'nguyenhieu', N'1 sản phẩm / hộp', 1, 62000, 19, N' Oxy ')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1904231102', N'Sữa rửa mặt Hazeline nghệ hoa cúc 100g', N'/Assets/img/HDD1904231102.jpg', N'Sữa rửa mặt Hazeline an toàn chất lượng là sự lựa chọn tuyệt vời dành cho làn da của bạn. Sữa rửa mặt Hazeline nghệ hoa cúc 100g giúp làm sạch bụi bẩn và bã nhờn một cách hiệu quả nhất. Sữa rửa mặt với thành phần thành an toàn lành tính nên bạn có thể yên tâm sử dụng.', CAST(N'2023-04-19T11:02:41.897' AS DateTime), 11, NULL, N'nguyenhieu', N'1 sản phẩm / hộp', 1, 54500, 0, N'Hazeline ')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1904231105', N'Sữa rửa mặt Bioré sáng mịn dưỡng ẩm 200g', N'/Assets/img/HDD1904231105.jpg', N'Sữa rửa mặt loại bỏ vết bẩn và bã nhờn trên khuôn mặt. Sữa rửa mặt Bioré sáng mịn dưỡng ẩm 100g lấy sạch bụi bẩn, bã nhờn mà không làm mất đi độ ẩm tự nhiên của da. Bọt cải tiến dạng kem cực mềm mịn nhẹ nhàng chăm sóc da. Sữa rửa mặt Bioré giúp sạch da, tự tin tỏa sáng', CAST(N'2023-04-19T11:05:04.520' AS DateTime), 11, N'<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu Bior&eacute;</strong></h3>
<p>Bior&eacute; l&agrave; thương hiệu mỹ phẩm Nhật Bản thuộc tập đo&agrave;n KAO được th&agrave;nh lập năm 1980. Ng&agrave;y nay người ta nhắc tới Bior&eacute; l&agrave; d&ograve;ng mỹ phẩm chất lượng, uy t&iacute;n to&agrave;n cầu v&agrave; nổi tiếng với c&aacute;c sản phẩm trị mụn, dưỡng da hiệu quả đặc biệt l&agrave; sữa rửa mặt, sữa tắm, lột mụn,...ngo&agrave;i ra c&ograve;n c&oacute; tẩy trang, kem chống nắng, kem dưỡng da,...cũng rất được nhiều người tin d&ugrave;ng. Qua hơn 140 ph&aacute;t triển Bior&eacute; đ&atilde; chiếm được cảm t&igrave;nh của người d&ugrave;ng ở khắp c&aacute;c nơi tr&ecirc;n thế giới.</p>
<div><img class="lazy initial loaded" src="https://cdn.tgdd.vn/Products/Images//2504/81302/bhx/files/biore.jpg" alt="Sữa rửa mặt Bior&eacute; s&aacute;ng mịn dưỡng ẩm 100g 0" data-src="//cdn.tgdd.vn/Products/Images//2504/81302/bhx/files/biore.jpg" data-was-processed="true"></div>
<h3><strong>Ưu điểm của sản phẩm sữa rửa mặt Bior&eacute; s&aacute;ng mịn dưỡng ẩm 100g</strong></h3>
<ul>
<li>
<p>C&ocirc;ng nghệ đột ph&aacute; từ Nhật Bản gi&uacute;p l&agrave;m sạch bụi bẩn v&agrave; loại bỏ b&atilde; nhờn tr&ecirc;n da</p>
</li>
<li>
<p>Vẫn giữ được độ ẩm tự nhi&ecirc;n tr&ecirc;n da</p>
</li>
<li>
<p>Bọt kem mềm mịn cho cảm gi&aacute;c dễ chịu tr&ecirc;n da</p>
</li>
<li>
<p>Chứa đất s&eacute;t v&agrave; c&aacute;c hạt si&ecirc;u mịn c&agrave;ng l&agrave;m tăng hiệu quả l&agrave;m sạch b&atilde; nhờn</p>
</li>
<li>
<p>Chứa serum dưỡng da gi&uacute;p da bạn s&aacute;ng mịn v&agrave; ẩm mượt</p>
</li>
</ul>
<h3><strong>Đối tượng sử dụng sữa rửa mặt Bior&eacute; s&aacute;ng mịn dưỡng ẩm 100g</strong></h3>
<ul>
<li>
<p>Sản phẩm ph&ugrave; hợp với mọi loại da, đặc biệt l&agrave; da kh&ocirc; cần được cấp ẩm thường xuy&ecirc;n</p>
</li>
<li>
<p>Kh&ocirc;ng d&ugrave;ng cho người dưới 15 tuổi</p>
</li>
</ul>
<h3><strong><img class="lazy initial loaded" src="https://cdn.tgdd.vn/Products/Images//2504/81302/bhx/files/dsauhdaudhu.jpg" alt="Sữa rửa mặt Bior&eacute; s&aacute;ng mịn dưỡng ẩm 100g 1" data-src="//cdn.tgdd.vn/Products/Images//2504/81302/bhx/files/dsauhdaudhu.jpg" data-was-processed="true"><br>Hướng dẫn sử dụng sữa rửa mặt Bior&eacute; s&aacute;ng mịn dưỡng ẩm 100g</strong></h3>
<ul>
<li>
<p>L&agrave;m ướt da mặt</p>
</li>
<li>
<p>D&ugrave;ng lượng kem vừa đủ cho ra tay sau đ&oacute; thoa l&ecirc;n mặt ướt để tạo bọt</p>
</li>
<li>
<p>Massage nhẹ nh&agrave;ng cho dưỡng chất trong kem được thấm đều hết v&agrave;o da, đặc biệt l&agrave; v&ugrave;ng tr&aacute;n, mũi, cằm (v&ugrave;ng chữ T)</p>
</li>
<li>
<p>Rửa sạch lại với nước, lau kh&ocirc; bằng khăn mềm</p>
</li>
</ul>
<h3><strong>C&aacute;ch bảo quản v&agrave; lưu &yacute; khi sử dụng sữa rửa mặt Bior&eacute; s&aacute;ng mịn dưỡng ẩm 100g</strong></h3>
<p><em><strong>Bảo quản:</strong></em></p>
<ul>
<li>
<p>Đ&oacute;ng chặt nắp sau khi sử dụng</p>
</li>
<li>
<p>N&ecirc;n dựng đứng sản phẩm để kem kh&ocirc;ng bị đổ v&agrave; dễ lấy hơn trong mỗi lần sử dụng</p>
</li>
<li>
<p>Để nơi kh&ocirc; r&aacute;o, tr&aacute;nh nắng, tr&aacute;nh nhiệt độ cao</p>
</li>
</ul>
<p><strong><em>Lưu &yacute;:</em></strong></p>
<ul>
<li>
<p>Kh&ocirc;ng n&ecirc;n d&ugrave;ng qu&aacute; nhiều lần trong ng&agrave;y, tốt nhất n&ecirc;n d&ugrave;ng 2 ng&agrave;y mỗi lần v&agrave;o buổi s&aacute;ng v&agrave; tối</p>
</li>
<li>
<p>Dừng sử dụng khi gặp c&aacute;c vấn đề như dị ứng, ngứa da,...nhất l&agrave; người dễ bị mẫn cảm, đang gặp c&aacute;c vấn đề về da liễu</p>
</li>
</ul>
<p><br>Biore l&agrave; một thương hiệu lớn với nhiều năm kinh nghiệm trong lĩnh vực chăm s&oacute;c sắc đẹp, v&igrave; thế h&atilde;ng đ&atilde; cho ra đời nhiều d&ograve;ng sản phẩm d&agrave;nh cho c&aacute;c vấn đề da kh&aacute;c nhau.&nbsp;<a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/tim-hieu-cac-dong-sua-rua-mat-biore-loai-nao-tot-nhat-cho-lan-da-cua-ban-1201264" target="_blank" rel="noopener">T&igrave;m hiểu c&aacute;c d&ograve;ng sữa rửa mặt Biore, loại n&agrave;o tốt nhất cho l&agrave;n da của bạn?</a>, sau b&agrave;i viết n&agrave;y, hy vọng bạn sẽ t&igrave;m được một sản phẩm l&agrave;m sạch da ưng &yacute; nhất nh&eacute;.</p>', N'nguyenhieu', N'1 sản phẩm / hộp', 1, 51500, 0, N'Bioré')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1904231109', N'Máy giặt lồng ngang LG Inverter 9kg', N'/Assets/img/HDD1904231109.jpg', N'Loại máy giặt: Cửa ngang
Lồng giặt: Lồng ngang
Khối lượng giặt: 9 Kg
Số người sử dụng: Từ 3 - 5 người
Inverter: Có Inverter
Kiểu động cơ: Truyền động trực tiếp bền & êm
Công nghệ giặt: Giặt 6 chuyển động', CAST(N'2023-04-19T11:09:51.570' AS DateTime), 17, N'<p>Tiện &iacute;ch: Chẩn đo&aacute;n lỗi Smart Diagnosis</p>
<p>Hẹn giờ giặt Kh&oacute;a trẻ em</p>
<p>Hệ thống lọc xơ vải tự động</p>
<p>Hiệu suất sử dụng điện: 26 Wh/ kg</p>
<p>Tốc độ quay vắt tối đa: 1200 v&ograve;ng/ph&uacute;t</p>
<p>Chất liệu lồng giặt: Th&eacute;p kh&ocirc;ng gỉ Chất liệu vỏ m&aacute;y:</p>
<p>Th&eacute;p cao cấp Chất liệu nắp m&aacute;y: K&iacute;nh chịu lực</p>
<p>Bảng điều khiển: Song ngữ Anh - Việt, c&oacute; n&uacute;t xoay, m&agrave;n h&igrave;nh hiển thị</p>
<p>K&iacute;ch thước: Cao 85 cm - Ngang 60 cm - S&acirc;u 58.5 cm</p>
<p>Sản xuất tại: Việt Nam</p>
<p>Thời gian bảo h&agrave;nh động cơ: 10 năm D&ograve;ng sản phẩm: 2019</p>
<p>Th&ocirc;ng tin bảo h&agrave;nh</p>
<p>Thời gian bảo h&agrave;nh: 24 th&aacute;ng</p>
<p>Xem chi tiết tại: https://www.lg.com/vn/tro-giup/bao-hanh</p>
<p>***C&ocirc;ng lắp đặt:</p>
<ul>
<li>Miễn ph&iacute; cho nội th&agrave;nh HCM (Quận 1, 2, 3, 4, 5, 6, 7, 8, 10, 11, T&acirc;n B&igrave;nh, T&acirc;n Ph&uacute;, Ph&uacute; Nhuận, B&igrave;nh Thạnh, G&ograve; Vấp, Quận 9, 12, Thủ Đức, B&igrave;nh T&acirc;n, H&oacute;c M&ocirc;n) v&agrave; nội th&agrave;nh H&agrave; Nội (Quận Ba Đ&igrave;nh, Quận Bắc Từ Li&ecirc;m, Quận Cầu Giấy, Quận H&agrave; Đ&ocirc;ng, Quận Hai B&agrave; Trưng, Quận Ho&agrave;n Kiếm, Quận Ho&agrave;ng Mai, Quận Long Bi&ecirc;n, Quận Nam Từ Li&ecirc;m, Quận T&acirc;y Hồ, Quận Thanh Xu&acirc;n, Quận Đống Đa)</li>
<li>Chi ph&iacute; vật tư: Nh&acirc;n vi&ecirc;n sẽ th&ocirc;ng b&aacute;o ph&iacute; vật tư (ống đồng, d&acirc;y điện v.v...) khi khảo s&aacute;t lắp đặt (Bảng k&ecirc; xem tại ảnh 2). Kh&aacute;ch h&agrave;ng sẽ thanh to&aacute;n trực tiếp cho nh&acirc;n vi&ecirc;n kỹ thuật sau khi việc lắp đặt ho&agrave;n th&agrave;nh - chi ph&iacute; n&agrave;y sẽ kh&ocirc;ng ho&agrave;n lại trong bất cứ trường hợp n&agrave;o.</li>
<li>Qu&yacute; kh&aacute;ch h&agrave;ng c&oacute; thể tr&igrave; ho&atilde;n việc lắp đặt tối đa l&agrave; 7 ng&agrave;y lịch kể từ ng&agrave;y giao h&agrave;ng th&agrave;nh c&ocirc;ng (kh&ocirc;ng t&iacute;nh ng&agrave;y Lễ). Nếu nh&acirc;n vi&ecirc;n hỗ trợ kh&ocirc;ng thể li&ecirc;n hệ được với Kh&aacute;ch h&agrave;ng qu&aacute; 3 lần, hoặc Kh&aacute;ch h&agrave;ng tr&igrave; ho&atilde;n việc lắp đặt qu&aacute; thời hạn tr&ecirc;n, Dịch vụ lắp đặt sẽ được hủy bỏ. - Đơn vị vận chuyển giao h&agrave;ng cho bạn KH&Ocirc;NG c&oacute; nghiệp vụ lắp đặt sản phẩm.</li>
<li>Thời gian bộ phận lắp đặt li&ecirc;n hệ (kh&ocirc;ng bao gồm thời gian lắp đặt): trong v&ograve;ng 24h kể từ khi nhận h&agrave;ng (Trừ Chủ nhật/ Ng&agrave;y Lễ). Trong trường hợp bạn chưa được li&ecirc;n hệ sau thời gian n&agrave;y, vui l&ograve;ng gọi l&ecirc;n hotline của Shopee (19001221) để được tư vấn.</li>
</ul>', N'tamnguyen1766', N'1', 1, 11390000, 46, N'LG')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1904231113', N'Máy Giặt Cửa Trước Panasonic 9 Kg NA-V90FC1LVT - Diệt khuẩn 99.99% (Xám)', N'/Assets/img/HDD1904231113.jpg', N'Máy Giặt Cửa Trước Panasonic 9 Kg NA-V90FC1LVT với thiết kế tối giản, thanh lịch tôn lên không gian sống của bạn. Thân máy thanh lịch có thiết kế tối giản với những đường thẳng và tròn đơn giản. ECONAVI phát hiện các điều kiện giặt bằng ba cảm biến, Cảm biến khối lượng đồ giặt, Cảm biến nhiệt độ nước và Cảm biến chất liệu đồ giặt. Công nghệ này giúp giảm mức tiêu thụ năng lượng đến 71%, mức tiêu thụ nước 41% và thời gian giặt 40%. Động cơ inverter cũng giảm thiểu tình trạng thất thoát năng lượng với khả năng điều chỉnh công suất linh hoạt', CAST(N'2023-04-19T11:13:40.650' AS DateTime), 17, N'<p class="irIKAp">TH&Ocirc;NG TIN SẢN PHẨM</p>
<p class="irIKAp">Đặc điểm nổi bật</p>
<p class="irIKAp">- C&ocirc;ng nghệ Blue Ag+ loại bỏ 99,99%*1 vi khuẩn v&agrave; c&oacute; sức mạnh kh&aacute;ng khuẩn vượt trội th&ocirc;ng qua tia UV v&agrave; ion bạc trong c&aacute;c chu kỳ giặt th&ocirc;ng thường</p>
<p class="irIKAp">- C&ocirc;ng nghệ StainMaster+ gi&uacute;p bảo vệ b&eacute; khỏi dị ứng. Giặt nước n&oacute;ng dễ d&agrave;ng đ&aacute;nh bay c&aacute;c vết bẩn cứng đầu, vi khuẩn, mạt bụi v&agrave; c&aacute;c t&aacute;c nh&acirc;n g&acirc;y dị ứng ở nhiệt độ cao (l&ecirc;n đến 90&ordm;C)</p>
<p class="irIKAp">- Hệ thống ActiveFoam tạo bọt si&ecirc;u mịn, đậm đặc len lỏi s&acirc;u v&agrave;o từng sợi vải, loại bỏ ho&agrave;n to&agrave;n bụi bẩn v&agrave; đảm bảo mang đến kết quả giặt sạch hơn</p>
<p class="irIKAp">- Vệ sinh lồng giặt tự động Auto Tub Care sẽ tự động vệ sinh lồng giặt sau mỗi lần giặt, ngăn ngừa t&iacute;ch tụ cặn bột giặt dư thừa ch&iacute;nh l&agrave; nguy&ecirc;n nh&acirc;n g&acirc;y ra nấm mốc đen v&agrave; m&ugrave;i h&ocirc;i</p>
<p class="irIKAp">- Chế độ Active Speed Wash đem lại hiệu suất giặt tối ưu chỉ trong 38 ph&uacute;t bằng khả năng tạo bọt mịn, đậm đặc. Tiết kiệm thời gian gi&uacute;p bạn thoải m&aacute;i tận hưởng cuộc sống</p>
<p class="irIKAp">Th&ocirc;ng số kỹ thuật</p>
<p class="irIKAp">Loại m&aacute;y giặt: Cửa trước</p>
<p class="irIKAp">Lồng giặt: Lồng ngang</p>
<p class="irIKAp">Khối lượng giặt - (sấy): 9Kg</p>
<p class="irIKAp">Tốc độ quay vắt: 1400 v&ograve;ng/ph&uacute;t</p>
<p class="irIKAp">Lượng nước ti&ecirc;u thụ chuẩn: 83 L&iacute;t</p>
<p class="irIKAp">C&ocirc;ng nghệ Inverter: C&oacute;</p>
<p class="irIKAp">Trọng lượng: 69 kg</p>
<p class="irIKAp">Điện &aacute;p / Tần số: 220 - 240 V / 50 Hz</p>
<p class="irIKAp">K&iacute;ch thước: 596 mm x 585 x 845</p>
<p class="irIKAp">Nơi sản xuất: Việt Nam</p>
<p class="irIKAp">Năm ra mắt: 2022</p>
<p class="irIKAp">Thời gian bảo h&agrave;nh m&aacute;y: 2 năm</p>
<p class="irIKAp">Thời gian bảo h&agrave;nh động cơ: 12 năm</p>
<p class="irIKAp">K&egrave;m theo m&aacute;y c&oacute;: S&aacute;ch hướng dẫn sử dụng, Phiếu bảo h&agrave;nh, Ống tho&aacute;t nước</p>
<p class="irIKAp">TH&Ocirc;NG TIN LẮP ĐẶT</p>
<p class="irIKAp">- Ph&iacute; vận chuyển đến tầng trệt: Miễn ph&iacute; (Nếu kh&aacute;ch h&agrave;ng cần b&ecirc; l&ecirc;n tầng lầu v&agrave; kh&ocirc;ng c&oacute; thang m&aacute;y th&igrave; sẽ c&oacute; ph&aacute;t sinh th&ecirc;m ph&iacute; b&ecirc; l&ecirc;n tầng l&acirc;u, chi tiết vui l&ograve;ng li&ecirc;n hệ qua phần Chatbox</p>
<p class="irIKAp">- Chi ph&iacute; lắp đặt:</p>
<p class="irIKAp">+ C&ocirc;ng lắp: Miễn ph&iacute;</p>
<p class="irIKAp">+ Chi ph&iacute; vật tư (Kh&ocirc;ng bao gồm trong c&ocirc;ng lắp đặt): Nh&acirc;n vi&ecirc;n sẽ th&ocirc;ng b&aacute;o ph&iacute; vật tư (ống đồng, d&acirc;y điện v.v...) khi khảo s&aacute;t lắp đặt (B&aacute;o gi&aacute; chi tiết vui l&ograve;ng li&ecirc;n hệ qua phần Chat). Kh&aacute;ch h&agrave;ng sẽ thanh to&aacute;n trực tiếp cho nh&acirc;n vi&ecirc;n kỹ thuật sau khi việc lắp đặt ho&agrave;n th&agrave;nh.</p>
<p class="irIKAp">- Đơn vị vận chuyển giao h&agrave;ng KH&Ocirc;NG c&oacute; nghiệp vụ lắp đặt sản phẩm.</p>
<p class="irIKAp">- Thời gian bộ phận lắp đặt li&ecirc;n hệ (kh&ocirc;ng bao gồm thời gian lắp đặt): Trong v&ograve;ng 24h kể từ khi nhận h&agrave;ng (Trừ Chủ nhật/ Ng&agrave;y Lễ). Trong trường hợp bạn chưa được li&ecirc;n hệ sau thời gian n&agrave;y, vui l&ograve;ng li&ecirc;n hệ qua phần Chatbox</p>
<p class="irIKAp">- Quy định đổi trả:</p>
<p class="irIKAp">+ Để đảm bảo được hỗ trợ đổi/ trả sản phẩm tốt v&agrave; nhanh gọn nhất trong trường hợp h&agrave;ng giao đến kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn/ thiếu phụ kiện/ nhận sai h&agrave;ng, kh&aacute;ch h&agrave;ng cần QUAY VIDEO QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG</p>
<p class="irIKAp">+ Với c&aacute;c sản phẩm đ&atilde; được cắm điện sử dụng v&agrave;/ hoặc lắp đặt, gặp lỗi kĩ thuật, sản phẩm sẽ được hưởng chế độ bảo h&agrave;nh theo đ&uacute;ng ch&iacute;nh s&aacute;ch của nh&agrave; sản xuất</p>', N'tamnguyen1766', N'1', 1, 17390000, 22, N'Panasonic')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'190423122035', N'iPad mini 6 WiFi 128GB | Chính hãng Apple Việt Nam', N'/Assets/img/HDD190423122035.jpg', N'Với sự thành công của các thế hệ iPad mini trước iPad mini 6 là sản phẩm kế nhiệm mới với nhiều tính năng hiện kèm nhiều sự nâng cấp đáng chú ý dành cho người dùng trong năm nay. Nếu bạn đang có nhu cầu mua cho mình một chiếc máy tính bảng iPad để phục vụ cho nhu cầu sử dụng thì iPad Mini 6 sẽ là sự lựa chọn hoàn hảo cho bạn vào thời điểm này cho nhu cầu sử dụng tablet kích thước vừa phải.', CAST(N'2023-04-19T12:20:35.023' AS DateTime), 4, N'<h3><strong>Thiết kế nhỏ gọn, k&iacute;ch thước m&agrave;n h&igrave;nh 8.</strong><strong>3 inch</strong></h3>
<p>iPad Mini 6 được Apple thiết kế với h&igrave;nh d&aacute;ng nhỏ gọn c&acirc;n đối chiều d&agrave;i v&agrave; ngang gi&uacute;p bạn c&oacute; thể mang theo b&ecirc;n m&igrave;nh mọi l&uacute;c mọi nơi để hỗ trợ cho qu&aacute; tr&igrave;nh học tập, l&agrave;m việc hay giải tr&iacute; một c&aacute;ch dễ d&agrave;ng.</p>
<p><img src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/tablet/iPad/ipad-mini-6-5.jpg" alt="M&aacute;y t&iacute;nh bảng iPad Mini 6 " loading="lazy"></p>
<p>M&aacute;y t&iacute;nh bảng n&agrave;y cũng được Apple trang bị c&aacute;c gam m&agrave;u truyền thống giống như c&aacute;c phi&ecirc;n bản trước gi&uacute;p người d&ugrave;ng dễ d&agrave;ng lựa chọn m&agrave;u sắc ph&ugrave; hợp với độ tuổi v&agrave; c&aacute; t&iacute;nh của bạn. Hơn thế thiết bị c&ograve;n được thiết kế khung kim loại gi&uacute;p cho m&aacute;y t&iacute;nh bảng chắc chắn hơn trong qu&aacute; tr&igrave;nh sử dụng.</p>
<p><img src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/tablet/iPad/ipad-mini-6-6.jpg" alt="Bảo mật Touch ID, dung lượng pin sử dụng nhiều giờ" loading="lazy"></p>
<p>Một trong những thay đổi lớn nhất về ngoại h&igrave;nh của iPad Mini 6 đ&oacute; l&agrave; k&iacute;ch thước m&agrave;n h&igrave;nh sẽ lớn hơn nhiều với những thế hệ trước đ&acirc;y. Cụ thể l&agrave; m&agrave;n h&igrave;nh của iPad Mini 6 c&oacute; k&iacute;ch thước l&ecirc;n đến 8,3 inch hỗ trợ True Tone. M&agrave;n h&igrave;nh rộng n&agrave;y gi&uacute;p người d&ugrave;ng thoải m&aacute;i sử dụng trong thời gian l&acirc;u m&agrave; kh&ocirc;ng lo bị mỏi mắt. C&ugrave;ng với độ ph&acirc;n giải cao sẽ hỗ trợ iPad hiển thị những h&igrave;nh ảnh sắc n&eacute;t v&agrave; tự nhi&ecirc;n nhất đến mắt người d&ugrave;ng khi sử dụng.</p>
<h3><strong>Trang bị chipset A1</strong><strong>5 Bionic,&nbsp;</strong><strong>dung lượng RAM lớn</strong></h3>
<p>T&iacute;nh tới thời điểm hiện đại iPad Mini 6 được xem l&agrave; chiếc iPad Mini cao cấp nhất trong d&ograve;ng Mini n&ecirc;n v&igrave; thế chiếc m&aacute;y t&iacute;nh bảng Mini thế hệ 6 n&agrave;y sẽ sở hữu một cấu h&igrave;nh mạnh mẽ. Cụ thể iPad Mini 6 được trang bị vi xử l&yacute; chipset A15 Bionic c&ugrave;ng với dung lượng RAM gi&uacute;p tốc độ xử l&yacute; diễn ra nhanh ch&oacute;ng v&agrave; mượt m&agrave;.&nbsp;&nbsp;</p>
<p><img src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/tablet/iPad/ipad-mini-6-3.jpg" alt="M&aacute;y t&iacute;nh bảng iPad Mini 6" loading="lazy"></p>
<p>Ngo&agrave;i ra, Apple c&ograve;n trang bị cho iPad Mini 6 bộ nhớ trong 64GB gi&uacute;p bạn c&oacute; thể lưu trữ được nhiều dữ liệu như những khoảnh khắc vui vẻ c&ugrave;ng với gia đ&igrave;nh v&agrave; bạn b&egrave; th&ocirc;ng qua h&igrave;nh ảnh hay video. Bạn cũng c&oacute; thể tải những tựa game nặng để chơi gi&uacute;p lưu trữ được nhiều thứ hơn trong một chiếc iPad nhỏ gọn. &nbsp;</p>
<h3><strong>Bảo mật Touch ID, dung lượng pin sử dụng nhiều giờ</strong></h3>
<p>Về bảo mật, Apple đ&atilde; trang bị tr&ecirc;n chiếc iPad Mini 6 c&ocirc;ng nghệ bảo mật Touch ID ngay tr&ecirc;n n&uacute;t nguồn. C&ocirc;ng nghệ bảo mật sinh trắc học n&agrave;y kh&ocirc;ng chỉ gi&uacute;p mở kh&oacute;a nhanh ch&oacute;ng m&agrave; c&ograve;n n&acirc;ng cao độ bảo mật cho thiết bị c&aacute; nh&acirc;n của bạn.</p>
<p><img src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/tablet/iPad/ipad-mini-6-4.jpg" alt="Bảo mật Touch ID, dung lượng pin sử dụng nhiều giờ" loading="lazy"></p>
<p>Apple đ&atilde; n&acirc;ng cấp cho iPad Mini 6 nhiều t&iacute;nh năng hiện đại, b&ecirc;n cạnh cấu h&igrave;nh mạnh th&igrave; dung lượng pin cũng được n&acirc;ng cao cho thời gian sử dụng d&agrave;i hơn. Cho ph&eacute;p người d&ugrave;ng thoải m&aacute;i sử dụng trong nhiều tiếng đồng hồ m&agrave; kh&ocirc;ng lo hết pin v&agrave; gi&aacute;n đoạn qu&aacute; tr&igrave;nh sử dụng.</p>
<p><img src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/tablet/iPad/ipad-mini-6-8.jpg" alt="Bảo mật Touch ID, dung lượng pin sử dụng nhiều giờ" loading="lazy"></p>
<p>Về khả năng kết nối, iPad Mini 6 hỗ trợ kết nối 5G cho ph&eacute;p truyền &ndash; tải dữ liệu nhanh v&agrave; c&ocirc;ng nghệ wifi 6 mới nhất thời điểm hiện tại.</p>
<h3><strong>Hỗ trợ Apple Pencil 2,&nbsp;</strong><strong>camera&nbsp;</strong><strong>12MP sắc n&eacute;t</strong></h3>
<p>Nếu thế hệ iPad Mini 5 l&agrave; thế hệ nổi bật bởi c&oacute; sự kết hợp với Apple Pencil thế hệ đầu. Th&igrave; đến với thế hệ iPad Mini 6 sẽ tiếp tục được hỗ trợ Apple Pencil 2. Apple Pencil 2 với khả năng gắn từ t&iacute;nh v&agrave; sạc nhanh kh&ocirc;ng d&acirc;y gi&uacute;p người d&ugrave;ng sử dụng một c&aacute;ch tiện lợi. Chiếc b&uacute;t ng&agrave;y người d&ugrave;ng c&oacute; thể thiết kế, vẽ, hay ghi ch&uacute; lại c&ocirc;ng việc tiện lợi. Nh&igrave;n chung cho thấy, iPad Mini 6 với Apple Pencil 2 l&agrave; bộ đ&ocirc;i c&ocirc;ng cụ đắc lực hỗ trợ cho bạn ho&agrave;n th&agrave;nh c&ocirc;ng việc nhanh ch&oacute;ng v&agrave; thoải m&aacute;i khi giải tr&iacute;.</p>
<p><img src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/tablet/iPad/ipad-mini-6-1.jpg" alt="M&aacute;y t&iacute;nh bảng iPad Mini 6 " loading="lazy"></p>
<p>Tuy người d&ugrave;ng kh&ocirc;ng y&ecirc;u cầu cao về camera tr&ecirc;n chiếc m&aacute;y t&iacute;nh bảng nhưng Apple cũng tinh tế trang bị cho iPad Mini 6 camera với độ ph&acirc;n giải 12MP sắc n&eacute;t. Với camera n&agrave;y, người d&ugrave;ng c&oacute; thể tr&ograve; chuyện video với bạn b&egrave; một c&aacute;ch r&otilde; n&eacute;t. Ph&iacute;a trước thiết bị cũng được trang bị một camera 12MP với g&oacute;c nh&igrave;n rộng 122 độ.</p>
<p><img src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/tablet/iPad/ipad-mini-6-7.jpg" alt="Hỗ trợ Apple Pencil 2, camera 12MP sắc n&eacute;t" loading="lazy"></p>', N'hai15042003', N'1', 1, 12830000, 28, N'iphone')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'200423082005450', N'Cải thìa 4KFarm 500gr', N'/Assets/img/HDD200423082005450.jpg', N'Cải thìa 4KFarm gói 500g là sản phẩm rau sạch, với ưu điểm 4 KHÔNG được các chị em nội trợ ưa chuộng và tin dùng như không thuốc trừ sâu, không chất tăng trưởng, không chất bảo quản và không biến đổi gen, mang tới giống rau sạch, rau chất lượng', CAST(N'2023-04-20T20:20:05.450' AS DateTime), 19, N'<div class="short-description">Cải th&igrave;a 4KFarm g&oacute;i 500g l&agrave; sản phẩm rau sạch, với ưu điểm 4 KH&Ocirc;NG được c&aacute;c chị em nội trợ ưa chuộng v&agrave; tin d&ugrave;ng như kh&ocirc;ng thuốc trừ s&acirc;u, kh&ocirc;ng chất tăng trưởng, kh&ocirc;ng chất bảo quản v&agrave; kh&ocirc;ng biến đổi gen, mang tới giống rau sạch, rau chất lượng</div>
<div class="description nospeci hasvideo">
<h2><strong>4KFarm l&agrave;&nbsp;ai?</strong></h2>
<p><strong><a href="https://www.bachhoaxanh.com/rau-4kfarm" target="_blank" rel="noopener">4KFarm</a></strong>&nbsp;l&agrave; TH&Agrave;NH VI&Ecirc;N MỚI của tập đo&agrave;n Thế Giới Di Động, tiền th&acirc;n l&agrave; Vifarm. Đội ngũ chuy&ecirc;n gia về n&ocirc;ng nghiệp của 4KFarm chuyển giao c&ocirc;ng nghệ v&agrave; hỗ trợ n&ocirc;ng d&acirc;n trồng rau an to&agrave;n 4 KH&Ocirc;NG v&agrave; thu mua 100% sản lượng rau an to&agrave;n n&agrave;y cung cấp độc quyền cho chuỗi B&aacute;ch H&oacute;a Xanh.<br><strong><a href="https://www.bachhoaxanh.com/rau-4kfarm/rau-cai-thia-4kfarm-goi-500g" target="_blank" rel="noopener">Cải th&igrave;a&nbsp;4KFarm</a></strong>&nbsp;(hay cải bẹ trắng) c&ograve;n c&oacute; t&ecirc;n l&agrave; bạch giới tử&nbsp;thuộc&nbsp;họ cải&nbsp;c&ugrave;ng họ với cải thảo, cải bẹ xanh. Đ&acirc;y l&agrave; loại&nbsp;<a title="Rau sạch b&aacute;n tại B&aacute;ch H&oacute;a XANH" href="https://www.bachhoaxanh.com/rau-sach" target="_blank" rel="noopener">rau</a>&nbsp;<strong>chứa nhiều th&agrave;nh phần dinh dưỡng</strong>&nbsp;dễ chế biến, ăn ngon miệng. Đặc biệt,&nbsp;<a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/loi-ich-cua-cai-thia-doi-voi-suc-khoe-1266662" target="_blank" rel="noopener">rau cải th&igrave;a cũng mang đến nhiều<strong>&nbsp;</strong>lợi cho sức khỏe</a>&nbsp;như&nbsp;ph&ograve;ng ngừa bệnh đục nh&acirc;n mắt,&nbsp;ngăn ngừa ung thư,...</p>
</div>', N'hai15042003', N'99', 1, 38500, 34, N'Fram')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'200423082233654', N'Rau dền 4KFram 500gr', N'/Assets/img/HDD200423082233654.jpg', N'Rau an toàn 4KFarm với tiêu chí 4 KHÔNG, luôn ưu tiên bảo vệ sức khỏe người tiêu dùng. Vị ngọt mát, thành phần dinh dưỡng cao đặc biệt là hàm lượng sắt dồi dào, Rau Dền 4KFarm sẽ là món canh bổ dưỡng hỗ trợ điều trị nhiều loại bệnh như táo bón, tiểu đường, thiếu máu...', CAST(N'2023-04-20T20:22:33.653' AS DateTime), 19, N'<div class="short-description">Rau an to&agrave;n 4KFarm với ti&ecirc;u ch&iacute; 4 KH&Ocirc;NG, lu&ocirc;n ưu ti&ecirc;n bảo vệ sức khỏe người ti&ecirc;u d&ugrave;ng. Vị ngọt m&aacute;t, th&agrave;nh phần dinh dưỡng cao đặc biệt l&agrave; h&agrave;m lượng sắt dồi d&agrave;o,&nbsp;Rau Dền 4KFarm sẽ l&agrave; m&oacute;n canh bổ dưỡng hỗ trợ điều trị nhiều loại bệnh như t&aacute;o b&oacute;n, tiểu đường, thiếu m&aacute;u...</div>
<div class="description nospeci hasvideo">
<h2><strong>4KFarm l&agrave;&nbsp;ai?</strong></h2>
<p><strong><a href="https://www.bachhoaxanh.com/rau-4kfarm" target="_blank" rel="noopener">4KFarm</a>&nbsp;</strong>l&agrave; TH&Agrave;NH VI&Ecirc;N MỚI của tập đo&agrave;n Thế Giới Di Động, tiền th&acirc;n l&agrave; Vifarm. Đội ngũ chuy&ecirc;n gia về n&ocirc;ng nghiệp của 4KFarm chuyển giao c&ocirc;ng nghệ v&agrave; hỗ trợ n&ocirc;ng d&acirc;n trồng rau an to&agrave;n 4 KH&Ocirc;NG v&agrave; thu mua 100% sản lượng rau an to&agrave;n n&agrave;y cung cấp độc quyền cho chuỗi B&aacute;ch H&oacute;a Xanh.</p>
<p><strong><a href="https://www.bachhoaxanh.com/rau-4kfarm/rau-den-tuoi-4kfarm-goi-500g" target="_blank" rel="noopener">Rau dền 4KFarm</a></strong>&nbsp;l&agrave; một loại&nbsp;<a title="Rau sạch tại B&aacute;ch H&oacute;a XANH" href="https://www.bachhoaxanh.com/rau-sach" target="_blank" rel="noopener">rau xanh</a>&nbsp;được c&aacute;c b&agrave; nội trợ bổ sung trong thực đơn mỗi ng&agrave;y. Ngo&agrave;i&nbsp;<strong>vị ngọt m&aacute;t v&agrave; th&agrave;nh phần dinh dưỡng cao</strong>,&nbsp;<a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/rau-den-loai-rau-gia-re-ma-loi-ich-khong-ngo-1165573" target="_blank" rel="noopener">rau dền&nbsp;c&ograve;n mang đến nhiều&nbsp;lợi &iacute;ch</a>&nbsp;như: Chống t&aacute;o b&oacute;n, điều trị tăng huyết &aacute;p, tốt cho bệnh nh&acirc;n tiểu đường, ngừa ung thư...</p>
</div>', N'hai15042003', N'1', 0, 15000, 10, N'Fram')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'200423082416700', N'Rau cải trắng 500gr - 600gr', N'/Assets/img/HDD200423082416700.jpg', N'Bắp cải trắng là loại rau được trồng tại Lâm Đồng rất dễ mua và chế biến thành nhiều món ăn đa dạng khác nhau trong bữa cơm hằng ngày. Bắp cải trắng đặc biệt mang đến lợi ích trong việc hỗ trợ phòng chống ung thư, giúp cơ thể khỏe mạnh toàn diện.', CAST(N'2023-04-20T20:24:16.700' AS DateTime), 19, N'<div class="short-description">Bắp cải trắng l&agrave; loại&nbsp;<a href="https://www.bachhoaxanh.com/cu">rau</a>&nbsp;được trồng tại L&acirc;m Đồng rất dễ mua v&agrave; chế biến th&agrave;nh nhiều m&oacute;n ăn đa dạng kh&aacute;c nhau trong bữa cơm hằng ng&agrave;y.&nbsp;<a href="https://www.bachhoaxanh.com/cu/bap-cai-trang-tui-500gr">Bắp cải trắng</a>&nbsp;đặc biệt mang đến lợi &iacute;ch trong việc hỗ trợ ph&ograve;ng chống ung thư, gi&uacute;p cơ thể khỏe mạnh to&agrave;n diện.</div>
<div class="description show-moreinfo">
<h3><img class="lazy initial loaded" src="https://cdn.tgdd.vn/Products/Images//8785/275316/bhx/files/ksp%204.jpg" width="548" height="343" data-src="//cdn.tgdd.vn/Products/Images//8785/275316/bhx/files/ksp%204.jpg" data-was-processed="true"><br><strong>Ưu điểm khi mua bắp cải trắng tại B&aacute;ch ho&aacute; XANH</strong></h3>
<ul>
<li>Bắp cải trắng (bắp s&uacute;) lu&ocirc;n l&agrave; nguy&ecirc;n liệu quen thuộc trong căn bếp của mọi gia đ&igrave;nh Việt.&nbsp;<strong>Bắp cải c&oacute; vị ngọt thanh&nbsp;</strong>đặc trưng v&agrave; độ gi&ograve;n nhất định. Bắp cải trắng tươi ngon, chất lượng, kh&ocirc;ng bị hư, dập.</li>
<li><strong>Bắp cải trắng được trồng tại L&acirc;m Đồng</strong>, đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng.</li>
<li>Đặt giao h&agrave;ng nhanh</li>
</ul>
<h3><img class="lazy initial loaded" src="https://cdn.tgdd.vn/Products/Images/8785/275316/bhx/bap-cai-trang-tui-500gr-1-bap-202205201654554145.jpg" alt="Bắp cải trắng 500g - 600g 1" width="521" height="391" data-src="https://cdn.tgdd.vn/Products/Images/8785/275316/bhx/bap-cai-trang-tui-500gr-1-bap-202205201654554145.jpg" data-was-processed="true"></h3>
<h3><strong>Gi&aacute; trị dinh dưỡng của bắp cải trắng</strong></h3>
<ul>
<li>Bắp cải l&agrave; loại củ gi&agrave;u h&agrave;m lượng vitamin A, C, chất chống ung thư gi&uacute;p gia tăng c&aacute;c tế b&agrave;o hồng cầu, giải độc cơ thể,.. Ngo&agrave;i ra, bắp cải c&ograve;n chứa nhiều chất xơ, c&aacute;c kho&aacute;ng chất kh&aacute;c tốt cho cơ thể.</li>
<li>Trong 100g bắp cải trắng c&oacute; khoảng&nbsp;<strong>24 Kcal.</strong></li>
</ul>
</div>', N'hai15042003', N'1', 1, 17000, 10, N'Tuoi')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'200423122055600', N'Túi Nữ FURLA 1927 Mini Top Handle', N'/Assets/img/HDD200423122055600.jpg', N'• Furla 1927 là một chiếc túi xách mini làm bằng da kết cấu da vân. Túi được tô điểm bằng khóa xoắn đặc biệt với logo Arch bằng kim loại ở mặt trước. Đây là một phụ kiện trang nhã để lưu trữ gọn gàng vật dụng cá nhân của bạn.• 1 ngăn túi mở;1 ngăn nhỏ bên trong có khóa zip• Dây đeo có thể tháo rời• Chiều dài dây đeo: 114 cm• Kích thước: 21 x 16 x 8,5 cm• Chiều dài tay cầm: 8,5 cm• Chất liệu: 100% da', CAST(N'2023-04-20T12:20:55.600' AS DateTime), 15, NULL, N'tamnguyen1766', N'1', 1, 14500000, 13, N'FURLA')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'200423122223897', N'Túi đeo chéo vai JASMIN NOIR bằng da PU buộc khăn choàng thời trang cho nữ', N'/Assets/img/HDD200423122223897.jpg', N'Thời gian giao hàng dự kiến cho sản phẩm này là từ 7-9 ngày', CAST(N'2023-04-20T12:22:23.897' AS DateTime), 15, N'<p class="irIKAp">Thương hiệu: JASMIN NOIR</p>
<p class="irIKAp">Xuất xứ: Trung Quốc đại lục</p>
<p class="irIKAp">Chất liệu l&oacute;t: Polyester</p>
<p class="irIKAp">Ch&acirc;́t li&ecirc;̣u ch&iacute;nh: PU</p>
<p class="irIKAp">K&iacute;ch thước: D&agrave;i 26cm x cao 20cm x d&agrave;y 11cm</p>
<p class="irIKAp">H&igrave;nh dạng: Nắp lật</p>
<p class="irIKAp">Dịp sử dụng: Đa năng</p>
<p class="irIKAp">Thiết kế b&ecirc;n ngo&agrave;i: KH&Ocirc;NG</p>
<p class="irIKAp">Số mẫu: 22BL10076</p>
<p class="irIKAp">C&aacute;ch đ&oacute;ng mở: Kh&oacute;a k&eacute;o</p>
<p class="irIKAp">Trang tr&iacute;: Khăn cho&agrave;ng cổ</p>
<p class="irIKAp">Độ cứng: Mềm</p>
<p class="irIKAp">D&agrave;nh cho: Nữ</p>
<p class="irIKAp">Họa tiết: M&agrave;u trơn</p>
<p class="irIKAp">Thiết kế b&ecirc;n trong: Ngăn t&uacute;i đựng điện thoại</p>
<p class="irIKAp">Thiết kế b&ecirc;n trong: T&uacute;i kh&oacute;a k&eacute;o</p>
<p class="irIKAp">Phong c&aacute;ch: Thời trang</p>', N'tamnguyen1766', N'1', 1, 545000, 50, N' JASMIN NOIR')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'200423122419288', N'Túi xách nữ Aldo HALABERYN', N'/Assets/img/HDD200423122419288.jpg', N'Thương hiệu thời trang ALDO là hãng thời trang Canada chuyên mang đến những thiết kế sang trọng và tinh tế về phụ kiện giầy dép và túi xách. ALDO được phân phối độc quyền tại Việt Nam bởi Công ty cổ phần Nhà Thái từ năm 2009. 

Túi và phụ kiện Aldo không có hộp và túi vải. 

Chính sách bảo hành: chỉ áp dụng đối với GIÀY DÉP NGUYÊN GIÁ trong vòng 07 ngày kể từ ngày khách hàng nhận hàng thành công. Túi xách, phụ kiện và hàng giảm giá không áp dụng chính sách bảo hành. Túi và phụ kiện Aldo không có hộp và túi vải. 

Cần hỗ trợ tư vấn, vui lòng inbox nhân viên CSKH của ALDO.', CAST(N'2023-04-20T12:24:19.287' AS DateTime), 15, NULL, N'tamnguyen1766', N'1', 1, 1800000, 23, N'Aldo ')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'200423123125319', N'Bút Kẻ Mày Phẩy Sợi Chân Mày Focallure Flufmax Tinted Brow Ink Pen 10g', N'/Assets/img/HDD200423123125319.jpg', N'Thương hiệu: FOCALLURE
  Nguồn gốc: Trung Quốc
  Thời hạn sử dụng: 3 năm', CAST(N'2023-04-20T12:31:25.320' AS DateTime), 13, N'<p>Th&agrave;nh phần: NƯỚC, BUTYLENEGLYCOL/ACRYLATES / DIMETHYLAMINOETHYL METHACRYLATECOPOLYMER/ACRYLATES / ETHYLHEXYLACRYLATECOPOLYMER PHENOXYETHANOL/CAPRYLYLGLYCOL/TETRASODIUMEDTA ETHYLHEXYLGLYCERIN/SODIUM HYDROXIDE</p>
<p>C&Ocirc;NG DỤNG:</p>
<ul>
<li>L&agrave;m đều m&agrave;u l&ocirc;ng m&agrave;y.</li>
<li>Tạo d&aacute;ng m&agrave;y ưng &yacute;, l&agrave;m ho&agrave;n thiện lớp trang điểm hơn.</li>
<li>Giữ h&agrave;ng l&ocirc;ng m&agrave;y bền đẹp suốt cả ng&agrave;y d&agrave;i, cho bạn tự tin khi tham gia giao tiếp v&agrave; c&aacute;c hoạt động b&ecirc;n ngo&agrave;i.<br>Hướng dẫn sử dụng:</li>
<li>1. Bắt đầu từ v&ograve;m ch&acirc;n m&agrave;y về ph&iacute;a đu&ocirc;i.</li>
<li>2. Tiếp tục kẻ từ ph&iacute;a trước của ch&acirc;n m&agrave;y về ph&iacute;a v&ograve;m bằng c&aacute;ch sử dụng c&aacute;c n&eacute;t ngắn hướng l&ecirc;n tr&ecirc;n, t&ocirc; những v&ugrave;ng thưa thớt. Bạn c&oacute; thể kết hợp với c&aacute;c sản phẩm trang điểm của ch&uacute;ng t&ocirc;i như phấn phủ, b&uacute;t kẻ mắt v&agrave; gel trang điểm ch&acirc;n m&agrave;y, bảng phấn mắt v&agrave; c&aacute;c sản phẩm trang điểm kh&aacute;c tạo lớp trang điểm quyến rũ hơn.</li>
</ul>', N'tamnguyen1766', N'1', 1, 52000, 44, N'Focallure ')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'200423123324053', N'Kem nền BB FOCALLURE 31g trang điểm khuôn mặt che khuyết điểm tiện lợi', N'/Assets/img/HDD200423123324053.jpg', N'', CAST(N'2023-04-20T12:33:24.053' AS DateTime), 13, N'<p class="irIKAp">Thời gian giao h&agrave;ng dự kiến cho sản phẩm n&agrave;y l&agrave; từ 7-9 ng&agrave;y</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">Kem che khuyết điểm kh&ocirc;ng chứa dầu, l&agrave;m s&aacute;ng m&agrave;u da, dưỡng ẩm, mềm mại v&agrave; nhẹ</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">Kem nền dạng lỏng Focallure 8 m&agrave;u ho&agrave;n hảo</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">Tạo một lớp trang điểm nude tự nhi&ecirc;n</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">Kem che khuyết điểm kh&ocirc;ng chứa dầu - che phủ c&aacute;c khuyết điểm tr&ecirc;n da, gi&uacute;p lỗ ch&acirc;n l&ocirc;ng tr&ecirc;n da v&ocirc; h&igrave;nh</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">L&agrave;m s&aacute;ng m&agrave;u da - bảo vệ da khỏi &aacute;nh nắng</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">Dưỡng ẩm - dưỡng ẩm cao, gi&agrave;u yếu tố giữ ẩm</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">Da s&aacute;ng v&agrave; nhẹ - bột mảnh v&agrave; mịn, hiệu ứng trong suốt</p>
<p class="irIKAp">M&agrave;u n&oacute;ng: 01, 02, 03</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">M&agrave;u da rất trắng: 01</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">M&agrave;u da trắng: 02</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">M&agrave;u da tự nhi&ecirc;n nhưng trắng: 03</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">T&ocirc;ng da v&agrave;ng: 04</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">M&agrave;u da hơi đen hơi v&agrave;ng: 05</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">M&agrave;u da khỏe mạnh: 06, 07, 08</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">Khi kh&ocirc;ng thể chọn được m&atilde; m&agrave;u tương tự, bạn n&ecirc;n chọn m&atilde; m&agrave;u đậm hơn để da c&oacute; kết cấu hơn.</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">* Lưu &yacute; khi lựa chọn m&agrave;u sắc cụ thể từ dịch vụ chăm s&oacute;c kh&aacute;ch h&agrave;ng trực tuyến</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">Lớp trang điểm đa dạng, định h&igrave;nh nhiều kiểu thời trang</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">Kết cấu: C&ocirc;ng thức dưỡng ẩm l&agrave;m mới để che phủ c&aacute;c khuyết điểm tr&ecirc;n da, tạo ra lỗ ch&acirc;n l&ocirc;ng v&ocirc; h&igrave;nh tr&ecirc;n da</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">Che khuyết điểm mạnh: B&ocirc;i kem nền dạng lỏng, chống trầy xước</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">Giữ lớp trang điểm: tiếp tục triệt để dầu, lớp trang điểm kh&ocirc; v&agrave; tự nhi&ecirc;n hơn</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">Sử dụng t&ugrave;y chỉnh, hiệu ứng l&agrave;m đẹp s&acirc;u hơn</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">1. Vui l&ograve;ng thoa một lớp nền mảnh trước khi chăm s&oacute;c da v&agrave; trang điểm.</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">2. Lấy một lượng vừa đủ kem nền dạng lỏng v&agrave; d&ugrave;ng cọ thoa đều từ giữa mặt ra ngo&agrave;i.</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">3. Đặc biệt cần phủ một lượng nhỏ nhiều lần trước khi trang điểm bước tiếp theo</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">Thời điểm ra mắt: Th&aacute;ng 3 năm 2016</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">Khối lượng tịnh: 31g</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">Hạn sử dụng mỹ phẩm: 36 th&aacute;ng</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">Mỹ phẩm chuy&ecirc;n dụng: Kh&ocirc;ng</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">Ph&acirc;n loại kem nền: kem nền dạng lỏng</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">Chống nắng: c&oacute;</p>', N'tamnguyen1766', N'1', 1, 92000, 35, N'FOCALLURE ')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'200423123617194', N'Bộ 2 nước tẩy trang dưỡng ẩm mượt da 3in1 L''Oreal Paris Micellar Water', N'/Assets/img/HDD200423123617194.jpg', N'', CAST(N'2023-04-20T12:36:17.197' AS DateTime), 13, N'<p class="irIKAp">&bull; V&Igrave; SAO BẠN SẼ TH&Iacute;CH?</p>
<p class="irIKAp">02 x Tẩy trang 3-trong-1 L''Oreal Paris Micellar Water m&igrave;n mịn da 400ml</p>
<p class="irIKAp">HSD: 3 năm kể từ ng&agrave;y sản xuất Thương hiệu: L&rsquo;Or&eacute;al Paris Xuất xứ thương hiệu: Ph&aacute;p Nơi sản xuất: Trung Quốc Ng&agrave;y sản xuất: Xem tr&ecirc;n bao b&igrave; sản phẩm Th&agrave;nh phần: Xem chi tiết tr&ecirc;n bao b&igrave; sản phẩm Đối tượng sử dụng: Th&iacute;ch hợp cho mọi loại da Hướng dẫn bảo quản: Xem chi tiết tr&ecirc;n bao b&igrave; sản phẩm Hướng dẫn bảo quản: Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t H&igrave;nh bao b&igrave; c&oacute; thay đổi t&ugrave;y theo đợt sản xuất TH&Ocirc;NG TIN THƯƠNG HIỆU Hơn 100 năm th&agrave;nh lập, L&rsquo;Or&eacute;al l&agrave; tập đo&agrave;n chuy&ecirc;n về mỹ phẩm v&agrave; chăm s&oacute;c sắc đẹp lớn nhất thế giới. L&rsquo;Or&eacute;al Paris đ&atilde; c&oacute; mặt tại hơn 120 quốc gia với c&aacute;c d&ograve;ng sản phẩm về chăm s&oacute;c t&oacute;c, chăm s&oacute;c da v&agrave; trang điểm d&agrave;nh cho đại ch&uacute;ng. Được x&acirc;y dựng tr&ecirc;n nền tảng khoa học, &aacute;p dụng những ph&aacute;t minh c&ocirc;ng nghệ mới nhất, c&aacute;c sản phẩm L&rsquo;Or&eacute;al Paris c&oacute; chất lượng cao cấp, đa dạng, dễ sử dụng, với mức gi&aacute; ph&ugrave; hợp cho tất cả mọi người, đ&aacute;p ứng nhiều nhu cầu l&agrave;m đẹp. *L&rsquo;Or&eacute;al Paris l&agrave; nh&atilde;n hiệu mỹ phẩm h&agrave;ng đầu tại Ch&acirc;u &Acirc;u được sản xuất tại nhiều nh&agrave; m&aacute;y tr&ecirc;n to&agrave;n thế giới như Trung Quốc, Mỹ, Indonesia&hellip; D&ugrave; được sản xuất ở đ&acirc;u, c&aacute;c sản phẩm đều tu&acirc;n theo quy tr&igrave;nh kiểm so&aacute;t chất lượng nghi&ecirc;m ngặt v&agrave; đồng đều của L&rsquo;Or&eacute;al To&agrave;n Cầu. C&aacute;c sản phẩm ch&iacute;nh h&atilde;ng đều c&oacute; tem nh&atilde;n tiếng Việt ph&iacute;a sau v&agrave; nhập khẩu trực tiếp từ c&ocirc;ng ty TNHH L&rsquo;Or&eacute;al Việt Nam n&ecirc;n c&aacute;c bạn ho&agrave;n to&agrave;n y&ecirc;n t&acirc;m về chất lượng sản phẩm.</p>
<p class="irIKAp">&bull; ƯU ĐIỂM NỔI BẬT</p>
<p class="irIKAp">Deep Cleasing - Sạch s&acirc;u (Hồng): C&oacute; hai lớp chất lỏng gi&uacute;p h&ograve;a tan chất bẩn v&agrave; loại bỏ to&agrave;n bộ lớp trang điểm hiệu quả, kể cả lớp trang điểm l&acirc;u tr&ocirc;i v&agrave; kh&ocirc;ng thấm nước chỉ trong một bước. Lớp Micellar chứa c&aacute;c hạt mixen si&ecirc;u nhỏ để len lỏi s&acirc;u v&agrave; dễ d&agrave;ng lấy đi bụi bẩn, dầu thừa, lớp trang điểm v&agrave; chất bẩn kh&aacute;c m&agrave; kh&ocirc;ng l&agrave;m kh&ocirc; da. Th&iacute;ch hợp cho mọi loại da, kể cả da nhạy cảm.</p>
<p class="irIKAp">&bull; HIỆU QUẢ SỬ DỤNG</p>
<p class="irIKAp">gi&uacute;p l&agrave;m sạch lấy đi sạch cặn trang điểm những vẫn gi&uacute;p da giữ ẩm, th&ocirc;ng tho&aacute;ng v&agrave; mềm mượt chỉ trong một bước.</p>
<p class="irIKAp">&bull; HƯỚNG DẪN SỬ DỤNG</p>
<p class="irIKAp">- Lắc đều.</p>
<p class="irIKAp">- Cho sản phẩm v&agrave;o b&ocirc;ng tẩy trang rồi nhẹ nh&agrave;ng lau l&ecirc;n mặt, mắt v&agrave; m&ocirc;i theo chuyển động tr&ograve;n.</p>
<p class="irIKAp">- Kh&ocirc;ng cần rửa lại với nước.</p>
<p class="irIKAp">&bull; TH&Ocirc;NG TIN THƯƠNG HIỆU</p>
<p class="irIKAp">Hơn 100 năm th&agrave;nh lập, L&rsquo;Or&eacute;al l&agrave; tập đo&agrave;n chuy&ecirc;n về mỹ phẩm v&agrave; chăm s&oacute;c sắc đẹp lớn nhất thế giới. L&rsquo;Or&eacute;al Paris đ&atilde; c&oacute; mặt tại hơn 120 quốc gia với c&aacute;c d&ograve;ng sản phẩm về chăm s&oacute;c t&oacute;c, chăm s&oacute;c da v&agrave; trang điểm d&agrave;nh cho đại ch&uacute;ng. Được x&acirc;y dựng tr&ecirc;n nền tảng khoa học, &aacute;p dụng những ph&aacute;t minh c&ocirc;ng nghệ mới nhất, c&aacute;c sản phẩm L&rsquo;Or&eacute;al Paris c&oacute; chất lượng cao cấp, đa dạng, dễ sử dụng, với mức gi&aacute; ph&ugrave; hợp cho tất cả mọi người, đ&aacute;p ứng nhiều nhu cầu l&agrave;m đẹp.</p>
<p class="irIKAp">*L&rsquo;Or&eacute;al Paris l&agrave; nh&atilde;n hiệu mỹ phẩm h&agrave;ng đầu tại Ch&acirc;u &Acirc;u được sản xuất tại nhiều nh&agrave; m&aacute;y tr&ecirc;n to&agrave;n thế giới như Trung Quốc, Mỹ, Indonesia&hellip; D&ugrave; được sản xuất ở đ&acirc;u, c&aacute;c sản phẩm đều tu&acirc;n theo quy tr&igrave;nh kiểm so&aacute;t chất lượng nghi&ecirc;m ngặt v&agrave; đồng đều của L&rsquo;Or&eacute;al To&agrave;n Cầu. C&aacute;c sản phẩm ch&iacute;nh h&atilde;ng đều c&oacute; tem nh&atilde;n tiếng Việt ph&iacute;a sau v&agrave; nhập khẩu trực tiếp từ c&ocirc;n</p>', N'tamnguyen1766', N'1', 1, 438000, 25, N'L''Oreal Paris')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'200423123736616', N'Bộ kem ngày đêm sáng da tức thì Glycolic Bright & 2 Serum cấp ẩm L''Oreal Paris', N'/Assets/img/HDD200423123736616.jpg', N'', CAST(N'2023-04-20T12:37:36.617' AS DateTime), 12, N'<p class="irIKAp">&bull; V&Igrave; SAO BẠN SẼ TH&Iacute;CH?</p>
<p class="irIKAp">01 x kem dưỡng ng&agrave;y Glycolic Bright 50ml L''Oreal Paris</p>
<p class="irIKAp">01 x kem dưỡng đ&ecirc;m Glycolic Bright 50ml L''Oreal Paris</p>
<p class="irIKAp">02 x Serum s&aacute;ng da tức th&igrave; Glycolic bright 1.0% 7.5ml L''Oreal Paris</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">Viện Nghi&ecirc;n cứu L&rsquo;Or&eacute;al Paris giới thiệu Kem Dưỡng S&aacute;ng Da Ban Ng&agrave;y L''OR&Eacute;AL PARIS GLYCOLIC-BRIGHT GLOWING CREAM DAY - SPF 17. Với c&ocirc;ng thức chứa Glycolic Acid v&agrave; SPF 17, gi&uacute;p bảo vệ da trước t&aacute;c hại của tia UV, giảm th&acirc;m n&aacute;m v&agrave; t&igrave;nh trạng da xỉn m&agrave;u, cho l&agrave;n da s&aacute;ng đều m&agrave;u, tr&ocirc;ng rạng rỡ hơn.</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">BẠN C&Oacute; BIẾT?</p>
<p class="irIKAp">Glycolic Acid Glycolic Acid c&oacute; trọng lượng ph&acirc;n tử nhỏ nhất trong nh&oacute;m AHA, gi&uacute;p thẩm thấu s&acirc;u hơn v&agrave; l&agrave;m sạch tế b&agrave;o da chết nhẹ nh&agrave;ng tr&ecirc;n bề mặt da gi&uacute;p hỗ trợ qu&aacute; tr&igrave;nh t&aacute;i tạo da, cho l&agrave;n da tr&ocirc;ng tươi s&aacute;ng, rạng rỡ hơn.</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">4 T&Aacute;C ĐỘNG L&Agrave;M S&Aacute;NG DA:</p>
<p class="irIKAp">(1) Giảm th&acirc;m n&aacute;m, đốm sạm m&agrave;u</p>
<p class="irIKAp">(2) Giảm khuyết điểm</p>
<p class="irIKAp">(3) L&agrave;m đều m&agrave;u da</p>
<p class="irIKAp">(4) L&agrave;m da tr&ocirc;ng rạng rỡ hơn.</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">CẢNH B&Aacute;O: Sản phẩm n&agrave;y chứa Alpha Hydroxy Acid c&oacute; thể l&agrave;m tăng độ nhạy cảm của da với &aacute;nh nắng mặt trời v&agrave; g&acirc;y ra t&igrave;nh trạng ch&aacute;y nắng. Sử dụng kem chống nắng, mặc quần &aacute;o bảo vệ v&agrave; hạn chế tiếp x&uacute;c với &aacute;nh nắng mặt trời trong v&agrave; sau một tuần sử dụng sản phẩm.</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">Xuất xứ: Trung Quốc</p>
<p class="irIKAp">HSD: 3 năm kể từ ng&agrave;y sản xuất</p>
<p class="irIKAp">NSX: Xem tr&ecirc;n bao b&igrave;"</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">&bull; TH&Ocirc;NG TIN THƯƠNG HIỆU</p>
<p class="irIKAp">Hơn 100 năm th&agrave;nh lập, L&rsquo;Or&eacute;al l&agrave; tập đo&agrave;n chuy&ecirc;n về mỹ phẩm v&agrave; chăm s&oacute;c sắc đẹp lớn nhất thế giới. L&rsquo;Or&eacute;al Paris đ&atilde; c&oacute; mặt tại hơn 120 quốc gia với c&aacute;c d&ograve;ng sản phẩm về chăm s&oacute;c t&oacute;c, chăm s&oacute;c da v&agrave; trang điểm d&agrave;nh cho đại ch&uacute;ng. Được x&acirc;y dựng tr&ecirc;n nền tảng khoa học, &aacute;p dụng những ph&aacute;t minh c&ocirc;ng nghệ mới nhất, c&aacute;c sản phẩm L&rsquo;Or&eacute;al Paris c&oacute; chất lượng cao cấp, đa dạng, dễ sử dụng, với mức gi&aacute; ph&ugrave; hợp cho tất cả mọi người, đ&aacute;p ứng nhiều nhu cầu l&agrave;m đẹp. *L&rsquo;Or&eacute;al Paris l&agrave; nh&atilde;n hiệu mỹ phẩm h&agrave;ng đầu tại Ch&acirc;u &Acirc;u được sản xuất tại nhiều nh&agrave; m&aacute;y tr&ecirc;n to&agrave;n thế giới như Trung Quốc, Mỹ, Indonesia&hellip; D&ugrave; được sản xuất ở đ&acirc;u, c&aacute;c sản phẩm đều tu&acirc;n theo quy tr&igrave;nh kiểm so&aacute;t chất lượng nghi&ecirc;m ngặt v&agrave; đồng đều của L&rsquo;Or&eacute;al To&agrave;n Cầu. C&aacute;c sản phẩm ch&iacute;nh h&atilde;ng đều c&oacute; tem nh&atilde;n tiếng Việt ph&iacute;a sau v&agrave; nhập khẩu trực tiếp từ c&ocirc;ng ty TNHH L&rsquo;Or&eacute;al Việt Nam n&ecirc;n c&aacute;c bạn ho&agrave;n to&agrave;n y&ecirc;n t&acirc;m về chất lượng sản phẩm.</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">&bull; ƯU ĐIỂM NỔI BẬT</p>
<p class="irIKAp">4 T&Aacute;C ĐỘNG L&Agrave;M S&Aacute;NG DA:</p>
<p class="irIKAp">(1) Giảm th&acirc;m n&aacute;m, đốm sạm m&agrave;u</p>
<p class="irIKAp">(2) Giảm khuyết điểm</p>
<p class="irIKAp">(3) L&agrave;m đều m&agrave;u da</p>
<p class="irIKAp">(4) L&agrave;m da tr&ocirc;ng rạng rỡ hơn.</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">&bull; HIỆU QUẢ SỬ DỤNG</p>
<p class="irIKAp">Ngay lập tức: Da được cấp ẩm s&acirc;u, s&aacute;ng v&agrave; tr&ocirc;ng rạng rỡ hơn. Ng&agrave;y qua ng&agrave;y: C&aacute;c vết th&acirc;m n&aacute;m giảm, da đều m&agrave;u v&agrave; s&aacute;ng hơn. (*) Theo kết quả nghi&ecirc;n cứu tr&ecirc;n 40 phụ nữ, tuổi từ 20~60.</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">&bull; HƯỚNG DẪN SỬ DỤNG</p>
<p class="irIKAp">Thoa đều khắp mặt v&agrave; cổ v&agrave;o mỗi buổi s&aacute;ng. C&oacute; thể sử dụng sau bước serum.</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">&bull; TH&Ocirc;NG TIN THƯƠNG HIỆU</p>
<p class="irIKAp">Hơn 100 năm th&agrave;nh lập, L&rsquo;Or&eacute;al l&agrave; tập đo&agrave;n chuy&ecirc;n về mỹ phẩm v&agrave; chăm s&oacute;c sắc đẹp lớn nhất thế giới. L&rsquo;Or&eacute;al Paris đ&atilde; c&oacute; mặt tại hơn 120 quốc gia với c&aacute;c d&ograve;ng sản phẩm về chăm s&oacute;c t&oacute;c, chăm s&oacute;c da v&agrave; trang điểm d&agrave;nh cho đại ch&uacute;ng. Được x&acirc;y dựng tr&ecirc;n nền tảng khoa học, &aacute;p dụng những ph&aacute;t minh c&ocirc;ng</p>', N'tamnguyen1766', N'1', 1, 10180000, 43, N'L''Oreal Paris')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'200423124106085', N'Áo Thun Levents Loveyou300k Special/ Cream', N'/Assets/img/HDD200423124106085.jpg', N'+ LEVENTS LOVEYOU300K SPECIAL TEE/ CREAM

COLOR: CREAM PAPER

MATERIAL: LÌ VEN ORIGINAL 2.0 - Phiên bản bề mặt vải có lông, khắc phục tình trạng bị nhăn của sản phẩm

SIZE: 1/2/3/4', CAST(N'2023-04-20T12:41:06.087' AS DateTime), 14, N'<p class="irIKAp">Form &aacute;o được Fit size theo form v&agrave; ti&ecirc;u chuẩn tương đối của người Việt Nam, nếu bạn đang c&acirc;n nhắc giữa hai size, n&ecirc;n chọn size lớn hơn.</p>
<p class="irIKAp">Size 1: Chiều cao từ 1m50 - 1m65, c&acirc;n nặng tr&ecirc;n 55kg</p>
<p class="irIKAp">Size 2: Chiều cao từ 1m65 - 1m72, c&acirc;n nặng dưới 65kg</p>
<p class="irIKAp">Size 3: Chiều cao từ 1m70 - 1m77, c&acirc;n nặng dưới 80kg</p>
<p class="irIKAp">Size 4:&nbsp;Chiều&nbsp;cao tr&ecirc;n 1m72, c&acirc;n nặng dưới 95kg.</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">HƯỚNG DẪN ĐỔI TRẢ</p>
<p class="irIKAp">1. Điều kiện đổi h&agrave;ng</p>
<p class="irIKAp">- Đối với sản phẩm &aacute;o quần, thời gian đổi h&agrave;ng trong v&ograve;ng 7 ng&agrave;y kể từ ng&agrave;y kh&aacute;ch h&agrave;ng nhận bưu phẩm.</p>
<p class="irIKAp">- Đối với sản phẩm phụ kiện (ba l&ocirc;, d&eacute;p, mũ,...),&nbsp; thời gian đổi h&agrave;ng trong v&ograve;ng 30 ng&agrave;y kể từ ng&agrave;y kh&aacute;ch h&agrave;ng nhận bưu phẩm.</p>
<p class="irIKAp">- &Aacute;p dụng đổi h&agrave;ng với tất cả c&aacute;c sản phẩm v&agrave; sản phẩm được đổi phải c&ograve;n nguy&ecirc;n nh&atilde;n m&aacute;c, trong t&igrave;nh trạng chưa qua sử dụng.</p>
<p class="irIKAp">- Với trường hợp sản phẩm bị cắt tag, trong v&ograve;ng 1 ng&agrave;y kể từ ng&agrave;y nhận bưu phẩm, bạn h&atilde;y gửi phản hồi về tụi m&igrave;nh để được giải quyết. Qua mốc thời gian 1 ng&agrave;y ch&uacute;ng m&igrave;nh sẽ kh&ocirc;ng giải quyết đơn đổi trả.</p>
<p class="irIKAp">- Sản phẩm đổi phải c&oacute; gi&aacute; trị tương đương hoặc cao hơn sản phẩm được đổi. Vui l&ograve;ng thanh to&aacute;n chi ph&iacute; ch&ecirc;nh lệch gi&aacute; trị sản phẩm nếu c&oacute;.</p>
<p class="irIKAp">- Trường hợp ho&agrave;n lại gi&aacute; trị đơn h&agrave;ng, tụi m&igrave;nh sẽ ho&agrave;n tiền trong v&ograve;ng 48h l&agrave;m việc sau khi nhận được y&ecirc;u cầu từ c&aacute;c bạn.</p>
<p class="irIKAp">- &Aacute;p dụng 01 lần đổi/ 01 đơn h&agrave;ng.&nbsp;</p>
<p class="irIKAp">- &Aacute;p dung với c&aacute;c đơn h&agrave;ng tr&ecirc;n to&agrave;n hệ thống của Levents&reg; (Website, FB &amp; IG, TMĐT &amp; cửa h&agrave;ng).</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">*Lưu &yacute;:&nbsp;</p>
<p class="irIKAp">- Bạn vui l&ograve;ng gửi cho ch&uacute;ng m&igrave;nh clip đ&oacute;ng g&oacute;i h&agrave;ng đổi trả của bạn, nh&acirc;n vi&ecirc;n tư vấn sẽ x&aacute;c nhận v&agrave; tiến h&agrave;nh l&ecirc;n đơn đổi trả cho bạn.</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">2. C&aacute;ch thức quay video unbox:</p>
<p class="irIKAp">- Clip r&otilde; n&eacute;t từ cảnh kiểm tra bề mặt g&oacute;i h&agrave;ng, l&uacute;c mở đến kiểm tra h&agrave;ng.</p>
<p class="irIKAp">- Clip kh&ocirc;ng cắt gh&eacute;p, kh&ocirc;ng chỉnh sửa.</p>
<p class="irIKAp">- Clip quay r&otilde; th&ocirc;ng tin tr&ecirc;n bưu phẩm: T&ecirc;n người nhận, m&atilde; đơn, địa chỉ, số điện thoại.</p>', N'tamnguyen1766', N'1', 1, 300000, 12, N'Levents ')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'200423124228070', N'Áo Hoodie Levents Popular Logo 2.0/ Black', N'/Assets/img/HDD200423124228070.jpg', N'+ LEVENTS POPULAR LOGO 2.0 HOODIE/ BLACK

COLOR: BLACK

MATERIAL: LÌ VEN FABRIC - chất vải dày dặn, mềm mịm, không bị nhăn.

SIZE: 2/3/4', CAST(N'2023-04-20T12:42:28.070' AS DateTime), 14, N'<p class="irIKAp">Form &aacute;o được Fit size theo form v&agrave; ti&ecirc;u chuẩn tương đối của người Việt Nam, nếu bạn đang c&acirc;n nhắc giữa hai size, n&ecirc;n chọn size lớn hơn.</p>
<p class="irIKAp">Size 2: Chiều cao từ 1m65 - 1m72, c&acirc;n nặng dưới 65kg</p>
<p class="irIKAp">Size 3: Chiều cao từ 1m70 - 1m77, c&acirc;n nặng dưới 80kg</p>
<p class="irIKAp">Size 4:&nbsp;Chiều&nbsp;cao tr&ecirc;n 1m72, c&acirc;n nặng dưới 95kg.</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">HƯỚNG DẪN ĐỔI TRẢ</p>
<p class="irIKAp">1. Điều kiện đổi h&agrave;ng</p>
<p class="irIKAp">- Đối với sản phẩm &aacute;o quần, thời gian đổi h&agrave;ng trong v&ograve;ng 7 ng&agrave;y kể từ ng&agrave;y kh&aacute;ch h&agrave;ng nhận bưu phẩm.</p>
<p class="irIKAp">- Đối với sản phẩm phụ kiện (ba l&ocirc;, d&eacute;p, mũ,...),&nbsp; thời gian đổi h&agrave;ng trong v&ograve;ng 30 ng&agrave;y kể từ ng&agrave;y kh&aacute;ch h&agrave;ng nhận bưu phẩm.</p>
<p class="irIKAp">- &Aacute;p dụng đổi h&agrave;ng với tất cả c&aacute;c sản phẩm v&agrave; sản phẩm được đổi phải c&ograve;n nguy&ecirc;n nh&atilde;n m&aacute;c, trong t&igrave;nh trạng chưa qua sử dụng.</p>
<p class="irIKAp">- Với trường hợp sản phẩm bị cắt tag, trong v&ograve;ng 1 ng&agrave;y kể từ ng&agrave;y nhận bưu phẩm, bạn h&atilde;y gửi phản hồi về tụi m&igrave;nh để được giải quyết. Qua mốc thời gian 1 ng&agrave;y ch&uacute;ng m&igrave;nh sẽ kh&ocirc;ng giải quyết đơn đổi trả.</p>
<p class="irIKAp">- Sản phẩm đổi phải c&oacute; gi&aacute; trị tương đương hoặc cao hơn sản phẩm được đổi. Vui l&ograve;ng thanh to&aacute;n chi ph&iacute; ch&ecirc;nh lệch gi&aacute; trị sản phẩm nếu c&oacute;.</p>
<p class="irIKAp">- Trường hợp ho&agrave;n lại gi&aacute; trị đơn h&agrave;ng, tụi m&igrave;nh sẽ ho&agrave;n tiền trong v&ograve;ng 48h l&agrave;m việc sau khi nhận được y&ecirc;u cầu từ c&aacute;c bạn.</p>
<p class="irIKAp">- &Aacute;p dụng 01 lần đổi/ 01 đơn h&agrave;ng.&nbsp;</p>
<p class="irIKAp">- &Aacute;p dung với c&aacute;c đơn h&agrave;ng tr&ecirc;n to&agrave;n hệ thống của Levents&reg;</p>
<p class="irIKAp">*Lưu &yacute;:&nbsp;</p>
<p class="irIKAp">- Bạn vui l&ograve;ng gửi cho ch&uacute;ng m&igrave;nh clip đ&oacute;ng g&oacute;i h&agrave;ng đổi trả của bạn, nh&acirc;n vi&ecirc;n tư vấn sẽ x&aacute;c nhận v&agrave; tiến h&agrave;nh l&ecirc;n đơn đổi trả cho bạn.</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">2. C&aacute;ch thức quay video unbox:</p>
<p class="irIKAp">- Clip r&otilde; n&eacute;t từ cảnh kiểm tra bề mặt g&oacute;i h&agrave;ng, l&uacute;c mở đến kiểm tra h&agrave;ng.</p>
<p class="irIKAp">- Clip kh&ocirc;ng cắt gh&eacute;p, kh&ocirc;ng chỉnh sửa.</p>
<p class="irIKAp">- Clip quay r&otilde; th&ocirc;ng tin tr&ecirc;n bưu phẩm: T&ecirc;n người nhận, m&atilde; đơn, địa chỉ, số điện thoại.</p>', N'tamnguyen1766', N'1', 1, 590000, 17, N'Levents ')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'200423124351835', N'Set lẻ Áo kiểu phối nơ GUMAC AD04065 - Chân váy A xếp ly hộp GUMAC VD04066', N'/Assets/img/HDD200423124351835.jpg', N'', CAST(N'2023-04-20T12:43:51.837' AS DateTime), 14, N'<p class="irIKAp">&Aacute;o kiểu phom regalar, l&oacute;t trong/ Cổ tr&ograve;n, buộc nơ/ Nẹp may d&acirc;y khuy, n&uacute;t ngọc trai/ Tay d&agrave;i, măng-s&eacute;c, cửa tay nh&uacute;n.</p>
<p class="irIKAp">M&atilde; Sản Phẩm: AD04065</p>
<p class="irIKAp">T&ecirc;n Sản Phẩm: &Aacute;o kiểu phối nơ</p>
<p class="irIKAp">Gi&aacute; B&aacute;n: 450,000vnđ</p>
<p class="irIKAp">M&agrave;u Sắc: CAM, ĐỎ</p>
<p class="irIKAp">NGỰC: 88</p>
<p class="irIKAp">LAI: 94</p>
<p class="irIKAp">VAI: 34</p>
<p class="irIKAp">D&Agrave;I TAY: 55</p>
<p class="irIKAp">CỬA TAY: 18</p>
<p class="irIKAp">D&Agrave;I &Aacute;O: 60</p>
<p class="irIKAp">SIZE: XS</p>
<p class="irIKAp">T&Ecirc;N CHẤT LIỆU: TƠ TẰM GẠO</p>
<p class="irIKAp">ĐỘ CO GI&Atilde;N: &Iacute;T</p>
<p class="irIKAp">___________________________________________________</p>
<p class="irIKAp">Ch&acirc;n v&aacute;y phom A, xếp ly hộp, hai lớp/ Lưng rời, d&acirc;y k&eacute;o ph&iacute; sau, kh&ocirc;ng t&uacute;i.</p>
<p class="irIKAp">M&atilde; Sản Phẩm: VD04066</p>
<p class="irIKAp">T&ecirc;n Sản Phẩm: Ch&acirc;n v&aacute;y A xếp ly hộp</p>
<p class="irIKAp">Gi&aacute; B&aacute;n: 530.000</p>', N'tamnguyen1766', N'1', 1, 530000, 18, N'GUMAC ')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'200423124723741', N'Đầm maxi 20Again, thiết kế xòe tôn dáng DMA2534', N'/Assets/img/HDD200423124723741.jpg', N'', CAST(N'2023-04-20T12:47:23.743' AS DateTime), 14, N'<p class="irIKAp">✅ Đầm maxi 20Again, thiết kế x&ograve;e t&ocirc;n d&aacute;ng DMA2534</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">✅Chất liệu : Đũi xước</p>
<p class="irIKAp">+ Cấu tr&uacute;c sợi vải chắc chắn, bền m&agrave;u, kh&ocirc;ng bị nhăn, mặc v&agrave;o cực k&igrave; tho&aacute;ng m&aacute;t, thoải m&aacute;i</p>
<p class="irIKAp">+ Kh&ocirc;ng bị sờn mốc hay x&ugrave; l&ocirc;ng sau thời gian d&agrave;i sử dụng</p>
<p class="irIKAp">✅ Thiết kế/ mix &amp; match:</p>
<p class="irIKAp">+ Mẫu đầm sang - xịn - mịn c&aacute;c n&agrave;ng n&ecirc;n c&oacute; trong tủ đồ</p>
<p class="irIKAp">✅ M&agrave;u sắc: V&agrave;ng/Xanh</p>
<p class="irIKAp">✅Size: S/M/L - Th&ocirc;ng số size: chiều cao; c&acirc;n nặng.</p>
<p class="irIKAp">+ Size S: 150 - 159 cm; 40 - 47 kg;</p>
<p class="irIKAp">+ Size M: 150 - 159 cm; 48 - 55 kg;</p>
<p class="irIKAp">+ Size L: 160 - 165cm;56-62 kg;</p>
<p class="irIKAp">✅ Hướng dẫn bảo quản: Để sản phẩm bền đẹp, shop khuyến kh&iacute;ch qu&yacute; kh&aacute;ch:</p>
<p class="irIKAp">+ Giặt tay hoặc giặt bằng t&uacute;i giặt nếu giặt m&aacute;y; giặt bằng x&agrave; ph&ograve;ng trung t&iacute;nh, kh&ocirc;ng chất tẩy mạnh.</p>
<p class="irIKAp">+ Phơi sản phẩm ở nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng gay gắt.</p>
<p class="irIKAp">+ L&agrave; qua sản phẩm trước khi mặc để sản phẩm l&ecirc;n form d&aacute;ng đẹp .</p>', N'tamnguyen1766', N'1', 1, 785000, 30, N'20Again')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'200423124941257', N'Chảo đáy từ SUNHOUSE phi 18-30cm (đen)', N'/Assets/img/HDD200423124941257.jpg', N'', CAST(N'2023-04-20T12:49:41.257' AS DateTime), 18, N'<p class="irIKAp">LƯU &Yacute;: NẾU MUA CHO BẾP TỪ SỬ DỤNG N&Ecirc;N MUA TỪ SIZE 22-24CM TRỞ L&Ecirc;N SẼ BẮT TỪ TỐT, SIZE NHỎ HƠN BẮT TỪ K&Eacute;M HƠN</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">Đặc điểm nổi bật</p>
<p class="irIKAp">L&agrave;m từ nh&ocirc;m tấm c&oacute; độ d&agrave;y 2.5mm</p>
<p class="irIKAp">K&iacute;ch thước chảo lớn, dẫn nhiệt nhanh, tỏa nhiệt đều</p>
<p class="irIKAp">Sử dụng được với bếp từ</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">Chảo từ SUNHOUSE Magnetic Pan&nbsp;gi&uacute;p cho c&ocirc;ng việc x&agrave;o nấu được nhanh ch&oacute;ng v&agrave; gọn nhẹ hơn rất nhiều. Với cấu tạo từ nh&ocirc;m tấm nguy&ecirc;n khối phủ chống d&iacute;nh cao cấp, chảo gi&uacute;p nấu ăn ngon hơn, ph&ugrave; hợp với gia đ&igrave;nh từ 3-5 người.</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">Thiết kế đơn giản, tinh tế, tiện dụngKiểu d&aacute;ng đơn giản, hiện đại:&nbsp;Chảo được thiết kế đẹp mắt với mặt ngo&agrave;i được phủ sơn tĩnh điện đen b&oacute;ng c&oacute; khả năng hạn chế trầy xước v&agrave; b&aacute;m bẩn. L&ograve;ng chảo tr&aacute;ng chống d&iacute;nh tối m&agrave;u đem lại tổng thể đơn giản nhưng kh&ocirc;ng k&eacute;m phần tinh tế.</p>', N'tamnguyen1766', N'1', 1, 396000, 28, N'SUNHOUSE ')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'200423125054663', N'Bộ Nồi Inox 5 Đáy SUNHOUSE Đáy Từ SH781 16, 20, 24 cm', N'/Assets/img/HDD200423125054663.jpg', N'', CAST(N'2023-04-20T12:50:54.663' AS DateTime), 18, N'<p class="irIKAp">Bộ Nồi Inox 5 Đ&aacute;y SUNHOUSE Đ&aacute;y Từ SH781 16, 20, 24 cm</p>
<p class="irIKAp">***</p>
<p class="irIKAp">LƯU &Yacute;</p>
<p class="irIKAp">Nếu nấu tr&ecirc;n bếp ga, hơi n&oacute;ng của ga sẽ l&agrave;m quai cầm kh&ocirc;ng c&aacute;ch nhiệt được n&ecirc;n Qu&yacute; kh&aacute;ch h&agrave;ng n&ecirc;n ưu ti&ecirc;n sử dụng tr&ecirc;n bếp điện, bếp hồng ngoại nh&eacute; ạ!</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">✅Th&acirc;n nồi được l&agrave;m bằng inox cao cấp</p>
<p class="irIKAp">Bộ nồi Inox SUNHOUSE 5 đ&aacute;y 16cm 20cm 24cm SH781 được l&agrave;m từ chất liệu inox cao cấp lu&ocirc;n s&aacute;ng b&oacute;ng, dễ d&agrave;ng vệ sinh v&agrave; lau ch&ugrave;i. Th&acirc;n nồi được thiết kế sang trọng, g&oacute;p phần trang tr&iacute; cho căn bếp của bạn.</p>
<p class="irIKAp">✅Vung k&iacute;nh cường lực</p>
<p class="irIKAp">Bộ nồi Inox SUNHOUSE c&oacute; vung nồi l&agrave;m bằng k&iacute;nh cường lực trong suốt c&ugrave;ng n&uacute;m mạ v&agrave;ng sang trọng, chịu lực tốt. Nhờ vậy, qu&aacute; tr&igrave;nh nấu nướng của người d&ugrave;ng sẽ trở n&ecirc;n dễ d&agrave;ng hơn do quan s&aacute;t được to&agrave;n bộ thực phẩm trong qu&aacute; tr&igrave;nh nấu.</p>', N'tamnguyen1766', N'1', 1, 1132000, 32, N'SUNHOUSE ')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'200423125244663', N'Nồi Chiên Không Dầu Sharp KF-AF70EV-BK Chống Dính 7L [1700W]', N'/Assets/img/HDD200423125244663.jpg', N'', CAST(N'2023-04-20T12:52:44.663' AS DateTime), 18, N'<p class="irIKAp">"Xuất xứ: Trung Quốc</p>
<p class="irIKAp">M&agrave;u sắc: Đen</p>
<p class="irIKAp">Dung t&iacute;ch: tổng 7 lit</p>
<p class="irIKAp">- Rổ chi&ecirc;n: 5,5 l&iacute;t</p>
<p class="irIKAp">- Nồi chiền: 7 l&iacute;t</p>
<p class="irIKAp">C&ocirc;ng nghệ l&agrave;m n&oacute;ng: HIGH SPEED HOT AIR CIRCULATION</p>
<p class="irIKAp">Kiểu điều khiển: Điện tử</p>
<p class="irIKAp">C&ocirc;ng suất ti&ecirc;u thụ:</p>
<p class="irIKAp">- M&acirc;m nhiệt: 1700w</p>
<p class="irIKAp">- Motor quạt: 45w</p>
<p class="irIKAp">Chất liệu sản phẩm: phủ kim loại</p>
<p class="irIKAp">Nắp tr&ecirc;n:</p>
<p class="irIKAp">- Chất liệu: Acrylic (3mm)</p>
<p class="irIKAp">- Chất liệu n&uacute;t bấm: Acrylic</p>
<p class="irIKAp">Hiển thị:</p>
<p class="irIKAp">- Kiểu: LED</p>
<p class="irIKAp">- C&oacute; đ&egrave;n LED: m&agrave;u trắng</p>
<p class="irIKAp">Bảng điều khiển: N&uacute;t nhấn (tiếng Việt - tiếng Anh)</p>
<p class="irIKAp">Chất liệu rổ chi&ecirc;n: 2 lớp phủ chống d&iacute;nh b&ecirc;n trong v&agrave; b&ecirc;n ngo&agrave;i</p>
<p class="irIKAp">- Độ d&agrave;y: 0,6mm</p>
<p class="irIKAp">- Ch&acirc;n đ&ecirc; đặt rổ chi&ecirc;n: m&agrave;u đen</p>
<p class="irIKAp">Chất liệu nồi chi&ecirc;n: 2 lớp phủ chống d&iacute;nh b&ecirc;n trong v&agrave; b&ecirc;n ngo&agrave;i</p>
<p class="irIKAp">- Độ d&agrave;y: 0,5mm</p>
<p class="irIKAp">8 thực đơn tự động: Fries/Steak/Veggie/Chicken/Bake/Fish/Frozen food/Pizza</p>
<p class="irIKAp">Nhiệt độ c&agrave;i đặt: 80℃-200℃</p>
<p class="irIKAp">Thời gian c&agrave;i đặt: 0-60 ph&uacute;t</p>
<p class="irIKAp">Nhiệt độ cầu ch&igrave;: 192℃</p>
<p class="irIKAp">Độ ồn: 55-62dB</p>
<p class="irIKAp">Bảo vệ v&agrave; an to&agrave;n:Dừng khi qu&aacute; nhiệt (250℃)/ Kh&ocirc;ng hoạt động, khi kh&ocirc;ng c&oacute; nồi chi&ecirc;n/ Miếng nhựa che n&uacute;t nhấn để lấy rổ chi&ecirc;n/ Tấm chắn m&acirc;m nhiệt/ Tự động tắt khi k&eacute;o nồi chi&ecirc;n ra/ Tự động hoạt động khi gắn nồi chi&ecirc;n v&agrave;o</p>
<p class="irIKAp">"</p>
<p class="irIKAp">&bull; Trước khi thanh to&aacute;n nhận h&agrave;ng, bạn c&oacute; thể kiểm tra ngoại quan kiện h&agrave;ng, nếu bị r&aacute;ch/ thủng/ m&oacute;p m&eacute;o/ c&oacute; dấu hiệu đ&aacute;ng nghi th&igrave; bạn c&oacute; thể từ chối nhận h&agrave;ng sẽ được ho&agrave;n trả về v&agrave; kh&ocirc;ng tốn ph&iacute;. Sau khi thanh to&aacute;n nhận h&agrave;ng bạn nhớ chụp ảnh quay video khui h&agrave;ng để đảm bảo quyền lợi đối chiếu kiểm duyệt khi kiện h&agrave;ng ph&aacute;t sinh vấn đề bạn nh&eacute;!</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">SHARP nhận th&ocirc;ng tin xuất h&oacute;a đơn VAT theo y&ecirc;u cầu trong 3 ng&agrave;y đầu đặt h&agrave;ng qua k&ecirc;nh chat, nếu qua 3 ng&agrave;y đặt h&agrave;ng SHARP sẽ xuất h&oacute;a đơn theo th&ocirc;ng tin c&aacute; nh&acirc;n tr&ecirc;n đơn h&agrave;ng.</p>', N'tamnguyen1766', N'1', 1, 3700000, 16, N'Sharp ')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'200423125415272', N'Nồi đa năng Sharp KN-MC90V-ST Kèm 3 PK Nồi Sứ, Khay Hấp, Nắp Kính Cường Lực', N'/Assets/img/HDD200423125415272.jpg', N'', CAST(N'2023-04-20T12:54:15.273' AS DateTime), 18, N'<p class="irIKAp">Nồi cơm đa năng Sharp KN-MC90V-ST [K&egrave;m 3 Phụ kiện Nồi Sứ, Khay Hấp Inox, Gi&aacute; đ&otilde; Inox] Nắp Nồi K&iacute;nh Cường Lực - H&agrave;ng Ch&iacute;nh H&atilde;ng Bảo H&agrave;nh Uy T&iacute;n 12 Th&aacute;ng</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">Dung t&iacute;ch nồi inox: 9L</p>
<p class="irIKAp">Dung t&iacute;ch nồi con đất: 3,4L (chuy&ecirc;n d&ugrave;ng h&acirc;m c&aacute;ch thủy) -&nbsp;Lượng gạo tối đa: 14 cốc (2,5L)</p>
<p class="irIKAp">C&ocirc;ng suất: 1000W</p>
<p class="irIKAp">Hẹn giờ nấu: 24 giờ; giữ ấm: 5 giờ</p>
<p class="irIKAp">L&ograve;ng nồi:&nbsp;- Chất liệu: SUS 304 /&nbsp;- Độ d&agrave;y: 0.5mm -&nbsp;Nắp nồi: k&iacute;nh cường lực</p>
<p class="irIKAp">Mặt điều khiển: LED,&nbsp;N&uacute;t điều khiển: nhấn</p>
<p class="irIKAp">Chất liệu b&ecirc;n ngo&agrave;i: SUS 304 -&nbsp;M&acirc;m nhiệt: 1D</p>
<p class="irIKAp">Chức năng nấu: 13 chức năng: Gạo trắng, Gạo lức, Ch&aacute;o, G&agrave; chi&ecirc;n, Cơm hấp, Sườn hấp, C&aacute; hấp, Hầm c&aacute;ch thủy, Hầm đậu, Hầm soup, Sữa chua, H&acirc;m n&oacute;ng</p>
<p class="irIKAp">Phụ kiện đi k&egrave;m: Nồi sứ, Khay hấp Inox, Gi&aacute; đ&otilde; Inox,&nbsp;D&acirc;y điện: th&aacute;o rời</p>
<p class="irIKAp">K&iacute;ch thước sản phẩm: 400&nbsp;x 310&nbsp;x 332&nbsp;mm.&nbsp;Khối lượng sản phẩm (kg): 7.15&nbsp;kg.</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">BẢO H&Agrave;NH 12 TH&Aacute;NG TR&Ecirc;N TO&Agrave;N QUỐC: Tem serial tr&ecirc;n sản phẩm + Phiếu bảo h&agrave;nh + H&oacute;a đơn mua h&agrave;ng tr&ecirc;n Shopee (bằng giấy hoặc điện tử)</p>
<p class="irIKAp">Cần lấy h&oacute;a đơn hoặc thắc mắc về h&oacute;a đơn, chế độ bảo h&agrave;nh vui l&ograve;ng inbox tại CHAT NOW.&nbsp;Cần tư vấn hoặc hỗ trợ kỹ thuật vui l&ograve;ng gọi Hotline của Sharp: 18001599 (8h-20h, từ thứ Hai đến thứ Bảy).</p>
<p class="irIKAp">Trước khi thanh to&aacute;n nhận h&agrave;ng, bạn c&oacute; thể kiểm tra ngoại quan kiện h&agrave;ng, nếu bị r&aacute;ch/ thủng/ m&oacute;p m&eacute;o/ c&oacute; dấu hiệu đ&aacute;ng nghi th&igrave; bạn c&oacute; thể từ chối nhận h&agrave;ng sẽ được ho&agrave;n trả về v&agrave; kh&ocirc;ng tốn ph&iacute;. Sau khi thanh to&aacute;n nhận h&agrave;ng bạn nhớ chụp ảnh quay video khui h&agrave;ng để đảm bảo quyền lợi đối chiếu kiểm duyệt khi kiện h&agrave;ng ph&aacute;t sinh vấn đề bạn nh&eacute;!</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">SHARP nhận th&ocirc;ng tin xuất h&oacute;a đơn VAT theo y&ecirc;u cầu trong 3 ng&agrave;y đầu đặt h&agrave;ng qua k&ecirc;nh chat, nếu qua 3 ng&agrave;y đặt h&agrave;ng SHARP sẽ xuất h&oacute;a đơn theo th&ocirc;ng tin c&aacute; nh&acirc;n tr&ecirc;n đơn h&agrave;ng.</p>', N'tamnguyen1766', N'1', 1, 2790000, 14, N'Sharp ')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'200423125607256', N'Derma Forte 15g - Gamma, Bản Thường / Advanced, Gel Giúp Giảm Mụn Trứng Cá, Ngừa Thâm, Mờ Sẹo, Da Dầu Mụn - Dr Thêm', N'/Assets/img/HDD200423125607256.jpg', N'', CAST(N'2023-04-20T12:56:07.257' AS DateTime), 21, N'<p class="irIKAp">Derma Forte 15g</p>
<p class="irIKAp">Sản xuất bởi: Doanh Nghiệp Tư Nh&acirc;n Sản Xuất H&oacute;a Mỹ Phẩm GAM MA</p>
<p class="irIKAp">Địa chỉ: 18 Nguyễn Hậu, Phường T&acirc;n Th&agrave;nh, Quận T&acirc;n Ph&uacute;, TP Hồ Ch&iacute; Minh</p>
<p class="irIKAp">+ Xuất xứ thương hiệu: Việt Nam</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">+ Th&agrave;nh phần:</p>
<p class="irIKAp">- Bản Advanced: Water, Tazarotene, Ascorbic Acid (Vitamin C), Tocopherol (Vitamin E), Collagen, Ubiquinone (Coenzyme Q10), Carbomer, Squalane, Centella Asiatica Extract, Curcuma Longa Root Extract, Glycolic acid, Sodium Hydroxide, Edta, Potassium Sorbate</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">+ C&ocirc;ng dụng/Loại da ph&ugrave; hợp:</p>
<p class="irIKAp">- Gi&uacute;p giảm mụn trứng c&aacute;, mụn đầu đen, mụn đầu trắng, mụn ẩn&hellip;.</p>
<p class="irIKAp">- Gi&uacute;p mờ sẹo, ngừa th&acirc;m, ngừa t&aacute;i mụn. Gi&uacute;p l&agrave;m sạch b&atilde; nhờn tr&ecirc;n da. Dưỡng trắng mịn da</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">+ Hướng dẫn sử dụng:</p>
<p class="irIKAp">B&ocirc;i 1 lớp mỏng Derma Forte l&ecirc;n v&ugrave;ng da mụn sau khi đ&atilde; rửa sạch v&agrave; l&agrave;m kh&ocirc;.</p>
<p class="irIKAp">- Derma Forte ADCANCED d&ugrave;ng buổi tối. B&ocirc;i Derma Forte ADCANCED sau khi rửa sạch mặt v&agrave; lau kh&ocirc; da. C&aacute;c bước sử dụng: Sữa rửa mặt &ndash; toner &ndash; serum &ndash; Derma Forte ADCANCED &ndash; dưỡng ẩm (nếu đủ sản phẩm skincare). Derma Forte ADCANCED c&oacute; thể b&ocirc;i ri&ecirc;ng v&ugrave;ng mụn hoặc b&ocirc;i to&agrave;n mặt.</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">+ Th&ocirc;ng tin dị ứng (nếu c&oacute;): xem bảng th&agrave;nh phần</p>
<p class="irIKAp">+ Hướng dẫn bảo quản: Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp từ mặt trời. Để xa tầm tay trẻ em.</p>
<p class="irIKAp">+ Ng&agrave;y sản xuất/ Hạn sử dụng: Xem tr&ecirc;n bao b&igrave; sản phẩm</p>
<p class="irIKAp">+ Hạn sử dụng: 36 th&aacute;ng</p>', N'tamnguyen1766', N'1', 1, 165000, 46, N'Derma ')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'200423125608959', N'Derma Forte 15g - Gamma, Bản Thường / Advanced, Gel Giúp Giảm Mụn Trứng Cá, Ngừa Thâm, Mờ Sẹo, Da Dầu Mụn - Dr Thêm', N'/Assets/img/HDD200423125608959.jpg', N'', CAST(N'2023-04-20T12:56:08.960' AS DateTime), 21, N'<p class="irIKAp">Derma Forte 15g</p>
<p class="irIKAp">Sản xuất bởi: Doanh Nghiệp Tư Nh&acirc;n Sản Xuất H&oacute;a Mỹ Phẩm GAM MA</p>
<p class="irIKAp">Địa chỉ: 18 Nguyễn Hậu, Phường T&acirc;n Th&agrave;nh, Quận T&acirc;n Ph&uacute;, TP Hồ Ch&iacute; Minh</p>
<p class="irIKAp">+ Xuất xứ thương hiệu: Việt Nam</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">+ Th&agrave;nh phần:</p>
<p class="irIKAp">- Bản Advanced: Water, Tazarotene, Ascorbic Acid (Vitamin C), Tocopherol (Vitamin E), Collagen, Ubiquinone (Coenzyme Q10), Carbomer, Squalane, Centella Asiatica Extract, Curcuma Longa Root Extract, Glycolic acid, Sodium Hydroxide, Edta, Potassium Sorbate</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">+ C&ocirc;ng dụng/Loại da ph&ugrave; hợp:</p>
<p class="irIKAp">- Gi&uacute;p giảm mụn trứng c&aacute;, mụn đầu đen, mụn đầu trắng, mụn ẩn&hellip;.</p>
<p class="irIKAp">- Gi&uacute;p mờ sẹo, ngừa th&acirc;m, ngừa t&aacute;i mụn. Gi&uacute;p l&agrave;m sạch b&atilde; nhờn tr&ecirc;n da. Dưỡng trắng mịn da</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">+ Hướng dẫn sử dụng:</p>
<p class="irIKAp">B&ocirc;i 1 lớp mỏng Derma Forte l&ecirc;n v&ugrave;ng da mụn sau khi đ&atilde; rửa sạch v&agrave; l&agrave;m kh&ocirc;.</p>
<p class="irIKAp">- Derma Forte ADCANCED d&ugrave;ng buổi tối. B&ocirc;i Derma Forte ADCANCED sau khi rửa sạch mặt v&agrave; lau kh&ocirc; da. C&aacute;c bước sử dụng: Sữa rửa mặt &ndash; toner &ndash; serum &ndash; Derma Forte ADCANCED &ndash; dưỡng ẩm (nếu đủ sản phẩm skincare). Derma Forte ADCANCED c&oacute; thể b&ocirc;i ri&ecirc;ng v&ugrave;ng mụn hoặc b&ocirc;i to&agrave;n mặt.</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">+ Th&ocirc;ng tin dị ứng (nếu c&oacute;): xem bảng th&agrave;nh phần</p>
<p class="irIKAp">+ Hướng dẫn bảo quản: Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp từ mặt trời. Để xa tầm tay trẻ em.</p>
<p class="irIKAp">+ Ng&agrave;y sản xuất/ Hạn sử dụng: Xem tr&ecirc;n bao b&igrave; sản phẩm</p>
<p class="irIKAp">+ Hạn sử dụng: 36 th&aacute;ng</p>', N'tamnguyen1766', N'1', 1, 165000, 46, N'Derma ')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'200423125757677', N'Tinh Chất Chấm Mụn Mờ Thâm Cafuné Essence thành phần serum AHA Và Tràm Trà 15ml', N'/Assets/img/HDD200423125757677.jpg', N'', CAST(N'2023-04-20T12:57:57.677' AS DateTime), 21, N'<p class="irIKAp">Cafun&eacute; Essence AHA V&agrave; Tr&agrave;m Tr&agrave; - Tinh Chất Serum Chấm Mụn Mờ Th&acirc;m Cafun&eacute; (15ml)</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">I. GIỚI THIỆU SẢN PHẨM:</p>
<p class="irIKAp">1/ Th&agrave;nh phần của tinh chất mụn th&acirc;m Cafun&eacute;:</p>
<p class="irIKAp">&bull; Tinh dầu tr&agrave;m tr&agrave; c&oacute; t&aacute;c dụng chống lại vi khuẩn P. Acnes &ndash; nguy&ecirc;n nh&acirc;n ch&iacute;nh g&acirc;y ra mụn trứng c&aacute;.</p>
<p class="irIKAp">&bull; Glycolic acid (AHA) &ndash; hoạt chất thần k&igrave; đối với da mụn, thu nhỏ lỗ ch&acirc;n l&ocirc;ng..</p>
<p class="irIKAp">&bull; Chiết xuất Cam Thảo &ndash; Dưỡng chất l&agrave;m trắng da vượt trội</p>
<p class="irIKAp">&bull; Hợp chất tự nhi&ecirc;n Glycerin c&oacute; t&aacute;c dụng mạnh mẽ chống lại mụn trứng c&aacute;</p>
<p class="irIKAp">&bull; V&agrave; một số th&agrave;nh phần thi&ecirc;n nhi&ecirc;n kh&aacute;c như Dầu Dừa, chiết xuất Hạt Nho, chiết xuất c&acirc;y B&aacute;ch Nhật Bản &hellip; cũng c&oacute; t&aacute;c dụng rất tốt đối với da mụn.</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">2/ C&ocirc;ng dụng:</p>
<p class="irIKAp">Ph&ugrave; hợp với tất cả c&aacute;c loại mụn ẩn, mụn trứng c&aacute;, mụn đầu đen, mụn đầu trắng,... Mờ th&acirc;m, sẹo. Ngăn ngừa t&aacute;i ph&aacute;t mụn.</p>
<p class="irIKAp">&nbsp;</p>
<p class="irIKAp">3/ Hướng dẫn sử dụng:</p>
<p class="irIKAp">B&ocirc;i 1 lớp mỏng tinh chất Cafun&eacute; l&ecirc;n v&ugrave;ng da bị mụn th&acirc;m sau khi đ&atilde; rửa sạch v&agrave; l&agrave;m kh&ocirc; ho&agrave;n to&agrave;n.</p>
<p class="irIKAp">&bull; Massage nhẹ nh&agrave;ng theo chuyển động tr&ograve;n cho đến khi tinh chất thấm v&agrave;o da.</p>
<p class="irIKAp">&bull; Sử dụng 1-2 lần/ng&agrave;y (S&aacute;ng v&agrave; Tối)</p>
<p class="irIKAp">&bull; Nếu c&oacute; k&iacute;ch ứng, giảm xuống 1 lần/ng&agrave;y</p>
<p class="irIKAp">&bull; Sử dụng cho đến khi đạt được kết quả mong muốn.</p>
<p class="irIKAp">4/ Lưu &yacute;:</p>
<p class="irIKAp">Sản phẩm chỉ d&ugrave;ng ngo&agrave;i da, để xa tầm tay trẻ em. Nếu gặp một số c&aacute;c dấu hiệu ở da như ban đỏ, n&oacute;ng r&aacute;t hay ngứa th&igrave; h&atilde;y giảm tần suất sử dụng.</p>
<p class="irIKAp">5/ Bảo quản: 15 - 30&deg;C, tr&aacute;nh &aacute;nh nắng trực tiếp</p>
<p class="irIKAp">6/ Hạn sử dụng: 3 năm kể từ ng&agrave;y sản xuất</p>
<p class="irIKAp">7/ Ti&ecirc;u chuẩn: Nh&agrave; sản xuất</p>', N'tamnguyen1766', N'1', 1, 300000, 27, N'Cafuné ')
GO
INSERT [dbo].[TaiKhoanTV] ([TKTV], [matKhau], [hinhDD], [hoDem], [tenTV], [ngaysinh], [gioiTinh], [soDT], [email], [diaChi], [trangThai], [ghiChu]) VALUES (N'admin', N'f865b53623b121fd34ee5426c792e5c33af8c227', N'/Assets/img/admin.jpg', N'admin', N'admin', CAST(N'2023-04-17T00:00:00.000' AS DateTime), 1, N'0000000000', N'admin@fivestar.com', N'TPHCM', 1, N'')
INSERT [dbo].[TaiKhoanTV] ([TKTV], [matKhau], [hinhDD], [hoDem], [tenTV], [ngaysinh], [gioiTinh], [soDT], [email], [diaChi], [trangThai], [ghiChu]) VALUES (N'bachsykhang', N'cae2e7d85443fb83aeffe74d1a01b605cd46a458', N'/Assets/img/HDDbachsykhang.jpg', N'bạch sỹ', N'khang', CAST(N'2023-04-17T20:55:44.733' AS DateTime), 1, N'0375595019', N'bachsykhang.it@gmail.com', N'sài gòn', 1, N'')
INSERT [dbo].[TaiKhoanTV] ([TKTV], [matKhau], [hinhDD], [hoDem], [tenTV], [ngaysinh], [gioiTinh], [soDT], [email], [diaChi], [trangThai], [ghiChu]) VALUES (N'bachsykhang78', N'96ded99ade7e41a894311579c32d75a746fb6986', N'/Assets/img/HDDbachsykhang78.jpg', N'bạch sỹ', N'khang', CAST(N'2023-04-20T20:03:45.850' AS DateTime), 1, N'0375595019', N'binxtin@gmail.com', N'Tp.Hồ Chí Minh', 1, N'')
INSERT [dbo].[TaiKhoanTV] ([TKTV], [matKhau], [hinhDD], [hoDem], [tenTV], [ngaysinh], [gioiTinh], [soDT], [email], [diaChi], [trangThai], [ghiChu]) VALUES (N'hai15042003', N'c8966e987f391bc6f2ba1de0279905d7bc4ade60', N'/Assets/img/HDDhai15042003.jpg', N'Nguyễn', N'Hải', NULL, 1, N'0377920917', N'haikoi150423@gmail.com', N'Hóc Môn,TP.HCM', 1, N'')
INSERT [dbo].[TaiKhoanTV] ([TKTV], [matKhau], [hinhDD], [hoDem], [tenTV], [ngaysinh], [gioiTinh], [soDT], [email], [diaChi], [trangThai], [ghiChu]) VALUES (N'hai555', N'20eabe5d64b0e216796e834f52d61fd0b70332fc', N'/Assets/img/HDDhai555.jpg', N'nguyen', N'hai', CAST(N'2023-04-20T04:51:43.987' AS DateTime), 1, N'8997868', N'hai@gmail.com', N'uiouoiuiouoi', 1, N'')
INSERT [dbo].[TaiKhoanTV] ([TKTV], [matKhau], [hinhDD], [hoDem], [tenTV], [ngaysinh], [gioiTinh], [soDT], [email], [diaChi], [trangThai], [ghiChu]) VALUES (N'nguyenhieu', N'88ea39439e74fa27c09a4fc0bc8ebe6d00978392', N'/Assets/img/HDDnguyenhieu.jpg', N'Nguyễn Xuân ', N'Hiếu', CAST(N'2023-04-17T20:45:13.037' AS DateTime), 1, N'0346456730', N'Sara.No.Sand@gmail.com', N'Q12 , Tp.HCM', 1, N'')
INSERT [dbo].[TaiKhoanTV] ([TKTV], [matKhau], [hinhDD], [hoDem], [tenTV], [ngaysinh], [gioiTinh], [soDT], [email], [diaChi], [trangThai], [ghiChu]) VALUES (N'nguyennguyen', N'8cb2237d0679ca88db6464eac60da96345513964', N'', N'Nguyenn', N'gnfgfg', CAST(N'2023-04-20T05:28:17.640' AS DateTime), 1, N'09898787', N'fdgsdfx@gmail.com', N'ypdspd', 1, N'')
INSERT [dbo].[TaiKhoanTV] ([TKTV], [matKhau], [hinhDD], [hoDem], [tenTV], [ngaysinh], [gioiTinh], [soDT], [email], [diaChi], [trangThai], [ghiChu]) VALUES (N'sykhang', N'96ded99ade7e41a894311579c32d75a746fb6986', N'/Assets/img/HDDsykhang.jpg', N'bạch sỹ', N'khang', CAST(N'2023-04-17T22:51:07.067' AS DateTime), 1, N'0999888777', N'test1@gmail.com', N'sai gon', 1, N'')
INSERT [dbo].[TaiKhoanTV] ([TKTV], [matKhau], [hinhDD], [hoDem], [tenTV], [ngaysinh], [gioiTinh], [soDT], [email], [diaChi], [trangThai], [ghiChu]) VALUES (N'tamnguyen1766', N'8cb2237d0679ca88db6464eac60da96345513964', N'', N'Nguyễn Thái', N'Tâm', CAST(N'2023-04-19T10:13:23.293' AS DateTime), 1, N'0908373779', N'tamnguyen1766@gmail.com', N'ấp 1', 1, N'')
INSERT [dbo].[TaiKhoanTV] ([TKTV], [matKhau], [hinhDD], [hoDem], [tenTV], [ngaysinh], [gioiTinh], [soDT], [email], [diaChi], [trangThai], [ghiChu]) VALUES (N'tphu123', N'a592498ccbe375ff47c085046cfc41de8b363e8d', N'/Assets/img/HDDtphu123.jpg', N'Lê Tấn', N'Phú', NULL, 1, N'0974613051', N'letanphu2906@gmail.com', N'Hóc Môn, TP HCM', 1, N'')
GO
INSERT [dbo].[ThongBao] ([soTB], [TKQT], [TKTV], [chuDe], [noiDung], [ngayTB], [trangThai]) VALUES (N'0420042840', N'admin', N'hai15042003', N'vi pham', N'<p>jljkljjl</p>', CAST(N'2023-04-20' AS Date), N'DDc')
INSERT [dbo].[ThongBao] ([soTB], [TKQT], [TKTV], [chuDe], [noiDung], [ngayTB], [trangThai]) VALUES (N'0420062939', N'admin', N'hai15042003', N'vi pham', N'<p>ggvhgcfchgchf</p>', CAST(N'2023-04-20' AS Date), N'DDc')
INSERT [dbo].[ThongBao] ([soTB], [TKQT], [TKTV], [chuDe], [noiDung], [ngayTB], [trangThai]) VALUES (N'0420122828', N'nguyenhieu', N'admin', N'gfv gfgggvggvg', NULL, CAST(N'2023-04-20' AS Date), N'DD')
INSERT [dbo].[ThongBao] ([soTB], [TKQT], [TKTV], [chuDe], [noiDung], [ngayTB], [trangThai]) VALUES (N'0426102003', N'bachsykhang78', N'admin', N'okla', N'<p>cxx</p>', CAST(N'2023-04-26' AS Date), N'DD')
INSERT [dbo].[ThongBao] ([soTB], [TKQT], [TKTV], [chuDe], [noiDung], [ngayTB], [trangThai]) VALUES (N'0426104702', N'admin', N'bachsykhang78', N'Test bug', N'<p>Test bug</p>', CAST(N'2023-04-26' AS Date), N'DDc')
INSERT [dbo].[ThongBao] ([soTB], [TKQT], [TKTV], [chuDe], [noiDung], [ngayTB], [trangThai]) VALUES (N'0427011543', N'admin', N'bachsykhang78', N'yêu cầu hỗ trợ', N'<p>ccx</p>', CAST(N'2023-04-27' AS Date), N'DDc')
INSERT [dbo].[ThongBao] ([soTB], [TKQT], [TKTV], [chuDe], [noiDung], [ngayTB], [trangThai]) VALUES (N'0427021642', N'admin', N'bachsykhang78', N'yêu cầu hỗ trợ', N'<p>fvfdff</p>', CAST(N'2023-04-27' AS Date), N'DDc')
INSERT [dbo].[ThongBao] ([soTB], [TKQT], [TKTV], [chuDe], [noiDung], [ngayTB], [trangThai]) VALUES (N'0427024902', N'admin', N'bachsykhang78', N'svsd', N'<p>sdsd</p>', CAST(N'2023-04-27' AS Date), N'DDc')
INSERT [dbo].[ThongBao] ([soTB], [TKQT], [TKTV], [chuDe], [noiDung], [ngayTB], [trangThai]) VALUES (N'0427024929', N'admin', N'bachsykhang78', N'sfvsfv', N'<p>vsd</p>', CAST(N'2023-04-27' AS Date), N'DDc')
INSERT [dbo].[ThongBao] ([soTB], [TKQT], [TKTV], [chuDe], [noiDung], [ngayTB], [trangThai]) VALUES (N'0427030647', N'admin', N'hai15042003', N'bfbfb', N'<p>bdfbdb</p>', CAST(N'2023-04-27' AS Date), N'DDc')
INSERT [dbo].[ThongBao] ([soTB], [TKQT], [TKTV], [chuDe], [noiDung], [ngayTB], [trangThai]) VALUES (N'0427031100', N'admin', N'bachsykhang78', N'liên hệ hỗ trợ', N'<p>li&ecirc;n hệ hỗ trợ ... l&agrave;m nhanh đii</p>', CAST(N'2023-04-27' AS Date), N'DDc')
INSERT [dbo].[ThongBao] ([soTB], [TKQT], [TKTV], [chuDe], [noiDung], [ngayTB], [trangThai]) VALUES (N'0427031337', N'admin', N'hai15042003', N'yêu cầu hỗ trợ', N'<p>hooho</p>', CAST(N'2023-04-27' AS Date), N'')
INSERT [dbo].[ThongBao] ([soTB], [TKQT], [TKTV], [chuDe], [noiDung], [ngayTB], [trangThai]) VALUES (N'0427031418', N'admin', N'tphu123', N'yêu cầu hỗ trợ', N'<p>dfbdf</p>', CAST(N'2023-04-27' AS Date), N'')
INSERT [dbo].[ThongBao] ([soTB], [TKQT], [TKTV], [chuDe], [noiDung], [ngayTB], [trangThai]) VALUES (N'0427044646', N'admin', N'bachsykhang78', N'thông báo', N'<p>abx</p>', CAST(N'2023-04-27' AS Date), N'')
INSERT [dbo].[ThongBao] ([soTB], [TKQT], [TKTV], [chuDe], [noiDung], [ngayTB], [trangThai]) VALUES (N'0427051333', N'sykhang', N'admin', N'thông báo', N'<p>abc</p>', CAST(N'2023-04-27' AS Date), N'DG')
INSERT [dbo].[ThongBao] ([soTB], [TKQT], [TKTV], [chuDe], [noiDung], [ngayTB], [trangThai]) VALUES (N'0427051542', N'admin', N'sykhang', N'thông báoth s', N'<p>123</p>', CAST(N'2023-04-27' AS Date), N'DDc')
INSERT [dbo].[ThongBao] ([soTB], [TKQT], [TKTV], [chuDe], [noiDung], [ngayTB], [trangThai]) VALUES (N'0427090712', N'admin', N'nguyenhieu', N'thông báo', N'<p>123</p>', CAST(N'2023-04-27' AS Date), N'DDc')
INSERT [dbo].[ThongBao] ([soTB], [TKQT], [TKTV], [chuDe], [noiDung], [ngayTB], [trangThai]) VALUES (N'0427125947', N'admin', N'bachsykhang78', N'Test bug', N'<p>Test bug</p>', CAST(N'2023-04-27' AS Date), N'DDc')
INSERT [dbo].[ThongBao] ([soTB], [TKQT], [TKTV], [chuDe], [noiDung], [ngayTB], [trangThai]) VALUES (N'2304170745', N'admin', N'hai15042003', N'Test Gửi thông báo', N'<p>Test demo</p>', CAST(N'2023-04-17' AS Date), N'DDc')
INSERT [dbo].[ThongBao] ([soTB], [TKQT], [TKTV], [chuDe], [noiDung], [ngayTB], [trangThai]) VALUES (N'2304180759', N'admin', N'sykhang', N'test', N'<p>ok</p>', CAST(N'2023-04-18' AS Date), N'DDc')
INSERT [dbo].[ThongBao] ([soTB], [TKQT], [TKTV], [chuDe], [noiDung], [ngayTB], [trangThai]) VALUES (N'2304180809', N'admin', N'sykhang', N'svsdsdv', N'<p>dvsdvsdv</p>', CAST(N'2023-04-18' AS Date), N'DDc')
INSERT [dbo].[ThongBao] ([soTB], [TKQT], [TKTV], [chuDe], [noiDung], [ngayTB], [trangThai]) VALUES (N'2304180903', N'admin', N'sykhang', N'thông báo', N'<p>ok</p>
<p>&nbsp;</p>', CAST(N'2023-04-18' AS Date), N'DDc')
INSERT [dbo].[ThongBao] ([soTB], [TKQT], [TKTV], [chuDe], [noiDung], [ngayTB], [trangThai]) VALUES (N'2304180904', N'admin', N'sykhang', N'vsv', N'<p>sdv</p>', CAST(N'2023-04-18' AS Date), N'DDc')
INSERT [dbo].[ThongBao] ([soTB], [TKQT], [TKTV], [chuDe], [noiDung], [ngayTB], [trangThai]) VALUES (N'2304190414', N'admin', N'bachsykhang', N'vi phạm lỗi abc', N'<p>cần khắc phục</p>', CAST(N'2023-04-19' AS Date), N'DDc')
INSERT [dbo].[ThongBao] ([soTB], [TKQT], [TKTV], [chuDe], [noiDung], [ngayTB], [trangThai]) VALUES (N'2304190925', N'admin', N'hai15042003', N'vi pham', NULL, CAST(N'2023-04-19' AS Date), N'DDc')
GO