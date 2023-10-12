USE BanAmthanh
GO

/****** Object:  Database [BanAmthanh]    Script Date: 23/09/2023 11:39:06 SA ******/
CREATE DATABASE [BanAmthanh]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BanAmthanh', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS00\MSSQL\DATA\BanAmthanh.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BanAmthanh_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS00\MSSQL\DATA\BanAmthanh_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BanAmthanh].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [BanAmthanh] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [BanAmthanh] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [BanAmthanh] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [BanAmthanh] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [BanAmthanh] SET ARITHABORT OFF 
GO

ALTER DATABASE [BanAmthanh] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [BanAmthanh] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [BanAmthanh] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [BanAmthanh] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [BanAmthanh] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [BanAmthanh] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [BanAmthanh] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [BanAmthanh] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [BanAmthanh] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [BanAmthanh] SET  ENABLE_BROKER 
GO

ALTER DATABASE [BanAmthanh] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [BanAmthanh] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [BanAmthanh] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [BanAmthanh] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [BanAmthanh] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [BanAmthanh] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [BanAmthanh] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [BanAmthanh] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [BanAmthanh] SET  MULTI_USER 
GO

ALTER DATABASE [BanAmthanh] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [BanAmthanh] SET DB_CHAINING OFF 
GO

ALTER DATABASE [BanAmthanh] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [BanAmthanh] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [BanAmthanh] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [BanAmthanh] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [BanAmthanh] SET QUERY_STORE = ON
GO

ALTER DATABASE [BanAmthanh] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO

ALTER DATABASE [BanAmthanh] SET  READ_WRITE 
GO

USE [BanAmthanh]
GO
USE [BanAmthanh]
GO

/****** Object:  Table [dbo].[Nguoidung]    Script Date: 23/09/2023 11:39:43 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Nguoidung](
	[NguoidungID] INT IDENTITY(1,1)  NOT NULL,
	[hoten] [nvarchar](150) NULL,
	[ngaysinh] [date] NULL,
	[diachi] [nvarchar](250) NULL,
	[gioitinh] [nvarchar](30) NULL,
	[email] [varchar](150) NULL,
	[taikhoan] [varchar](30) NULL,
	[matkhau] [varchar](60) NULL,
	[role] [varchar](30) NULL,
 CONSTRAINT [PK_Nguoidung] PRIMARY KEY CLUSTERED 
(
	[NguoidungID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [BanAmthanh]
GO

USE [BanAmthanh]
GO

/****** Object:  Table [dbo].[SanPham]    Script Date: 12/10/2023 9:15:19 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SanPham](
	[MaSanPham] [nvarchar](50) NOT NULL,
	[MaChuyenMuc] [nvarchar](50) NULL,
	[TenSanPham] [nvarchar](150) NULL,
	[AnhSanPham] [nvarchar](350) NULL,
	[Gia] [decimal](18, 0) NULL,
	[Giagiam] [decimal](18, 0) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_Chuyenmuc] FOREIGN KEY([MaChuyenMuc])
REFERENCES [dbo].[Chuyenmuc] ([MaChuyenMuc])
GO

ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_Chuyenmuc]
GO
USE [BanAmthanh]
GO

/****** Object:  Table [dbo].[ChiTietSanPham]    Script Date: 12/10/2023 9:15:51 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ChiTietSanPham](
	[MaChiTietSanPham] [nvarchar](50) NOT NULL,
	[MaSanPham] [nvarchar](50) NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[Soluong] [int] NULL,
	[Donvi] [nvarchar](50) NULL,
	[Baohanh] [nvarchar](150) NULL,
	[Tinhtrang] [nvarchar](100) NULL,
	[AnhSP] [nvarchar](350) NULL,
	[Chitiet] [nvarchar](max) NULL,
 CONSTRAINT [PK_ChiTietSanPham] PRIMARY KEY CLUSTERED 
(
	[MaChiTietSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietSanPham_SanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO

ALTER TABLE [dbo].[ChiTietSanPham] CHECK CONSTRAINT [FK_ChiTietSanPham_SanPham]
GO

/****** Object:  Table [dbo].[Chuyenmuc]    Script Date: 23/09/2023 11:40:33 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Chuyenmuc](
	[MaChuyenMuc] [nvarchar](50) NOT NULL,
	[MaChuyenMucCha] [nvarchar](50) NULL,
	[TenChuyenMuc] [nvarchar](50) NULL,
	[NoiDung] [nvarchar](max) NULL,
 CONSTRAINT [PK_Chuyenmuc] PRIMARY KEY CLUSTERED 
(
	[MaChuyenMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[HoaDon]    Script Date: 23/09/2023 11:40:15 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[HoaDon](
	[Mahoadon] [nvarchar](50) NOT NULL,
	[TenKH] [nvarchar](150) NULL,
	[Diachi] [nvarchar](100) NULL,
	[NgayTao] [datetime] NULL,
	[NgayDuyet] [datetime] NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[Mahoadon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 23/09/2023 11:39:26 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ChiTietHoaDon](
	[MachitietHoadon] [nchar](50) NOT NULL,
	[Mahoadon] [nvarchar](50) NULL,
	[MaSanpham] [nvarchar](50) NULL,
	[Soluong] [int] NULL,
	[Tonggia] [int] NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[MachitietHoadon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HoaDon] FOREIGN KEY([Mahoadon])
REFERENCES [dbo].[HoaDon] ([Mahoadon])
GO

ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HoaDon]
GO

ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_San_Pham] FOREIGN KEY([MaSanpham])
REFERENCES [dbo].[San_Pham] ([MaSanPham])
GO

ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_San_Pham]
GO

USE [BanAmthanh]
GO

/****** Object:  StoredProcedure [dbo].[sp_nguoidung_create]    Script Date: 28/09/2023 8:37:44 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[sp_nguoidung_create]
( 
 @hoten          nvarchar(150) ,
 @ngaysinh         date  ,
 @diachi          nvarchar(250)  ,
 @gioitinh         nvarchar(30)  ,
 @email          varchar(150) ,
 @taikhoan         varchar(30) ,
 @matkhau         varchar(60)  ,
 @roles          varchar(30) 
)
AS
    BEGIN
      INSERT INTO Nguoidung
                (
					 hoten           ,
					 ngaysinh          ,
					 diachi           ,
					 gioitinh           ,
					 email           ,
					 taikhoan         ,
					 matkhau           ,
					 roles  
				)
                VALUES
                (
				 @hoten           ,
				 @ngaysinh          ,
				 @diachi           ,
				 @gioitinh           ,
				 @email           ,
				 @taikhoan         ,
				 @matkhau           ,
				 @roles
				);
        SELECT '';
    END;
GO

USE [BanAmthanh]
GO

/****** Object:  StoredProcedure [dbo].[sp_nguoidung_delete_id]    Script Date: 28/09/2023 8:39:42 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[sp_nguoidung_delete_id]
(@nguoidung_id              nchar(50) 
)
AS
    BEGIN
		delete from Nguoidung where NguoidungID = @nguoidung_id;
        SELECT '';
    END;
GO

USE [BanAmthanh]
GO

/****** Object:  StoredProcedure [dbo].[sp_nguoidung_get_by_id]    Script Date: 28/09/2023 8:41:38 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_nguoidung_get_by_id](@nguoidung_id INT)
AS
    BEGIN
        SELECT  NguoidungID               , 
					 hoten           ,
					 ngaysinh          ,
					 diachi           ,
					 gioitinh           ,
					 email           ,
					 taikhoan         ,
					 matkhau           ,
					 roles      
        FROM Nguoidung
      where  NguoidungID = @nguoidung_id;
    END;
GO

USE [BanAmthanh]
GO

/****** Object:  StoredProcedure [dbo].[sp_nguoidung_get_by_username_password]    Script Date: 28/09/2023 8:43:24 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_nguoidung_get_by_username_password](@taikhoan varchar(30), @matkhau varchar(60))
AS
    BEGIN
        SELECT  NguoidungID               , 
					 hoten           ,
					 ngaysinh          ,
					 diachi           ,
					 gioitinh           ,
					 email           ,
					 taikhoan         ,
					 matkhau,
					 roles      
        FROM Nguoidung
      where  taikhoan = @taikhoan and matkhau = @matkhau ;
    END;
GO
USE [BanAmthanh]
GO

/****** Object:  StoredProcedure [dbo].[sp_nguoidung_search]    Script Date: 28/09/2023 8:50:20 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_nguoidung_search] (@page_index  INT, 
                                       @page_size   INT,
									   @hoten nvarchar(150),
									    @taikhoan varchar(30)
									   )
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
                SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY u.hoten ASC)) AS RowNumber, 
                             u.NguoidungID            , 
							 u.hoten           ,
							 u.ngaysinh          ,
							 u.diachi           ,
							 u.gioitinh           ,
							 u.email           ,
							 u.taikhoan         ,
							 u.matkhau           ,
							 u.roles  
                        INTO #Results1
                        FROM Nguoidung AS u
						WHERE (u.taikhoan <> 'Admin') and ((@hoten = '') OR (u.hoten LIKE '%' + @hoten + '%')) and  ((@taikhoan = '') OR (u.taikhoan = @taikhoan));
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1;
                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
                SET NOCOUNT ON;
                         SELECT(ROW_NUMBER() OVER(
                              ORDER BY u.hoten ASC)) AS RowNumber, 
                             u.NguoidungID              , 
							 u.hoten           ,
							 u.ngaysinh          ,
							 u.diachi           ,
							 u.gioitinh           ,
							 u.email           ,
							 u.taikhoan         ,
							 u.matkhau           ,
							 u.roles     
                        INTO #Results2
                        FROM Nguoidung AS u
						WHERE (u.taikhoan <> 'Admin') and ((@hoten = '') OR (u.hoten LIKE '%' + @hoten + '%')) and  ((@taikhoan = '') OR (u.taikhoan = @taikhoan));
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;
                        DROP TABLE #Results2;
        END;
    END;
GO

USE [BanAmthanh]
GO

/****** Object:  StoredProcedure [dbo].[sp_nguoidung_update]    Script Date: 28/09/2023 8:52:37 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

alter PROCEDURE [dbo].[sp_nguoidung_update]
(@nguoidung_id             nchar(50), 
 @hoten          nvarchar(150) ,
 @ngaysinh         date  ,
 @diachi          nvarchar(250)  ,
 @gioitinh         nvarchar(30)  ,
 @email          varchar(150) ,
 @taikhoan         varchar(30) ,
 @matkhau         varchar(60)  ,
 @role          varchar(30)
)
AS
    BEGIN
   update Nguoidung set 
				hoten= @hoten           ,
				ngaysinh= @ngaysinh          ,
				diachi= @diachi           ,
				gioitinh= @gioitinh           ,
				email= @email           ,
				matkhau = @matkhau           ,
				roles= @role 
				where NguoidungID = @nguoidung_id;
        SELECT '';
    END;
GO

/****** Object:  StoredProcedure [dbo].[sp_Chuyenmuc_get_by_id]    Script Date: 12/10/2023 9:23:56 SA ******/
CREATE PROCEDURE [dbo].[sp_Chuyenmuc_get_by_id](@machuyenmuc_id nvarchar(50))
AS
    BEGIN
        SELECT  MaChuyenMuc              , 
					 MaChuyenMucCha          ,
					 TenChuyenMuc         ,
					 NoiDung       
        FROM Chuyenmuc
      where  MaChuyenMuc = @machuyenmuc_id;
    END;
GO
USE [BanAmthanh]
GO

/****** Object:  StoredProcedure [dbo].[sp_chuyenmuc_create]    Script Date: 12/10/2023 9:28:24 SA ******/
ALTER PROCEDURE [dbo].[sp_chuyenmuc_create]
(@machuyenmuc             NVARCHAR(50), 
 @machuyenmuc_cha       NVARCHAR(50), 
 @tenchuyenmuc         NVARCHAR(50), 
 @noidung           NVARCHAR(MAX),
 @list_json_sanpham NVARCHAR(MAX),
 @list_json_chitietsanpham NVARCHAR(MAX)
)
AS
    BEGIN
      INSERT INTO Chuyenmuc
                (MaChuyenMuc, 
                 MaChuyenMucCha, 
                 TenChuyenMuc, 
                 NoiDung          
                )
                VALUES
                (@machuyenmuc, 
                 @machuyenmuc_cha, 
                 @tenchuyenmuc, 
                 @noidung
                );
				SET @machuyenmuc = (SELECT SCOPE_IDENTITY());
                IF(@list_json_sanpham IS NOT NULL)
                    BEGIN
						DECLARE @MaSanPham NVARCHAR(50);
                        INSERT INTO SanPham
						 (MaSanPham,
						  MaChuyenMuc,
						  TenSanPham,
                          AnhSanPham, 
                          Gia,
						  Giagiam
                        )
                    SELECT @MaSanPham, 
                           @machuyenmuc, 
                            JSON_VALUE(p.value, '$.tenSanPham'), 
                            JSON_VALUE(p.value, '$.anhSanPham'),
							JSON_VALUE(p.value, '$.gia'),
							JSON_VALUE(p.value, '$.giagiam')
                    FROM OPENJSON(@list_json_sanpham) AS p;
					SET @MaSanPham = (SELECT SCOPE_IDENTITY());
					IF(@list_json_chitietsanpham IS NOT NULL)
						BEGIN
							INSERT INTO ChiTietSanPham
								(MaChiTietSanPham,
								MaSanPham,
								MoTa,
								Soluong, 
								Donvi,
								Baohanh,
								Tinhtrang,
								AnhSP,
								Chitiet
							)
						SELECT JSON_VALUE(p.value, '$.maChiTietSanPham'), 
								@MaSanPham, 
								JSON_VALUE(p.value, '$.tenSanPham'), 
								JSON_VALUE(p.value, '$.anhSanPham'),
								JSON_VALUE(p.value, '$.gia'),
								JSON_VALUE(p.value, '$.giagiam')
						FROM OPENJSON(@list_json_sanpham) AS p;

					END;
				END;
        SELECT '';
    END;
GO
USE [BanAmthanh]
GO

/****** Object:  StoredProcedure [dbo].[sp_chuyenmuc_search]    Script Date: 12/10/2023 9:33:24 SA ******/
ALTER PROCEDURE [dbo].[sp_chuyenmuc_search] (@page_index  INT, 
                                       @page_size   INT,
									   @machuyenmuc Nvarchar(50),
									   @machuyenmuccha  Nvarchar(50))
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
                SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY TenChuyenMuc ASC)) AS RowNumber, 
                              i.MaChuyenMuc, 
                              i.MaChuyenMucCha, 
                              i.TenChuyenMuc , 
                              i.NoiDung
                        INTO #Results1
                        FROM Chuyenmuc AS i
					    WHERE ((@machuyenmuc = '') OR (i.MaChuyenMuc = @machuyenmuc)) and ((@machuyenmuccha = '') OR (i.MaChuyenMucCha = @machuyenmuccha));                   
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1;
                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
                SET NOCOUNT ON;
                         SELECT(ROW_NUMBER() OVER(
                               ORDER BY TenChuyenMuc ASC)) AS RowNumber, 
                              i.MaChuyenMuc, 
                              i.MaChuyenMucCha, 
                              i.TenChuyenMuc , 
                              i.NoiDung
                        INTO #Results2
                        FROM Chuyenmuc AS i
						WHERE ((@machuyenmuc = '') OR (i.MaChuyenMuc = @machuyenmuc)) and ((@machuyenmuccha = '') OR (i.MaChuyenMucCha = @machuyenmuccha));            
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;
                        DROP TABLE #Results2;
        END;
    END;
GO
USE [BanAmthanh]
GO

/****** Object:  StoredProcedure [dbo].[sp_chuyenmuc_delete]    Script Date: 12/10/2023 9:35:38 SA ******/
create PROCEDURE [dbo].[sp_chuyenmuc_delete]
(@machuyenmuc             nvarchar(50) 
)
AS
    BEGIN
		delete from Chuyenmuc where MaChuyenMuc = @machuyenmuc;
        SELECT '';
    END;
GO
USE [BanAmthanh]
GO

/****** Object:  StoredProcedure [dbo].[sp_chuyenmuc_update]    Script Date: 12/10/2023 9:42:47 SA ******/
ALTER PROCEDURE [dbo].[sp_chuyenmuc_update]
(@machuyenmuc             NVARCHAR(50), 
 @machuyenmuc_cha       NVARCHAR(50), 
 @tenchuyenmuc         NVARCHAR(50), 
 @noidung           NVARCHAR(MAX) 
)
AS
    BEGIN
   update Chuyenmuc set    
				MaChuyenMucCha= @machuyenmuc_cha          ,
				TenChuyenMuc= @tenchuyenmuc           ,
				NoiDung= @noidung           
				where MaChuyenMuc = @machuyenmuc;
        SELECT '';
    END;
GO












