USE [master]
GO
/****** Object:  Database [QL_Duoc1]    Script Date: 2/28/2019 10:03:54 AM ******/
CREATE DATABASE [QL_Duoc1] ON  PRIMARY 
( NAME = N'QL_Duoc1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\QL_Duoc1.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QL_Duoc1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\QL_Duoc1_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QL_Duoc1] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QL_Duoc1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QL_Duoc1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QL_Duoc1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QL_Duoc1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QL_Duoc1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QL_Duoc1] SET ARITHABORT OFF 
GO
ALTER DATABASE [QL_Duoc1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QL_Duoc1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QL_Duoc1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QL_Duoc1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QL_Duoc1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QL_Duoc1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QL_Duoc1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QL_Duoc1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QL_Duoc1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QL_Duoc1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QL_Duoc1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QL_Duoc1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QL_Duoc1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QL_Duoc1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QL_Duoc1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QL_Duoc1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QL_Duoc1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QL_Duoc1] SET RECOVERY FULL 
GO
ALTER DATABASE [QL_Duoc1] SET  MULTI_USER 
GO
ALTER DATABASE [QL_Duoc1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QL_Duoc1] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QL_Duoc1', N'ON'
GO
USE [QL_Duoc1]
GO
/****** Object:  User [hoainam]    Script Date: 2/28/2019 10:03:55 AM ******/
CREATE USER [hoainam] FOR LOGIN [hoainam] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [hoainam]
GO
/****** Object:  Table [dbo].[ChiTietHoaDonMua]    Script Date: 2/28/2019 10:03:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDonMua](
	[MaHD] [nvarchar](50) NOT NULL,
	[MaDT] [nvarchar](50) NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [int] NULL,
 CONSTRAINT [PK_ChiTietPhieuDKMua] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DauThuoc]    Script Date: 2/28/2019 10:03:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DauThuoc](
	[MaDT] [nvarchar](50) NOT NULL,
	[TenDauThuoc] [nvarchar](150) NULL,
	[ChiTiet] [nvarchar](500) NULL,
	[Gia] [int] NULL,
	[GiaMoi] [int] NULL,
	[Image] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[MaNhomThuoc] [nvarchar](50) NULL,
	[MaNSX] [nvarchar](50) NULL,
 CONSTRAINT [PK_DauThuoc] PRIMARY KEY CLUSTERED 
(
	[MaDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDonMua]    Script Date: 2/28/2019 10:03:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonMua](
	[MaHD] [nvarchar](50) NOT NULL,
	[MaKH] [nvarchar](50) NULL,
	[NgayMua] [datetime] NULL,
	[MaTK] [nvarchar](50) NULL,
	[TrangThai] [int] NULL,
	[MaHoaDonVanChuyen] [nvarchar](50) NULL,
 CONSTRAINT [PK_HoaDonMua] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDonVanChuyen]    Script Date: 2/28/2019 10:03:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonVanChuyen](
	[MaHoaDonVanChuyen] [nvarchar](50) NOT NULL,
	[MaNguoiVanChuyen] [nvarchar](50) NULL,
	[NgayGioVanChuyen] [datetime] NULL,
	[SoGioDuTinh] [int] NULL,
 CONSTRAINT [PK_HoaDonVanChuyen] PRIMARY KEY CLUSTERED 
(
	[MaHoaDonVanChuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 2/28/2019 10:03:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [nvarchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](500) NULL,
	[SDT] [nvarchar](20) NULL,
	[Email] [nvarchar](150) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhaSanXuat]    Script Date: 2/28/2019 10:03:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaSanXuat](
	[MaNSX] [nvarchar](50) NOT NULL,
	[TenNSX] [nvarchar](150) NULL,
	[DiaChi] [nvarchar](500) NULL,
	[SDT] [nvarchar](20) NULL,
	[Email] [nvarchar](150) NULL,
 CONSTRAINT [PK_NhaSanXuat] PRIMARY KEY CLUSTERED 
(
	[MaNSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhomDauThuoc]    Script Date: 2/28/2019 10:03:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomDauThuoc](
	[MaNhomDauThuoc] [nvarchar](50) NOT NULL,
	[TenNhom] [nvarchar](150) NULL,
	[Image] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
 CONSTRAINT [PK_NhomDauThuoc] PRIMARY KEY CLUSTERED 
(
	[MaNhomDauThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuanHuyen]    Script Date: 2/28/2019 10:03:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuanHuyen](
	[ID] [int] NOT NULL,
	[TenQuanHuyen] [nvarchar](150) NULL,
	[IDTinhThanh] [int] NULL,
 CONSTRAINT [PK_QuanHuyen] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 2/28/2019 10:03:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaTK] [nvarchar](50) NOT NULL,
	[TenTaiKhoan] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[HoTen] [nvarchar](50) NULL,
	[MaQuyen] [int] NULL,
	[MaTD] [nvarchar](50) NULL,
	[MaKH] [nvarchar](50) NULL,
	[MaNguoiVanChuyen] [nvarchar](50) NULL,
	[MaNSX] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[MaTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TinhThanhPho]    Script Date: 2/28/2019 10:03:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinhThanhPho](
	[ID] [int] NOT NULL,
	[TenTinh] [nvarchar](150) NULL,
 CONSTRAINT [PK_TinhThanhPho] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TrinhDuoc]    Script Date: 2/28/2019 10:03:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrinhDuoc](
	[MaTD] [nvarchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[SDT] [nvarchar](20) NULL,
	[NgaySinh] [datetime] NULL,
	[DiaChi] [nvarchar](max) NULL,
	[KhuVuc] [nvarchar](250) NULL,
	[TrangThai] [int] NULL,
	[DanhGia] [float] NULL,
	[LuongTieuThu] [int] NULL,
 CONSTRAINT [PK_TrinhDuoc] PRIMARY KEY CLUSTERED 
(
	[MaTD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TrinhDuocKhachHang]    Script Date: 2/28/2019 10:03:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrinhDuocKhachHang](
	[MaTD] [nvarchar](50) NOT NULL,
	[MaKH] [nvarchar](50) NOT NULL,
	[NgayBatDau] [datetime] NOT NULL,
	[NgayKetThuc] [datetime] NULL,
 CONSTRAINT [PK_TrinhDuocKhachHang] PRIMARY KEY CLUSTERED 
(
	[MaTD] ASC,
	[MaKH] ASC,
	[NgayBatDau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VanChuyen]    Script Date: 2/28/2019 10:03:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VanChuyen](
	[MaNguoiVanChuyen] [nvarchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](500) NULL,
	[SDT] [nvarchar](20) NULL,
	[Email] [nvarchar](150) NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_VanChuyen] PRIMARY KEY CLUSTERED 
(
	[MaNguoiVanChuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[DauThuoc] ([MaDT], [TenDauThuoc], [ChiTiet], [Gia], [GiaMoi], [Image], [Status], [MaNhomThuoc], [MaNSX]) VALUES (N'DT000001', N'Ampicillin', N'kháng sinh', 10000, 10000, N'', N'', N'MNT000001', N'SX000001')
INSERT [dbo].[DauThuoc] ([MaDT], [TenDauThuoc], [ChiTiet], [Gia], [GiaMoi], [Image], [Status], [MaNhomThuoc], [MaNSX]) VALUES (N'DT000002', N'Berberin', N'trị đau bụng', 10000, 10000, N'', N'', N'MNT000002', N'SX000002')
INSERT [dbo].[DauThuoc] ([MaDT], [TenDauThuoc], [ChiTiet], [Gia], [GiaMoi], [Image], [Status], [MaNhomThuoc], [MaNSX]) VALUES (N'DT000003', N'Trimeseptol', N'Nhiễm Khuẩn', 10000, 10000, N'', N'', N'MNT000003', N'SX000003')
INSERT [dbo].[DauThuoc] ([MaDT], [TenDauThuoc], [ChiTiet], [Gia], [GiaMoi], [Image], [Status], [MaNhomThuoc], [MaNSX]) VALUES (N'DT000004', N'Probiotic', N'men vi sinh', 10000, 10000, N'', N'', N'MNT000004', N'SX000004')
INSERT [dbo].[DauThuoc] ([MaDT], [TenDauThuoc], [ChiTiet], [Gia], [GiaMoi], [Image], [Status], [MaNhomThuoc], [MaNSX]) VALUES (N'DT000005', N'Super Fucoidan', N'Hỗ trợ trị ung thư', 10000, 10000, N'', N'', N'MNT000005', N'SX000005')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [DiaChi], [SDT], [Email]) VALUES (N'KH000001', N'Lê Văn A', N'Hoàng Mai-Hà Nội', N'123456', N'A@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [DiaChi], [SDT], [Email]) VALUES (N'KH000002', N'Lê Văn B', N'Hoàng Mai-Hà Nội', N'123457', N'B@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [DiaChi], [SDT], [Email]) VALUES (N'KH000003', N'Lê Văn C', N'Hoàng Mai-Hà Nội', N'123458', N'C@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [DiaChi], [SDT], [Email]) VALUES (N'KH000004', N'Lê Văn D', N'Hoàng Mai-Hà Nội', N'123459', N'D@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [DiaChi], [SDT], [Email]) VALUES (N'KH000005', N'Lê Văn E', N'Hoàng Mai-Hà Nội', N'123460', N'E@gmail.com')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChi], [SDT], [Email]) VALUES (N'SX000001', N'CTCP TRAPHACO', N'Hoàng Mai-Hà Nội', N'123456', N'A@gmail.com')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChi], [SDT], [Email]) VALUES (N'SX000002', N'CTCP PYMEPHARCO', N'Hoàng Mai-Hà Nội', N'123456', N'B@gmail.com')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChi], [SDT], [Email]) VALUES (N'SX000003', N'CTCP Dược Hà Tây', N'Hoàng Mai-Hà Nội', N'123456', N'C@gmail.com')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChi], [SDT], [Email]) VALUES (N'SX000004', N'CTCP Dược OPC', N'Hoàng Mai-Hà Nội', N'123456', N'D@gmail.com')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChi], [SDT], [Email]) VALUES (N'SX000005', N'CTCP Dược Nam Hà', N'Hoàng Mai-Hà Nội', N'123456', N'E@gmail.com')
INSERT [dbo].[NhomDauThuoc] ([MaNhomDauThuoc], [TenNhom], [Image], [Status]) VALUES (N'MNT000001', N'KhangSinh', NULL, NULL)
INSERT [dbo].[NhomDauThuoc] ([MaNhomDauThuoc], [TenNhom], [Image], [Status]) VALUES (N'MNT000002', N'ĐauBụng', NULL, NULL)
INSERT [dbo].[NhomDauThuoc] ([MaNhomDauThuoc], [TenNhom], [Image], [Status]) VALUES (N'MNT000003', N'NhiemTrung', NULL, NULL)
INSERT [dbo].[NhomDauThuoc] ([MaNhomDauThuoc], [TenNhom], [Image], [Status]) VALUES (N'MNT000004', N'DuongRuot', NULL, NULL)
INSERT [dbo].[NhomDauThuoc] ([MaNhomDauThuoc], [TenNhom], [Image], [Status]) VALUES (N'MNT000005', N'UngThu', NULL, NULL)
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTaiKhoan], [MatKhau], [HoTen], [MaQuyen], [MaTD], [MaKH], [MaNguoiVanChuyen], [MaNSX]) VALUES (N'TK000001', N'admin', N'1', N'Nguyễn Hoài Nam', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTaiKhoan], [MatKhau], [HoTen], [MaQuyen], [MaTD], [MaKH], [MaNguoiVanChuyen], [MaNSX]) VALUES (N'TK000002', N'trinhduoc', N'1', N'Hồ Văn Bảo', 2, N'TD000001', NULL, NULL, NULL)
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTaiKhoan], [MatKhau], [HoTen], [MaQuyen], [MaTD], [MaKH], [MaNguoiVanChuyen], [MaNSX]) VALUES (N'TK000003', N'khachhang', N'1', N'Phạm Bá Toại', 3, NULL, N'KH000001', NULL, NULL)
INSERT [dbo].[TrinhDuoc] ([MaTD], [HoTen], [SDT], [NgaySinh], [DiaChi], [KhuVuc], [TrangThai], [DanhGia], [LuongTieuThu]) VALUES (N'TD000001', N'Nguyễn Văn An', N'123456', CAST(N'2018-11-10 00:00:00.000' AS DateTime), N'Hoàng Mai-Hà Nội', N'Hoàng Mai-Hà Nội', NULL, NULL, NULL)
INSERT [dbo].[TrinhDuoc] ([MaTD], [HoTen], [SDT], [NgaySinh], [DiaChi], [KhuVuc], [TrangThai], [DanhGia], [LuongTieuThu]) VALUES (N'TD000002', N'Nguyễn Văn B', N'123457', CAST(N'2018-11-11 00:00:00.000' AS DateTime), N'Hoàng Mai-Hà Nội', N'Hoàng Mai-Hà Nội', NULL, NULL, NULL)
INSERT [dbo].[TrinhDuoc] ([MaTD], [HoTen], [SDT], [NgaySinh], [DiaChi], [KhuVuc], [TrangThai], [DanhGia], [LuongTieuThu]) VALUES (N'TD000003', N'Nguyễn Văn C', N'123458', CAST(N'2018-11-12 00:00:00.000' AS DateTime), N'Hoàng Mai-Hà Nội', N'Hoàng Mai-Hà Nội', NULL, NULL, NULL)
INSERT [dbo].[TrinhDuoc] ([MaTD], [HoTen], [SDT], [NgaySinh], [DiaChi], [KhuVuc], [TrangThai], [DanhGia], [LuongTieuThu]) VALUES (N'TD000004', N'Nguyễn Văn D', N'123459', CAST(N'2018-11-13 00:00:00.000' AS DateTime), N'Hoàng Mai-Hà Nội', N'Hoàng Mai-Hà Nội', NULL, NULL, NULL)
INSERT [dbo].[TrinhDuoc] ([MaTD], [HoTen], [SDT], [NgaySinh], [DiaChi], [KhuVuc], [TrangThai], [DanhGia], [LuongTieuThu]) VALUES (N'TD000005', N'Nguyễn Văn E', N'123460', CAST(N'2018-11-14 00:00:00.000' AS DateTime), N'Hoàng Mai-Hà Nội', N'Hoàng Mai-Hà Nội', NULL, NULL, NULL)
INSERT [dbo].[VanChuyen] ([MaNguoiVanChuyen], [HoTen], [DiaChi], [SDT], [Email], [TrangThai]) VALUES (N'HDVC000001', N'NCV001', N'20/10/2018', N'2', NULL, NULL)
INSERT [dbo].[VanChuyen] ([MaNguoiVanChuyen], [HoTen], [DiaChi], [SDT], [Email], [TrangThai]) VALUES (N'HDVC000002', N'NCV002', N'20/10/2019', N'3', NULL, NULL)
INSERT [dbo].[VanChuyen] ([MaNguoiVanChuyen], [HoTen], [DiaChi], [SDT], [Email], [TrangThai]) VALUES (N'HDVC000003', N'NCV003', N'20/10/2020', N'2', NULL, NULL)
INSERT [dbo].[VanChuyen] ([MaNguoiVanChuyen], [HoTen], [DiaChi], [SDT], [Email], [TrangThai]) VALUES (N'HDVC000004', N'NCV004', N'20/10/2021', N'2', NULL, NULL)
INSERT [dbo].[VanChuyen] ([MaNguoiVanChuyen], [HoTen], [DiaChi], [SDT], [Email], [TrangThai]) VALUES (N'HDVC000005', N'NCV005', N'20/10/2022', N'2', NULL, NULL)
ALTER TABLE [dbo].[ChiTietHoaDonMua]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuDKMua_DauThuoc] FOREIGN KEY([MaDT])
REFERENCES [dbo].[DauThuoc] ([MaDT])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHoaDonMua] CHECK CONSTRAINT [FK_ChiTietPhieuDKMua_DauThuoc]
GO
ALTER TABLE [dbo].[ChiTietHoaDonMua]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuDKMua_HoaDonMua] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDonMua] ([MaHD])
GO
ALTER TABLE [dbo].[ChiTietHoaDonMua] CHECK CONSTRAINT [FK_ChiTietPhieuDKMua_HoaDonMua]
GO
ALTER TABLE [dbo].[DauThuoc]  WITH CHECK ADD  CONSTRAINT [FK_DauThuoc_NhaSanXuat] FOREIGN KEY([MaNSX])
REFERENCES [dbo].[NhaSanXuat] ([MaNSX])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DauThuoc] CHECK CONSTRAINT [FK_DauThuoc_NhaSanXuat]
GO
ALTER TABLE [dbo].[DauThuoc]  WITH CHECK ADD  CONSTRAINT [FK_DauThuoc_NhomDauThuoc] FOREIGN KEY([MaNhomThuoc])
REFERENCES [dbo].[NhomDauThuoc] ([MaNhomDauThuoc])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DauThuoc] CHECK CONSTRAINT [FK_DauThuoc_NhomDauThuoc]
GO
ALTER TABLE [dbo].[HoaDonMua]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonMua_HoaDonVanChuyen] FOREIGN KEY([MaHoaDonVanChuyen])
REFERENCES [dbo].[HoaDonVanChuyen] ([MaHoaDonVanChuyen])
GO
ALTER TABLE [dbo].[HoaDonMua] CHECK CONSTRAINT [FK_HoaDonMua_HoaDonVanChuyen]
GO
ALTER TABLE [dbo].[HoaDonMua]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonMua_TaiKhoan] FOREIGN KEY([MaTK])
REFERENCES [dbo].[TaiKhoan] ([MaTK])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDonMua] CHECK CONSTRAINT [FK_HoaDonMua_TaiKhoan]
GO
ALTER TABLE [dbo].[HoaDonVanChuyen]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonVanChuyen_VanChuyen] FOREIGN KEY([MaNguoiVanChuyen])
REFERENCES [dbo].[VanChuyen] ([MaNguoiVanChuyen])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDonVanChuyen] CHECK CONSTRAINT [FK_HoaDonVanChuyen_VanChuyen]
GO
ALTER TABLE [dbo].[QuanHuyen]  WITH CHECK ADD  CONSTRAINT [FK_QuanHuyen_TinhThanhPho] FOREIGN KEY([IDTinhThanh])
REFERENCES [dbo].[TinhThanhPho] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[QuanHuyen] CHECK CONSTRAINT [FK_QuanHuyen_TinhThanhPho]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_KhachHang]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_NhaSanXuat] FOREIGN KEY([MaNSX])
REFERENCES [dbo].[NhaSanXuat] ([MaNSX])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_NhaSanXuat]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_TrinhDuoc] FOREIGN KEY([MaTD])
REFERENCES [dbo].[TrinhDuoc] ([MaTD])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_TrinhDuoc]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_VanChuyen] FOREIGN KEY([MaNguoiVanChuyen])
REFERENCES [dbo].[VanChuyen] ([MaNguoiVanChuyen])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_VanChuyen]
GO
ALTER TABLE [dbo].[TrinhDuocKhachHang]  WITH CHECK ADD  CONSTRAINT [FK_TrinhDuocKhachHang_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TrinhDuocKhachHang] CHECK CONSTRAINT [FK_TrinhDuocKhachHang_KhachHang]
GO
ALTER TABLE [dbo].[TrinhDuocKhachHang]  WITH CHECK ADD  CONSTRAINT [FK_TrinhDuocKhachHang_TrinhDuoc] FOREIGN KEY([MaTD])
REFERENCES [dbo].[TrinhDuoc] ([MaTD])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TrinhDuocKhachHang] CHECK CONSTRAINT [FK_TrinhDuocKhachHang_TrinhDuoc]
GO
/****** Object:  StoredProcedure [dbo].[Tk_Account_login]    Script Date: 2/28/2019 10:03:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Tk_Account_login]
(
	@tenTaiKhoan nvarchar(50),
	@matKhau nvarchar(50)
)
as
begin
	declare @count int
	declare @res bit
	select @count = count(*) from TaiKhoan where TaiKhoan = @tenTaiKhoan and MatKhau = @matKhau
	if @count > 0
		set @res = 1
	else
		set @res = 0
	select @res
end

GO
USE [master]
GO
ALTER DATABASE [QL_Duoc1] SET  READ_WRITE 
GO
