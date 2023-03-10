USE [master]
GO
/****** Object:  Database [HospitalRecord]    Script Date: 6/1/2022 11:02:19 PM ******/
CREATE DATABASE [HospitalRecord]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HospitalRecord', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019\MSSQL\DATA\HospitalRecord.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HospitalRecord_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019\MSSQL\DATA\HospitalRecord_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HospitalRecord] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HospitalRecord].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HospitalRecord] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HospitalRecord] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HospitalRecord] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HospitalRecord] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HospitalRecord] SET ARITHABORT OFF 
GO
ALTER DATABASE [HospitalRecord] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HospitalRecord] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HospitalRecord] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HospitalRecord] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HospitalRecord] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HospitalRecord] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HospitalRecord] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HospitalRecord] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HospitalRecord] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HospitalRecord] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HospitalRecord] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HospitalRecord] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HospitalRecord] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HospitalRecord] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HospitalRecord] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HospitalRecord] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HospitalRecord] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HospitalRecord] SET RECOVERY FULL 
GO
ALTER DATABASE [HospitalRecord] SET  MULTI_USER 
GO
ALTER DATABASE [HospitalRecord] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HospitalRecord] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HospitalRecord] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HospitalRecord] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HospitalRecord] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HospitalRecord] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'HospitalRecord', N'ON'
GO
ALTER DATABASE [HospitalRecord] SET QUERY_STORE = OFF
GO
USE [HospitalRecord]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 6/1/2022 11:02:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[Bill_no] [int] NOT NULL,
	[p_id] [int] NULL,
	[doctor_charge] [money] NULL,
	[room_charge] [money] NULL,
	[no_days] [int] NULL,
	[lab_charge] [money] NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[Bill_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Check_in_Patient]    Script Date: 6/1/2022 11:02:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Check_in_Patient](
	[p_id] [int] NOT NULL,
	[room_no] [int] NULL,
	[dateof_admision] [date] NULL,
	[dateof_discharge] [date] NULL,
	[lab_no] [int] NULL,
 CONSTRAINT [PK_Check_in_Patient] PRIMARY KEY CLUSTERED 
(
	[p_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[checkout_patient]    Script Date: 6/1/2022 11:02:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[checkout_patient](
	[P_id] [int] NOT NULL,
	[date] [date] NULL,
	[lab_no] [int] NOT NULL,
 CONSTRAINT [PK_checkout_patient] PRIMARY KEY CLUSTERED 
(
	[P_id] ASC,
	[lab_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 6/1/2022 11:02:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[doctor_id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[age] [int] NULL,
	[salary] [money] NULL,
	[gender] [nvarchar](50) NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[doctor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lab]    Script Date: 6/1/2022 11:02:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lab](
	[Lab_no] [int] NOT NULL,
	[p_id] [int] NULL,
	[doctor_id] [int] NULL,
	[date] [date] NULL,
	[amount] [int] NULL,
 CONSTRAINT [PK_Lab] PRIMARY KEY CLUSTERED 
(
	[Lab_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 6/1/2022 11:02:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[patient_id] [int] NOT NULL,
	[patient_name] [nvarchar](20) NULL,
	[age] [int] NULL,
	[gender] [nvarchar](10) NULL,
	[address] [nvarchar](10) NULL,
	[disease] [nvarchar](20) NULL,
	[doctor_id] [int] NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[patient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 6/1/2022 11:02:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[room_no] [int] NOT NULL,
	[room_Type] [nvarchar](50) NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[room_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Bill] ([Bill_no], [p_id], [doctor_charge], [room_charge], [no_days], [lab_charge]) VALUES (1000, 1, 500.0000, 500.0000, 3, 250.0000)
INSERT [dbo].[Bill] ([Bill_no], [p_id], [doctor_charge], [room_charge], [no_days], [lab_charge]) VALUES (1001, 2, 1500.0000, 250.0000, 2, 350.0000)
INSERT [dbo].[Bill] ([Bill_no], [p_id], [doctor_charge], [room_charge], [no_days], [lab_charge]) VALUES (1002, 3, 3000.0000, 360.0000, 5, 150.0000)
INSERT [dbo].[Bill] ([Bill_no], [p_id], [doctor_charge], [room_charge], [no_days], [lab_charge]) VALUES (1003, 4, 750.0000, 900.0000, 4, 600.0000)
INSERT [dbo].[Bill] ([Bill_no], [p_id], [doctor_charge], [room_charge], [no_days], [lab_charge]) VALUES (1004, 5, 690.0000, 800.0000, 1, 400.0000)
INSERT [dbo].[Bill] ([Bill_no], [p_id], [doctor_charge], [room_charge], [no_days], [lab_charge]) VALUES (1005, 6, 1200.0000, 400.0000, 6, 300.0000)
GO
INSERT [dbo].[Check_in_Patient] ([p_id], [room_no], [dateof_admision], [dateof_discharge], [lab_no]) VALUES (1, 50, CAST(N'2021-09-09' AS Date), NULL, 10)
INSERT [dbo].[Check_in_Patient] ([p_id], [room_no], [dateof_admision], [dateof_discharge], [lab_no]) VALUES (2, 40, CAST(N'2021-09-12' AS Date), NULL, 5)
INSERT [dbo].[Check_in_Patient] ([p_id], [room_no], [dateof_admision], [dateof_discharge], [lab_no]) VALUES (4, 50, CAST(N'2022-05-14' AS Date), NULL, 9)
INSERT [dbo].[Check_in_Patient] ([p_id], [room_no], [dateof_admision], [dateof_discharge], [lab_no]) VALUES (5, 30, CAST(N'2022-04-29' AS Date), NULL, 3)
INSERT [dbo].[Check_in_Patient] ([p_id], [room_no], [dateof_admision], [dateof_discharge], [lab_no]) VALUES (7, 70, CAST(N'2021-10-10' AS Date), NULL, 6)
INSERT [dbo].[Check_in_Patient] ([p_id], [room_no], [dateof_admision], [dateof_discharge], [lab_no]) VALUES (8, 90, CAST(N'2021-06-17' AS Date), NULL, 7)
INSERT [dbo].[Check_in_Patient] ([p_id], [room_no], [dateof_admision], [dateof_discharge], [lab_no]) VALUES (9, 40, CAST(N'2021-06-07' AS Date), NULL, 4)
INSERT [dbo].[Check_in_Patient] ([p_id], [room_no], [dateof_admision], [dateof_discharge], [lab_no]) VALUES (10, NULL, NULL, NULL, 1)
INSERT [dbo].[Check_in_Patient] ([p_id], [room_no], [dateof_admision], [dateof_discharge], [lab_no]) VALUES (11, 70, NULL, NULL, 8)
INSERT [dbo].[Check_in_Patient] ([p_id], [room_no], [dateof_admision], [dateof_discharge], [lab_no]) VALUES (12, 20, NULL, NULL, NULL)
INSERT [dbo].[Check_in_Patient] ([p_id], [room_no], [dateof_admision], [dateof_discharge], [lab_no]) VALUES (13, 50, NULL, NULL, NULL)
INSERT [dbo].[Check_in_Patient] ([p_id], [room_no], [dateof_admision], [dateof_discharge], [lab_no]) VALUES (14, 20, CAST(N'2020-01-05' AS Date), NULL, 2)
INSERT [dbo].[Check_in_Patient] ([p_id], [room_no], [dateof_admision], [dateof_discharge], [lab_no]) VALUES (15, 80, NULL, NULL, NULL)
GO
INSERT [dbo].[checkout_patient] ([P_id], [date], [lab_no]) VALUES (1, CAST(N'2021-09-12' AS Date), 6)
INSERT [dbo].[checkout_patient] ([P_id], [date], [lab_no]) VALUES (4, CAST(N'2022-05-18' AS Date), 2)
INSERT [dbo].[checkout_patient] ([P_id], [date], [lab_no]) VALUES (5, CAST(N'2022-05-05' AS Date), 1)
INSERT [dbo].[checkout_patient] ([P_id], [date], [lab_no]) VALUES (6, NULL, 9)
INSERT [dbo].[checkout_patient] ([P_id], [date], [lab_no]) VALUES (7, CAST(N'2021-10-15' AS Date), 10)
INSERT [dbo].[checkout_patient] ([P_id], [date], [lab_no]) VALUES (10, NULL, 3)
GO
INSERT [dbo].[Doctor] ([doctor_id], [name], [age], [salary], [gender]) VALUES (10, N'Gorge', 40, 6000.0000, N'male')
INSERT [dbo].[Doctor] ([doctor_id], [name], [age], [salary], [gender]) VALUES (20, N'Samuel', 40, 6000.0000, N'male')
INSERT [dbo].[Doctor] ([doctor_id], [name], [age], [salary], [gender]) VALUES (30, N'Muhammed', 50, 6500.0000, N'male')
INSERT [dbo].[Doctor] ([doctor_id], [name], [age], [salary], [gender]) VALUES (40, N'Ahmed', 30, 5000.0000, N'male')
INSERT [dbo].[Doctor] ([doctor_id], [name], [age], [salary], [gender]) VALUES (50, N'Khalifa', 55, 7000.0000, N'male')
INSERT [dbo].[Doctor] ([doctor_id], [name], [age], [salary], [gender]) VALUES (60, N'Moataaz', 30, 3500.0000, N'male')
INSERT [dbo].[Doctor] ([doctor_id], [name], [age], [salary], [gender]) VALUES (70, N'Khaled', 36, 4000.0000, N'male')
INSERT [dbo].[Doctor] ([doctor_id], [name], [age], [salary], [gender]) VALUES (80, N'Islam', 63, 8000.0000, N'male')
INSERT [dbo].[Doctor] ([doctor_id], [name], [age], [salary], [gender]) VALUES (90, N'Heba', 43, 5000.0000, N'female')
INSERT [dbo].[Doctor] ([doctor_id], [name], [age], [salary], [gender]) VALUES (100, N'Eman', 29, 3500.0000, N'female')
INSERT [dbo].[Doctor] ([doctor_id], [name], [age], [salary], [gender]) VALUES (200, N'Hamed', 46, 6000.0000, N'male')
INSERT [dbo].[Doctor] ([doctor_id], [name], [age], [salary], [gender]) VALUES (300, N'Bahaa', 29, 3000.0000, N'male')
INSERT [dbo].[Doctor] ([doctor_id], [name], [age], [salary], [gender]) VALUES (400, N'Israa', 51, 7500.0000, N'female')
INSERT [dbo].[Doctor] ([doctor_id], [name], [age], [salary], [gender]) VALUES (500, N'Hoda', 30, 3500.0000, N'female')
INSERT [dbo].[Doctor] ([doctor_id], [name], [age], [salary], [gender]) VALUES (600, N'jfu', 70, 10000.0000, N'male')
GO
INSERT [dbo].[Lab] ([Lab_no], [p_id], [doctor_id], [date], [amount]) VALUES (1, 5, 10, NULL, NULL)
INSERT [dbo].[Lab] ([Lab_no], [p_id], [doctor_id], [date], [amount]) VALUES (2, 9, 40, NULL, NULL)
INSERT [dbo].[Lab] ([Lab_no], [p_id], [doctor_id], [date], [amount]) VALUES (3, 10, 60, NULL, NULL)
INSERT [dbo].[Lab] ([Lab_no], [p_id], [doctor_id], [date], [amount]) VALUES (4, 20, 10, NULL, NULL)
INSERT [dbo].[Lab] ([Lab_no], [p_id], [doctor_id], [date], [amount]) VALUES (5, 2, 100, NULL, NULL)
INSERT [dbo].[Lab] ([Lab_no], [p_id], [doctor_id], [date], [amount]) VALUES (6, 9, 90, NULL, NULL)
INSERT [dbo].[Lab] ([Lab_no], [p_id], [doctor_id], [date], [amount]) VALUES (7, 6, 300, NULL, NULL)
INSERT [dbo].[Lab] ([Lab_no], [p_id], [doctor_id], [date], [amount]) VALUES (8, 8, 90, NULL, NULL)
INSERT [dbo].[Lab] ([Lab_no], [p_id], [doctor_id], [date], [amount]) VALUES (9, 14, 50, NULL, NULL)
INSERT [dbo].[Lab] ([Lab_no], [p_id], [doctor_id], [date], [amount]) VALUES (10, 7, 30, NULL, NULL)
GO
INSERT [dbo].[Patient] ([patient_id], [patient_name], [age], [gender], [address], [disease], [doctor_id]) VALUES (1, N'Ayman', 50, N'male', N'Assiut', N'Cancer', 10)
INSERT [dbo].[Patient] ([patient_id], [patient_name], [age], [gender], [address], [disease], [doctor_id]) VALUES (2, N'Ahmed', 30, N'male', N'Assiut', N'Cancer', 20)
INSERT [dbo].[Patient] ([patient_id], [patient_name], [age], [gender], [address], [disease], [doctor_id]) VALUES (3, N'Ibrahim', 40, N'male', N'Cairo', N'Diabets', 30)
INSERT [dbo].[Patient] ([patient_id], [patient_name], [age], [gender], [address], [disease], [doctor_id]) VALUES (4, N'islam', 66, N'male', N'Alex', N'Cancer', 50)
INSERT [dbo].[Patient] ([patient_id], [patient_name], [age], [gender], [address], [disease], [doctor_id]) VALUES (5, N'Soha', 25, N'female', N'Alex', N'Cervical cancer', 40)
INSERT [dbo].[Patient] ([patient_id], [patient_name], [age], [gender], [address], [disease], [doctor_id]) VALUES (6, N'Noha', 50, N'female', N'Cairo', N'Renal failure', 100)
INSERT [dbo].[Patient] ([patient_id], [patient_name], [age], [gender], [address], [disease], [doctor_id]) VALUES (7, N'Nehad', 19, N'female', N'Qena', N'Cervical cancer', 200)
INSERT [dbo].[Patient] ([patient_id], [patient_name], [age], [gender], [address], [disease], [doctor_id]) VALUES (8, N'Sayed', 32, N'male', N'Cairo', N'Renal failure', 300)
INSERT [dbo].[Patient] ([patient_id], [patient_name], [age], [gender], [address], [disease], [doctor_id]) VALUES (9, N'Mohamed', 65, N'male', N'Minea', N'orthopedic diseases', 400)
INSERT [dbo].[Patient] ([patient_id], [patient_name], [age], [gender], [address], [disease], [doctor_id]) VALUES (10, N'Shawky', 47, N'male', N'Cairo', N'Diabets', 60)
INSERT [dbo].[Patient] ([patient_id], [patient_name], [age], [gender], [address], [disease], [doctor_id]) VALUES (11, N'Samy', 21, N'male', N'Cairo', N'Diabets', 70)
INSERT [dbo].[Patient] ([patient_id], [patient_name], [age], [gender], [address], [disease], [doctor_id]) VALUES (12, N'Sameer', 36, N'male', N'Sina', N'Hypertension', 80)
INSERT [dbo].[Patient] ([patient_id], [patient_name], [age], [gender], [address], [disease], [doctor_id]) VALUES (13, N'Hend', 66, N'female', N'Tanta', N'Hypertension', 90)
INSERT [dbo].[Patient] ([patient_id], [patient_name], [age], [gender], [address], [disease], [doctor_id]) VALUES (14, N'Medhat', 70, N'male', N'Giza', N'Cancer', 10)
INSERT [dbo].[Patient] ([patient_id], [patient_name], [age], [gender], [address], [disease], [doctor_id]) VALUES (15, NULL, NULL, NULL, NULL, NULL, 50)
INSERT [dbo].[Patient] ([patient_id], [patient_name], [age], [gender], [address], [disease], [doctor_id]) VALUES (16, NULL, NULL, NULL, NULL, NULL, 40)
INSERT [dbo].[Patient] ([patient_id], [patient_name], [age], [gender], [address], [disease], [doctor_id]) VALUES (17, NULL, NULL, NULL, NULL, NULL, 60)
INSERT [dbo].[Patient] ([patient_id], [patient_name], [age], [gender], [address], [disease], [doctor_id]) VALUES (18, NULL, NULL, NULL, NULL, NULL, 70)
INSERT [dbo].[Patient] ([patient_id], [patient_name], [age], [gender], [address], [disease], [doctor_id]) VALUES (19, NULL, NULL, NULL, NULL, NULL, 90)
INSERT [dbo].[Patient] ([patient_id], [patient_name], [age], [gender], [address], [disease], [doctor_id]) VALUES (20, NULL, NULL, NULL, NULL, NULL, 100)
GO
INSERT [dbo].[Room] ([room_no], [room_Type]) VALUES (20, N'single')
INSERT [dbo].[Room] ([room_no], [room_Type]) VALUES (30, N'Operations room')
INSERT [dbo].[Room] ([room_no], [room_Type]) VALUES (40, N'isolated')
INSERT [dbo].[Room] ([room_no], [room_Type]) VALUES (50, N'isolated')
INSERT [dbo].[Room] ([room_no], [room_Type]) VALUES (60, N'single')
INSERT [dbo].[Room] ([room_no], [room_Type]) VALUES (70, N'Operations room')
INSERT [dbo].[Room] ([room_no], [room_Type]) VALUES (80, N'isolated')
INSERT [dbo].[Room] ([room_no], [room_Type]) VALUES (90, N'Operations room')
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Patient] FOREIGN KEY([p_id])
REFERENCES [dbo].[Patient] ([patient_id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Patient]
GO
ALTER TABLE [dbo].[Check_in_Patient]  WITH CHECK ADD  CONSTRAINT [FK_Check_in_Patient_Lab] FOREIGN KEY([lab_no])
REFERENCES [dbo].[Lab] ([Lab_no])
GO
ALTER TABLE [dbo].[Check_in_Patient] CHECK CONSTRAINT [FK_Check_in_Patient_Lab]
GO
ALTER TABLE [dbo].[Check_in_Patient]  WITH CHECK ADD  CONSTRAINT [FK_Check_in_Patient_Patient] FOREIGN KEY([p_id])
REFERENCES [dbo].[Patient] ([patient_id])
GO
ALTER TABLE [dbo].[Check_in_Patient] CHECK CONSTRAINT [FK_Check_in_Patient_Patient]
GO
ALTER TABLE [dbo].[Check_in_Patient]  WITH CHECK ADD  CONSTRAINT [FK_Check_in_Patient_Room] FOREIGN KEY([room_no])
REFERENCES [dbo].[Room] ([room_no])
GO
ALTER TABLE [dbo].[Check_in_Patient] CHECK CONSTRAINT [FK_Check_in_Patient_Room]
GO
ALTER TABLE [dbo].[checkout_patient]  WITH CHECK ADD  CONSTRAINT [FK_checkout_patient_Patient] FOREIGN KEY([P_id])
REFERENCES [dbo].[Patient] ([patient_id])
GO
ALTER TABLE [dbo].[checkout_patient] CHECK CONSTRAINT [FK_checkout_patient_Patient]
GO
ALTER TABLE [dbo].[Lab]  WITH CHECK ADD  CONSTRAINT [FK_Lab_Doctor] FOREIGN KEY([doctor_id])
REFERENCES [dbo].[Doctor] ([doctor_id])
GO
ALTER TABLE [dbo].[Lab] CHECK CONSTRAINT [FK_Lab_Doctor]
GO
ALTER TABLE [dbo].[Lab]  WITH CHECK ADD  CONSTRAINT [FK_Lab_Patient] FOREIGN KEY([p_id])
REFERENCES [dbo].[Patient] ([patient_id])
GO
ALTER TABLE [dbo].[Lab] CHECK CONSTRAINT [FK_Lab_Patient]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Doctor] FOREIGN KEY([doctor_id])
REFERENCES [dbo].[Doctor] ([doctor_id])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_Doctor]
GO
/****** Object:  StoredProcedure [dbo].[Calc_TotalCharge]    Script Date: 6/1/2022 11:02:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Calc_TotalCharge] @pid int 
as  

begin

select  b.no_days *(b.doctor_charge + b.lab_charge + b.room_charge) as [Total Charge] from Bill b
join Patient p on p.patient_id = b.p_id
where p.patient_id = @pid
end
GO
/****** Object:  StoredProcedure [dbo].[daily_rebort]    Script Date: 6/1/2022 11:02:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[daily_rebort]
as
select count(p.patient_id) AS [Number of Patint],GETDATE() as [Date of Rebort] 
from Patient p join Check_in_Patient ch on p.patient_id = ch.p_id
GO
USE [master]
GO
ALTER DATABASE [HospitalRecord] SET  READ_WRITE 
GO
