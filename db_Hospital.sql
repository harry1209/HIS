USE [db_hospital]
GO
/****** Object:  Database [db_hospital]    Script Date: 2014/11/26 2:22:27 ******/
CREATE DATABASE [db_hospital] ON  PRIMARY 
( NAME = N'db_hospital', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\db_hospital.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'db_hospital_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\db_hospital_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_hospital].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_hospital] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_hospital] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_hospital] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_hospital] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_hospital] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_hospital] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_hospital] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [db_hospital] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_hospital] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_hospital] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_hospital] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_hospital] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_hospital] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_hospital] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_hospital] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_hospital] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_hospital] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_hospital] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_hospital] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_hospital] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_hospital] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_hospital] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_hospital] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_hospital] SET RECOVERY FULL 
GO
ALTER DATABASE [db_hospital] SET  MULTI_USER 
GO
ALTER DATABASE [db_hospital] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_hospital] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'db_hospital', N'ON'
GO
USE [db_hospital]
GO
/****** Object:  Table [dbo].[Authorization_Information]    Script Date: 2014/11/26 2:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Authorization_Information](
	[DoctorID] [varchar](100) NOT NULL,
	[PatientID] [varchar](100) NOT NULL,
	[RecordID] [varchar](100) NOT NULL,
	[AuthorizationID] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DoctorID] ASC,
	[PatientID] ASC,
	[RecordID] ASC,
	[AuthorizationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bill_Information]    Script Date: 2014/11/26 2:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bill_Information](
	[DoctorID] [varchar](100) NOT NULL,
	[PatientID] [varchar](100) NOT NULL,
	[RecordID] [varchar](100) NOT NULL,
	[BillID] [varchar](100) NOT NULL,
	[BillPrice] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DoctorID] ASC,
	[PatientID] ASC,
	[RecordID] ASC,
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Billdetail_Information]    Script Date: 2014/11/26 2:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Billdetail_Information](
	[RecordID] [varchar](100) NULL,
	[BillID] [varchar](100) NOT NULL,
	[BillItemID] [varchar](100) NOT NULL,
	[BillItemName] [varchar](100) NULL,
	[BillItemType] [varchar](100) NULL,
	[BillItemPrice] [int] NULL,
	[BillItemQuantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BillID] ASC,
	[BillItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Department_Information]    Script Date: 2014/11/26 2:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department_Information](
	[DepartmentName] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Login_Information]    Script Date: 2014/11/26 2:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Login_Information](
	[MemberID] [varchar](50) NOT NULL,
	[MemberPassword] [varchar](50) NULL,
	[IdentityInfo] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Medicine_Information]    Script Date: 2014/11/26 2:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Medicine_Information](
	[MedicineID] [varchar](100) NOT NULL,
	[MedicineName] [varchar](100) NOT NULL,
	[MedicineType] [varchar](100) NULL,
	[MedicinePrice] [int] NULL,
	[MedicineInfo] [varchar](8000) NULL,
PRIMARY KEY CLUSTERED 
(
	[MedicineID] ASC,
	[MedicineName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Medicinetype_Information]    Script Date: 2014/11/26 2:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Medicinetype_Information](
	[MedicinetypeName] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MedicinetypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Member_Information]    Script Date: 2014/11/26 2:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Member_Information](
	[MemberID] [varchar](50) NOT NULL,
	[MemberName] [varchar](50) NULL,
	[MemberGender] [varchar](50) NULL,
	[MemberAge] [int] NULL,
	[MemberDepartment] [varchar](100) NULL,
	[MemberEmail] [varchar](100) NULL,
	[MemberTel] [varchar](50) NULL,
	[MemberAddress] [varchar](200) NULL,
	[MemberComment] [varchar](100) NULL,
	[MemberInfo] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Record_Information]    Script Date: 2014/11/26 2:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Record_Information](
	[DoctorID] [varchar](100) NOT NULL,
	[PatientID] [varchar](100) NOT NULL,
	[RecordID] [varchar](100) NOT NULL,
	[RecordContent] [varchar](8000) NULL,
PRIMARY KEY CLUSTERED 
(
	[DoctorID] ASC,
	[RecordID] ASC,
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Visitation_Information]    Script Date: 2014/11/26 2:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Visitation_Information](
	[RecordID] [varchar](100) NULL,
	[BillID] [varchar](100) NULL,
	[MemberID] [varchar](100) NULL,
	[Working] [varchar](100) NULL,
	[Location] [varchar](100) NULL,
	[Visitation] [varchar](500) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Authorization_Information] ([DoctorID], [PatientID], [RecordID], [AuthorizationID]) VALUES (N'admin', N'P1', N'PP1', N'admin')
INSERT [dbo].[Authorization_Information] ([DoctorID], [PatientID], [RecordID], [AuthorizationID]) VALUES (N'admin', N'P1001', N'PR1001', N'admin')
INSERT [dbo].[Authorization_Information] ([DoctorID], [PatientID], [RecordID], [AuthorizationID]) VALUES (N'admin', N'P1001', N'PR10011', N'admin')
INSERT [dbo].[Authorization_Information] ([DoctorID], [PatientID], [RecordID], [AuthorizationID]) VALUES (N'admin', N'P1001', N'PR10012', N'admin')
INSERT [dbo].[Authorization_Information] ([DoctorID], [PatientID], [RecordID], [AuthorizationID]) VALUES (N'admin', N'P1002', N'P10021', N'admin')
INSERT [dbo].[Authorization_Information] ([DoctorID], [PatientID], [RecordID], [AuthorizationID]) VALUES (N'admin', N'qqq', N'qqq', N'admin')
INSERT [dbo].[Authorization_Information] ([DoctorID], [PatientID], [RecordID], [AuthorizationID]) VALUES (N'admin', N'uuuuu', N'poi', N'admin')
INSERT [dbo].[Authorization_Information] ([DoctorID], [PatientID], [RecordID], [AuthorizationID]) VALUES (N'D1001', N'P1001', N'987', N'D1001')
INSERT [dbo].[Authorization_Information] ([DoctorID], [PatientID], [RecordID], [AuthorizationID]) VALUES (N'D1001', N'P1001', N'PR1001', N'D1001')
INSERT [dbo].[Authorization_Information] ([DoctorID], [PatientID], [RecordID], [AuthorizationID]) VALUES (N'D1001', N'P10012', N'PR100121', N'D1001')
INSERT [dbo].[Authorization_Information] ([DoctorID], [PatientID], [RecordID], [AuthorizationID]) VALUES (N'D1001', N'P1002', N'PR111', N'D1001')
INSERT [dbo].[Authorization_Information] ([DoctorID], [PatientID], [RecordID], [AuthorizationID]) VALUES (N'D1001', N'PD1001', N'PD10011', N'D1001')
INSERT [dbo].[Authorization_Information] ([DoctorID], [PatientID], [RecordID], [AuthorizationID]) VALUES (N'D1002', N'P1001', N'10021001', N'D1002')
INSERT [dbo].[Bill_Information] ([DoctorID], [PatientID], [RecordID], [BillID], [BillPrice]) VALUES (N'admin', N'P1001', N'PR10011', N'BPR100111', NULL)
INSERT [dbo].[Bill_Information] ([DoctorID], [PatientID], [RecordID], [BillID], [BillPrice]) VALUES (N'D1001', N'P1001', N'987', N'10008', 48)
INSERT [dbo].[Bill_Information] ([DoctorID], [PatientID], [RecordID], [BillID], [BillPrice]) VALUES (N'D1001', N'P1002', N'PR111', N'B10001', NULL)
INSERT [dbo].[Bill_Information] ([DoctorID], [PatientID], [RecordID], [BillID], [BillPrice]) VALUES (N'D1002', N'P1001', N'10021001', N'101', NULL)
INSERT [dbo].[Bill_Information] ([DoctorID], [PatientID], [RecordID], [BillID], [BillPrice]) VALUES (N'D1002', N'P1001', N'10021001', N'102', NULL)
INSERT [dbo].[Bill_Information] ([DoctorID], [PatientID], [RecordID], [BillID], [BillPrice]) VALUES (N'D1002', N'P1001', N'10021001', N'103', NULL)
INSERT [dbo].[Billdetail_Information] ([RecordID], [BillID], [BillItemID], [BillItemName], [BillItemType], [BillItemPrice], [BillItemQuantity]) VALUES (N'987', N'10008', N'M1001', N'MM1', N'Medicine', 1, 3)
INSERT [dbo].[Billdetail_Information] ([RecordID], [BillID], [BillItemID], [BillItemName], [BillItemType], [BillItemPrice], [BillItemQuantity]) VALUES (N'987', N'10008', N'M1009', N'MM9', N'Medicine', 9, 5)
INSERT [dbo].[Billdetail_Information] ([RecordID], [BillID], [BillItemID], [BillItemName], [BillItemType], [BillItemPrice], [BillItemQuantity]) VALUES (N'10021001', N'101', N'M1001', N'MM1', N'Medicine', 1, 3123)
INSERT [dbo].[Department_Information] ([DepartmentName]) VALUES (N'Doctor')
INSERT [dbo].[Department_Information] ([DepartmentName]) VALUES (N'Financial')
INSERT [dbo].[Department_Information] ([DepartmentName]) VALUES (N'IT')
INSERT [dbo].[Department_Information] ([DepartmentName]) VALUES (N'Lawyer')
INSERT [dbo].[Department_Information] ([DepartmentName]) VALUES (N'None')
INSERT [dbo].[Department_Information] ([DepartmentName]) VALUES (N'Nurse')
INSERT [dbo].[Department_Information] ([DepartmentName]) VALUES (N'Patient')
INSERT [dbo].[Login_Information] ([MemberID], [MemberPassword], [IdentityInfo]) VALUES (N'admin', N'admin', N'IT')
INSERT [dbo].[Login_Information] ([MemberID], [MemberPassword], [IdentityInfo]) VALUES (N'D1001', N'D1001', N'Doctor')
INSERT [dbo].[Login_Information] ([MemberID], [MemberPassword], [IdentityInfo]) VALUES (N'D1002', N'D1002', N'Doctor')
INSERT [dbo].[Login_Information] ([MemberID], [MemberPassword], [IdentityInfo]) VALUES (N'D1003', N'D1003', N'Doctor')
INSERT [dbo].[Login_Information] ([MemberID], [MemberPassword], [IdentityInfo]) VALUES (N'D1004', N'D1004', N'Doctor')
INSERT [dbo].[Login_Information] ([MemberID], [MemberPassword], [IdentityInfo]) VALUES (N'D1005', N'D1005', N'Doctor')
INSERT [dbo].[Login_Information] ([MemberID], [MemberPassword], [IdentityInfo]) VALUES (N'D1006', N'D1006', N'Doctor')
INSERT [dbo].[Login_Information] ([MemberID], [MemberPassword], [IdentityInfo]) VALUES (N'D1007', N'D1007', N'Doctor')
INSERT [dbo].[Login_Information] ([MemberID], [MemberPassword], [IdentityInfo]) VALUES (N'D1008', N'D1008', N'Doctor')
INSERT [dbo].[Login_Information] ([MemberID], [MemberPassword], [IdentityInfo]) VALUES (N'D1009', N'D1009', N'Doctor')
INSERT [dbo].[Login_Information] ([MemberID], [MemberPassword], [IdentityInfo]) VALUES (N'D1010', N'D1010', N'Doctor')
INSERT [dbo].[Login_Information] ([MemberID], [MemberPassword], [IdentityInfo]) VALUES (N'F100', N'F100', N'Financial')
INSERT [dbo].[Login_Information] ([MemberID], [MemberPassword], [IdentityInfo]) VALUES (N'L1001', N'L1001', N'Lawyer')
INSERT [dbo].[Login_Information] ([MemberID], [MemberPassword], [IdentityInfo]) VALUES (N'N1001', N'N1001', N'Nurse')
INSERT [dbo].[Login_Information] ([MemberID], [MemberPassword], [IdentityInfo]) VALUES (N'P1001', N'P1001', N'Patient')
INSERT [dbo].[Login_Information] ([MemberID], [MemberPassword], [IdentityInfo]) VALUES (N'P10012', N'P10012', N'Patient')
INSERT [dbo].[Login_Information] ([MemberID], [MemberPassword], [IdentityInfo]) VALUES (N'P1002', N'P1002', N'Patient')
INSERT [dbo].[Login_Information] ([MemberID], [MemberPassword], [IdentityInfo]) VALUES (N'P1003', N'P1003', N'Patient')
INSERT [dbo].[Login_Information] ([MemberID], [MemberPassword], [IdentityInfo]) VALUES (N'P1004', N'P1004', N'Patient')
INSERT [dbo].[Login_Information] ([MemberID], [MemberPassword], [IdentityInfo]) VALUES (N'P1005', N'P1005', N'Patient')
INSERT [dbo].[Login_Information] ([MemberID], [MemberPassword], [IdentityInfo]) VALUES (N'P1006', N'P1006', N'Patient')
INSERT [dbo].[Login_Information] ([MemberID], [MemberPassword], [IdentityInfo]) VALUES (N'P1007', N'P1007', N'Patient')
INSERT [dbo].[Login_Information] ([MemberID], [MemberPassword], [IdentityInfo]) VALUES (N'P1008', N'P1008', N'Patient')
INSERT [dbo].[Login_Information] ([MemberID], [MemberPassword], [IdentityInfo]) VALUES (N'P1009', N'P1009', N'Patient')
INSERT [dbo].[Login_Information] ([MemberID], [MemberPassword], [IdentityInfo]) VALUES (N'P1010', N'P1010', N'Patient')
INSERT [dbo].[Login_Information] ([MemberID], [MemberPassword], [IdentityInfo]) VALUES (N'P1011', N'P1011', N'Patient')
INSERT [dbo].[Medicine_Information] ([MedicineID], [MedicineName], [MedicineType], [MedicinePrice], [MedicineInfo]) VALUES (N'M1001', N'MM1', N'Medicine', 1, N'Good1')
INSERT [dbo].[Medicine_Information] ([MedicineID], [MedicineName], [MedicineType], [MedicinePrice], [MedicineInfo]) VALUES (N'M1002', N'MM2', N'Medicine', 2, N'Good2')
INSERT [dbo].[Medicine_Information] ([MedicineID], [MedicineName], [MedicineType], [MedicinePrice], [MedicineInfo]) VALUES (N'M1003', N'MM3', N'Medicine', 3, N'Good3')
INSERT [dbo].[Medicine_Information] ([MedicineID], [MedicineName], [MedicineType], [MedicinePrice], [MedicineInfo]) VALUES (N'M1004', N'MM4', N'Medicine', 4, N'Good4')
INSERT [dbo].[Medicine_Information] ([MedicineID], [MedicineName], [MedicineType], [MedicinePrice], [MedicineInfo]) VALUES (N'M1005', N'MM5', N'Medicine', 5, N'Good5')
INSERT [dbo].[Medicine_Information] ([MedicineID], [MedicineName], [MedicineType], [MedicinePrice], [MedicineInfo]) VALUES (N'M1006', N'MM6', N'Medicine', 6, N'Good6')
INSERT [dbo].[Medicine_Information] ([MedicineID], [MedicineName], [MedicineType], [MedicinePrice], [MedicineInfo]) VALUES (N'M1007', N'MM7', N'Medicine', 7, N'Good7')
INSERT [dbo].[Medicine_Information] ([MedicineID], [MedicineName], [MedicineType], [MedicinePrice], [MedicineInfo]) VALUES (N'M1008', N'MM8', N'Medicine', 8, N'Good8')
INSERT [dbo].[Medicine_Information] ([MedicineID], [MedicineName], [MedicineType], [MedicinePrice], [MedicineInfo]) VALUES (N'M1009', N'MM9', N'Medicine', 9, N'Good9')
INSERT [dbo].[Medicine_Information] ([MedicineID], [MedicineName], [MedicineType], [MedicinePrice], [MedicineInfo]) VALUES (N'M1010', N'MM10', N'Medicine', 10, N'Good10')
INSERT [dbo].[Medicine_Information] ([MedicineID], [MedicineName], [MedicineType], [MedicinePrice], [MedicineInfo]) VALUES (N'T1001', N'TT1', N'Tools', 1, N'Good11')
INSERT [dbo].[Medicine_Information] ([MedicineID], [MedicineName], [MedicineType], [MedicinePrice], [MedicineInfo]) VALUES (N'T1002', N'TT2', N'Tools', 2, N'Good12')
INSERT [dbo].[Medicine_Information] ([MedicineID], [MedicineName], [MedicineType], [MedicinePrice], [MedicineInfo]) VALUES (N'T1003', N'TT3', N'Tools', 3, N'Good13')
INSERT [dbo].[Medicine_Information] ([MedicineID], [MedicineName], [MedicineType], [MedicinePrice], [MedicineInfo]) VALUES (N'T1004', N'TT4', N'Tools', 4, N'Good14')
INSERT [dbo].[Medicine_Information] ([MedicineID], [MedicineName], [MedicineType], [MedicinePrice], [MedicineInfo]) VALUES (N'T1005', N'TT5', N'Tools', 5, N'Good15')
INSERT [dbo].[Medicine_Information] ([MedicineID], [MedicineName], [MedicineType], [MedicinePrice], [MedicineInfo]) VALUES (N'T1006', N'TT6', N'Tools', 6, N'Good16')
INSERT [dbo].[Medicine_Information] ([MedicineID], [MedicineName], [MedicineType], [MedicinePrice], [MedicineInfo]) VALUES (N'T1007', N'TT7', N'Tools', 7, N'Good17')
INSERT [dbo].[Medicine_Information] ([MedicineID], [MedicineName], [MedicineType], [MedicinePrice], [MedicineInfo]) VALUES (N'T1008', N'TT8', N'Tools', 8, N'Good18')
INSERT [dbo].[Medicine_Information] ([MedicineID], [MedicineName], [MedicineType], [MedicinePrice], [MedicineInfo]) VALUES (N'T1009', N'TT9', N'Tools', 9, N'Good19')
INSERT [dbo].[Medicine_Information] ([MedicineID], [MedicineName], [MedicineType], [MedicinePrice], [MedicineInfo]) VALUES (N'T1010', N'TT10', N'Tools', 10, N'Good20')
INSERT [dbo].[Medicinetype_Information] ([MedicinetypeName]) VALUES (N'Medicine')
INSERT [dbo].[Medicinetype_Information] ([MedicinetypeName]) VALUES (N'Tools')
INSERT [dbo].[Member_Information] ([MemberID], [MemberName], [MemberGender], [MemberAge], [MemberDepartment], [MemberEmail], [MemberTel], [MemberAddress], [MemberComment], [MemberInfo]) VALUES (N'admin', N'admin', N'Male', 30, N'IT', N'abc@gmail.com', N'1234567890', N'waterloo', N'0', N'0')
INSERT [dbo].[Member_Information] ([MemberID], [MemberName], [MemberGender], [MemberAge], [MemberDepartment], [MemberEmail], [MemberTel], [MemberAddress], [MemberComment], [MemberInfo]) VALUES (N'D1001', N'Mike', N'Male', 30, N'Doctor', N'Mike@gmail.com', N'2269861234', N'Lester23', N'0', N'0')
INSERT [dbo].[Member_Information] ([MemberID], [MemberName], [MemberGender], [MemberAge], [MemberDepartment], [MemberEmail], [MemberTel], [MemberAddress], [MemberComment], [MemberInfo]) VALUES (N'D1002', N'John', N'Male', 20, N'Doctor', N'John@gmail.com', N'2269861235', N'Lester24', N'0', N'0')
INSERT [dbo].[Member_Information] ([MemberID], [MemberName], [MemberGender], [MemberAge], [MemberDepartment], [MemberEmail], [MemberTel], [MemberAddress], [MemberComment], [MemberInfo]) VALUES (N'D1003', N'Tom', N'Female', 21, N'Doctor', N'Tom@gmail.com', N'2269861236', N'Lester25', N'0', N'0 ')
INSERT [dbo].[Member_Information] ([MemberID], [MemberName], [MemberGender], [MemberAge], [MemberDepartment], [MemberEmail], [MemberTel], [MemberAddress], [MemberComment], [MemberInfo]) VALUES (N'D1004', N'Nancy', N'Female', 25, N'Doctor', N'Nancy@gmail.com', N'2269861237', N'Lester26', N'0', N'0 ')
INSERT [dbo].[Member_Information] ([MemberID], [MemberName], [MemberGender], [MemberAge], [MemberDepartment], [MemberEmail], [MemberTel], [MemberAddress], [MemberComment], [MemberInfo]) VALUES (N'D1005', N'Amy', N'Female', 32, N'Doctor', N'Amy@gmail.com', N'2269861238', N'Lester27', N'0', N'0 ')
INSERT [dbo].[Member_Information] ([MemberID], [MemberName], [MemberGender], [MemberAge], [MemberDepartment], [MemberEmail], [MemberTel], [MemberAddress], [MemberComment], [MemberInfo]) VALUES (N'D1006', N'Anila', N'Female', 45, N'Doctor', N'Anila@gmail.com', N'2269861239', N'Donus34', N'0', N'0')
INSERT [dbo].[Member_Information] ([MemberID], [MemberName], [MemberGender], [MemberAge], [MemberDepartment], [MemberEmail], [MemberTel], [MemberAddress], [MemberComment], [MemberInfo]) VALUES (N'D1007', N'Tom', N'Male', 44, N'Doctor', N'Tom@gmail.com', N'2269861240', N'Donus35', N'0', N'0 ')
INSERT [dbo].[Member_Information] ([MemberID], [MemberName], [MemberGender], [MemberAge], [MemberDepartment], [MemberEmail], [MemberTel], [MemberAddress], [MemberComment], [MemberInfo]) VALUES (N'D1008', N'Dany', N'Male', 36, N'Doctor', N'Dany@gmail.com', N'2269861241', N'Donus36', N'0', N'0 ')
INSERT [dbo].[Member_Information] ([MemberID], [MemberName], [MemberGender], [MemberAge], [MemberDepartment], [MemberEmail], [MemberTel], [MemberAddress], [MemberComment], [MemberInfo]) VALUES (N'D1009', N'Kassey', N'Female', 42, N'Doctor', N'Kassey@gmail.com', N'2269861242', N'Regina28', N'0', N'0 ')
INSERT [dbo].[Member_Information] ([MemberID], [MemberName], [MemberGender], [MemberAge], [MemberDepartment], [MemberEmail], [MemberTel], [MemberAddress], [MemberComment], [MemberInfo]) VALUES (N'D1010', N'Karren', N'Female', 27, N'Doctor', N'Karren@gmail.com', N'2269861243', N'Regina29', N'0', N'0 ')
INSERT [dbo].[Member_Information] ([MemberID], [MemberName], [MemberGender], [MemberAge], [MemberDepartment], [MemberEmail], [MemberTel], [MemberAddress], [MemberComment], [MemberInfo]) VALUES (N'F100', N'Tom', N'Male', 0, N'Financial', N'', N'', N'', N'0', N'0')
INSERT [dbo].[Member_Information] ([MemberID], [MemberName], [MemberGender], [MemberAge], [MemberDepartment], [MemberEmail], [MemberTel], [MemberAddress], [MemberComment], [MemberInfo]) VALUES (N'L1001', N'OMM', N'Male', 0, N'Lawyer', N'', N'', N'', N'0', N'0')
INSERT [dbo].[Member_Information] ([MemberID], [MemberName], [MemberGender], [MemberAge], [MemberDepartment], [MemberEmail], [MemberTel], [MemberAddress], [MemberComment], [MemberInfo]) VALUES (N'N1001', N'Ly', N'Male', 0, N'Nurse', N'', N'', N'', N'0', N'0')
INSERT [dbo].[Member_Information] ([MemberID], [MemberName], [MemberGender], [MemberAge], [MemberDepartment], [MemberEmail], [MemberTel], [MemberAddress], [MemberComment], [MemberInfo]) VALUES (N'P1001', N'Mike', N'Male', 30, N'Patient', N'Mike@gmail.com', N'5192347321', N'Regina34', N'0', N'0')
INSERT [dbo].[Member_Information] ([MemberID], [MemberName], [MemberGender], [MemberAge], [MemberDepartment], [MemberEmail], [MemberTel], [MemberAddress], [MemberComment], [MemberInfo]) VALUES (N'P10012', N'PoP', NULL, NULL, N'Patient', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Member_Information] ([MemberID], [MemberName], [MemberGender], [MemberAge], [MemberDepartment], [MemberEmail], [MemberTel], [MemberAddress], [MemberComment], [MemberInfo]) VALUES (N'P1002', N'John', N'Male', 20, N'Patient', N'John@gmail.com', N'5192347322', N'Regina35', N'0', N'0')
INSERT [dbo].[Member_Information] ([MemberID], [MemberName], [MemberGender], [MemberAge], [MemberDepartment], [MemberEmail], [MemberTel], [MemberAddress], [MemberComment], [MemberInfo]) VALUES (N'P1003', N'Noana', N'Female', 21, N'Patient', N'Noana@gmail.com', N'5192347323', N'Regina36', N'0', N'0 ')
INSERT [dbo].[Member_Information] ([MemberID], [MemberName], [MemberGender], [MemberAge], [MemberDepartment], [MemberEmail], [MemberTel], [MemberAddress], [MemberComment], [MemberInfo]) VALUES (N'P1004', N'Nancy', N'Female', 45, N'Patient', N'Nancy@gmail.com', N'5192347324', N'Regina37', N'0', N'0 ')
INSERT [dbo].[Member_Information] ([MemberID], [MemberName], [MemberGender], [MemberAge], [MemberDepartment], [MemberEmail], [MemberTel], [MemberAddress], [MemberComment], [MemberInfo]) VALUES (N'P1005', N'Anny', N'Female', 45, N'Patient', N'Anny@gmail.com', N'5192347325', N'Rogers56', N'0', N'0 ')
INSERT [dbo].[Member_Information] ([MemberID], [MemberName], [MemberGender], [MemberAge], [MemberDepartment], [MemberEmail], [MemberTel], [MemberAddress], [MemberComment], [MemberInfo]) VALUES (N'P1006', N'Karren', N'Female', 23, N'Patient', N'Karren@gmail.com', N'5192347326', N'Rogers57', N'0', N'0 ')
INSERT [dbo].[Member_Information] ([MemberID], [MemberName], [MemberGender], [MemberAge], [MemberDepartment], [MemberEmail], [MemberTel], [MemberAddress], [MemberComment], [MemberInfo]) VALUES (N'P1007', N'Tommy', N'Male', 47, N'Patient', N'Tommy@gmail.com', N'2267893456', N'Rogers58', N'0', N'0')
INSERT [dbo].[Member_Information] ([MemberID], [MemberName], [MemberGender], [MemberAge], [MemberDepartment], [MemberEmail], [MemberTel], [MemberAddress], [MemberComment], [MemberInfo]) VALUES (N'P1008', N'Danica', N'Male', 38, N'Patient', N'Danica@gmail.com', N'2267893457', N'Queen23', N'0', N'0')
INSERT [dbo].[Member_Information] ([MemberID], [MemberName], [MemberGender], [MemberAge], [MemberDepartment], [MemberEmail], [MemberTel], [MemberAddress], [MemberComment], [MemberInfo]) VALUES (N'P1009', N'Alina', N'Female', 67, N'Patient', N'Alina@gmail.com', N'2267893458', N'Queen24', N'0', N'0')
INSERT [dbo].[Member_Information] ([MemberID], [MemberName], [MemberGender], [MemberAge], [MemberDepartment], [MemberEmail], [MemberTel], [MemberAddress], [MemberComment], [MemberInfo]) VALUES (N'P1010', N'Katty', N'Female', 29, N'Patient', N'Katty@gmail.com', N'2267893459', N'Queen25', N'0', N'0')
INSERT [dbo].[Member_Information] ([MemberID], [MemberName], [MemberGender], [MemberAge], [MemberDepartment], [MemberEmail], [MemberTel], [MemberAddress], [MemberComment], [MemberInfo]) VALUES (N'P1011', N'Yto', NULL, NULL, N'Patient', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Record_Information] ([DoctorID], [PatientID], [RecordID], [RecordContent]) VALUES (N'admin', N'P1002', N'P10021', NULL)
INSERT [dbo].[Record_Information] ([DoctorID], [PatientID], [RecordID], [RecordContent]) VALUES (N'admin', N'P1001', N'PR10011', NULL)
INSERT [dbo].[Record_Information] ([DoctorID], [PatientID], [RecordID], [RecordContent]) VALUES (N'admin', N'P1001', N'PR10012', NULL)
INSERT [dbo].[Record_Information] ([DoctorID], [PatientID], [RecordID], [RecordContent]) VALUES (N'D1001', N'P1001', N'987', NULL)
INSERT [dbo].[Record_Information] ([DoctorID], [PatientID], [RecordID], [RecordContent]) VALUES (N'D1001', N'P1001', N'PR1001', NULL)
INSERT [dbo].[Record_Information] ([DoctorID], [PatientID], [RecordID], [RecordContent]) VALUES (N'D1001', N'P10012', N'PR100121', N'Good')
INSERT [dbo].[Record_Information] ([DoctorID], [PatientID], [RecordID], [RecordContent]) VALUES (N'D1001', N'P1002', N'PR111', NULL)
INSERT [dbo].[Record_Information] ([DoctorID], [PatientID], [RecordID], [RecordContent]) VALUES (N'D1002', N'P1001', N'10021001', N'huijiachidianfan')
INSERT [dbo].[Visitation_Information] ([RecordID], [BillID], [MemberID], [Working], [Location], [Visitation]) VALUES (N'PR111', NULL, N'D1001', N'Creation, successful', N'Record', N'2014/11/26 0:03:47')
INSERT [dbo].[Visitation_Information] ([RecordID], [BillID], [MemberID], [Working], [Location], [Visitation]) VALUES (N'10021001', NULL, N'D1002', N'Edition,successful', N'Record', N'2014/11/26 0:32:24')
INSERT [dbo].[Visitation_Information] ([RecordID], [BillID], [MemberID], [Working], [Location], [Visitation]) VALUES (N'PR1001', NULL, N'admin', N'Deletion,successful', N'Record', N'2014/11/25 23:11:35')
INSERT [dbo].[Visitation_Information] ([RecordID], [BillID], [MemberID], [Working], [Location], [Visitation]) VALUES (N'PR10011', NULL, N'admin', N'Creation, successful', N'Record', N'2014/11/25 23:11:43')
INSERT [dbo].[Visitation_Information] ([RecordID], [BillID], [MemberID], [Working], [Location], [Visitation]) VALUES (N'PR10012', NULL, N'admin', N'Creation, successful', N'Record', N'2014/11/25 23:11:48')
INSERT [dbo].[Visitation_Information] ([RecordID], [BillID], [MemberID], [Working], [Location], [Visitation]) VALUES (N'P10021', NULL, N'admin', N'Creation, successful', N'Record', N'2014/11/25 23:11:54')
INSERT [dbo].[Visitation_Information] ([RecordID], [BillID], [MemberID], [Working], [Location], [Visitation]) VALUES (N'PR10011', N'BPR100111', N'admin', N'Creation, successful', N'Bill', N'2014/11/25 23:12:14')
INSERT [dbo].[Visitation_Information] ([RecordID], [BillID], [MemberID], [Working], [Location], [Visitation]) VALUES (N'10021001', NULL, N'D1002', N'Creation, successful', N'Record', N'2014/11/26 0:08:24')
INSERT [dbo].[Visitation_Information] ([RecordID], [BillID], [MemberID], [Working], [Location], [Visitation]) VALUES (N'PR1001', NULL, N'admin', N'Creation, successful', N'Record', N'2014/11/25 23:11:15')
INSERT [dbo].[Visitation_Information] ([RecordID], [BillID], [MemberID], [Working], [Location], [Visitation]) VALUES (N'PR10011', NULL, N'admin', N'Creation, successful', N'Record', N'2014/11/25 23:11:29')
INSERT [dbo].[Visitation_Information] ([RecordID], [BillID], [MemberID], [Working], [Location], [Visitation]) VALUES (N'PR1001', NULL, N'D1001', N'Creation, successful', N'Record', N'2014/11/25 23:37:36')
INSERT [dbo].[Visitation_Information] ([RecordID], [BillID], [MemberID], [Working], [Location], [Visitation]) VALUES (N'PR100121', NULL, N'D1001', N'Creation, successful', N'Record', N'2014/11/25 23:41:50')
INSERT [dbo].[Visitation_Information] ([RecordID], [BillID], [MemberID], [Working], [Location], [Visitation]) VALUES (N'PR100121', NULL, N'D1001', N'Edition,successful', N'Record', N'2014/11/25 23:42:01')
INSERT [dbo].[Visitation_Information] ([RecordID], [BillID], [MemberID], [Working], [Location], [Visitation]) VALUES (N'987', NULL, N'D1001', N'Creation, successful', N'Record', N'2014/11/26 0:01:59')
INSERT [dbo].[Visitation_Information] ([RecordID], [BillID], [MemberID], [Working], [Location], [Visitation]) VALUES (N'PR111', N'B10001', N'D1001', N'Creation, successful', N'Bill', N'2014/11/26 0:07:37')
INSERT [dbo].[Visitation_Information] ([RecordID], [BillID], [MemberID], [Working], [Location], [Visitation]) VALUES (N'987', N'10008', N'D1001', N'Creation, successful', N'Bill', N'2014/11/26 0:07:51')
INSERT [dbo].[Visitation_Information] ([RecordID], [BillID], [MemberID], [Working], [Location], [Visitation]) VALUES (N'10021001', N'101', N'D1002', N'Creation, successful', N'Bill', N'2014/11/26 0:16:22')
INSERT [dbo].[Visitation_Information] ([RecordID], [BillID], [MemberID], [Working], [Location], [Visitation]) VALUES (N'10021001', N'102', N'D1002', N'Creation, successful', N'Bill', N'2014/11/26 0:17:47')
INSERT [dbo].[Visitation_Information] ([RecordID], [BillID], [MemberID], [Working], [Location], [Visitation]) VALUES (N'10021001', N'103', N'D1002', N'Creation, successful', N'Bill', N'2014/11/26 0:21:23')
USE [master]
GO
ALTER DATABASE [db_hospital] SET  READ_WRITE 
GO
