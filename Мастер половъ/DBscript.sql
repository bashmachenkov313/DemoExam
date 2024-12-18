USE [master]
GO
/****** Object:  Database [Master_floor]    Script Date: 04.12.2024 14:13:25 ******/
CREATE DATABASE [Master_floor]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Master_floor', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Master_floor.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Master_floor_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Master_floor_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Master_floor] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Master_floor].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Master_floor] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Master_floor] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Master_floor] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Master_floor] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Master_floor] SET ARITHABORT OFF 
GO
ALTER DATABASE [Master_floor] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Master_floor] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Master_floor] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Master_floor] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Master_floor] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Master_floor] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Master_floor] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Master_floor] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Master_floor] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Master_floor] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Master_floor] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Master_floor] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Master_floor] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Master_floor] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Master_floor] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Master_floor] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Master_floor] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Master_floor] SET RECOVERY FULL 
GO
ALTER DATABASE [Master_floor] SET  MULTI_USER 
GO
ALTER DATABASE [Master_floor] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Master_floor] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Master_floor] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Master_floor] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Master_floor] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Master_floor] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Master_floor', N'ON'
GO
ALTER DATABASE [Master_floor] SET QUERY_STORE = ON
GO
ALTER DATABASE [Master_floor] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Master_floor]
GO
/****** Object:  Table [dbo].[MaterialDefection]    Script Date: 04.12.2024 14:13:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialDefection](
	[MaterialType] [int] NOT NULL,
	[DefectProc] [float] NOT NULL,
 CONSTRAINT [PK_MaterialDefection] PRIMARY KEY CLUSTERED 
(
	[MaterialType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partner]    Script Date: 04.12.2024 14:13:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partner](
	[PartnerID] [int] IDENTITY(6,1) NOT NULL,
	[PartnerType] [int] NOT NULL,
	[PartnerName] [nvarchar](50) NOT NULL,
	[PartnerDirektor] [nvarchar](100) NOT NULL,
	[PartnerEmail] [nvarchar](50) NOT NULL,
	[PartnerPhone] [nvarchar](20) NULL,
	[PartnerAddress] [nvarchar](500) NOT NULL,
	[PartnerINN] [nvarchar](50) NOT NULL,
	[PartnerRate] [int] NOT NULL,
 CONSTRAINT [PK_Partner] PRIMARY KEY CLUSTERED 
(
	[PartnerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerProduct]    Script Date: 04.12.2024 14:13:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerProduct](
	[ProductID] [int] NOT NULL,
	[PartnerID] [int] NOT NULL,
	[ProductCount] [int] NOT NULL,
	[SaleDate] [nvarchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerType]    Script Date: 04.12.2024 14:13:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerType](
	[TypeID] [int] IDENTITY(5,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PartnerType] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 04.12.2024 14:13:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(6,1) NOT NULL,
	[ProductType] [int] NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[ProductArticle] [nvarchar](50) NOT NULL,
	[ProductMinimalPrice] [float] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 04.12.2024 14:13:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[TypeID] [int] IDENTITY(5,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
	[ProductCoef] [float] NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[MaterialDefection] ([MaterialType], [DefectProc]) VALUES (1, 0.001)
INSERT [dbo].[MaterialDefection] ([MaterialType], [DefectProc]) VALUES (2, 0.0095)
INSERT [dbo].[MaterialDefection] ([MaterialType], [DefectProc]) VALUES (3, 0.0028)
INSERT [dbo].[MaterialDefection] ([MaterialType], [DefectProc]) VALUES (4, 0.0055)
INSERT [dbo].[MaterialDefection] ([MaterialType], [DefectProc]) VALUES (5, 0.0034)
GO
SET IDENTITY_INSERT [dbo].[Partner] ON 

INSERT [dbo].[Partner] ([PartnerID], [PartnerType], [PartnerName], [PartnerDirektor], [PartnerEmail], [PartnerPhone], [PartnerAddress], [PartnerINN], [PartnerRate]) VALUES (1, 1, N'База Строитель', N'Иванова Александра Ивановна', N'aleksandraivanova@ml.ru', N'493 123 45 67', N'652050, Кемеровская область, город Юрга, ул. Лесная, 15', N'2222455179', 7)
INSERT [dbo].[Partner] ([PartnerID], [PartnerType], [PartnerName], [PartnerDirektor], [PartnerEmail], [PartnerPhone], [PartnerAddress], [PartnerINN], [PartnerRate]) VALUES (2, 2, N'Паркет 29', N'Петров Василий Петрович', N'vppetrov@vl.ru', N'987 123 56 78', N'164500, Архангельская область, город Северодвинск, ул. Строителей, 18', N'3333888520', 7)
INSERT [dbo].[Partner] ([PartnerID], [PartnerType], [PartnerName], [PartnerDirektor], [PartnerEmail], [PartnerPhone], [PartnerAddress], [PartnerINN], [PartnerRate]) VALUES (3, 3, N'Стройсервис', N'Соловьев Андрей Николаевич', N'ansolovev@st.ru', N'812 223 32 00', N'188910, Ленинградская область, город Приморск, ул. Парковая, 21', N'4440391035', 7)
INSERT [dbo].[Partner] ([PartnerID], [PartnerType], [PartnerName], [PartnerDirektor], [PartnerEmail], [PartnerPhone], [PartnerAddress], [PartnerINN], [PartnerRate]) VALUES (4, 4, N'Ремонт и отделка', N'Воробьева Екатерина Валерьевна', N'ekaterina.vorobeva@ml.ru', N'444 222 33 11', N'143960, Московская область, город Реутов, ул. Свободы, 51', N'1111520857', 5)
INSERT [dbo].[Partner] ([PartnerID], [PartnerType], [PartnerName], [PartnerDirektor], [PartnerEmail], [PartnerPhone], [PartnerAddress], [PartnerINN], [PartnerRate]) VALUES (5, 1, N'МонтажПро', N'Степанов Степан Сергеевич', N'stepanov@stepan.ru', N'912 888 33 33', N'309500, Белгородская область, город Старый Оскол, ул. Рабочая, 122', N'5552431140', 10)
SET IDENTITY_INSERT [dbo].[Partner] OFF
GO
INSERT [dbo].[PartnerProduct] ([ProductID], [PartnerID], [ProductCount], [SaleDate]) VALUES (1, 1, 15500, N'23.03.2023')
INSERT [dbo].[PartnerProduct] ([ProductID], [PartnerID], [ProductCount], [SaleDate]) VALUES (3, 1, 12350, N'18.12.2023')
INSERT [dbo].[PartnerProduct] ([ProductID], [PartnerID], [ProductCount], [SaleDate]) VALUES (4, 1, 37400, N'07.06.2024')
INSERT [dbo].[PartnerProduct] ([ProductID], [PartnerID], [ProductCount], [SaleDate]) VALUES (2, 2, 35000, N'02.12.2022')
INSERT [dbo].[PartnerProduct] ([ProductID], [PartnerID], [ProductCount], [SaleDate]) VALUES (5, 2, 1250, N'17.05.2023')
INSERT [dbo].[PartnerProduct] ([ProductID], [PartnerID], [ProductCount], [SaleDate]) VALUES (3, 2, 1000, N'07.06.2024')
INSERT [dbo].[PartnerProduct] ([ProductID], [PartnerID], [ProductCount], [SaleDate]) VALUES (1, 2, 7550, N'01.07.2024')
INSERT [dbo].[PartnerProduct] ([ProductID], [PartnerID], [ProductCount], [SaleDate]) VALUES (1, 3, 7250, N'22.01.2023')
INSERT [dbo].[PartnerProduct] ([ProductID], [PartnerID], [ProductCount], [SaleDate]) VALUES (2, 3, 2500, N'05.07.2024')
INSERT [dbo].[PartnerProduct] ([ProductID], [PartnerID], [ProductCount], [SaleDate]) VALUES (4, 4, 59050, N'20.03.2023')
INSERT [dbo].[PartnerProduct] ([ProductID], [PartnerID], [ProductCount], [SaleDate]) VALUES (3, 4, 37200, N'12.03.2024')
INSERT [dbo].[PartnerProduct] ([ProductID], [PartnerID], [ProductCount], [SaleDate]) VALUES (5, 4, 4500, N'14.05.2024')
INSERT [dbo].[PartnerProduct] ([ProductID], [PartnerID], [ProductCount], [SaleDate]) VALUES (3, 5, 50000, N'19.09.2023')
INSERT [dbo].[PartnerProduct] ([ProductID], [PartnerID], [ProductCount], [SaleDate]) VALUES (4, 5, 670000, N'10.11.2023')
INSERT [dbo].[PartnerProduct] ([ProductID], [PartnerID], [ProductCount], [SaleDate]) VALUES (1, 5, 35000, N'15.04.2024')
INSERT [dbo].[PartnerProduct] ([ProductID], [PartnerID], [ProductCount], [SaleDate]) VALUES (2, 5, 25000, N'12.06.2024')
GO
SET IDENTITY_INSERT [dbo].[PartnerType] ON 

INSERT [dbo].[PartnerType] ([TypeID], [TypeName]) VALUES (1, N'ЗАО
')
INSERT [dbo].[PartnerType] ([TypeID], [TypeName]) VALUES (2, N'ООО
')
INSERT [dbo].[PartnerType] ([TypeID], [TypeName]) VALUES (3, N'ПАО
')
INSERT [dbo].[PartnerType] ([TypeID], [TypeName]) VALUES (4, N'ОАО')
SET IDENTITY_INSERT [dbo].[PartnerType] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductType], [ProductName], [ProductArticle], [ProductMinimalPrice]) VALUES (1, 3, N'Паркетная доска Ясень темный однополосная 14 мм
', N'8758385
', 4456.9)
INSERT [dbo].[Product] ([ProductID], [ProductType], [ProductName], [ProductArticle], [ProductMinimalPrice]) VALUES (2, 3, N'Инженерная доска Дуб Французская елка однополосная 12 мм
', N'8858958
', 7330.99)
INSERT [dbo].[Product] ([ProductID], [ProductType], [ProductName], [ProductArticle], [ProductMinimalPrice]) VALUES (3, 1, N'Ламинат Дуб дымчато-белый 33 класс 12 мм
', N'7750282
', 1799.33)
INSERT [dbo].[Product] ([ProductID], [ProductType], [ProductName], [ProductArticle], [ProductMinimalPrice]) VALUES (4, 1, N'Ламинат Дуб серый 32 класс 8 мм с фаской
', N'7028748
', 3890.41)
INSERT [dbo].[Product] ([ProductID], [ProductType], [ProductName], [ProductArticle], [ProductMinimalPrice]) VALUES (5, 4, N'Пробковое напольное клеевое покрытие 32 класс 4 мм
', N'5012543
', 5450.59)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([TypeID], [TypeName], [ProductCoef]) VALUES (1, N'Ламинат', 2.35)
INSERT [dbo].[ProductType] ([TypeID], [TypeName], [ProductCoef]) VALUES (2, N'Массивная доска', 5.15)
INSERT [dbo].[ProductType] ([TypeID], [TypeName], [ProductCoef]) VALUES (3, N'Паркетная доска', 4.34)
INSERT [dbo].[ProductType] ([TypeID], [TypeName], [ProductCoef]) VALUES (4, N'Пробковое покрытие', 1.5)
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
ALTER TABLE [dbo].[Partner]  WITH CHECK ADD  CONSTRAINT [FK_Partner_PartnerType] FOREIGN KEY([PartnerType])
REFERENCES [dbo].[PartnerType] ([TypeID])
GO
ALTER TABLE [dbo].[Partner] CHECK CONSTRAINT [FK_Partner_PartnerType]
GO
ALTER TABLE [dbo].[PartnerProduct]  WITH CHECK ADD  CONSTRAINT [FK_PartnerProduct_Partner] FOREIGN KEY([PartnerID])
REFERENCES [dbo].[Partner] ([PartnerID])
GO
ALTER TABLE [dbo].[PartnerProduct] CHECK CONSTRAINT [FK_PartnerProduct_Partner]
GO
ALTER TABLE [dbo].[PartnerProduct]  WITH CHECK ADD  CONSTRAINT [FK_PartnerProduct_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[PartnerProduct] CHECK CONSTRAINT [FK_PartnerProduct_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([ProductType])
REFERENCES [dbo].[ProductType] ([TypeID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
USE [master]
GO
ALTER DATABASE [Master_floor] SET  READ_WRITE 
GO
