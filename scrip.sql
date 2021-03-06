USE [master]
GO
/****** Object:  Database [QLCV]    Script Date: 4/24/2018 8:25:13 PM ******/
CREATE DATABASE [QLCV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLCV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QLCV.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLCV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QLCV_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLCV] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLCV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLCV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLCV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLCV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLCV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLCV] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLCV] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLCV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLCV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLCV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLCV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLCV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLCV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLCV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLCV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLCV] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLCV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLCV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLCV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLCV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLCV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLCV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLCV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLCV] SET RECOVERY FULL 
GO
ALTER DATABASE [QLCV] SET  MULTI_USER 
GO
ALTER DATABASE [QLCV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLCV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLCV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLCV] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLCV] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLCV', N'ON'
GO
USE [QLCV]
GO
/****** Object:  Table [dbo].[ChiTietLichLamViec]    Script Date: 4/24/2018 8:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietLichLamViec](
	[MaNV] [bigint] NOT NULL,
	[MaCV] [bigint] NOT NULL,
	[MaVTri] [bigint] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_ChiTietLichLamViec] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC,
	[MaCV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CongViec]    Script Date: 4/24/2018 8:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CongViec](
	[MaCV] [bigint] IDENTITY(1,1) NOT NULL,
	[MaDA] [bigint] NOT NULL,
	[Ten] [nvarchar](200) NULL,
	[Status] [int] NULL,
	[NoiDung] [ntext] NULL,
	[Cong] [int] NULL,
	[ThoiGianBD] [datetime] NULL,
	[ThoiGianKT] [datetime] NULL,
 CONSTRAINT [PK_CongViec_1] PRIMARY KEY CLUSTERED 
(
	[MaCV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DuAn]    Script Date: 4/24/2018 8:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DuAn](
	[MaDA] [bigint] IDENTITY(1,1) NOT NULL,
	[MaKH] [bigint] NULL,
	[Ten] [nvarchar](150) NULL,
	[ThoiGianBD] [datetime] NULL,
	[ThoiGianKT] [datetime] NULL,
	[TienDo] [float] NULL CONSTRAINT [DF_DuAn_TienDo]  DEFAULT ((0)),
	[DiaChi] [nvarchar](200) NULL,
	[TaiLieu] [ntext] NULL,
	[TrangThai] [int] NULL CONSTRAINT [DF_DuAn_TrangThai]  DEFAULT ((1)),
	[NgayTao] [datetime] NULL CONSTRAINT [DF_DuAn_NgayTao]  DEFAULT (getdate()),
	[MoTa] [ntext] NULL,
	[TruongDuAn] [bigint] NULL,
 CONSTRAINT [PK_DuAn] PRIMARY KEY CLUSTERED 
(
	[MaDA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 4/24/2018 8:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [bigint] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](150) NULL,
	[DiaChi] [nvarchar](250) NULL,
	[SoTK] [varchar](20) NULL,
	[SoDT] [varchar](15) NULL,
	[NgayTao] [datetime] NULL CONSTRAINT [DF_KhachHang_NgayTao]  DEFAULT (getdate()),
	[NgaySua] [datetime] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhacNho]    Script Date: 4/24/2018 8:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhacNho](
	[MaNN] [bigint] IDENTITY(1,1) NOT NULL,
	[MaNV] [bigint] NULL,
	[ThoiGian] [datetime] NULL,
	[SoLan] [int] NULL,
	[TieuDe] [nvarchar](100) NULL,
	[Status] [int] NULL CONSTRAINT [DF_NhacNho_TrangThai]  DEFAULT ((1)),
	[NoiDung] [nvarchar](500) NULL,
	[NgayTao] [datetime] NULL CONSTRAINT [DF_NhacNho_NgayTao]  DEFAULT (getdate()),
	[NguoiNhanID] [bigint] NULL,
 CONSTRAINT [PK_NhacNho] PRIMARY KEY CLUSTERED 
(
	[MaNN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 4/24/2018 8:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [bigint] IDENTITY(1,1) NOT NULL,
	[MaPB] [bigint] NULL,
	[MaVT] [bigint] NULL,
	[Ten] [nvarchar](150) NULL,
	[TaiKhoan] [varchar](200) NULL,
	[MatKhau] [varchar](200) NULL,
	[DiaChi] [nvarchar](250) NULL,
	[SoTK] [varchar](20) NULL,
	[SoDT] [varchar](15) NULL,
	[TrinhDo] [nvarchar](200) NULL,
	[Status] [int] NULL CONSTRAINT [DF_NhanVien_Status]  DEFAULT ((1)),
	[Email] [varchar](150) NULL,
	[TongCong] [float] NULL,
	[Luong] [decimal](18, 0) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhanVienQuyen]    Script Date: 4/24/2018 8:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVienQuyen](
	[MaVT] [bigint] NOT NULL,
	[MaQuyen] [int] NOT NULL,
	[NgayTao] [datetime] NULL CONSTRAINT [DF_NhanVienQuyen_NgayTao]  DEFAULT (getdate()),
	[NgaySua] [datetime] NULL,
 CONSTRAINT [PK_NhanVienQuyen] PRIMARY KEY CLUSTERED 
(
	[MaVT] ASC,
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhongBan]    Script Date: 4/24/2018 8:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhongBan](
	[MaPB] [bigint] IDENTITY(1,1) NOT NULL,
	[TenPB] [nvarchar](250) NULL,
	[SoDT] [varchar](15) NULL,
	[DiaChi] [nvarchar](500) NULL,
	[MoTa] [nvarchar](250) NULL,
 CONSTRAINT [PK_PhongBan] PRIMARY KEY CLUSTERED 
(
	[MaPB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 4/24/2018 8:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Quyen](
	[MaQuyen] [int] NOT NULL,
	[TenQuyen] [varchar](50) NULL,
	[MoTa] [nvarchar](50) NULL,
 CONSTRAINT [PK_Quyen] PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VaiTro]    Script Date: 4/24/2018 8:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VaiTro](
	[MaVT] [bigint] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](50) NULL,
 CONSTRAINT [PK_VaiTro] PRIMARY KEY CLUSTERED 
(
	[MaVT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ViTri]    Script Date: 4/24/2018 8:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ViTri](
	[MaVTri] [bigint] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](200) NULL,
	[HeSo] [float] NULL,
 CONSTRAINT [PK_ViTri] PRIMARY KEY CLUSTERED 
(
	[MaVTri] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[ChiTietLichLamViec] ([MaNV], [MaCV], [MaVTri], [Status]) VALUES (11, 11, 1, NULL)
INSERT [dbo].[ChiTietLichLamViec] ([MaNV], [MaCV], [MaVTri], [Status]) VALUES (12, 9, 2, NULL)
INSERT [dbo].[ChiTietLichLamViec] ([MaNV], [MaCV], [MaVTri], [Status]) VALUES (12, 14, 2, NULL)
INSERT [dbo].[ChiTietLichLamViec] ([MaNV], [MaCV], [MaVTri], [Status]) VALUES (13, 9, 1, NULL)
INSERT [dbo].[ChiTietLichLamViec] ([MaNV], [MaCV], [MaVTri], [Status]) VALUES (13, 14, 1, NULL)
INSERT [dbo].[ChiTietLichLamViec] ([MaNV], [MaCV], [MaVTri], [Status]) VALUES (14, 9, 2, NULL)
SET IDENTITY_INSERT [dbo].[CongViec] ON 

INSERT [dbo].[CongViec] ([MaCV], [MaDA], [Ten], [Status], [NoiDung], [Cong], [ThoiGianBD], [ThoiGianKT]) VALUES (9, 2, N'Công việc 1', 1, N'Xây dựng form', 10, CAST(N'2018-04-24 00:00:00.000' AS DateTime), CAST(N'2018-04-28 00:00:00.000' AS DateTime))
INSERT [dbo].[CongViec] ([MaCV], [MaDA], [Ten], [Status], [NoiDung], [Cong], [ThoiGianBD], [ThoiGianKT]) VALUES (11, 2, N'Công việc 2', 1, N'đasad', 10, CAST(N'2018-04-13 00:00:00.000' AS DateTime), CAST(N'2018-04-21 00:00:00.000' AS DateTime))
INSERT [dbo].[CongViec] ([MaCV], [MaDA], [Ten], [Status], [NoiDung], [Cong], [ThoiGianBD], [ThoiGianKT]) VALUES (14, 2, N'công việc 3', 1, N'3ghhy', 14, CAST(N'2018-04-24 00:00:00.000' AS DateTime), CAST(N'2018-04-28 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[CongViec] OFF
SET IDENTITY_INSERT [dbo].[DuAn] ON 

INSERT [dbo].[DuAn] ([MaDA], [MaKH], [Ten], [ThoiGianBD], [ThoiGianKT], [TienDo], [DiaChi], [TaiLieu], [TrangThai], [NgayTao], [MoTa], [TruongDuAn]) VALUES (2, 4, N'Dự án 2', CAST(N'2018-04-12 00:00:00.000' AS DateTime), CAST(N'2018-05-25 00:00:00.000' AS DateTime), 100, NULL, NULL, NULL, CAST(N'2018-04-12 00:00:00.000' AS DateTime), N'đâsdasdassadasdasd55', 13)
SET IDENTITY_INSERT [dbo].[DuAn] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [Ten], [DiaChi], [SoTK], [SoDT], [NgayTao], [NgaySua]) VALUES (1, N'Phạm đức hùng', N'Hà nội', N'0000000000', N'123456789', NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [Ten], [DiaChi], [SoTK], [SoDT], [NgayTao], [NgaySua]) VALUES (3, N'Nguyễn Thế X', N'Hà nội', N'21548794564', N'0321546578', NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [Ten], [DiaChi], [SoTK], [SoDT], [NgayTao], [NgaySua]) VALUES (4, N'Công ty A', N'Hà nội', N'35487946547', N'0124684579', NULL, NULL)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[NhacNho] ON 

INSERT [dbo].[NhacNho] ([MaNN], [MaNV], [ThoiGian], [SoLan], [TieuDe], [Status], [NoiDung], [NgayTao], [NguoiNhanID]) VALUES (1, 11, NULL, NULL, N'Tin nhắn', 0, N' Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                            Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', CAST(N'2018-04-12 15:22:33.063' AS DateTime), 12)
INSERT [dbo].[NhacNho] ([MaNN], [MaNV], [ThoiGian], [SoLan], [TieuDe], [Status], [NoiDung], [NgayTao], [NguoiNhanID]) VALUES (3, 11, CAST(N'2018-04-24 19:58:37.410' AS DateTime), NULL, N'abc', NULL, N'hhhh', CAST(N'2018-04-24 19:58:37.410' AS DateTime), 12)
SET IDENTITY_INSERT [dbo].[NhacNho] OFF
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([MaNV], [MaPB], [MaVT], [Ten], [TaiKhoan], [MatKhau], [DiaChi], [SoTK], [SoDT], [TrinhDo], [Status], [Email], [TongCong], [Luong]) VALUES (11, 1, 2, N'Quản lý', N'manager', N'123', NULL, N'123456789', N'123456789', N'cấp 1', 1, N'manager@gmial.com', NULL, NULL)
INSERT [dbo].[NhanVien] ([MaNV], [MaPB], [MaVT], [Ten], [TaiKhoan], [MatKhau], [DiaChi], [SoTK], [SoDT], [TrinhDo], [Status], [Email], [TongCong], [Luong]) VALUES (12, 7, 3, N'Đỗ Thị Mai', N'domai', N'123', N'Hà nội 2', N'111111111', N'2154355487', N'cấp 1', NULL, N'mai@gmail.com', NULL, NULL)
INSERT [dbo].[NhanVien] ([MaNV], [MaPB], [MaVT], [Ten], [TaiKhoan], [MatKhau], [DiaChi], [SoTK], [SoDT], [TrinhDo], [Status], [Email], [TongCong], [Luong]) VALUES (13, 2, 3, N'Nguyễn Quang', N'quangn', N'123', NULL, N'123124544', N'131545532', N'PGS', 1, N'quangn@gmail.com', NULL, NULL)
INSERT [dbo].[NhanVien] ([MaNV], [MaPB], [MaVT], [Ten], [TaiKhoan], [MatKhau], [DiaChi], [SoTK], [SoDT], [TrinhDo], [Status], [Email], [TongCong], [Luong]) VALUES (14, 1, 1, N'Admin', N'admin', N'123', N'Hà Nội', N'215263562315', N'0985632654', N'TS', 1, N'admin@gmail.com', NULL, NULL)
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (1, 1, CAST(N'2018-04-16 22:07:17.670' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (1, 2, CAST(N'2018-04-24 14:19:47.470' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (1, 3, CAST(N'2018-04-16 22:07:25.513' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (1, 4, CAST(N'2018-04-16 22:07:29.650' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (1, 5, CAST(N'2018-04-16 22:07:46.457' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (1, 6, CAST(N'2018-04-24 14:20:02.413' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (1, 7, CAST(N'2018-04-16 22:07:52.913' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (1, 8, CAST(N'2018-04-16 22:07:55.560' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (1, 10, CAST(N'2018-04-24 14:20:35.313' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (1, 13, CAST(N'2018-04-16 22:05:23.357' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (1, 14, CAST(N'2018-04-16 22:05:23.357' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (1, 15, CAST(N'2018-04-16 22:05:23.357' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (1, 16, CAST(N'2018-04-16 22:05:23.357' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (1, 17, CAST(N'2018-04-16 22:05:23.360' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (1, 18, CAST(N'2018-04-16 22:05:23.360' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (1, 19, CAST(N'2018-04-16 22:05:23.360' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (1, 20, CAST(N'2018-04-16 22:05:23.360' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (1, 21, CAST(N'2018-04-16 22:05:23.360' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (1, 22, CAST(N'2018-04-16 22:05:23.360' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (1, 23, CAST(N'2018-04-16 22:05:23.360' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (1, 24, CAST(N'2018-04-16 22:05:23.363' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (1, 25, CAST(N'2018-04-16 22:05:23.363' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (1, 26, CAST(N'2018-04-16 22:05:23.363' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (1, 27, CAST(N'2018-04-16 22:05:23.363' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (1, 28, CAST(N'2018-04-16 22:05:23.363' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (1, 29, CAST(N'2018-04-16 22:05:23.363' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (1, 30, CAST(N'2018-04-16 22:05:23.363' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (1, 31, CAST(N'2018-04-16 22:05:23.363' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (1, 32, CAST(N'2018-04-16 22:05:23.363' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (1, 33, CAST(N'2018-04-16 22:05:23.363' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (1, 34, CAST(N'2018-04-16 22:05:23.363' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (1, 35, CAST(N'2018-04-16 22:05:23.363' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (1, 36, CAST(N'2018-04-16 22:05:23.363' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (2, 1, CAST(N'2018-04-16 22:05:13.673' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (2, 2, CAST(N'2018-04-16 22:05:13.677' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (2, 3, CAST(N'2018-04-16 22:05:13.677' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (2, 4, CAST(N'2018-04-16 22:05:13.677' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (2, 5, CAST(N'2018-04-16 22:05:13.677' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (2, 6, CAST(N'2018-04-16 22:05:13.677' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (2, 7, CAST(N'2018-04-16 22:05:13.677' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (2, 8, CAST(N'2018-04-16 22:05:13.677' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (2, 9, CAST(N'2018-04-16 22:05:13.680' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (2, 10, CAST(N'2018-04-16 22:05:13.680' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (2, 11, CAST(N'2018-04-16 22:05:13.680' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (2, 12, CAST(N'2018-04-16 22:05:13.680' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (2, 13, CAST(N'2018-04-16 22:05:13.680' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (2, 14, CAST(N'2018-04-16 22:05:13.680' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (2, 15, CAST(N'2018-04-16 22:05:13.680' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (2, 16, CAST(N'2018-04-16 22:05:13.680' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (2, 17, CAST(N'2018-04-16 22:05:13.683' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (2, 18, CAST(N'2018-04-16 22:05:13.683' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (2, 19, CAST(N'2018-04-16 22:05:13.683' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (2, 20, CAST(N'2018-04-16 22:05:13.683' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (2, 21, CAST(N'2018-04-16 22:05:13.683' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (2, 22, CAST(N'2018-04-16 22:05:13.683' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (2, 23, CAST(N'2018-04-16 22:05:13.683' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (2, 24, CAST(N'2018-04-16 22:05:13.683' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (2, 25, CAST(N'2018-04-16 22:05:13.683' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (2, 26, CAST(N'2018-04-16 22:05:13.683' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (2, 27, CAST(N'2018-04-16 22:05:13.683' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (2, 28, CAST(N'2018-04-16 22:05:13.683' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (2, 29, CAST(N'2018-04-16 22:05:13.683' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (2, 30, CAST(N'2018-04-16 22:05:13.683' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (2, 31, CAST(N'2018-04-16 22:05:13.683' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (2, 32, CAST(N'2018-04-16 22:05:13.683' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (2, 33, CAST(N'2018-04-16 22:05:13.687' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (2, 34, CAST(N'2018-04-16 22:05:13.687' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (2, 35, CAST(N'2018-04-16 22:05:13.687' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (2, 36, CAST(N'2018-04-16 22:05:13.687' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (3, 2, CAST(N'2018-04-16 22:07:23.323' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (3, 6, CAST(N'2018-04-16 22:07:49.867' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (3, 10, CAST(N'2018-04-16 22:08:00.930' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (3, 14, CAST(N'2018-04-16 22:09:54.287' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (3, 17, CAST(N'2018-04-16 22:10:02.837' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (3, 18, CAST(N'2018-04-16 22:10:27.860' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (3, 19, CAST(N'2018-04-16 22:10:31.177' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (3, 22, CAST(N'2018-04-16 22:10:45.750' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (3, 26, CAST(N'2018-04-16 22:10:55.663' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (3, 30, CAST(N'2018-04-16 22:11:11.063' AS DateTime), NULL)
INSERT [dbo].[NhanVienQuyen] ([MaVT], [MaQuyen], [NgayTao], [NgaySua]) VALUES (3, 34, CAST(N'2018-04-16 22:11:13.503' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[PhongBan] ON 

INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [SoDT], [DiaChi], [MoTa]) VALUES (1, N'Phòng Giám đốc ', N'123456789', N'HN', N'abcd')
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [SoDT], [DiaChi], [MoTa]) VALUES (2, N'Phòng Nhân sự', NULL, NULL, NULL)
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [SoDT], [DiaChi], [MoTa]) VALUES (3, N'Phòng Kế toán', NULL, NULL, NULL)
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [SoDT], [DiaChi], [MoTa]) VALUES (4, N'Phòng software', NULL, NULL, NULL)
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [SoDT], [DiaChi], [MoTa]) VALUES (5, N'Phòng quản lý chất lượng', NULL, NULL, NULL)
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [SoDT], [DiaChi], [MoTa]) VALUES (6, N'Phòng kinh doanh', NULL, NULL, NULL)
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [SoDT], [DiaChi], [MoTa]) VALUES (7, N'Phòng hỗ trợ', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[PhongBan] OFF
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa]) VALUES (1, N'CREATE_CHITIETLICHLAMVIEC', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa]) VALUES (2, N'READ_CHITIETLICHLAMVIEC', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa]) VALUES (3, N'UPDATE_CHITIETLICHLAMVIEC', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa]) VALUES (4, N'DELETE_CHITIETLICHLAMVIEC', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa]) VALUES (5, N'CREATE_CONGVIEC', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa]) VALUES (6, N'READ_CONGVIEC', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa]) VALUES (7, N'UPDATE_CONGVIEC', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa]) VALUES (8, N'DELETE_CONGVIEC', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa]) VALUES (9, N'CREATE_DUAN', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa]) VALUES (10, N'READ_DUAN', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa]) VALUES (11, N'UPDATE_DUAN', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa]) VALUES (12, N'DELETE_DUAN', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa]) VALUES (13, N'CREATE_KHACHHANG', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa]) VALUES (14, N'READ_KHACHHANG', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa]) VALUES (15, N'UPDATE_KHACHHANG', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa]) VALUES (16, N'DELETE_KHACHHANG', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa]) VALUES (17, N'CREATE_NHACNHO', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa]) VALUES (18, N'READ_NHACNHO', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa]) VALUES (19, N'UPDATE_NHACNHO', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa]) VALUES (20, N'DELETE_NHACNHO', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa]) VALUES (21, N'CREATE_NHANVIEN', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa]) VALUES (22, N'READ_NHANVIEN', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa]) VALUES (23, N'UPDATE_NHANVIEN', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa]) VALUES (24, N'DELETE_NHANVIEN', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa]) VALUES (25, N'CREATE_PHONGBAN', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa]) VALUES (26, N'READ_PHONGBAN', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa]) VALUES (27, N'UPDATE_PHONGBAN', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa]) VALUES (28, N'DELETE_PHONGBAN', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa]) VALUES (29, N'CREATE_VAITRO', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa]) VALUES (30, N'READ_VAITRO', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa]) VALUES (31, N'UPDATE_VAITRO', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa]) VALUES (32, N'DELETE_VAITRO', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa]) VALUES (33, N'CREATE_VITRI', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa]) VALUES (34, N'READ_VITRI', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa]) VALUES (35, N'UPDATE_VITRI', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa]) VALUES (36, N'DELETE_VITRI', NULL)
SET IDENTITY_INSERT [dbo].[VaiTro] ON 

INSERT [dbo].[VaiTro] ([MaVT], [Ten]) VALUES (1, N'ADMIN')
INSERT [dbo].[VaiTro] ([MaVT], [Ten]) VALUES (2, N'MANAGER')
INSERT [dbo].[VaiTro] ([MaVT], [Ten]) VALUES (3, N'EMPLOYEE')
SET IDENTITY_INSERT [dbo].[VaiTro] OFF
SET IDENTITY_INSERT [dbo].[ViTri] ON 

INSERT [dbo].[ViTri] ([MaVTri], [Ten], [HeSo]) VALUES (1, N'Leader', 1.5)
INSERT [dbo].[ViTri] ([MaVTri], [Ten], [HeSo]) VALUES (2, N'Member', 1.3)
INSERT [dbo].[ViTri] ([MaVTri], [Ten], [HeSo]) VALUES (3, N'Tester', 1.2)
SET IDENTITY_INSERT [dbo].[ViTri] OFF
USE [master]
GO
ALTER DATABASE [QLCV] SET  READ_WRITE 
GO
