USE [master]
GO
/****** Object:  Database [QL_Duoc1]    Script Date: 3/26/2019 5:21:46 PM ******/
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
/****** Object:  User [hoainam]    Script Date: 3/26/2019 5:21:46 PM ******/
CREATE USER [hoainam] FOR LOGIN [hoainam] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [hoainam]
GO
/****** Object:  Table [dbo].[ChiTietHoaDonMua]    Script Date: 3/26/2019 5:21:46 PM ******/
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
/****** Object:  Table [dbo].[DauThuoc]    Script Date: 3/26/2019 5:21:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DauThuoc](
	[MaDT] [nvarchar](50) NOT NULL,
	[TenDauThuoc] [nvarchar](150) NULL,
	[CongDung] [nvarchar](max) NULL,
	[CachDung] [nvarchar](500) NULL,
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
/****** Object:  Table [dbo].[HoaDonMua]    Script Date: 3/26/2019 5:21:46 PM ******/
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
/****** Object:  Table [dbo].[HoaDonVanChuyen]    Script Date: 3/26/2019 5:21:46 PM ******/
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
/****** Object:  Table [dbo].[KeHoachLamViec]    Script Date: 3/26/2019 5:21:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KeHoachLamViec](
	[ID] [nvarchar](50) NOT NULL,
	[CongViec] [nvarchar](max) NULL,
	[TrangThai1] [int] NULL,
	[TrangThai2] [int] NULL,
	[GhiChu] [nvarchar](500) NULL,
	[MaTD] [nvarchar](50) NULL,
 CONSTRAINT [PK_KeHoachLamViec] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 3/26/2019 5:21:46 PM ******/
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
/****** Object:  Table [dbo].[Kho]    Script Date: 3/26/2019 5:21:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kho](
	[MaKho] [nvarchar](50) NOT NULL,
	[TenKho] [nvarchar](500) NULL,
	[DiaChi] [nvarchar](500) NULL,
	[SDT] [nvarchar](20) NULL,
 CONSTRAINT [PK_Kho] PRIMARY KEY CLUSTERED 
(
	[MaKho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhoNhaVien]    Script Date: 3/26/2019 5:21:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhoNhaVien](
	[ID] [nvarchar](50) NOT NULL,
	[MaKho] [nvarchar](50) NULL,
	[MaTK] [nvarchar](50) NULL,
	[ChucVu] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhoNhaVien] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhuyenMai]    Script Date: 3/26/2019 5:21:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuyenMai](
	[ID] [nvarchar](50) NOT NULL,
	[TenChuongTrinh] [nvarchar](500) NULL,
	[ChuDe] [nvarchar](500) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[Image] [nvarchar](500) NULL,
	[ThoiGianBatDau] [datetime] NULL,
	[ThoiGianKetThuc] [datetime] NULL,
 CONSTRAINT [PK_KhuyenMai] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhuyenMaiDauThuoc]    Script Date: 3/26/2019 5:21:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuyenMaiDauThuoc](
	[ID] [nvarchar](50) NOT NULL,
	[MaKM] [nvarchar](50) NULL,
	[MaDT] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhuyenMaiDauThuoc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhaSanXuat]    Script Date: 3/26/2019 5:21:46 PM ******/
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
/****** Object:  Table [dbo].[NhomDauThuoc]    Script Date: 3/26/2019 5:21:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomDauThuoc](
	[MaNhomThuoc] [nvarchar](50) NOT NULL,
	[TenNhom] [nvarchar](150) NULL,
	[Image] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
 CONSTRAINT [PK_NhomDauThuoc] PRIMARY KEY CLUSTERED 
(
	[MaNhomThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhomQuyen]    Script Date: 3/26/2019 5:21:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomQuyen](
	[MaNhomQuyen] [int] IDENTITY(1,1) NOT NULL,
	[TenNhomQuyen] [nvarchar](150) NULL,
	[MoTa] [nvarchar](500) NULL,
 CONSTRAINT [PK_NhomQuyen] PRIMARY KEY CLUSTERED 
(
	[MaNhomQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhomQuyenRoute]    Script Date: 3/26/2019 5:21:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomQuyenRoute](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaNhomQuyen] [int] NULL,
	[IDRoute] [int] NULL,
 CONSTRAINT [PK_NhomQuyenRoute] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Page]    Script Date: 3/26/2019 5:21:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Page](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](max) NULL,
	[controller] [nvarchar](250) NULL,
	[namespace] [nvarchar](250) NULL,
 CONSTRAINT [PK_Page] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuanHuyen]    Script Date: 3/26/2019 5:21:46 PM ******/
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
/****** Object:  Table [dbo].[Route]    Script Date: 3/26/2019 5:21:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Route](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Namespace] [nvarchar](250) NULL,
	[Controller] [nvarchar](250) NULL,
	[Action] [nvarchar](250) NULL,
	[Name] [nvarchar](250) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Route] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 3/26/2019 5:21:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaTK] [nvarchar](50) NOT NULL,
	[TenTaiKhoan] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[HoTen] [nvarchar](50) NULL,
	[SDT] [nvarchar](20) NULL,
	[Email] [nvarchar](250) NULL,
	[MaQuyen] [int] NULL,
	[MaNhomQuyen] [int] NULL,
	[MaTD] [nvarchar](50) NULL,
	[MaKH] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[MaTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TinhThanhPho]    Script Date: 3/26/2019 5:21:46 PM ******/
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
/****** Object:  Table [dbo].[TrinhDuoc]    Script Date: 3/26/2019 5:21:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrinhDuoc](
	[MaTD] [nvarchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[SDT] [nvarchar](20) NULL,
	[NgaySinh] [nvarchar](50) NULL,
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
/****** Object:  Table [dbo].[TrinhDuocKhachHang]    Script Date: 3/26/2019 5:21:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrinhDuocKhachHang](
	[MaTD] [nvarchar](50) NOT NULL,
	[MaKH] [nvarchar](50) NOT NULL,
	[NgayBatDau] [datetime] NOT NULL,
	[NgayKetThuc] [datetime] NULL,
 CONSTRAINT [PK_TrinhDuocKhachHang_1] PRIMARY KEY CLUSTERED 
(
	[MaTD] ASC,
	[MaKH] ASC,
	[NgayBatDau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VanChuyen]    Script Date: 3/26/2019 5:21:46 PM ******/
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
INSERT [dbo].[ChiTietHoaDonMua] ([MaHD], [MaDT], [SoLuong], [DonGia]) VALUES (N'HD000001', N'DT000001', 3, 30000)
INSERT [dbo].[ChiTietHoaDonMua] ([MaHD], [MaDT], [SoLuong], [DonGia]) VALUES (N'HD000002', N'DT000007', 5, 50000)
INSERT [dbo].[ChiTietHoaDonMua] ([MaHD], [MaDT], [SoLuong], [DonGia]) VALUES (N'HD000003', N'DT000008', 3, 30000)
INSERT [dbo].[ChiTietHoaDonMua] ([MaHD], [MaDT], [SoLuong], [DonGia]) VALUES (N'HD000003', N'DT000014', 3, 30000)
INSERT [dbo].[ChiTietHoaDonMua] ([MaHD], [MaDT], [SoLuong], [DonGia]) VALUES (N'HD000004', N'DT000001', 2, 20000)
INSERT [dbo].[ChiTietHoaDonMua] ([MaHD], [MaDT], [SoLuong], [DonGia]) VALUES (N'HD000005', N'DT000006', 3, 30000)
INSERT [dbo].[ChiTietHoaDonMua] ([MaHD], [MaDT], [SoLuong], [DonGia]) VALUES (N'HD000006', N'DT000004', 3, 30000)
INSERT [dbo].[DauThuoc] ([MaDT], [TenDauThuoc], [CongDung], [CachDung], [Gia], [GiaMoi], [Image], [Status], [MaNhomThuoc], [MaNSX]) VALUES (N'DT000001', N'Ampicillin', N'kháng sinh', N'kháng sinh', 10000, 10000, N'Ampicillin', NULL, N'NT000001', N'SX000001')
INSERT [dbo].[DauThuoc] ([MaDT], [TenDauThuoc], [CongDung], [CachDung], [Gia], [GiaMoi], [Image], [Status], [MaNhomThuoc], [MaNSX]) VALUES (N'DT000002', N'Amoxicillin_500mg_785', N'kháng sinh', N'kháng sinh', 10000, 10000, N'Amoxicillin_500mg_785', N'', N'NT000001', N'SX000001')
INSERT [dbo].[DauThuoc] ([MaDT], [TenDauThuoc], [CongDung], [CachDung], [Gia], [GiaMoi], [Image], [Status], [MaNhomThuoc], [MaNSX]) VALUES (N'DT000003', N'khang sinh 151117', N'kháng sinh', N'kháng sinh', 10000, 10000, N'khang sinh 151117', N'', N'NT000001', N'SX000001')
INSERT [dbo].[DauThuoc] ([MaDT], [TenDauThuoc], [CongDung], [CachDung], [Gia], [GiaMoi], [Image], [Status], [MaNhomThuoc], [MaNSX]) VALUES (N'DT000004', N'levofloxacin', N'kháng sinh', N'kháng sinh', 10000, 10000, N'levofloxacin', N'', N'NT000001', N'SX000001')
INSERT [dbo].[DauThuoc] ([MaDT], [TenDauThuoc], [CongDung], [CachDung], [Gia], [GiaMoi], [Image], [Status], [MaNhomThuoc], [MaNSX]) VALUES (N'DT000005', N'Mekocefal_250', N'kháng sinh', N'kháng sinh', 10000, 10000, N'Mekocefal_250', N'', N'NT000001', N'SX000001')
INSERT [dbo].[DauThuoc] ([MaDT], [TenDauThuoc], [CongDung], [CachDung], [Gia], [GiaMoi], [Image], [Status], [MaNhomThuoc], [MaNSX]) VALUES (N'DT000006', N'Berberine_100mg_431', N'trị đau bụng', N'trị đau bụng', 10000, 10000, N'Berberine_100mg_431', N'', N'NT000002', N'SX000002')
INSERT [dbo].[DauThuoc] ([MaDT], [TenDauThuoc], [CongDung], [CachDung], [Gia], [GiaMoi], [Image], [Status], [MaNhomThuoc], [MaNSX]) VALUES (N'DT000007', N'ích mau', N'trị đau bụng', N'trị đau bụng', 10000, 10000, N'ích mau', N'', N'NT000002', N'SX000002')
INSERT [dbo].[DauThuoc] ([MaDT], [TenDauThuoc], [CongDung], [CachDung], [Gia], [GiaMoi], [Image], [Status], [MaNhomThuoc], [MaNSX]) VALUES (N'DT000008', N'moc_hoa_trang_1489456096', N'trị đau bụng', N'trị đau bụng', 10000, 10000, N'moc_hoa_trang_1489456096', N'', N'NT000002', N'SX000002')
INSERT [dbo].[DauThuoc] ([MaDT], [TenDauThuoc], [CongDung], [CachDung], [Gia], [GiaMoi], [Image], [Status], [MaNhomThuoc], [MaNSX]) VALUES (N'DT000009', N'Trimeseptol', N'Nhiễm Trùng', N'Nhiễm Trùng', 10000, 10000, N'Trimeseptol', N'', N'NT000003', N'SX000003')
INSERT [dbo].[DauThuoc] ([MaDT], [TenDauThuoc], [CongDung], [CachDung], [Gia], [GiaMoi], [Image], [Status], [MaNhomThuoc], [MaNSX]) VALUES (N'DT000010', N'5914_tygacil_iv_50mg', N'Nhiễm Trùng', N'Nhiễm Trùng', 10000, 10000, N'5914_tygacil_iv_50mg', N'', N'NT000003', N'SX000003')
INSERT [dbo].[DauThuoc] ([MaDT], [TenDauThuoc], [CongDung], [CachDung], [Gia], [GiaMoi], [Image], [Status], [MaNhomThuoc], [MaNSX]) VALUES (N'DT000011', N'cefuroxim_1', N'Nhiễm Trùng', N'Nhiễm Trùng', 10000, 10000, N'cefuroxim_1', N'', N'NT000003', N'SX000003')
INSERT [dbo].[DauThuoc] ([MaDT], [TenDauThuoc], [CongDung], [CachDung], [Gia], [GiaMoi], [Image], [Status], [MaNhomThuoc], [MaNSX]) VALUES (N'DT000012', N'Genbay_8_30316', N'Nhiễm Trùng', N'Nhiễm Trùng', 10000, 10000, N'Genbay_8_30316', N'', N'NT000003', N'SX000003')
INSERT [dbo].[DauThuoc] ([MaDT], [TenDauThuoc], [CongDung], [CachDung], [Gia], [GiaMoi], [Image], [Status], [MaNhomThuoc], [MaNSX]) VALUES (N'DT000013', N'vinphaco_media_5a38c7447518b', N'Nhiễm Trùng', N'Nhiễm Trùng', 10000, 10000, N'vinphaco_media_5a38c7447518b', N'', N'NT000003', N'SX000003')
INSERT [dbo].[DauThuoc] ([MaDT], [TenDauThuoc], [CongDung], [CachDung], [Gia], [GiaMoi], [Image], [Status], [MaNhomThuoc], [MaNSX]) VALUES (N'DT000014', N'0000389_samibio_tam_biet_tao_bon', N'Đường ruột', N'Đường ruột', 10000, 10000, N'0000389_samibio_tam_biet_tao_bon', N'', N'NT000004', N'SX000004')
INSERT [dbo].[DauThuoc] ([MaDT], [TenDauThuoc], [CongDung], [CachDung], [Gia], [GiaMoi], [Image], [Status], [MaNhomThuoc], [MaNSX]) VALUES (N'DT000015', N'00017036_olymediges_gold_20_goi_x_3g_4477_5bb3_large', N'Đường ruột', N'Đường ruột', 10000, 10000, N'00017036_olymediges_gold_20_goi_x_3g_4477_5bb3_large', N'', N'NT000004', N'SX000004')
INSERT [dbo].[DauThuoc] ([MaDT], [TenDauThuoc], [CongDung], [CachDung], [Gia], [GiaMoi], [Image], [Status], [MaNhomThuoc], [MaNSX]) VALUES (N'DT000016', N'Bluemin 3_900x900', N'Đường ruột', N'Đường ruột', 10000, 10000, N'Bluemin 3_900x900', N'', N'NT000004', N'SX000004')
INSERT [dbo].[DauThuoc] ([MaDT], [TenDauThuoc], [CongDung], [CachDung], [Gia], [GiaMoi], [Image], [Status], [MaNhomThuoc], [MaNSX]) VALUES (N'DT000017', N'dai_trang_02_thumb', N'Đường ruột', N'Đường ruột', 10000, 10000, N'dai_trang_02_thumb', N'', N'NT000004', N'SX000004')
INSERT [dbo].[DauThuoc] ([MaDT], [TenDauThuoc], [CongDung], [CachDung], [Gia], [GiaMoi], [Image], [Status], [MaNhomThuoc], [MaNSX]) VALUES (N'DT000018', N'biovita', N'Đường ruột', N'Đường ruột', 10000, 10000, N'biovita', N'', N'NT000004', N'SX000004')
INSERT [dbo].[DauThuoc] ([MaDT], [TenDauThuoc], [CongDung], [CachDung], [Gia], [GiaMoi], [Image], [Status], [MaNhomThuoc], [MaNSX]) VALUES (N'DT000019', N'Super Fucoidan', N'Hỗ trợ trị ung thư', N'Hỗ trợ trị ung thư', 10000, 10000, N'', N'', N'NT000005', N'SX000005')
INSERT [dbo].[HoaDonMua] ([MaHD], [MaKH], [NgayMua], [MaTK], [TrangThai], [MaHoaDonVanChuyen]) VALUES (N'HD000001', N'KH000001', CAST(N'2019-03-25 07:00:00.000' AS DateTime), N'TK000001', 2, N'VC000003')
INSERT [dbo].[HoaDonMua] ([MaHD], [MaKH], [NgayMua], [MaTK], [TrangThai], [MaHoaDonVanChuyen]) VALUES (N'HD000002', N'KH000002', CAST(N'2019-03-25 07:00:00.000' AS DateTime), N'TK000001', 3, N'VC000002')
INSERT [dbo].[HoaDonMua] ([MaHD], [MaKH], [NgayMua], [MaTK], [TrangThai], [MaHoaDonVanChuyen]) VALUES (N'HD000003', N'KH000002', CAST(N'2019-03-25 07:00:00.000' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[HoaDonMua] ([MaHD], [MaKH], [NgayMua], [MaTK], [TrangThai], [MaHoaDonVanChuyen]) VALUES (N'HD000004', N'KH000001', CAST(N'2019-03-25 07:00:00.000' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[HoaDonMua] ([MaHD], [MaKH], [NgayMua], [MaTK], [TrangThai], [MaHoaDonVanChuyen]) VALUES (N'HD000005', N'KH000003', CAST(N'2019-03-25 07:00:00.000' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[HoaDonMua] ([MaHD], [MaKH], [NgayMua], [MaTK], [TrangThai], [MaHoaDonVanChuyen]) VALUES (N'HD000006', N'KH000004', CAST(N'2019-03-26 07:00:00.000' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[HoaDonVanChuyen] ([MaHoaDonVanChuyen], [MaNguoiVanChuyen], [NgayGioVanChuyen], [SoGioDuTinh]) VALUES (N'VC000002', N'NC000005', CAST(N'2019-03-26 16:40:59.767' AS DateTime), 2)
INSERT [dbo].[HoaDonVanChuyen] ([MaHoaDonVanChuyen], [MaNguoiVanChuyen], [NgayGioVanChuyen], [SoGioDuTinh]) VALUES (N'VC000003', N'NC000002', CAST(N'2019-03-26 16:52:17.483' AS DateTime), 2)
INSERT [dbo].[KeHoachLamViec] ([ID], [CongViec], [TrangThai1], [TrangThai2], [GhiChu], [MaTD]) VALUES (N'KH000001', N'Đạt 50 khách hàng / tháng', 1, 2, NULL, N'TD000001')
INSERT [dbo].[KeHoachLamViec] ([ID], [CongViec], [TrangThai1], [TrangThai2], [GhiChu], [MaTD]) VALUES (N'KH000002', N'Đạt 50 sản phẩm / tháng', 2, 1, NULL, N'TD000001')
INSERT [dbo].[KeHoachLamViec] ([ID], [CongViec], [TrangThai1], [TrangThai2], [GhiChu], [MaTD]) VALUES (N'KH000003', N'Hoàn thành sản phẩm của 5 khu vực', 1, 1, NULL, N'TD000002')
INSERT [dbo].[KeHoachLamViec] ([ID], [CongViec], [TrangThai1], [TrangThai2], [GhiChu], [MaTD]) VALUES (N'KH000004', N'Đạt 30 khách hàng / tháng', 1, 1, NULL, N'TD000002')
INSERT [dbo].[KeHoachLamViec] ([ID], [CongViec], [TrangThai1], [TrangThai2], [GhiChu], [MaTD]) VALUES (N'KH000005', N'Tăng doanh số 5%', 1, 1, NULL, N'TD000001')
INSERT [dbo].[KeHoachLamViec] ([ID], [CongViec], [TrangThai1], [TrangThai2], [GhiChu], [MaTD]) VALUES (N'KH000006', N'Vượt chỉ tiêu 2%', 1, 1, NULL, N'TD000001')
INSERT [dbo].[KeHoachLamViec] ([ID], [CongViec], [TrangThai1], [TrangThai2], [GhiChu], [MaTD]) VALUES (N'KH000007', N'1', 1, 1, N'1', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [DiaChi], [SDT], [Email]) VALUES (N'KH000001', N'Lê Văn A', N'Yên Duyên-Yên Sở-Hoàng Mai-Hà Nội', N'123456', N'A@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [DiaChi], [SDT], [Email]) VALUES (N'KH000002', N'Lê Văn B', N'Yên Duyên-Yên Sở-Hoàng Mai-Hà Nội', N'123457', N'B@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [DiaChi], [SDT], [Email]) VALUES (N'KH000003', N'Lê Văn C', N'Yên Duyên-Yên Sở-Hoàng Mai-Hà Nội', N'123458', N'C@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [DiaChi], [SDT], [Email]) VALUES (N'KH000004', N'Lê Văn D', N'Yên Duyên-Yên Sở-Hoàng Mai-Hà Nội', N'123459', N'D@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [DiaChi], [SDT], [Email]) VALUES (N'KH000005', N'Lê Văn E', N'Yên Duyên-Yên Sở-Hoàng Mai-Hà Nội', N'123460', N'E@gmail.com')
INSERT [dbo].[KhuyenMai] ([ID], [TenChuongTrinh], [ChuDe], [NoiDung], [Image], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'KM000001', N'Tri ân khách hàng thân thiết', N'Mua 2 tặng 1', N'Khi khách hàng mua 2 sản phẩm nằm trong khung khuyến mại sẽ được tặng kèm 1 sản phẩm chức năng hoặc thuốc bổ', N'chuong-trinh-khuyen-mai-2018-1.jpg', CAST(N'2019-03-23 00:00:00.000' AS DateTime), CAST(N'2019-04-23 00:00:00.000' AS DateTime))
INSERT [dbo].[KhuyenMai] ([ID], [TenChuongTrinh], [ChuDe], [NoiDung], [Image], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'KM000002', N'Khách hàng thường xuyên', N'Gửi tặng khách hàng thường xuyên', N'Giảm 5% cho khách hàng thường xuyên khi mua sản phẩm trong khung khuyến mại', N'chuong-trinh-khuyen-mai-2018-1.jpg', CAST(N'2019-03-23 00:00:00.000' AS DateTime), CAST(N'2019-03-30 00:00:00.000' AS DateTime))
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChi], [SDT], [Email]) VALUES (N'SX000001', N'CTCP TRAPHACO', N'Yên Duyên-Yên Sở-Hoàng Mai-Hà Nội', N'123456', N'A@gmail.com')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChi], [SDT], [Email]) VALUES (N'SX000002', N'CTCP PYMEPHARCO', N'Yên Duyên-Yên Sở-Hoàng Mai-Hà Nội', N'123456', N'B@gmail.com')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChi], [SDT], [Email]) VALUES (N'SX000003', N'CTCP Dược Hà Tây', N'Yên Duyên-Yên Sở-Hoàng Mai-Hà Nội', N'123456', N'C@gmail.com')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChi], [SDT], [Email]) VALUES (N'SX000004', N'CTCP Dược OPC', N'Yên Duyên-Yên Sở-Hoàng Mai-Hà Nội', N'123456', N'D@gmail.com')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChi], [SDT], [Email]) VALUES (N'SX000005', N'CTCP Dược Nam Hà', N'Yên Duyên-Yên Sở-Hoàng Mai-Hà Nội', N'123456', N'E@gmail.com')
INSERT [dbo].[NhomDauThuoc] ([MaNhomThuoc], [TenNhom], [Image], [Status]) VALUES (N'NT000001', N'Kháng sinh', N'Amoxicillin_250mg.jpg', N'Kháng sinh còn được gọi là Trụ sinh là những chất được chiết xuất từ các vi sinh vật, nấm, được tổng hợp hoặc bán tổng hợp, có khả năng tiêu diệt vi khuẩn hay kìm hãm sự phát triển của vi khuẩn một cách đặc hiệu.')
INSERT [dbo].[NhomDauThuoc] ([MaNhomThuoc], [TenNhom], [Image], [Status]) VALUES (N'NT000002', N'Đau bụng', NULL, N'Đau bụng là triệu chứng bệnh lý thường mắc phải. Tất cả các cơ quan trong ổ bụng bị bất thường đều có thể gây đau bụng')
INSERT [dbo].[NhomDauThuoc] ([MaNhomThuoc], [TenNhom], [Image], [Status]) VALUES (N'NT000003', N'Nhiễm trùng', NULL, N'Nhiễm trùng (infection ) là sự xâm nhập của mầm bệnh vào cơ thể và phản ứng của cơ thể đối với thương tổn do mầm bệnh gây nên [1]. Quá trình nhiễm trùng là quá trình vi sinh vật gây bệnh xâm nhập và nhân lên trong (hoặc trên) cơ thể vật chủ hay cơ thể cảm nhiễm, hoặc qua hàng rào da, niêm mạc, xâm nhập và nhân lên ở mô tế bào cơ thể, hay xâm nhập vào tế bào hoặc mô cơ thể và lan tràn trong cơ thể.[2]. Nhiễm trùng có thể xảy ở bất cứ bộ phận nào của cơ thể, có khi cả toàn thân')
INSERT [dbo].[NhomDauThuoc] ([MaNhomThuoc], [TenNhom], [Image], [Status]) VALUES (N'NT000004', N'Đường ruột', NULL, N'Chống đau do co thắt cơ trơn đường tiêu hóa như hội chứng ruột kích thích, bệnh đau túi thừa ruột kết, đau do co thắt đường mật, cơn đau quặn thận, thống ...')
INSERT [dbo].[NhomDauThuoc] ([MaNhomThuoc], [TenNhom], [Image], [Status]) VALUES (N'NT000005', N'Ung thư', NULL, N'Ung thư là một nhóm các bệnh liên quan đến việc phân chia tế bào một cách vô tổ chức và những tế bào đó có khả năng xâm lấn những mô khác bằng cách phát triển trực tiếp vào mô lân cận hoặc di chuyển đến nơi xa (di căn)')
SET IDENTITY_INSERT [dbo].[NhomQuyen] ON 

INSERT [dbo].[NhomQuyen] ([MaNhomQuyen], [TenNhomQuyen], [MoTa]) VALUES (1, N'Quản trị hệ thống', N'Quyền cao nhất, có thể thao tác với bất kỳ chức năng nào của hệ thống')
INSERT [dbo].[NhomQuyen] ([MaNhomQuyen], [TenNhomQuyen], [MoTa]) VALUES (10, N'Ban giám đốc', N'Quyền cao nhất trong hệ thống công ty')
INSERT [dbo].[NhomQuyen] ([MaNhomQuyen], [TenNhomQuyen], [MoTa]) VALUES (11, N'Giám đốc vùng', N'Quản lý vùng kinh doanh')
INSERT [dbo].[NhomQuyen] ([MaNhomQuyen], [TenNhomQuyen], [MoTa]) VALUES (12, N'Trưởng vùng', N'Trưởng vùng kinh doanh')
INSERT [dbo].[NhomQuyen] ([MaNhomQuyen], [TenNhomQuyen], [MoTa]) VALUES (13, N'Giám sát kinh doanh', N'Giám sát kinh doanh')
INSERT [dbo].[NhomQuyen] ([MaNhomQuyen], [TenNhomQuyen], [MoTa]) VALUES (14, N'Nhân viên kinh doanh', N'Nhân viên kinh doanh')
INSERT [dbo].[NhomQuyen] ([MaNhomQuyen], [TenNhomQuyen], [MoTa]) VALUES (15, N'Quản lý kho', N'Quản lý kho')
SET IDENTITY_INSERT [dbo].[NhomQuyen] OFF
SET IDENTITY_INSERT [dbo].[NhomQuyenRoute] ON 

INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (103, 1, 1)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (104, 1, 6)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (106, 1, 8)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (107, 1, 9)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (108, 1, 10)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (109, 1, 16)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (110, 1, 17)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (111, 1, 18)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (112, 1, 19)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (113, 1, 20)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (114, 1, 21)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (115, 1, 22)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (116, 1, 23)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (117, 1, 25)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (118, 1, 26)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (119, 1, 27)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (120, 1, 28)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (127, 1, 37)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (128, 1, 38)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (129, 1, 39)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (136, 1, 40)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (137, 1, 41)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (146, 10, 1)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (147, 10, 37)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (148, 10, 38)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (149, 10, 39)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (157, 11, 1)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (158, 11, 38)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (159, 11, 6)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (160, 11, 8)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (161, 11, 9)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (162, 11, 10)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (163, 11, 16)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (164, 11, 17)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (165, 11, 18)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (166, 11, 19)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (167, 11, 20)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (168, 11, 40)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (169, 11, 21)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (170, 11, 22)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (171, 11, 25)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (172, 11, 26)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (184, 10, 6)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (185, 10, 8)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (186, 10, 9)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (187, 10, 10)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (188, 10, 16)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (189, 10, 17)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (190, 10, 18)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (191, 10, 19)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (192, 10, 20)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (193, 10, 40)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (194, 10, 21)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (195, 10, 22)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (196, 10, 23)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (197, 10, 41)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (198, 10, 25)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (199, 10, 26)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (200, 10, 27)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (201, 10, 28)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (219, 15, 25)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (220, 1, 62)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (221, 1, 63)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (222, 1, 64)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (223, 1, 65)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (224, 1, 60)
INSERT [dbo].[NhomQuyenRoute] ([ID], [MaNhomQuyen], [IDRoute]) VALUES (225, 1, 61)
SET IDENTITY_INSERT [dbo].[NhomQuyenRoute] OFF
SET IDENTITY_INSERT [dbo].[Page] ON 

INSERT [dbo].[Page] ([id], [name], [description], [controller], [namespace]) VALUES (1, N'Quản lý tài khoản', N'Quản lý danh sách tài khoản', N'Account', N'Quanlyduoc.Areas.Admin.Controllers')
INSERT [dbo].[Page] ([id], [name], [description], [controller], [namespace]) VALUES (2, N'Quản lý đầu thuốc', N'Quản lý, thao tác với đầu thuốc', N'DauThuoc', N'Quanlyduoc.Areas.Admin.Controllers')
INSERT [dbo].[Page] ([id], [name], [description], [controller], [namespace]) VALUES (4, N'Quản lý khách hàng', N'Quản lý danh sách khách hàng', N'KhachHang', N'Quanlyduoc.Areas.Admin.Controllers')
INSERT [dbo].[Page] ([id], [name], [description], [controller], [namespace]) VALUES (5, N'Nhà sản xuất', NULL, N'NhaSanXuat', N'Quanlyduoc.Areas.Admin.Controllers')
INSERT [dbo].[Page] ([id], [name], [description], [controller], [namespace]) VALUES (6, N'Nhóm đầu thuốc', NULL, N'NhomDauThuoc', N'Quanlyduoc.Areas.Admin.Controllers')
INSERT [dbo].[Page] ([id], [name], [description], [controller], [namespace]) VALUES (7, N'Trình dược', NULL, N'TrinhDuoc', N'Quanlyduoc.Areas.Admin.Controllers')
INSERT [dbo].[Page] ([id], [name], [description], [controller], [namespace]) VALUES (8, N'Hóa đơn', NULL, N'HoaDon', N'Quanlyduoc.Areas.Admin.Controllers')
SET IDENTITY_INSERT [dbo].[Page] OFF
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (1, N'Quận Ba Đình', 1)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (2, N'Quận Hoàn Kiếm', 1)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (3, N'Quận Tây Hồ', 1)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (4, N'Quận Long Biên', 1)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (5, N'Quận Cầu Giấy', 1)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (6, N'Quận Đống Đa', 1)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (7, N'Quận Hai Bà Trưng', 1)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (8, N'Quận Hoàng Mai', 1)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (9, N'Quận Thanh Xuân', 1)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (16, N'Huyện Sóc Sơn', 1)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (17, N'Huyện Đông Anh', 1)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (18, N'Huyện Gia Lâm', 1)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (19, N'Quận Nam Từ Liêm', 1)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (20, N'Huyện Thanh Trì', 1)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (21, N'Quận Bắc Từ Liêm', 1)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (24, N'Thành phố Hà Giang', 2)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (26, N'Huyện Đồng Văn', 2)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (27, N'Huyện Mèo Vạc', 2)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (28, N'Huyện Yên Minh', 2)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (29, N'Huyện Quản Bạ', 2)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (30, N'Huyện Vị Xuyên', 2)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (31, N'Huyện Bắc Mê', 2)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (32, N'Huyện Hoàng Su Phì', 2)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (33, N'Huyện Xín Mần', 2)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (34, N'Huyện Bắc Quang', 2)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (35, N'Huyện Quang Bình', 2)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (40, N'Thành phố Cao Bằng', 4)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (42, N'Huyện Bảo Lâm', 4)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (43, N'Huyện Bảo Lạc', 4)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (44, N'Huyện Thông Nông', 4)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (45, N'Huyện Hà Quảng', 4)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (46, N'Huyện Trà Lĩnh', 4)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (47, N'Huyện Trùng Khánh', 4)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (48, N'Huyện Hạ Lang', 4)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (49, N'Huyện Quảng Uyên', 4)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (50, N'Huyện Phục Hoà', 4)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (51, N'Huyện Hoà An', 4)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (52, N'Huyện Nguyên Bình', 4)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (53, N'Huyện Thạch An', 4)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (58, N'Thành Phố Bắc Kạn', 6)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (60, N'Huyện Pác Nặm', 6)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (61, N'Huyện Ba Bể', 6)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (62, N'Huyện Ngân Sơn', 6)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (63, N'Huyện Bạch Thông', 6)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (64, N'Huyện Chợ Đồn', 6)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (65, N'Huyện Chợ Mới', 6)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (66, N'Huyện Na Rì', 6)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (70, N'Thành phố Tuyên Quang', 8)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (71, N'Huyện Lâm Bình', 8)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (72, N'Huyện Na Hang', 8)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (73, N'Huyện Chiêm Hóa', 8)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (74, N'Huyện Hàm Yên', 8)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (75, N'Huyện Yên Sơn', 8)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (76, N'Huyện Sơn Dương', 8)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (80, N'Thành phố Lào Cai', 10)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (82, N'Huyện Bát Xát', 10)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (83, N'Huyện Mường Khương', 10)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (84, N'Huyện Si Ma Cai', 10)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (85, N'Huyện Bắc Hà', 10)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (86, N'Huyện Bảo Thắng', 10)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (87, N'Huyện Bảo Yên', 10)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (88, N'Huyện Sa Pa', 10)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (89, N'Huyện Văn Bàn', 10)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (94, N'Thành phố Điện Biên Phủ', 11)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (95, N'Thị Xã Mường Lay', 11)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (96, N'Huyện Mường Nhé', 11)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (97, N'Huyện Mường Chà', 11)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (98, N'Huyện Tủa Chùa', 11)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (99, N'Huyện Tuần Giáo', 11)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (100, N'Huyện Điện Biên', 11)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (101, N'Huyện Điện Biên Đông', 11)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (102, N'Huyện Mường Ảng', 11)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (103, N'Huyện Nậm Pồ', 11)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (105, N'Thành phố Lai Châu', 12)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (106, N'Huyện Tam Đường', 12)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (107, N'Huyện Mường Tè', 12)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (108, N'Huyện Sìn Hồ', 12)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (109, N'Huyện Phong Thổ', 12)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (110, N'Huyện Than Uyên', 12)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (111, N'Huyện Tân Uyên', 12)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (112, N'Huyện Nậm Nhùn', 12)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (116, N'Thành phố Sơn La', 14)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (118, N'Huyện Quỳnh Nhai', 14)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (119, N'Huyện Thuận Châu', 14)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (120, N'Huyện Mường La', 14)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (121, N'Huyện Bắc Yên', 14)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (122, N'Huyện Phù Yên', 14)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (123, N'Huyện Mộc Châu', 14)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (124, N'Huyện Yên Châu', 14)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (125, N'Huyện Mai Sơn', 14)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (126, N'Huyện Sông Mã', 14)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (127, N'Huyện Sốp Cộp', 14)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (128, N'Huyện Vân Hồ', 14)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (132, N'Thành phố Yên Bái', 15)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (133, N'Thị xã Nghĩa Lộ', 15)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (135, N'Huyện Lục Yên', 15)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (136, N'Huyện Văn Yên', 15)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (137, N'Huyện Mù Căng Chải', 15)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (138, N'Huyện Trấn Yên', 15)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (139, N'Huyện Trạm Tấu', 15)
GO
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (140, N'Huyện Văn Chấn', 15)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (141, N'Huyện Yên Bình', 15)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (148, N'Thành phố Hòa Bình', 17)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (150, N'Huyện Đà Bắc', 17)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (151, N'Huyện Kỳ Sơn', 17)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (152, N'Huyện Lương Sơn', 17)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (153, N'Huyện Kim Bôi', 17)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (154, N'Huyện Cao Phong', 17)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (155, N'Huyện Tân Lạc', 17)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (156, N'Huyện Mai Châu', 17)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (157, N'Huyện Lạc Sơn', 17)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (158, N'Huyện Yên Thủy', 17)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (159, N'Huyện Lạc Thủy', 17)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (164, N'Thành phố Thái Nguyên', 19)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (165, N'Thành phố Sông Công', 19)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (167, N'Huyện Định Hóa', 19)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (168, N'Huyện Phú Lương', 19)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (169, N'Huyện Đồng Hỷ', 19)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (170, N'Huyện Võ Nhai', 19)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (171, N'Huyện Đại Từ', 19)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (172, N'Thị xã Phổ Yên', 19)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (173, N'Huyện Phú Bình', 19)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (178, N'Thành phố Lạng Sơn', 20)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (180, N'Huyện Tràng Định', 20)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (181, N'Huyện Bình Gia', 20)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (182, N'Huyện Văn Lãng', 20)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (183, N'Huyện Cao Lộc', 20)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (184, N'Huyện Văn Quan', 20)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (185, N'Huyện Bắc Sơn', 20)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (186, N'Huyện Hữu Lũng', 20)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (187, N'Huyện Chi Lăng', 20)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (188, N'Huyện Lộc Bình', 20)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (189, N'Huyện Đình Lập', 20)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (193, N'Thành phố Hạ Long', 22)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (194, N'Thành phố Móng Cái', 22)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (195, N'Thành phố Cẩm Phả', 22)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (196, N'Thành phố Uông Bí', 22)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (198, N'Huyện Bình Liêu', 22)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (199, N'Huyện Tiên Yên', 22)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (200, N'Huyện Đầm Hà', 22)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (201, N'Huyện Hải Hà', 22)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (202, N'Huyện Ba Chẽ', 22)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (203, N'Huyện Vân Đồn', 22)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (204, N'Huyện Hoành Bồ', 22)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (205, N'Thị xã Đông Triều', 22)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (206, N'Thị xã Quảng Yên', 22)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (207, N'Huyện Cô Tô', 22)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (213, N'Thành phố Bắc Giang', 24)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (215, N'Huyện Yên Thế', 24)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (216, N'Huyện Tân Yên', 24)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (217, N'Huyện Lạng Giang', 24)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (218, N'Huyện Lục Nam', 24)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (219, N'Huyện Lục Ngạn', 24)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (220, N'Huyện Sơn Động', 24)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (221, N'Huyện Yên Dũng', 24)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (222, N'Huyện Việt Yên', 24)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (223, N'Huyện Hiệp Hòa', 24)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (227, N'Thành phố Việt Trì', 25)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (228, N'Thị xã Phú Thọ', 25)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (230, N'Huyện Đoan Hùng', 25)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (231, N'Huyện Hạ Hoà', 25)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (232, N'Huyện Thanh Ba', 25)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (233, N'Huyện Phù Ninh', 25)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (234, N'Huyện Yên Lập', 25)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (235, N'Huyện Cẩm Khê', 25)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (236, N'Huyện Tam Nông', 25)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (237, N'Huyện Lâm Thao', 25)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (238, N'Huyện Thanh Sơn', 25)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (239, N'Huyện Thanh Thuỷ', 25)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (240, N'Huyện Tân Sơn', 25)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (243, N'Thành phố Vĩnh Yên', 26)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (244, N'Thị xã Phúc Yên', 26)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (246, N'Huyện Lập Thạch', 26)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (247, N'Huyện Tam Dương', 26)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (248, N'Huyện Tam Đảo', 26)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (249, N'Huyện Bình Xuyên', 26)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (250, N'Huyện Mê Linh', 1)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (251, N'Huyện Yên Lạc', 26)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (252, N'Huyện Vĩnh Tường', 26)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (253, N'Huyện Sông Lô', 26)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (256, N'Thành phố Bắc Ninh', 27)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (258, N'Huyện Yên Phong', 27)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (259, N'Huyện Quế Võ', 27)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (260, N'Huyện Tiên Du', 27)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (261, N'Thị xã Từ Sơn', 27)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (262, N'Huyện Thuận Thành', 27)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (263, N'Huyện Gia Bình', 27)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (264, N'Huyện Lương Tài', 27)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (268, N'Quận Hà Đông', 1)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (269, N'Thị xã Sơn Tây', 1)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (271, N'Huyện Ba Vì', 1)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (272, N'Huyện Phúc Thọ', 1)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (273, N'Huyện Đan Phượng', 1)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (274, N'Huyện Hoài Đức', 1)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (275, N'Huyện Quốc Oai', 1)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (276, N'Huyện Thạch Thất', 1)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (277, N'Huyện Chương Mỹ', 1)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (278, N'Huyện Thanh Oai', 1)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (279, N'Huyện Thường Tín', 1)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (280, N'Huyện Phú Xuyên', 1)
GO
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (281, N'Huyện Ứng Hòa', 1)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (282, N'Huyện Mỹ Đức', 1)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (288, N'Thành phố Hải Dương', 30)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (290, N'Thị xã Chí Linh', 30)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (291, N'Huyện Nam Sách', 30)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (292, N'Huyện Kinh Môn', 30)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (293, N'Huyện Kim Thành', 30)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (294, N'Huyện Thanh Hà', 30)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (295, N'Huyện Cẩm Giàng', 30)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (296, N'Huyện Bình Giang', 30)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (297, N'Huyện Gia Lộc', 30)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (298, N'Huyện Tứ Kỳ', 30)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (299, N'Huyện Ninh Giang', 30)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (300, N'Huyện Thanh Miện', 30)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (303, N'Quận Hồng Bàng', 31)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (304, N'Quận Ngô Quyền', 31)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (305, N'Quận Lê Chân', 31)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (306, N'Quận Hải An', 31)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (307, N'Quận Kiến An', 31)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (308, N'Quận Đồ Sơn', 31)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (309, N'Quận Dương Kinh', 31)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (311, N'Huyện Thuỷ Nguyên', 31)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (312, N'Huyện An Dương', 31)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (313, N'Huyện An Lão', 31)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (314, N'Huyện Kiến Thuỵ', 31)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (315, N'Huyện Tiên Lãng', 31)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (316, N'Huyện Vĩnh Bảo', 31)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (317, N'Huyện Cát Hải', 31)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (318, N'Huyện Bạch Long Vĩ', 31)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (323, N'Thành phố Hưng Yên', 33)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (325, N'Huyện Văn Lâm', 33)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (326, N'Huyện Văn Giang', 33)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (327, N'Huyện Yên Mỹ', 33)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (328, N'Huyện Mỹ Hào', 33)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (329, N'Huyện Ân Thi', 33)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (330, N'Huyện Khoái Châu', 33)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (331, N'Huyện Kim Động', 33)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (332, N'Huyện Tiên Lữ', 33)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (333, N'Huyện Phù Cừ', 33)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (336, N'Thành phố Thái Bình', 34)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (338, N'Huyện Quỳnh Phụ', 34)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (339, N'Huyện Hưng Hà', 34)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (340, N'Huyện Đông Hưng', 34)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (341, N'Huyện Thái Thụy', 34)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (342, N'Huyện Tiền Hải', 34)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (343, N'Huyện Kiến Xương', 34)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (344, N'Huyện Vũ Thư', 34)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (347, N'Thành phố Phủ Lý', 35)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (349, N'Huyện Duy Tiên', 35)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (350, N'Huyện Kim Bảng', 35)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (351, N'Huyện Thanh Liêm', 35)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (352, N'Huyện Bình Lục', 35)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (353, N'Huyện Lý Nhân', 35)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (356, N'Thành phố Nam Định', 36)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (358, N'Huyện Mỹ Lộc', 36)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (359, N'Huyện Vụ Bản', 36)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (360, N'Huyện Ý Yên', 36)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (361, N'Huyện Nghĩa Hưng', 36)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (362, N'Huyện Nam Trực', 36)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (363, N'Huyện Trực Ninh', 36)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (364, N'Huyện Xuân Trường', 36)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (365, N'Huyện Giao Thủy', 36)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (366, N'Huyện Hải Hậu', 36)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (369, N'Thành phố Ninh Bình', 37)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (370, N'Thành phố Tam Điệp', 37)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (372, N'Huyện Nho Quan', 37)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (373, N'Huyện Gia Viễn', 37)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (374, N'Huyện Hoa Lư', 37)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (375, N'Huyện Yên Khánh', 37)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (376, N'Huyện Kim Sơn', 37)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (377, N'Huyện Yên Mô', 37)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (380, N'Thành phố Thanh Hóa', 38)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (381, N'Thị xã Bỉm Sơn', 38)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (382, N'Thành phố Sầm Sơn', 38)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (384, N'Huyện Mường Lát', 38)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (385, N'Huyện Quan Hóa', 38)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (386, N'Huyện Bá Thước', 38)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (387, N'Huyện Quan Sơn', 38)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (388, N'Huyện Lang Chánh', 38)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (389, N'Huyện Ngọc Lặc', 38)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (390, N'Huyện Cẩm Thủy', 38)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (391, N'Huyện Thạch Thành', 38)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (392, N'Huyện Hà Trung', 38)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (393, N'Huyện Vĩnh Lộc', 38)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (394, N'Huyện Yên Định', 38)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (395, N'Huyện Thọ Xuân', 38)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (396, N'Huyện Thường Xuân', 38)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (397, N'Huyện Triệu Sơn', 38)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (398, N'Huyện Thiệu Hóa', 38)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (399, N'Huyện Hoằng Hóa', 38)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (400, N'Huyện Hậu Lộc', 38)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (401, N'Huyện Nga Sơn', 38)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (402, N'Huyện Như Xuân', 38)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (403, N'Huyện Như Thanh', 38)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (404, N'Huyện Nông Cống', 38)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (405, N'Huyện Đông Sơn', 38)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (406, N'Huyện Quảng Xương', 38)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (407, N'Huyện Tĩnh Gia', 38)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (412, N'Thành phố Vinh', 40)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (413, N'Thị xã Cửa Lò', 40)
GO
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (414, N'Thị xã Thái Hoà', 40)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (415, N'Huyện Quế Phong', 40)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (416, N'Huyện Quỳ Châu', 40)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (417, N'Huyện Kỳ Sơn', 40)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (418, N'Huyện Tương Dương', 40)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (419, N'Huyện Nghĩa Đàn', 40)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (420, N'Huyện Quỳ Hợp', 40)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (421, N'Huyện Quỳnh Lưu', 40)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (422, N'Huyện Con Cuông', 40)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (423, N'Huyện Tân Kỳ', 40)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (424, N'Huyện Anh Sơn', 40)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (425, N'Huyện Diễn Châu', 40)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (426, N'Huyện Yên Thành', 40)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (427, N'Huyện Đô Lương', 40)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (428, N'Huyện Thanh Chương', 40)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (429, N'Huyện Nghi Lộc', 40)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (430, N'Huyện Nam Đàn', 40)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (431, N'Huyện Hưng Nguyên', 40)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (432, N'Thị xã Hoàng Mai', 40)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (436, N'Thành phố Hà Tĩnh', 42)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (437, N'Thị xã Hồng Lĩnh', 42)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (439, N'Huyện Hương Sơn', 42)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (440, N'Huyện Đức Thọ', 42)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (441, N'Huyện Vũ Quang', 42)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (442, N'Huyện Nghi Xuân', 42)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (443, N'Huyện Can Lộc', 42)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (444, N'Huyện Hương Khê', 42)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (445, N'Huyện Thạch Hà', 42)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (446, N'Huyện Cẩm Xuyên', 42)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (447, N'Huyện Kỳ Anh', 42)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (448, N'Huyện Lộc Hà', 42)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (449, N'Thị xã Kỳ Anh', 42)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (450, N'Thành Phố Đồng Hới', 44)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (452, N'Huyện Minh Hóa', 44)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (453, N'Huyện Tuyên Hóa', 44)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (454, N'Huyện Quảng Trạch', 44)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (455, N'Huyện Bố Trạch', 44)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (456, N'Huyện Quảng Ninh', 44)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (457, N'Huyện Lệ Thủy', 44)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (458, N'Thị xã Ba Đồn', 44)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (461, N'Thành phố Đông Hà', 45)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (462, N'Thị xã Quảng Trị', 45)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (464, N'Huyện Vĩnh Linh', 45)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (465, N'Huyện Hướng Hóa', 45)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (466, N'Huyện Gio Linh', 45)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (467, N'Huyện Đa Krông', 45)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (468, N'Huyện Cam Lộ', 45)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (469, N'Huyện Triệu Phong', 45)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (470, N'Huyện Hải Lăng', 45)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (471, N'Huyện Cồn Cỏ', 45)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (474, N'Thành phố Huế', 46)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (476, N'Huyện Phong Điền', 46)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (477, N'Huyện Quảng Điền', 46)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (478, N'Huyện Phú Vang', 46)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (479, N'Thị xã Hương Thủy', 46)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (480, N'Thị xã Hương Trà', 46)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (481, N'Huyện A Lưới', 46)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (482, N'Huyện Phú Lộc', 46)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (483, N'Huyện Nam Đông', 46)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (490, N'Quận Liên Chiểu', 48)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (491, N'Quận Thanh Khê', 48)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (492, N'Quận Hải Châu', 48)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (493, N'Quận Sơn Trà', 48)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (494, N'Quận Ngũ Hành Sơn', 48)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (495, N'Quận Cẩm Lệ', 48)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (497, N'Huyện Hòa Vang', 48)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (498, N'Huyện Hoàng Sa', 48)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (502, N'Thành phố Tam Kỳ', 49)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (503, N'Thành phố Hội An', 49)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (504, N'Huyện Tây Giang', 49)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (505, N'Huyện Đông Giang', 49)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (506, N'Huyện Đại Lộc', 49)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (507, N'Thị xã Điện Bàn', 49)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (508, N'Huyện Duy Xuyên', 49)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (509, N'Huyện Quế Sơn', 49)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (510, N'Huyện Nam Giang', 49)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (511, N'Huyện Phước Sơn', 49)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (512, N'Huyện Hiệp Đức', 49)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (513, N'Huyện Thăng Bình', 49)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (514, N'Huyện Tiên Phước', 49)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (515, N'Huyện Bắc Trà My', 49)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (516, N'Huyện Nam Trà My', 49)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (517, N'Huyện Núi Thành', 49)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (518, N'Huyện Phú Ninh', 49)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (519, N'Huyện Nông Sơn', 49)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (522, N'Thành phố Quảng Ngãi', 51)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (524, N'Huyện Bình Sơn', 51)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (525, N'Huyện Trà Bồng', 51)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (526, N'Huyện Tây Trà', 51)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (527, N'Huyện Sơn Tịnh', 51)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (528, N'Huyện Tư Nghĩa', 51)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (529, N'Huyện Sơn Hà', 51)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (530, N'Huyện Sơn Tây', 51)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (531, N'Huyện Minh Long', 51)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (532, N'Huyện Nghĩa Hành', 51)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (533, N'Huyện Mộ Đức', 51)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (534, N'Huyện Đức Phổ', 51)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (535, N'Huyện Ba Tơ', 51)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (536, N'Huyện Lý Sơn', 51)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (540, N'Thành phố Qui Nhơn', 52)
GO
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (542, N'Huyện An Lão', 52)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (543, N'Huyện Hoài Nhơn', 52)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (544, N'Huyện Hoài Ân', 52)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (545, N'Huyện Phù Mỹ', 52)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (546, N'Huyện Vĩnh Thạnh', 52)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (547, N'Huyện Tây Sơn', 52)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (548, N'Huyện Phù Cát', 52)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (549, N'Thị xã An Nhơn', 52)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (550, N'Huyện Tuy Phước', 52)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (551, N'Huyện Vân Canh', 52)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (555, N'Thành phố Tuy Hoà', 54)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (557, N'Thị xã Sông Cầu', 54)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (558, N'Huyện Đồng Xuân', 54)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (559, N'Huyện Tuy An', 54)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (560, N'Huyện Sơn Hòa', 54)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (561, N'Huyện Sông Hinh', 54)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (562, N'Huyện Tây Hoà', 54)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (563, N'Huyện Phú Hoà', 54)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (564, N'Huyện Đông Hòa', 54)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (568, N'Thành phố Nha Trang', 56)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (569, N'Thành phố Cam Ranh', 56)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (570, N'Huyện Cam Lâm', 56)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (571, N'Huyện Vạn Ninh', 56)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (572, N'Thị xã Ninh Hòa', 56)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (573, N'Huyện Khánh Vĩnh', 56)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (574, N'Huyện Diên Khánh', 56)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (575, N'Huyện Khánh Sơn', 56)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (576, N'Huyện Trường Sa', 56)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (582, N'Thành phố Phan Rang-Tháp Chàm', 58)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (584, N'Huyện Bác Ái', 58)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (585, N'Huyện Ninh Sơn', 58)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (586, N'Huyện Ninh Hải', 58)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (587, N'Huyện Ninh Phước', 58)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (588, N'Huyện Thuận Bắc', 58)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (589, N'Huyện Thuận Nam', 58)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (593, N'Thành phố Phan Thiết', 60)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (594, N'Thị xã La Gi', 60)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (595, N'Huyện Tuy Phong', 60)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (596, N'Huyện Bắc Bình', 60)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (597, N'Huyện Hàm Thuận Bắc', 60)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (598, N'Huyện Hàm Thuận Nam', 60)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (599, N'Huyện Tánh Linh', 60)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (600, N'Huyện Đức Linh', 60)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (601, N'Huyện Hàm Tân', 60)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (602, N'Huyện Phú Quí', 60)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (608, N'Thành phố Kon Tum', 62)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (610, N'Huyện Đắk Glei', 62)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (611, N'Huyện Ngọc Hồi', 62)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (612, N'Huyện Đắk Tô', 62)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (613, N'Huyện Kon Plông', 62)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (614, N'Huyện Kon Rẫy', 62)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (615, N'Huyện Đắk Hà', 62)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (616, N'Huyện Sa Thầy', 62)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (617, N'Huyện Tu Mơ Rông', 62)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (618, N'Huyện Ia H'' Drai', 62)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (622, N'Thành phố Pleiku', 64)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (623, N'Thị xã An Khê', 64)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (624, N'Thị xã Ayun Pa', 64)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (625, N'Huyện KBang', 64)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (626, N'Huyện Đăk Đoa', 64)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (627, N'Huyện Chư Păh', 64)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (628, N'Huyện Ia Grai', 64)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (629, N'Huyện Mang Yang', 64)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (630, N'Huyện Kông Chro', 64)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (631, N'Huyện Đức Cơ', 64)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (632, N'Huyện Chư Prông', 64)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (633, N'Huyện Chư Sê', 64)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (634, N'Huyện Đăk Pơ', 64)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (635, N'Huyện Ia Pa', 64)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (637, N'Huyện Krông Pa', 64)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (638, N'Huyện Phú Thiện', 64)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (639, N'Huyện Chư Pưh', 64)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (643, N'Thành phố Buôn Ma Thuột', 66)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (644, N'Thị Xã Buôn Hồ', 66)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (645, N'Huyện Ea H''leo', 66)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (646, N'Huyện Ea Súp', 66)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (647, N'Huyện Buôn Đôn', 66)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (648, N'Huyện Cư M''gar', 66)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (649, N'Huyện Krông Búk', 66)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (650, N'Huyện Krông Năng', 66)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (651, N'Huyện Ea Kar', 66)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (652, N'Huyện M''Đrắk', 66)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (653, N'Huyện Krông Bông', 66)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (654, N'Huyện Krông Pắc', 66)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (655, N'Huyện Krông A Na', 66)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (656, N'Huyện Lắk', 66)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (657, N'Huyện Cư Kuin', 66)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (660, N'Thị xã Gia Nghĩa', 67)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (661, N'Huyện Đăk Glong', 67)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (662, N'Huyện Cư Jút', 67)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (663, N'Huyện Đắk Mil', 67)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (664, N'Huyện Krông Nô', 67)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (665, N'Huyện Đắk Song', 67)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (666, N'Huyện Đắk R''Lấp', 67)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (667, N'Huyện Tuy Đức', 67)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (672, N'Thành phố Đà Lạt', 68)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (673, N'Thành phố Bảo Lộc', 68)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (674, N'Huyện Đam Rông', 68)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (675, N'Huyện Lạc Dương', 68)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (676, N'Huyện Lâm Hà', 68)
GO
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (677, N'Huyện Đơn Dương', 68)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (678, N'Huyện Đức Trọng', 68)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (679, N'Huyện Di Linh', 68)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (680, N'Huyện Bảo Lâm', 68)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (681, N'Huyện Đạ Huoai', 68)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (682, N'Huyện Đạ Tẻh', 68)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (683, N'Huyện Cát Tiên', 68)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (688, N'Thị xã Phước Long', 70)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (689, N'Thị xã Đồng Xoài', 70)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (690, N'Thị xã Bình Long', 70)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (691, N'Huyện Bù Gia Mập', 70)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (692, N'Huyện Lộc Ninh', 70)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (693, N'Huyện Bù Đốp', 70)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (694, N'Huyện Hớn Quản', 70)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (695, N'Huyện Đồng Phú', 70)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (696, N'Huyện Bù Đăng', 70)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (697, N'Huyện Chơn Thành', 70)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (698, N'Huyện Phú Riềng', 70)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (703, N'Thành phố Tây Ninh', 72)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (705, N'Huyện Tân Biên', 72)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (706, N'Huyện Tân Châu', 72)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (707, N'Huyện Dương Minh Châu', 72)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (708, N'Huyện Châu Thành', 72)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (709, N'Huyện Hòa Thành', 72)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (710, N'Huyện Gò Dầu', 72)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (711, N'Huyện Bến Cầu', 72)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (712, N'Huyện Trảng Bàng', 72)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (718, N'Thành phố Thủ Dầu Một', 74)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (719, N'Huyện Bàu Bàng', 74)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (720, N'Huyện Dầu Tiếng', 74)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (721, N'Thị xã Bến Cát', 74)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (722, N'Huyện Phú Giáo', 74)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (723, N'Thị xã Tân Uyên', 74)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (724, N'Thị xã Dĩ An', 74)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (725, N'Thị xã Thuận An', 74)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (726, N'Huyện Bắc Tân Uyên', 74)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (731, N'Thành phố Biên Hòa', 75)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (732, N'Thị xã Long Khánh', 75)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (734, N'Huyện Tân Phú', 75)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (735, N'Huyện Vĩnh Cửu', 75)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (736, N'Huyện Định Quán', 75)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (737, N'Huyện Trảng Bom', 75)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (738, N'Huyện Thống Nhất', 75)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (739, N'Huyện Cẩm Mỹ', 75)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (740, N'Huyện Long Thành', 75)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (741, N'Huyện Xuân Lộc', 75)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (742, N'Huyện Nhơn Trạch', 75)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (747, N'Thành phố Vũng Tàu', 77)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (748, N'Thành phố Bà Rịa', 77)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (750, N'Huyện Châu Đức', 77)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (751, N'Huyện Xuyên Mộc', 77)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (752, N'Huyện Long Điền', 77)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (753, N'Huyện Đất Đỏ', 77)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (754, N'Huyện Tân Thành', 77)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (755, N'Huyện Côn Đảo', 77)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (760, N'Quận 1', 79)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (761, N'Quận 12', 79)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (762, N'Quận Thủ Đức', 79)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (763, N'Quận 9', 79)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (764, N'Quận Gò Vấp', 79)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (765, N'Quận Bình Thạnh', 79)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (766, N'Quận Tân Bình', 79)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (767, N'Quận Tân Phú', 79)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (768, N'Quận Phú Nhuận', 79)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (769, N'Quận 2', 79)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (770, N'Quận 3', 79)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (771, N'Quận 10', 79)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (772, N'Quận 11', 79)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (773, N'Quận 4', 79)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (774, N'Quận 5', 79)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (775, N'Quận 6', 79)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (776, N'Quận 8', 79)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (777, N'Quận Bình Tân', 79)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (778, N'Quận 7', 79)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (783, N'Huyện Củ Chi', 79)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (784, N'Huyện Hóc Môn', 79)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (785, N'Huyện Bình Chánh', 79)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (786, N'Huyện Nhà Bè', 79)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (787, N'Huyện Cần Giờ', 79)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (794, N'Thành phố Tân An', 80)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (795, N'Thị xã Kiến Tường', 80)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (796, N'Huyện Tân Hưng', 80)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (797, N'Huyện Vĩnh Hưng', 80)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (798, N'Huyện Mộc Hóa', 80)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (799, N'Huyện Tân Thạnh', 80)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (800, N'Huyện Thạnh Hóa', 80)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (801, N'Huyện Đức Huệ', 80)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (802, N'Huyện Đức Hòa', 80)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (803, N'Huyện Bến Lức', 80)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (804, N'Huyện Thủ Thừa', 80)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (805, N'Huyện Tân Trụ', 80)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (806, N'Huyện Cần Đước', 80)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (807, N'Huyện Cần Giuộc', 80)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (808, N'Huyện Châu Thành', 80)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (815, N'Thành phố Mỹ Tho', 82)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (816, N'Thị xã Gò Công', 82)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (817, N'Thị xã Cai Lậy', 82)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (818, N'Huyện Tân Phước', 82)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (819, N'Huyện Cái Bè', 82)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (820, N'Huyện Cai Lậy', 82)
GO
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (821, N'Huyện Châu Thành', 82)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (822, N'Huyện Chợ Gạo', 82)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (823, N'Huyện Gò Công Tây', 82)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (824, N'Huyện Gò Công Đông', 82)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (825, N'Huyện Tân Phú Đông', 82)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (829, N'Thành phố Bến Tre', 83)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (831, N'Huyện Châu Thành', 83)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (832, N'Huyện Chợ Lách', 83)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (833, N'Huyện Mỏ Cày Nam', 83)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (834, N'Huyện Giồng Trôm', 83)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (835, N'Huyện Bình Đại', 83)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (836, N'Huyện Ba Tri', 83)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (837, N'Huyện Thạnh Phú', 83)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (838, N'Huyện Mỏ Cày Bắc', 83)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (842, N'Thành phố Trà Vinh', 84)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (844, N'Huyện Càng Long', 84)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (845, N'Huyện Cầu Kè', 84)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (846, N'Huyện Tiểu Cần', 84)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (847, N'Huyện Châu Thành', 84)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (848, N'Huyện Cầu Ngang', 84)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (849, N'Huyện Trà Cú', 84)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (850, N'Huyện Duyên Hải', 84)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (851, N'Thị xã Duyên Hải', 84)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (855, N'Thành phố Vĩnh Long', 86)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (857, N'Huyện Long Hồ', 86)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (858, N'Huyện Mang Thít', 86)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (859, N'Huyện  Vũng Liêm', 86)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (860, N'Huyện Tam Bình', 86)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (861, N'Thị xã Bình Minh', 86)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (862, N'Huyện Trà Ôn', 86)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (863, N'Huyện Bình Tân', 86)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (866, N'Thành phố Cao Lãnh', 87)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (867, N'Thành phố Sa Đéc', 87)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (868, N'Thị xã Hồng Ngự', 87)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (869, N'Huyện Tân Hồng', 87)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (870, N'Huyện Hồng Ngự', 87)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (871, N'Huyện Tam Nông', 87)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (872, N'Huyện Tháp Mười', 87)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (873, N'Huyện Cao Lãnh', 87)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (874, N'Huyện Thanh Bình', 87)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (875, N'Huyện Lấp Vò', 87)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (876, N'Huyện Lai Vung', 87)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (877, N'Huyện Châu Thành', 87)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (883, N'Thành phố Long Xuyên', 89)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (884, N'Thành phố Châu Đốc', 89)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (886, N'Huyện An Phú', 89)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (887, N'Thị xã Tân Châu', 89)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (888, N'Huyện Phú Tân', 89)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (889, N'Huyện Châu Phú', 89)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (890, N'Huyện Tịnh Biên', 89)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (891, N'Huyện Tri Tôn', 89)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (892, N'Huyện Châu Thành', 89)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (893, N'Huyện Chợ Mới', 89)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (894, N'Huyện Thoại Sơn', 89)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (899, N'Thành phố Rạch Giá', 91)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (900, N'Thị xã Hà Tiên', 91)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (902, N'Huyện Kiên Lương', 91)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (903, N'Huyện Hòn Đất', 91)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (904, N'Huyện Tân Hiệp', 91)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (905, N'Huyện Châu Thành', 91)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (906, N'Huyện Giồng Riềng', 91)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (907, N'Huyện Gò Quao', 91)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (908, N'Huyện An Biên', 91)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (909, N'Huyện An Minh', 91)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (910, N'Huyện Vĩnh Thuận', 91)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (911, N'Huyện Phú Quốc', 91)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (912, N'Huyện Kiên Hải', 91)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (913, N'Huyện U Minh Thượng', 91)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (914, N'Huyện Giang Thành', 91)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (916, N'Quận Ninh Kiều', 92)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (917, N'Quận Ô Môn', 92)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (918, N'Quận Bình Thuỷ', 92)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (919, N'Quận Cái Răng', 92)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (923, N'Quận Thốt Nốt', 92)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (924, N'Huyện Vĩnh Thạnh', 92)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (925, N'Huyện Cờ Đỏ', 92)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (926, N'Huyện Phong Điền', 92)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (927, N'Huyện Thới Lai', 92)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (930, N'Thành phố Vị Thanh', 93)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (931, N'Thị xã Ngã Bảy', 93)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (932, N'Huyện Châu Thành A', 93)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (933, N'Huyện Châu Thành', 93)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (934, N'Huyện Phụng Hiệp', 93)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (935, N'Huyện Vị Thuỷ', 93)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (936, N'Huyện Long Mỹ', 93)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (937, N'Thị xã Long Mỹ', 93)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (941, N'Thành phố Sóc Trăng', 94)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (942, N'Huyện Châu Thành', 94)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (943, N'Huyện Kế Sách', 94)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (944, N'Huyện Mỹ Tú', 94)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (945, N'Huyện Cù Lao Dung', 94)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (946, N'Huyện Long Phú', 94)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (947, N'Huyện Mỹ Xuyên', 94)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (948, N'Thị xã Ngã Năm', 94)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (949, N'Huyện Thạnh Trị', 94)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (950, N'Thị xã Vĩnh Châu', 94)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (951, N'Huyện Trần Đề', 94)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (954, N'Thành phố Bạc Liêu', 95)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (956, N'Huyện Hồng Dân', 95)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (957, N'Huyện Phước Long', 95)
GO
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (958, N'Huyện Vĩnh Lợi', 95)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (959, N'Thị xã Giá Rai', 95)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (960, N'Huyện Đông Hải', 95)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (961, N'Huyện Hoà Bình', 95)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (964, N'Thành phố Cà Mau', 96)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (966, N'Huyện U Minh', 96)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (967, N'Huyện Thới Bình', 96)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (968, N'Huyện Trần Văn Thời', 96)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (969, N'Huyện Cái Nước', 96)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (970, N'Huyện Đầm Dơi', 96)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (971, N'Huyện Năm Căn', 96)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (972, N'Huyện Phú Tân', 96)
INSERT [dbo].[QuanHuyen] ([ID], [TenQuanHuyen], [IDTinhThanh]) VALUES (973, N'Huyện Ngọc Hiển', 96)
SET IDENTITY_INSERT [dbo].[Route] ON 

INSERT [dbo].[Route] ([ID], [Namespace], [Controller], [Action], [Name], [Description]) VALUES (1, N'Quanlyduoc.Areas.Admin.Controllers', N'Account', N'Index', N'Xem danh sách', N'Xem danh sách tài khoản')
INSERT [dbo].[Route] ([ID], [Namespace], [Controller], [Action], [Name], [Description]) VALUES (6, N'Quanlyduoc.Areas.Admin.Controllers', N'DauThuoc', N'Index', N'Xem danh sách', NULL)
INSERT [dbo].[Route] ([ID], [Namespace], [Controller], [Action], [Name], [Description]) VALUES (8, N'Quanlyduoc.Areas.Admin.Controllers', N'DauThuoc', N'Themdauthuoc', N'Thêm đầu thuốc', NULL)
INSERT [dbo].[Route] ([ID], [Namespace], [Controller], [Action], [Name], [Description]) VALUES (9, N'Quanlyduoc.Areas.Admin.Controllers', N'DauThuoc', N'SuaDauThuoc', N'Sửa đầu thuốc', NULL)
INSERT [dbo].[Route] ([ID], [Namespace], [Controller], [Action], [Name], [Description]) VALUES (10, N'Quanlyduoc.Areas.Admin.Controllers', N'DauThuoc', N'XoaDauThuoc', N'Xóa đầu thuốc', NULL)
INSERT [dbo].[Route] ([ID], [Namespace], [Controller], [Action], [Name], [Description]) VALUES (16, N'Quanlyduoc.Areas.Admin.Controllers', N'KhachHang', N'Index', N'Xem', NULL)
INSERT [dbo].[Route] ([ID], [Namespace], [Controller], [Action], [Name], [Description]) VALUES (17, N'Quanlyduoc.Areas.Admin.Controllers', N'NhaSanXuat', N'Index', N'Xem', NULL)
INSERT [dbo].[Route] ([ID], [Namespace], [Controller], [Action], [Name], [Description]) VALUES (18, N'Quanlyduoc.Areas.Admin.Controllers', N'NhomDauThuoc', N'Index', N'Xem', NULL)
INSERT [dbo].[Route] ([ID], [Namespace], [Controller], [Action], [Name], [Description]) VALUES (19, N'Quanlyduoc.Areas.Admin.Controllers', N'NhomDauThuoc', N'ThemNhomDauThuoc', N'Thêm', NULL)
INSERT [dbo].[Route] ([ID], [Namespace], [Controller], [Action], [Name], [Description]) VALUES (20, N'Quanlyduoc.Areas.Admin.Controllers', N'NhomDauThuoc', N'XoaNhomDau', N'Xóa', NULL)
INSERT [dbo].[Route] ([ID], [Namespace], [Controller], [Action], [Name], [Description]) VALUES (21, N'Quanlyduoc.Areas.Admin.Controllers', N'TrinhDuoc', N'Index', N'Xem', NULL)
INSERT [dbo].[Route] ([ID], [Namespace], [Controller], [Action], [Name], [Description]) VALUES (22, N'Quanlyduoc.Areas.Admin.Controllers', N'TrinhDuoc', N'Themtrinhduoc', N'Thêm', NULL)
INSERT [dbo].[Route] ([ID], [Namespace], [Controller], [Action], [Name], [Description]) VALUES (23, N'Quanlyduoc.Areas.Admin.Controllers', N'TrinhDuoc', N'Xoa', N'Xóa', NULL)
INSERT [dbo].[Route] ([ID], [Namespace], [Controller], [Action], [Name], [Description]) VALUES (25, N'Quanlyduoc.Areas.Admin.Controllers', N'HoaDon', N'Index', N'Xem', NULL)
INSERT [dbo].[Route] ([ID], [Namespace], [Controller], [Action], [Name], [Description]) VALUES (26, N'Quanlyduoc.Areas.Admin.Controllers', N'HoaDon', N'themHoaDon', N'Thêm', NULL)
INSERT [dbo].[Route] ([ID], [Namespace], [Controller], [Action], [Name], [Description]) VALUES (27, N'Quanlyduoc.Areas.Admin.Controllers', N'HoaDon', N'pheDuyetHoaDon', N'Phê duyệt', NULL)
INSERT [dbo].[Route] ([ID], [Namespace], [Controller], [Action], [Name], [Description]) VALUES (28, N'Quanlyduoc.Areas.Admin.Controllers', N'HoaDon', N'xoaHoaDon', N'Xóa', NULL)
INSERT [dbo].[Route] ([ID], [Namespace], [Controller], [Action], [Name], [Description]) VALUES (37, N'Quanlyduoc.Areas.Admin.Controllers', N'Account', N'suaTaiKhoan', N'Sửa tài khoản', N'Sửa tài khoản')
INSERT [dbo].[Route] ([ID], [Namespace], [Controller], [Action], [Name], [Description]) VALUES (38, N'Quanlyduoc.Areas.Admin.Controllers', N'Account', N'themTaiKhoan', N'Thêm tài khoản', N'Thêm tài khoản mới')
INSERT [dbo].[Route] ([ID], [Namespace], [Controller], [Action], [Name], [Description]) VALUES (39, N'Quanlyduoc.Areas.Admin.Controllers', N'Account', N'xoaTaiKhoan', N'Xóa tài khoản', N'Xóa tài khoản')
INSERT [dbo].[Route] ([ID], [Namespace], [Controller], [Action], [Name], [Description]) VALUES (40, N'Quanlyduoc.Areas.Admin.Controllers', N'NhomDauThuoc', N'SuaNhomDauThuoc', N'Sửa', NULL)
INSERT [dbo].[Route] ([ID], [Namespace], [Controller], [Action], [Name], [Description]) VALUES (41, N'Quanlyduoc.Areas.Admin.Controllers', N'TrinhDuoc', N'suaTrinhDuoc', N'Sửa', NULL)
INSERT [dbo].[Route] ([ID], [Namespace], [Controller], [Action], [Name], [Description]) VALUES (60, N'Quanlyduoc.Areas.Admin.Controllers', N'TrinhDuoc', N'checkTaiKhoanTrinhDuoc', NULL, NULL)
INSERT [dbo].[Route] ([ID], [Namespace], [Controller], [Action], [Name], [Description]) VALUES (61, N'Quanlyduoc.Areas.Admin.Controllers', N'TrinhDuoc', N'themTaiKhoanChoTrinhDuoc', NULL, NULL)
INSERT [dbo].[Route] ([ID], [Namespace], [Controller], [Action], [Name], [Description]) VALUES (62, N'Quanlyduoc.Areas.Admin.Controllers', N'KhachHang', N'Xoa', NULL, NULL)
INSERT [dbo].[Route] ([ID], [Namespace], [Controller], [Action], [Name], [Description]) VALUES (63, N'Quanlyduoc.Areas.Admin.Controllers', N'KhachHang', N'checkTaiKhoanKhachHang', NULL, NULL)
INSERT [dbo].[Route] ([ID], [Namespace], [Controller], [Action], [Name], [Description]) VALUES (64, N'Quanlyduoc.Areas.Admin.Controllers', N'KhachHang', N'themTaiKhoanChoKhachHang', NULL, NULL)
INSERT [dbo].[Route] ([ID], [Namespace], [Controller], [Action], [Name], [Description]) VALUES (65, N'Quanlyduoc.Areas.Admin.Controllers', N'KhachHang', N'themKhachHang', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Route] OFF
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTaiKhoan], [MatKhau], [HoTen], [SDT], [Email], [MaQuyen], [MaNhomQuyen], [MaTD], [MaKH]) VALUES (N'TK000001', N'admin', N'1', N'Nguyễn Hoài Nam', N'0366561924', N'nam@gmail.com', 1, 1, NULL, NULL)
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTaiKhoan], [MatKhau], [HoTen], [SDT], [Email], [MaQuyen], [MaNhomQuyen], [MaTD], [MaKH]) VALUES (N'TK000002', N'trinhduoc', N'1', N'Hồ Văn Bảo', N'0366561924', N'bao@gmail.com', 2, 11, N'TD000001', NULL)
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTaiKhoan], [MatKhau], [HoTen], [SDT], [Email], [MaQuyen], [MaNhomQuyen], [MaTD], [MaKH]) VALUES (N'TK000003', N'khachhang', N'1', N'Phạm Bá Toại', N'0366561924', N'toai@gmail.com', 2, 11, NULL, NULL)
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTaiKhoan], [MatKhau], [HoTen], [SDT], [Email], [MaQuyen], [MaNhomQuyen], [MaTD], [MaKH]) VALUES (N'TK000004', N'quankho', N'1', N'Nguyễn Văn A', N'0123445566', N'a@gmail.com', 3, 15, NULL, NULL)
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (1, N'Thành phố Hà Nội')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (2, N'Tỉnh Hà Giang')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (4, N'Tỉnh Cao Bằng')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (6, N'Tỉnh Bắc Kạn')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (8, N'Tỉnh Tuyên Quang')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (10, N'Tỉnh Lào Cai')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (11, N'Tỉnh Điện Biên')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (12, N'Tỉnh Lai Châu')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (14, N'Tỉnh Sơn La')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (15, N'Tỉnh Yên Bái')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (17, N'Tỉnh Hoà Bình')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (19, N'Tỉnh Thái Nguyên')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (20, N'Tỉnh Lạng Sơn')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (22, N'Tỉnh Quảng Ninh')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (24, N'Tỉnh Bắc Giang')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (25, N'Tỉnh Phú Thọ')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (26, N'Tỉnh Vĩnh Phúc')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (27, N'Tỉnh Bắc Ninh')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (30, N'Tỉnh Hải Dương')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (31, N'Thành phố Hải Phòng')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (33, N'Tỉnh Hưng Yên')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (34, N'Tỉnh Thái Bình')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (35, N'Tỉnh Hà Nam')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (36, N'Tỉnh Nam Định')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (37, N'Tỉnh Ninh Bình')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (38, N'Tỉnh Thanh Hóa')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (40, N'Tỉnh Nghệ An')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (42, N'Tỉnh Hà Tĩnh')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (44, N'Tỉnh Quảng Bình')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (45, N'Tỉnh Quảng Trị')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (46, N'Tỉnh Thừa Thiên Huế')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (48, N'Thành phố Đà Nẵng')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (49, N'Tỉnh Quảng Nam')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (51, N'Tỉnh Quảng Ngãi')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (52, N'Tỉnh Bình Định')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (54, N'Tỉnh Phú Yên')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (56, N'Tỉnh Khánh Hòa')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (58, N'Tỉnh Ninh Thuận')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (60, N'Tỉnh Bình Thuận')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (62, N'Tỉnh Kon Tum')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (64, N'Tỉnh Gia Lai')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (66, N'Tỉnh Đắk Lắk')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (67, N'Tỉnh Đắk Nông')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (68, N'Tỉnh Lâm Đồng')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (70, N'Tỉnh Bình Phước')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (72, N'Tỉnh Tây Ninh')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (74, N'Tỉnh Bình Dương')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (75, N'Tỉnh Đồng Nai')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (77, N'Tỉnh Bà Rịa - Vũng Tàu')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (79, N'Thành phố Hồ Chí Minh')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (80, N'Tỉnh Long An')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (82, N'Tỉnh Tiền Giang')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (83, N'Tỉnh Bến Tre')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (84, N'Tỉnh Trà Vinh')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (86, N'Tỉnh Vĩnh Long')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (87, N'Tỉnh Đồng Tháp')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (89, N'Tỉnh An Giang')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (91, N'Tỉnh Kiên Giang')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (92, N'Thành phố Cần Thơ')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (93, N'Tỉnh Hậu Giang')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (94, N'Tỉnh Sóc Trăng')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (95, N'Tỉnh Bạc Liêu')
INSERT [dbo].[TinhThanhPho] ([ID], [TenTinh]) VALUES (96, N'Tỉnh Cà Mau')
INSERT [dbo].[TrinhDuoc] ([MaTD], [HoTen], [SDT], [NgaySinh], [DiaChi], [KhuVuc], [TrangThai], [DanhGia], [LuongTieuThu]) VALUES (N'TD000001', N'Hồ Văn Bảo', N'123456', N'1995-03-01', N'Hoàng Mai-Hà Nội', N'Hoàng Mai - Hà Nội', 1, 1, 1)
INSERT [dbo].[TrinhDuoc] ([MaTD], [HoTen], [SDT], [NgaySinh], [DiaChi], [KhuVuc], [TrangThai], [DanhGia], [LuongTieuThu]) VALUES (N'TD000002', N'Nguyễn Văn B', N'0366561924', N'1995-03-01', N'Hoàng Mai-Hà Nội', N'Hoàng Mai - Hà Nội', 1, 1, 1)
INSERT [dbo].[TrinhDuoc] ([MaTD], [HoTen], [SDT], [NgaySinh], [DiaChi], [KhuVuc], [TrangThai], [DanhGia], [LuongTieuThu]) VALUES (N'TD000003', N'Trần Văn C', N'123458', N'1995-03-01', N'Hoàng Mai-Hà Nội', N'Hoàng Mai - Hà Nội', 1, 1, 1)
INSERT [dbo].[TrinhDuoc] ([MaTD], [HoTen], [SDT], [NgaySinh], [DiaChi], [KhuVuc], [TrangThai], [DanhGia], [LuongTieuThu]) VALUES (N'TD000004', N'Lê Thị D', N'123459', N'1995-03-01', N'Hoàng Mai-Hà Nội', N'Hoàng Mai - Hà Nội', 1, 1, 1)
INSERT [dbo].[TrinhDuoc] ([MaTD], [HoTen], [SDT], [NgaySinh], [DiaChi], [KhuVuc], [TrangThai], [DanhGia], [LuongTieuThu]) VALUES (N'TD000005', N'Nguyễn Văn E', N'123460', N'1995-03-01', N'Hoàng Mai-Hà Nội', N'Hoàng Mai - Hà Nội', 1, 1, 1)
INSERT [dbo].[TrinhDuoc] ([MaTD], [HoTen], [SDT], [NgaySinh], [DiaChi], [KhuVuc], [TrangThai], [DanhGia], [LuongTieuThu]) VALUES (N'TD000006', N'Hồ Văn A', N'01274839989', N'1996-02-08', N'Quỳnh Lưu', N'Thành phố Hà Nội - Quận Ba Đình', NULL, NULL, NULL)
INSERT [dbo].[TrinhDuocKhachHang] ([MaTD], [MaKH], [NgayBatDau], [NgayKetThuc]) VALUES (N'TD000001', N'KH000001', CAST(N'2019-03-25 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[TrinhDuocKhachHang] ([MaTD], [MaKH], [NgayBatDau], [NgayKetThuc]) VALUES (N'TD000001', N'KH000002', CAST(N'2019-03-25 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[VanChuyen] ([MaNguoiVanChuyen], [HoTen], [DiaChi], [SDT], [Email], [TrangThai]) VALUES (N'NC000001', N'Nguyễn Hoàng Long', N'20/10/2018', N'2', NULL, 1)
INSERT [dbo].[VanChuyen] ([MaNguoiVanChuyen], [HoTen], [DiaChi], [SDT], [Email], [TrangThai]) VALUES (N'NC000002', N'Lê Hải', N'20/10/2019', N'3', NULL, 1)
INSERT [dbo].[VanChuyen] ([MaNguoiVanChuyen], [HoTen], [DiaChi], [SDT], [Email], [TrangThai]) VALUES (N'NC000003', N'Trần Văn Minh', N'20/10/2020', N'2', NULL, 2)
INSERT [dbo].[VanChuyen] ([MaNguoiVanChuyen], [HoTen], [DiaChi], [SDT], [Email], [TrangThai]) VALUES (N'NC000004', N'Nguyễn Hải Nam', N'20/10/2021', N'2', NULL, 2)
INSERT [dbo].[VanChuyen] ([MaNguoiVanChuyen], [HoTen], [DiaChi], [SDT], [Email], [TrangThai]) VALUES (N'NC000005', N'Hồ Văn Sơn', N'20/10/2022', N'2', NULL, 1)
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
ALTER TABLE [dbo].[DauThuoc]  WITH CHECK ADD  CONSTRAINT [FK_DauThuoc_NhaSanXuat1] FOREIGN KEY([MaNSX])
REFERENCES [dbo].[NhaSanXuat] ([MaNSX])
GO
ALTER TABLE [dbo].[DauThuoc] CHECK CONSTRAINT [FK_DauThuoc_NhaSanXuat1]
GO
ALTER TABLE [dbo].[DauThuoc]  WITH CHECK ADD  CONSTRAINT [FK_DauThuoc_NhomDauThuoc] FOREIGN KEY([MaNhomThuoc])
REFERENCES [dbo].[NhomDauThuoc] ([MaNhomThuoc])
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
ALTER TABLE [dbo].[KeHoachLamViec]  WITH CHECK ADD  CONSTRAINT [FK_KeHoachLamViec_TrinhDuoc] FOREIGN KEY([MaTD])
REFERENCES [dbo].[TrinhDuoc] ([MaTD])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KeHoachLamViec] CHECK CONSTRAINT [FK_KeHoachLamViec_TrinhDuoc]
GO
ALTER TABLE [dbo].[KhoNhaVien]  WITH CHECK ADD  CONSTRAINT [FK_KhoNhaVien_Kho] FOREIGN KEY([MaKho])
REFERENCES [dbo].[Kho] ([MaKho])
GO
ALTER TABLE [dbo].[KhoNhaVien] CHECK CONSTRAINT [FK_KhoNhaVien_Kho]
GO
ALTER TABLE [dbo].[KhoNhaVien]  WITH CHECK ADD  CONSTRAINT [FK_KhoNhaVien_TaiKhoan] FOREIGN KEY([MaTK])
REFERENCES [dbo].[TaiKhoan] ([MaTK])
GO
ALTER TABLE [dbo].[KhoNhaVien] CHECK CONSTRAINT [FK_KhoNhaVien_TaiKhoan]
GO
ALTER TABLE [dbo].[KhuyenMaiDauThuoc]  WITH CHECK ADD  CONSTRAINT [FK_KhuyenMaiDauThuoc_DauThuoc] FOREIGN KEY([MaDT])
REFERENCES [dbo].[DauThuoc] ([MaDT])
GO
ALTER TABLE [dbo].[KhuyenMaiDauThuoc] CHECK CONSTRAINT [FK_KhuyenMaiDauThuoc_DauThuoc]
GO
ALTER TABLE [dbo].[KhuyenMaiDauThuoc]  WITH CHECK ADD  CONSTRAINT [FK_KhuyenMaiDauThuoc_KhuyenMai] FOREIGN KEY([MaKM])
REFERENCES [dbo].[KhuyenMai] ([ID])
GO
ALTER TABLE [dbo].[KhuyenMaiDauThuoc] CHECK CONSTRAINT [FK_KhuyenMaiDauThuoc_KhuyenMai]
GO
ALTER TABLE [dbo].[NhomQuyenRoute]  WITH CHECK ADD  CONSTRAINT [FK_NhomQuyenRoute_NhomQuyen] FOREIGN KEY([MaNhomQuyen])
REFERENCES [dbo].[NhomQuyen] ([MaNhomQuyen])
GO
ALTER TABLE [dbo].[NhomQuyenRoute] CHECK CONSTRAINT [FK_NhomQuyenRoute_NhomQuyen]
GO
ALTER TABLE [dbo].[NhomQuyenRoute]  WITH CHECK ADD  CONSTRAINT [FK_NhomQuyenRoute_Route] FOREIGN KEY([IDRoute])
REFERENCES [dbo].[Route] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NhomQuyenRoute] CHECK CONSTRAINT [FK_NhomQuyenRoute_Route]
GO
ALTER TABLE [dbo].[QuanHuyen]  WITH CHECK ADD  CONSTRAINT [FK_QuanHuyen_TinhThanhPho] FOREIGN KEY([IDTinhThanh])
REFERENCES [dbo].[TinhThanhPho] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[QuanHuyen] CHECK CONSTRAINT [FK_QuanHuyen_TinhThanhPho]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_NhomQuyen] FOREIGN KEY([MaNhomQuyen])
REFERENCES [dbo].[NhomQuyen] ([MaNhomQuyen])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_NhomQuyen]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_TrinhDuoc] FOREIGN KEY([MaTD])
REFERENCES [dbo].[TrinhDuoc] ([MaTD])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_TrinhDuoc]
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
/****** Object:  StoredProcedure [dbo].[List_Route]    Script Date: 3/26/2019 5:21:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[List_Route]
(
	@controller nvarchar(250)
)
as
begin
	select rt.ID, rt.Controller, rt.Action, rt.Name from Route rt
	left join NhomQuyenRoute nqrt on nqrt.IDRoute = rt.ID
	
	Group by rt.ID, rt.Controller, rt.Action, rt.Name
end

GO
/****** Object:  StoredProcedure [dbo].[Tk_Account_login]    Script Date: 3/26/2019 5:21:46 PM ******/
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
