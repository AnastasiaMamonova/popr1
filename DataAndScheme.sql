USE [master]
GO
/****** Object:  Database [user1]    Script Date: 19.09.2023 12:27:48 ******/
CREATE DATABASE [user1]

GO
USE [user1]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 19.09.2023 12:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[AgentId] [int] IDENTITY(1,1) NOT NULL,
	[AgentName] [nvarchar](50) NOT NULL,
	[AgentTypeId] [int] NOT NULL,
	[LegalAddress] [nvarchar](100) NOT NULL,
	[INN] [nvarchar](20) NOT NULL,
	[KPP] [nvarchar](50) NOT NULL,
	[ManagerFIO] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Logo] [nvarchar](100) NULL,
	[Priority] [smallint] NULL,
 CONSTRAINT [PK_Agents] PRIMARY KEY CLUSTERED 
(
	[AgentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentPoint]    Script Date: 19.09.2023 12:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentPoint](
	[PointId] [int] IDENTITY(1,1) NOT NULL,
	[PointName] [nvarchar](1000) NOT NULL,
	[Address] [nvarchar](1000) NOT NULL,
	[AgentId] [int] NOT NULL,
 CONSTRAINT [PK_Points] PRIMARY KEY CLUSTERED 
(
	[PointId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentType]    Script Date: 19.09.2023 12:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentType](
	[AgentTypeId] [int] IDENTITY(1,1) NOT NULL,
	[AgentTypeName] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_AgentType] PRIMARY KEY CLUSTERED 
(
	[AgentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Door]    Script Date: 19.09.2023 12:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Door](
	[DoorId] [int] IDENTITY(1,1) NOT NULL,
	[DoorPlace] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Doors] PRIMARY KEY CLUSTERED 
(
	[DoorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 19.09.2023 12:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[MaterialId] [int] IDENTITY(1,1) NOT NULL,
	[MaterialName] [nvarchar](100) NOT NULL,
	[MaterialTypeId] [int] NOT NULL,
	[CountInPack] [float] NOT NULL,
	[UnitTypeId] [int] NOT NULL,
	[MinimalCount] [int] NOT NULL,
	[Description] [nvarchar](100) NULL,
	[Image] [nvarchar](50) NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_Materials] PRIMARY KEY CLUSTERED 
(
	[MaterialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialSupplier]    Script Date: 19.09.2023 12:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialSupplier](
	[MaterialSupplierId] [int] IDENTITY(1,1) NOT NULL,
	[MaterialId] [int] NOT NULL,
	[SupplierId] [int] NOT NULL,
	[Quality] [int] NOT NULL,
	[DeliveryDate] [datetime] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_MaterialSuppliers] PRIMARY KEY CLUSTERED 
(
	[MaterialSupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 19.09.2023 12:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[MaterialTypeId] [int] IDENTITY(1,1) NOT NULL,
	[MaterialTypeName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_MaterialTypes] PRIMARY KEY CLUSTERED 
(
	[MaterialTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialWarehouse]    Script Date: 19.09.2023 12:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialWarehouse](
	[MaterialWarehouseId] [int] IDENTITY(1,1) NOT NULL,
	[MaterialId] [int] NOT NULL,
	[OperationTypeId] [int] NOT NULL,
	[OperationDate] [datetime] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_MaterialWarehouse] PRIMARY KEY CLUSTERED 
(
	[MaterialWarehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperationType]    Script Date: 19.09.2023 12:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperationType](
	[OperationTypeId] [int] IDENTITY(1,1) NOT NULL,
	[OperationTypeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_OperationTypes] PRIMARY KEY CLUSTERED 
(
	[OperationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 19.09.2023 12:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[DateOfFormation] [datetime] NULL,
	[DateOfPrepayment] [datetime] NULL,
	[IsActive] [bit] NULL,
	[DateOfPayment] [datetime] NULL,
	[AgentId] [int] NOT NULL,
	[SellDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 19.09.2023 12:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderProductId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_Sell] PRIMARY KEY CLUSTERED 
(
	[OrderProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PriceHistory]    Script Date: 19.09.2023 12:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriceHistory](
	[PriceHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[MinimalPrice] [float] NOT NULL,
	[AcceptanceDate] [datetime] NOT NULL,
 CONSTRAINT [PK_AgentProducts] PRIMARY KEY CLUSTERED 
(
	[PriceHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PriorityHistory]    Script Date: 19.09.2023 12:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriorityHistory](
	[PriorityHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[AgentId] [int] NOT NULL,
	[Priority] [int] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_PriorityHistory] PRIMARY KEY CLUSTERED 
(
	[PriorityHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 19.09.2023 12:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Artikul] [nvarchar](50) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[ProductTypeId] [int] NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Image] [nvarchar](50) NULL,
	[Length] [float] NULL,
	[Height] [float] NULL,
	[Width] [float] NULL,
	[Netto] [float] NULL,
	[Brutto] [float] NULL,
	[Certificate] [nvarchar](50) NULL,
	[StandartNum] [nvarchar](100) NULL,
	[PeopleCount] [int] NOT NULL,
	[WorkshopId] [int] NOT NULL,
	[ProductionTime] [int] NULL,
	[MinimalPrice] [float] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMaterial]    Script Date: 19.09.2023 12:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMaterial](
	[ProductMaterialId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[MaterialId] [int] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_ProductMaterials] PRIMARY KEY CLUSTERED 
(
	[ProductMaterialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 19.09.2023 12:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ProductTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ProductTypeName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ProductTypes] PRIMARY KEY CLUSTERED 
(
	[ProductTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SellHistory]    Script Date: 19.09.2023 12:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellHistory](
	[SellHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[AgentId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_SellHistories] PRIMARY KEY CLUSTERED 
(
	[SellHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Speciality]    Script Date: 19.09.2023 12:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Speciality](
	[SpecialityId] [int] IDENTITY(1,1) NOT NULL,
	[SpecialityName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Specialities] PRIMARY KEY CLUSTERED 
(
	[SpecialityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 19.09.2023 12:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierId] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](100) NOT NULL,
	[INN] [nvarchar](50) NOT NULL,
	[SupplierTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierType]    Script Date: 19.09.2023 12:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierType](
	[SupplierTypeId] [int] IDENTITY(1,1) NOT NULL,
	[SupplierTypeName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_SupplierTypes] PRIMARY KEY CLUSTERED 
(
	[SupplierTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnitType]    Script Date: 19.09.2023 12:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitType](
	[UnitTypeId] [int] IDENTITY(1,1) NOT NULL,
	[UnitTypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UnitTypes] PRIMARY KEY CLUSTERED 
(
	[UnitTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Worker]    Script Date: 19.09.2023 12:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Worker](
	[WorkerId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[Surname] [nvarchar](100) NOT NULL,
	[MiddleName] [nvarchar](100) NULL,
	[DateBirth] [date] NOT NULL,
	[PassportSeries] [int] NOT NULL,
	[PassportNumber] [int] NOT NULL,
	[PassportInfo] [nvarchar](1000) NOT NULL,
	[BankAccount] [nvarchar](1000) NOT NULL,
	[SpecialityId] [int] NOT NULL,
	[FamilyInfo] [nvarchar](1000) NULL,
	[HealthyInfo] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Worker] PRIMARY KEY CLUSTERED 
(
	[WorkerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkerDoor]    Script Date: 19.09.2023 12:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkerDoor](
	[WorkerDoorId] [int] IDENTITY(1,1) NOT NULL,
	[WorkerId] [int] NOT NULL,
	[DoorId] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_WorkerDoors] PRIMARY KEY CLUSTERED 
(
	[WorkerDoorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkerWorkshop]    Script Date: 19.09.2023 12:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkerWorkshop](
	[WorkerWorkshopId] [int] IDENTITY(1,1) NOT NULL,
	[WorkerId] [int] NOT NULL,
	[WorkshopId] [int] NOT NULL,
	[WorkShift] [int] NOT NULL,
 CONSTRAINT [PK_WorkerWorkshops] PRIMARY KEY CLUSTERED 
(
	[WorkerWorkshopId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workshop]    Script Date: 19.09.2023 12:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workshop](
	[WorkshopId] [int] IDENTITY(1,1) NOT NULL,
	[WorkshopName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Workshops] PRIMARY KEY CLUSTERED 
(
	[WorkshopId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Agent] ON 

INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (1, N'МонтажОрионУрал', 1, N'027573, Тамбовская область, город Коломна, ул. Ленина, 20', N'1692286718', N'181380912', N'Давыдоваа Нина Евгеньевна', N'(35222) 67-39-26', N'pzaitev@blokin.org', N'96.png', 50)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (2, N'МетизСтрой', 1, N'254238, Нижегородская область, город Павловский Посад, проезд Балканская, 23', N'4024742936', N'295608432', N'Ева Борисовна Беспалова', N'8-800-172-62-56', N'kristina.pakomov@burova.ru', N'94.png', 374)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (3, N'РадиоСевер', 2, N'491360, Московская область, город Одинцово, въезд Ленина, 19', N'5889206249', N'372789083', N'Карпов Иосиф Максимович', N'(495) 368-86-51', N'maiy.belov@rogov.ru', N'123.png', 431)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (4, N'Компания КазАлмаз', 3, N'848810, Кемеровская область, город Лотошино, пер. Ломоносова, 90', N'3084797352', N'123190924', N'Марк Фёдорович Муравьёва', N'8-800-533-24-75', N'irina.gusina@vlasova.ru', N'80.png', 396)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (5, N'Компания СервисРадиоГор', 3, N'547196, Ульяновская область, город Серебряные Пруды, въезд Балканская, 81', N'8880473721', N'729975116', N'Попов Вадим Александрович', N'8-800-676-32-86', N'nika.nekrasova@kovalev.ru', N'40.png', 169)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (6, N'ВодТверьХозМашина', 4, N'145030, Сахалинская область, город Шатура, въезд Гоголя, 79', N'4174253174', N'522227145', N'Александра Дмитриевна Ждановаа', N'+7 (922) 849-91-96', N'tkrylov@baranova.net', N'56.png', 8)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (7, N'Тех', 2, N'731935, Калининградская область, город Павловский Посад, наб. Гагарина, 59', N'9282924869', N'587356429', N'Аким Романович Логинова', N'+7 (922) 427-13-31', N'vasilisa99@belyev.ru', N'61.png', 278)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (8, N'ТверьМетизУралСнос', 3, N'880551, Ленинградская область, город Красногорск, ул. Гоголя, 61', N'1076095397', N'947828491', N'Зоя Андреевна Соболева', N'(35222) 57-92-75', N'rlazareva@novikov.ru', N'109.png', 165)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (9, N'МясРеч', 4, N'903648, Калужская область, город Воскресенск, пр. Будапештсткая, 91', N'9254261217', N'656363498', N'Белоусоваа Ирина Максимовна', N'8-800-453-63-45', N'bkozlov@volkov.ru', N'58.png', 355)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (10, N'Флот', 4, N'505562, Тюменская область, город Наро-Фоминск, пр. Косиора, 11', N'1112170258', N'382584255', N'Василий Андреевич Ковалёв', N'8-800-144-25-38', N'gerasim.makarov@kornilov.ru', N'87.png', 473)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (11, N'CибПивОмскСнаб', 4, N'816260, Ивановская область, город Москва, ул. Гагарина, 31', N'5676173945', N'256512286', N'Людмила Александровна Сафонова', N'+7 (922) 153-95-22', N'evorontova@potapova.ru', N'46.png', 477)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (12, N'ЦементАсбоцемент', 4, N'619540, Курская область, город Раменское, пл. Балканская, 12', N'4345774724', N'352469905', N'Воронова Мария Александровна', N'(495) 184-87-92', N'polykov.veronika@artemeva.ru', NULL, 426)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (13, N'ТелеГлавВекторСбыт', 4, N'062489, Челябинская область, город Пушкино, въезд Бухарестская, 07', N'9504787157', N'419758597', N'Екатерина Фёдоровна Ковалёва', N'(35222) 56-15-37', N'nsitnikov@kovaleva.ru', N'31.png', 185)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (14, N'Инфо', 2, N'100469, Рязанская область, город Ногинск, шоссе Гагарина, 57', N'6549468639', N'718386757', N'Баранова Виктор Романович', N'8-800-793-59-97', N'arsenii.mikailova@prokorov.com', N'89.png', 304)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (15, N'ЭлектроРемОрионЛизинг', 4, N'594365, Ярославская область, город Павловский Посад, бульвар Космонавтов, 64', N'1340072597', N'500478249', N'Тарасова Дан Львович', N'(495) 519-97-41', N'anfisa.fedotova@tvetkov.ru', N'68.png', 198)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (16, N'Компания ТелекомХмельГаражПром', 3, N'126668, Ростовская область, город Зарайск, наб. Гагарина, 69', N'1614623826', N'824882264', N'Костина Татьяна Борисовна', N'(812) 983-91-73', N'qkolesnikova@kalinina.ru', N'71.png', 457)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (17, N'Компания Алмаз', 3, N'016215, Воронежская область, город Зарайск, ул. Косиора, 48', N'6698862694', N'662876919', N'Фоминаа Лариса Романовна', N'+7 (922) 688-74-22', N'akalinina@zaitev.ru', N'121.png', 259)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (18, N'МясТрансМоторЛизинг', 2, N'765320, Ивановская область, город Шатура, спуск Гоголя, 88', N'6148685143', N'196332656', N'Тамара Дмитриевна Семёноваа', N'+7 (922) 676-34-94', N'vlad.sokolov@andreev.org', N'62.png', 268)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (19, N'Монтаж', 5, N'066594, Магаданская область, город Шаховская, спуск Сталина, 59', N'6142194281', N'154457435', N'Блохина Сергей Максимович', N'(495) 867-76-15', N'zakar.sazonova@gavrilov.ru', NULL, 300)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (20, N'ВостокГлав', 3, N'217022, Ростовская область, город Озёры, ул. Домодедовская, 19', N'3580946305', N'405017349', N'Инга Фёдоровна Дмитриева', N'(812) 949-29-26', N'gordei95@kirillov.ru', N'63.png', 107)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (21, N'Газ', 5, N'252821, Тамбовская область, город Пушкино, ул. Чехова, 40', N'8876413796', N'955381891', N'Терентьев Илларион Максимович', N'(35222) 22-45-58', N'ulyna.antonov@noskov.ru', N'76.png', 170)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (22, N'ЭлектроТранс', 2, N'434616, Калининградская область, город Павловский Посад, пл. Ладыгина, 83', N'6019144874', N'450629885', N'Сава Александрович Титова', N'(812) 342-24-31', N'boleslav.zukova@nikiforova.com', N'91.png', 129)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (23, N'Электро', 2, N'966815, Новгородская область, город Одинцово, пр. Космонавтов, 19', N'7896029866', N'786038848', N'Шарапова Елена Дмитриевна', N'8-800-714-36-41', N'likacev.makar@antonov.ru', N'93.png', 366)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (24, N'Гор', 1, N'376483, Калужская область, город Сергиев Посад, ул. Славы, 09', N'7088187045', N'440309946', N'Нонна Львовна Одинцоваа', N'(495) 973-48-55', N'maiy12@koklov.net', N'52.png', 175)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (25, N'Компания Гараж', 3, N'395101, Белгородская область, город Балашиха, бульвар 1905 года, 00', N'6190244524', N'399106161', N'Владлена Фёдоровна Ларионоваа', N'+7 (922) 848-38-54', N'asiryeva@andreeva.com', N'66.png', 413)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (26, N'ОрионГлав', 6, N'729639, Магаданская область, город Талдом, въезд Будапештсткая, 98', N'9032455179', N'763045792', N'Тимофеева Григорий Андреевич', N'+7 (922) 684-13-74', N'sermakova@sarova.net', N'106.png', 482)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (27, N'ГлавITФлотПроф', 5, N'447811, Мурманская область, город Егорьевск, ул. Ленина, 24', N'2561361494', N'525678825', N'Зыкова Стефан Максимович', N'(812) 146-66-46', N'savva.rybov@kolobov.ru', N'64.png', 62)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (28, N'ТверьМонтажОмск', 6, N'761751, Амурская область, город Балашиха, шоссе Гоголя, 02', N'2421347164', N'157370604', N'Матвей Романович Большакова', N'8-800-363-43-86', N'dteterina@selezneva.ru', N'128.png', 272)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (29, N'РемСантехОмскБанк', 2, N'289468, Омская область, город Видное, пер. Балканская, 33', N'6823050572', N'176488617', N'Фокина Искра Максимовна', N'(812) 182-44-77', N'anisimov.mark@vorobev.ru', N'57.png', 442)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (30, N'ЭлектроМоторТрансСнос', 2, N'913777, Самарская область, город Красногорск, ул. Бухарестская, 49', N'6608362851', N'799760512', N'Людмила Евгеньевна Новиковаа', N'(35222) 43-62-19', N'inessa.voronov@sidorova.ru', NULL, 151)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (31, N'ТверьХозМорСбыт', 1, N'252101, Ростовская область, город Дорохово, пер. Ленина, 85', N'6681338084', N'460530907', N'Аким Львович Субботина', N'(495) 416-75-67', N'marina58@koroleva.com', N'117.png', 207)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (32, N'Компания ТомскХоз', 3, N'861543, Томская область, город Истра, бульвар Славы, 42', N'8430391035', N'961540858', N'Лазарева Аркадий Сергеевич', N'+7 (922) 849-13-37', N'nelli11@gureva.ru', N'115.png', 464)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (33, N'Компания МясДизайнДизайн', 3, N'557264, Брянская область, город Серпухов, въезд Гоголя, 34', N'8004989990', N'908629456', N'Клементина Сергеевна Стрелкова', N'(812) 535-17-25', N'gleb.gulyev@belyeva.com', N'53.png', 491)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (34, N'Компания ЖелДорТверьМонтаж', 3, N'152424, Рязанская область, город Сергиев Посад, ул. 1905 года, 27', N'3325722996', N'665766347', N'Нестор Максимович Гуляев', N'(495) 521-61-75', N'burova.zlata@zueva.ru', N'85.png', 2)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (35, N'МетизТехАвтоПроф', 3, N'713016, Брянская область, город Подольск, пл. Домодедовская, 93', N'2988890076', N'215491048', N'Егор Фёдорович Третьякова', N'(495) 581-42-46', N'anastasiy.gromov@samsonova.com', N'33.png', 321)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (36, N'Гараж', 5, N'585758, Самарская область, город Красногорск, бульвар Балканская, 13', N'2638464552', N'746822723', N'Панфилов Константин Максимович', N'(35222) 54-72-59', N'antonin51@korolev.com', N'90.png', 107)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (37, N'ГазДизайнЖелДор', 1, N'695230, Курская область, город Красногорск, пр. Гоголя, 64', N'2396029740', N'458924890', N'Лев Иванович Третьяков', N'(495) 797-97-33', N'elizaveta.komarov@rybakov.net', N'49.png', 236)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (38, N'РемГаражЛифт', 2, N'048715, Ивановская область, город Люберцы, проезд Космонавтов, 89', N'1656477206', N'988968838', N'Филатов Владимир Максимович', N'8-800-772-27-53', N'novikova.gleb@sestakov.ru', N'65.png', 374)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (39, N'СантехБашкир', 5, N'180288, Тверская область, город Одинцово, ул. Бухарестская, 37', N'4159215346', N'639267493', N'Виктор Иванович Молчанов', N'+7 (922) 155-87-39', N'nikodim81@kiseleva.com', N'99.png', 369)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (40, N'ЮпитерЛенГараж-М', 1, N'339507, Московская область, город Видное, ул. Космонавтов, 11', N'2038393690', N'259672761', N'Васильева Валерия Борисовна', N'(495) 327-58-25', N'larkipova@gorbunov.ru', N'48.png', 470)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (41, N'ОрионСофтВодСнос', 4, N'577227, Калужская область, город Павловский Посад, наб. Чехова, 35', N'1522348613', N'977738715', N'Мухина Ян Фёдорович', N'(35222) 59-75-11', N'isukanov@sobolev.com', N'97.png', 361)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (42, N'КазХоз', 2, N'384162, Астраханская область, город Одинцово, бульвар Гагарина, 57', N'6503377671', N'232279972', N'Степанова Роман Иванович', N'+7 (922) 728-85-62', N'istrelkova@fomin.ru', N'нет', 213)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (43, N'БухВжух', 6, N'481744, Амурская область, город Щёлково, пл. Сталина, 48', N'2320989197', N'359282667', N'Тарасов Болеслав Александрович', N'(495) 367-21-41', N'valentina.bolsakova@aksenova.ru', NULL, 327)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (44, N'ХозЮпитер', 2, N'038182, Курганская область, город Москва, спуск Космонавтов, 16', N'6667635058', N'380592865', N'Максимоваа Вера Фёдоровна', N'+7 (922) 332-48-96', N'jisakova@nazarova.com', N'114.png', 375)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (45, N'ВостокКазРыб', 5, N'059565, Оренбургская область, город Истра, шоссе Домодедовская, 27', N'7411284960', N'176779733', N'Самсонов Родион Романович', N'(495) 987-31-63', N'flukin@misin.org', N'112.png', 361)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (46, N'ЦементКрепТех-М', 4, N'263764, Свердловская область, город Раменское, пер. Косиора, 28', N'5359981084', N'680416300', N'Сергеев Владлен Александрович', N'(812) 838-79-58', N'yna.evdokimov@gordeeva.ru', N'82.png', 189)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (47, N'Строй', 5, N'763019, Омская область, город Шатура, пл. Сталина, 56', N'6678884759', N'279288618', N'Кудрявцев Адриан Андреевич', N'(812) 447-45-59', N'soloveva.adam@andreev.ru', NULL, 12)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (48, N'БашкирЮпитерТомск', 4, N'035268, Сахалинская область, город Волоколамск, проезд Ладыгина, 51', N'1606315697', N'217799345', N'Фадеева Раиса Александровна', N'(812) 189-59-57', N'dyckov.veniamin@kotova.ru', N'59.png', 139)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (49, N'Компания КазМеталКазань', 3, N'532703, Пензенская область, город Чехов, наб. Чехова, 81', N'4598939812', N'303467543', N'Валерий Владимирович Хохлова', N'(495) 685-34-29', N'mmoiseev@teterin.ru', N'130.png', 252)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (50, N'Компания Газ', 3, N'310403, Кировская область, город Солнечногорск, пл. Балканская, 76', N'2262431140', N'247369527', N'Давид Андреевич Фадеев', N'(35222) 75-96-85', N'alina56@zdanov.com', N'120.png', 445)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (51, N'Компания Монтаж', 3, N'036381, Брянская область, город Кашира, бульвар Гагарина, 76', N'6206428565', N'118570048', N'Силин Даниил Иванович', N'(35222) 92-45-98', N'afanasev.anastasiy@muravev.ru', N'75.png', 124)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (52, N'СервисХмельМонтаж', 4, N'928260, Нижегородская область, город Балашиха, пл. Косиора, 44', N'3459886235', N'356196105', N'Анжелика Дмитриевна Горбунова', N'+7 (922) 344-73-38', N'galina31@melnikov.ru', N'92.png', 124)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (53, N'ВодГараж', 2, N'988899, Саратовская область, город Раменское, пр. Славы, 40', N'5575072431', N'684290320', N'Лаврентий Фёдорович Логинова', N'+7 (922) 363-86-67', N'pmaslov@fomiceva.com', N'67.png', 250)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (54, N'CибГаз', 1, N'365674, Архангельская область, город Серебряные Пруды, пр. Ленина, 29', N'6483417250', N'455013058', N'Вячеслав Романович Третьякова', N'(495) 945-37-25', N'inna.sarova@panfilov.ru', N'103.png', 488)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (55, N'БашкирФлотМотор-H', 1, N'008081, Тюменская область, город Ногинск, въезд Гагарина, 94', N'1657476072', N'934931159', N'Марат Алексеевич Фролов', N'(495) 793-84-82', N'morozova.nika@kazakova.ru', N'36.png', 416)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (56, N'МеталСервисМор', 6, N'293265, Иркутская область, город Клин, пр. Славы, 12', N'6922817841', N'580142825', N'Коновалова Кирилл Львович', N'(35222) 91-28-62', N'xdanilov@titov.ru', N'нет', 475)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (57, N'Рем', 4, N'707812, Иркутская область, город Шаховская, ул. Гагарина, 17', N'3203830728', N'456254820', N'Шароваа Елизавета Львовна', N'(495) 987-88-53', N'zanna25@nikiforova.com', N'79.png', 329)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (58, N'СантехСеверЛенМашина', 3, N'606990, Новосибирская область, город Павловский Посад, въезд Домодедовская, 38', N'3506691089', N'830713603', N'Павел Максимович Рожков', N'(812) 918-88-43', N'pgorbacev@vasilev.net', N'74.png', 201)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (59, N'Цемент', 3, N'084315, Амурская область, город Шаховская, наб. Чехова, 62', N'9662118663', N'650216214', N'Анфиса Фёдоровна Буроваа', N'8-800-517-78-47', N'panova.klementina@bobrov.ru', N'54.png', 340)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (60, N'Вод', 4, N'964386, Оренбургская область, город Чехов, пл. Косиора, 80', N'1296063939', N'447430051', N'Зоя Романовна Селезнёва', N'(495) 142-19-84', N'savva86@zaiteva.ru', N'129.png', 359)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (61, N'Орион', 6, N'951035, Ивановская область, город Ступино, шоссе Космонавтов, 73', N'2670166502', N'716874456', N'Мартынов Михаил Борисович', N'8-800-621-61-93', N'aleksei63@kiselev.ru', N'77.png', 166)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (62, N'СтройГорНефть', 2, N'444539, Ульяновская область, город Лотошино, спуск Будапештсткая, 95', N'5916775587', N'398299418', N'Тарасова Макар Максимович', N'(812) 385-21-37', N'lysy.kolesnikova@molcanova.com', N'37.png', 161)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (63, N'Компания Хмель', 3, N'889757, Новосибирская область, город Раменское, бульвар 1905 года, 93', N'9004087602', N'297273898', N'Владимир Борисович Суворова', N'(812) 421-77-82', N'ermakov.mark@isakova.ru', NULL, 2)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (64, N'Компания ВодАлмазIT', 3, N'302100, Нижегородская область, город Мытищи, пер. 1905 года, 63', N'2345297765', N'908449277', N'Гуляев Егор Евгеньевич', N'(35222) 52-76-16', N'zakar37@nikolaeva.ru', N'111.png', 31)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (65, N'БашкирРечТомск', 6, N'136886, Амурская область, город Видное, въезд Космонавтов, 39', N'7027724917', N'823811460', N'Назарова Вера Андреевна', N'8-800-254-71-85', N'aleksandra77@karpov.com', N'100.png', 84)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (66, N'СофтРосБух', 4, N'747695, Амурская область, город Сергиев Посад, въезд Бухарестская, 46', N'8321561226', N'807803984', N'Белова Полина Владимировна', N'+7 (922) 445-69-17', N'ivanova.antonin@rodionov.ru', N'124.png', 69)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (67, N'ТелекомЮпитер', 1, N'959793, Курская область, город Егорьевск, бульвар Ленина, 72', N'9383182378', N'944520594', N'Калинина Татьяна Ивановна', N'(812) 895-67-23', N'kulikov.adrian@zuravlev.org', N'81.png', 302)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (68, N'УралСтройХмель', 4, N'462632, Костромская область, город Шаховская, шоссе Сталина, 92', N'8773558039', N'402502867', N'Август Борисович Красильникова', N'(35222) 39-23-65', N'aleksandr95@kolobova.ru', N'113.png', 372)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (69, N'АсбоцементТехАвто', 5, N'304975, Пензенская область, город Солнечногорск, шоссе Балканская, 76', N'7626076463', N'579234124', N'Сидорова Любовь Ивановна', N'+7 (922) 977-68-84', N'matveev.yliy@kiseleva.ru', N'110.png', 247)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (70, N'Компания ФинансСервис', 3, N'841700, Брянская область, город Серпухов, спуск Домодедовская, 35', N'7491491391', N'673621812', N'Клавдия Сергеевна Виноградова', N'(812) 878-42-71', N'robert.serbakov@safonova.ru', N'38.png', 395)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (71, N'Софт', 2, N'453714, Смоленская область, город Одинцово, спуск Косиора, 84', N'3889910123', N'952047511', N'Петухова Прохор Фёдорович', N'(35222) 12-82-65', N'jterentev@ersov.com', N'122.png', 292)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (72, N'ТелекомГор', 2, N'210024, Белгородская область, город Сергиев Посад, наб. Ломоносова, 43', N'3748947224', N'766431901', N'Ксения Андреевна Михайлова', N'(35222) 78-93-21', N'gorskov.larisa@kalinin.com', N'98.png', 255)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (73, N'РемСтрем', 6, N'373761, Псковская область, город Наро-Фоминск, наб. Гагарина, 03', N'9006569852', N'152177100', N'Альбина Александровна Романова', N'(35222) 55-28-24', N'rafail96@sukin.ru', N'116.png', 88)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (74, N'Лифт', 3, N'479565, Курганская область, город Клин, пл. Ленина, 54', N'6169713039', N'848972934', N'Вера Евгеньевна Денисоваа', N'(812) 484-92-38', N'zinaida01@bespalova.ru', N'101.png', 92)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (75, N'Компания МоторТелекомЦемент-М', 3, N'021293, Амурская область, город Наро-Фоминск, шоссе Славы, 40', N'7326832482', N'440199498', N'Иван Евгеньевич Белоусова', N'(812) 857-95-57', N'larisa44@silin.org', N'118.png', 237)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (76, N'ЮпитерТяжОрионЭкспедиция', 2, N'960726, Томская область, город Орехово-Зуево, въезд 1905 года, 51', N'6843174002', N'935556458', N'Валерий Евгеньевич Виноградов', N'(35222) 95-63-65', N'gblokin@orlov.net', N'44.png', 446)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (77, N'Транс', 5, N'508299, Кемеровская область, город Кашира, пер. Гагарина, 42', N'9604275878', N'951258069', N'Евсеева Болеслав Сергеевич', N'8-800-954-23-89', N'artem.fadeev@polykov.com', N'127.png', 38)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (78, N'РемВод', 2, N'449723, Смоленская область, город Наро-Фоминск, пер. Ломоносова, 94', N'3986603105', N'811373078', N'Медведеваа Ярослава Фёдоровна', N'+7 (922) 353-31-72', N'komarov.elizaveta@agafonova.ru', N'126.png', 1)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (79, N'АсбоцементЛифтРеч-H', 6, N'599158, Ростовская область, город Озёры, ул. Космонавтов, 05', N'6567878928', N'560960507', N'Кондратьева Таисия Андреевна', N'(495) 245-57-16', N'vladlena58@seliverstova.ru', N'105.png', 407)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (80, N'РосАвтоМонтаж', 3, N'331914, Курская область, город Ногинск, спуск Ладыгина, 66', N'4735043946', N'263682488', N'Диана Алексеевна Исаковаа', N'(495) 445-97-76', N'lapin.inessa@isaeva.com', N'55.png', 10)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (81, N'Компания СервисТелеМотор', 3, N'625988, Вологодская область, город Озёры, пр. Гоголя, 18', N'3248454160', N'138472695', N'Фролова Эдуард Борисович', N'+7 (922) 461-25-29', N'veronika.egorov@bespalova.com', N'102.png', 81)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (82, N'ФинансТелеТверь', 6, N'687171, Томская область, город Лотошино, пл. Славы, 59', N'2646091050', N'971874277', N'Зайцеваа Дарья Сергеевна', N'(812) 115-56-93', N'medvedev.klim@afanasev.com', N'45.png', 100)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (83, N'ВодГор', 2, N'265653, Калужская область, город Ступино, шоссе Гоголя, 89', N'4463113470', N'899603778', N'Фаина Фёдоровна Филиппова', N'(35222) 73-72-16', N'tvetkova.robert@sorokin.com', N'125.png', 72)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (84, N'ТяжРадиоУралПроф', 2, N'521087, Орловская область, город Егорьевск, шоссе Ладыгина, 14', N'5688533246', N'401535045', N'София Алексеевна Мухина', N'+7 (922) 885-66-15', N'liliy62@grisina.ru', N'88.png', 278)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (85, N'ГаражЛофт', 2, N'294596, Мурманская область, город Шаховская, пр. Домодедовская, 88', N'2816939574', N'754741128', N'Клавдия Фёдоровна Кудряшова', N'(495) 427-55-66', N'lydmila.belyeva@karpov.ru', N'108.png', 335)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (86, N'ITСтройАлмаз', 2, N'361730, Костромская область, город Волоколамск, шоссе Славы, 36', N'7689065648', N'456612755', N'Алексеева Валериан Андреевич', N'8-800-185-78-91', N'fokin.eduard@samoilov.com', N'83.png', 159)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (87, N'Асбоцемент', 3, N'030119, Курганская область, город Дмитров, пер. Славы, 47', N'1261407459', N'745921890', N'Никитинаа Антонина Андреевна', N'8-800-211-16-23', N'antonin19@panfilov.ru', N'34.png', 273)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (88, N'ТекстильУралАвтоОпт', 4, N'028936, Магаданская область, город Видное, ул. Гагарина, 54', N'3930950057', N'678529397', N'Алина Сергеевна Дьячковаа', N'(35222) 98-76-54', N'hkononova@pavlova.ru', NULL, 176)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (89, N'Компания КрепЦемент', 3, N'423477, Мурманская область, город Кашира, бульвар Домодедовская, 61', N'3025099903', N'606083992', N'Екатерина Львовна Суворова', N'(812) 963-77-87', N'rusakov.efim@nikiforov.ru', N'50.png', 426)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (90, N'КазаньТекстиль', 2, N'231891, Челябинская область, город Шатура, бульвар Ладыгина, 40', N'4584384019', N'149680499', N'Александров Бронислав Максимович', N'(35222) 86-74-21', N'osimonova@andreeva.com', N'47.png', 156)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (91, N'КазЮпитерТомск', 2, N'393450, Тульская область, город Кашира, пр. 1905 года, 47', N'9201745524', N'510248846', N'Рафаил Андреевич Копылов', N'+7 (922) 772-33-58', N'tgavrilov@frolov.ru', N'60.png', 244)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (92, N'Бух', 5, N'409600, Новгородская область, город Ногинск, пл. Гагарина, 68', N'1953785418', N'122905583', N'Татьяна Сергеевна Королёваа', N'+7 (922) 375-49-21', N'belova.vikentii@konstantinova.net', N'78.png', 82)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (93, N'Радио', 6, N'798718, Ленинградская область, город Пушкино, бульвар Балканская, 37', N'9077613654', N'657690787', N'Эмма Андреевна Колесникова', N'8-800-897-32-78', N'rtretykova@kozlov.ru', N'43.png', 221)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (94, N'Креп', 4, N'336489, Калининградская область, город Можайск, наб. Славы, 35', N'4880732317', N'258673591', N'Назар Алексеевич Григорьева', N'(495) 217-46-29', N'savina.dominika@belousova.com', N'39.png', 371)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (95, N'Мобайл', 2, N'606703, Амурская область, город Чехов, пл. Будапештсткая, 91', N'7803888520', N'885703265', N'Екатерина Сергеевна Бобылёва', N'8-800-618-73-37', N'dsiryev@dementeva.com', N'107.png', 464)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (96, N'CибБашкирТекстиль', 1, N'429540, Мурманская область, город Воскресенск, пл. Славы, 36', N'7392007090', N'576103661', N'Григорий Владимирович Елисеева', N'(495) 285-78-38', N'vzimina@zdanova.com', N'69.png', 218)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (97, N'МеталТекстильЛифтТрест', 1, N'786287, Свердловская область, город Волоколамск, пер. Будапештсткая, 72', N'2971553297', N'821859486', N'Одинцов Назар Борисович', N'(812) 753-96-76', N'muravev.trofim@sazonov.net', N'86.png', 425)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (98, N'ОрионТомскТех', 6, N'738763, Курская область, город Егорьевск, спуск Чехова, 66', N'9351493429', N'583041591', N'Георгий Александрович Лукин', N'+7 (922) 542-89-15', N'faina.tikonova@veselov.com', N'119.png', 73)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (99, N'ЖелДорДизайнМетизТраст', 6, N'170549, Сахалинская область, город Видное, проезд Космонавтов, 89', N'7669116841', N'906390137', N'Игорь Львович Агафонова', N'(812) 123-63-47', N'lnikitina@kulikova.com', NULL, 290)
GO
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (100, N'БухМясМоторПром', 2, N'677498, Костромская область, город Зарайск, спуск Славы, 59', N'7377410338', N'592041317', N'Нина Дмитриевна Черноваа', N'(35222) 83-23-59', N'varvara49@savin.ru', N'95.png', 158)
SET IDENTITY_INSERT [dbo].[Agent] OFF
GO
SET IDENTITY_INSERT [dbo].[AgentType] ON 

INSERT [dbo].[AgentType] ([AgentTypeId], [AgentTypeName]) VALUES (1, N'МКК')
INSERT [dbo].[AgentType] ([AgentTypeId], [AgentTypeName]) VALUES (2, N'ОАО')
INSERT [dbo].[AgentType] ([AgentTypeId], [AgentTypeName]) VALUES (3, N'ООО')
INSERT [dbo].[AgentType] ([AgentTypeId], [AgentTypeName]) VALUES (4, N'ЗАО')
INSERT [dbo].[AgentType] ([AgentTypeId], [AgentTypeName]) VALUES (5, N'МФО')
INSERT [dbo].[AgentType] ([AgentTypeId], [AgentTypeName]) VALUES (6, N'ПАО')
SET IDENTITY_INSERT [dbo].[AgentType] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (1, N'82925345', N'Попрыгунчик детский красный 1289', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, NULL, 1919)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (2, N'80007300', N'Попрыгунчик детский желтый 6678', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 1768)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (3, N'13875235', N'Попрыгунчик детский 6888', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 3, NULL, 1972)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (4, N'2158097', N'Попрыгунчик для мальчиков 3929', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 255)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (5, N'3157982', N'Попрыгунчик детский 2071', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 5, NULL, 275)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (6, N'67975083', N'Попрыгунчик для собачек 5096', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 4, NULL, 1465)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (7, N'70873532', N'Попрыгунчик для мальчиков 5389', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 6, NULL, 1739)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (8, N'74291677', N'Попрыгунчик детский розовый 5376', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 5, NULL, 1889)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (9, N'30269726', N'Попрыгунчик для мальчиков 3307', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, NULL, 1533)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (10, N'11890154', N'Попрыгунчик для кошечек 2604', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 7, NULL, 842)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (11, N'25514523', N'Шар 6366', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 8, NULL, 1932)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (12, N'88211092', N'Попрыгунчик детский желтый 6051', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 3, NULL, 727)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (13, N'25262035', N'Попрыгунчик для девочек 2311', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 2, NULL, 1308)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (14, N'89607276', N'Попрыгунчик для собачек 4387', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 9, NULL, 912)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (15, N'74919447', N'Попрыгун 3016', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, NULL, 615)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (16, N'88098604', N'Попрыгунчик детский красный 3240', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 9, NULL, 882)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (17, N'86558177', N'Попрыгунчик детский розовый 1657', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 10, NULL, 662)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (18, N'79704172', N'Попрыгунчик детский красный 6591', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 7, NULL, 592)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (19, N'54983244', N'Попрыгунчик для девочек 1895', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 8, NULL, 1586)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (20, N'43987093', N'Попрыгунчик для кошечек 3741', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 8, NULL, 1668)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (21, N'26655484', N'Попрыгунчик детский красный 3839', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 6, NULL, 1921)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (22, N'10614909', N'Попрыгунчик детский красный 4969', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 3, NULL, 913)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (23, N'79018408', N'Попрыгунчик для собачек 5754', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 9, NULL, 633)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (24, N'33440129', N'Попрыгунчик для собачек 4485', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 3, NULL, 1995)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (25, N'22217580', N'Попрыгунчик для девочек 1656', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 5, NULL, 1494)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (26, N'45540528', N'Попрыгунчик для мальчиков 4791', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 11, NULL, 1260)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (27, N'10084400', N'Попрыгунчик для девочек 6849', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 11, NULL, 933)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (28, N'85514178', N'Попрыгунчик детский желтый 1371', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 7, NULL, 252)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (29, N'26434211', N'Попрыгунчик для девочек 3389', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, 597)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (30, N'89612317', N'Попрыгунчик детский розовый 5197', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, 1948)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (31, N'79994924', N'Попрыгунчик для собачек 3500', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 4, NULL, 1142)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (32, N'12732041', N'Попрыгун 6882', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 5, NULL, 809)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (33, N'80698285', N'Попрыгунчик для кошечек 4740', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 5, NULL, 1973)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (34, N'42536654', N'Шар 2243', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 3, NULL, 1247)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (35, N'43330133', N'Попрыгунчик детский красный 1740', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 10, NULL, 1749)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (36, N'68237918', N'Попрыгунчик детский красный 5400', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 12, NULL, 1570)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (37, N'47378395', N'Попрыгунчик для девочек 1560', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 5, NULL, 235)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (38, N'39025230', N'Шар 4124', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 9, NULL, 1160)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (39, N'32125209', N'Попрыгунчик детский желтый 2582', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 11, NULL, 1730)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (40, N'69184347', N'Попрыгунчик детский 6029', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 7, NULL, 419)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (41, N'34750945', N'Попрыгун 2299', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 6, NULL, 1688)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (42, N'59509797', N'Попрыгунчик детский красный 1972', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 7, NULL, 794)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (43, N'80875656', N'Попрыгунчик детский 5117', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 3, NULL, 338)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (44, N'25409940', N'Попрыгунчик детский розовый 5501', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 7, NULL, 652)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (45, N'30282346', N'Попрыгунчик детский розовый 6346', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 1024)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (46, N'28152672', N'Попрыгун 6412', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 4, NULL, 523)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (47, N'73345857', N'Попрыгунчик детский 1916', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 9, NULL, 832)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (48, N'81713527', N'Попрыгунчик для собачек 4529', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 5, NULL, 1923)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (49, N'27301447', N'Попрыгунчик для собачек 4381', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 12, NULL, 1234)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (50, N'13340356', N'Попрыгунчик детский розовый 2694', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 5, NULL, 1691)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName]) VALUES (1, N'Детский')
INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName]) VALUES (2, N'Взрослый')
INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName]) VALUES (3, N'Цифровой')
INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName]) VALUES (4, N'Упругий')
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
SET IDENTITY_INSERT [dbo].[SellHistory] ON 

INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (1, 90, 10, 7, CAST(N'2010-06-21' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (2, 70, 23, 18, CAST(N'2016-02-17' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (3, 38, 24, 9, CAST(N'2012-11-07' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (4, 93, 46, 5, CAST(N'2019-06-01' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (5, 61, 21, 11, CAST(N'2014-06-11' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (6, 29, 1, 12, CAST(N'2012-08-12' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (7, 21, 35, 16, CAST(N'2012-09-26' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (8, 38, 17, 3, CAST(N'2018-02-28' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (9, 96, 2, 6, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (10, 33, 12, 10, CAST(N'2011-08-27' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (11, 25, 42, 2, CAST(N'2011-08-19' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (12, 38, 45, 20, CAST(N'2015-02-02' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (13, 94, 48, 14, CAST(N'2011-07-01' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (14, 40, 47, 8, CAST(N'2013-12-23' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (15, 7, 10, 10, CAST(N'2017-11-11' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (16, 35, 24, 14, CAST(N'2014-04-15' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (17, 37, 24, 6, CAST(N'2018-06-22' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (18, 57, 39, 12, CAST(N'2013-07-11' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (19, 18, 17, 7, CAST(N'2016-08-13' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (20, 21, 47, 8, CAST(N'2014-07-28' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (21, 62, 14, 8, CAST(N'2010-04-15' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (22, 42, 14, 8, CAST(N'2017-10-12' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (23, 88, 38, 13, CAST(N'2012-09-02' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (24, 91, 17, 14, CAST(N'2015-08-08' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (25, 5, 49, 15, CAST(N'2012-05-25' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (26, 30, 36, 12, CAST(N'2014-03-06' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (27, 29, 16, 6, CAST(N'2016-05-18' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (28, 89, 50, 10, CAST(N'2014-07-11' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (29, 63, 45, 8, CAST(N'2016-08-18' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (30, 5, 4, 19, CAST(N'2019-07-25' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (31, 53, 40, 6, CAST(N'2019-03-17' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (32, 47, 20, 9, CAST(N'2014-08-06' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (33, 5, 27, 18, CAST(N'2011-09-12' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (34, 19, 14, 11, CAST(N'2011-08-28' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (35, 63, 41, 4, CAST(N'2015-12-25' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (36, 18, 1, 8, CAST(N'2016-02-25' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (37, 11, 8, 1, CAST(N'2017-06-07' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (38, 96, 38, 6, CAST(N'2016-11-27' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (39, 7, 18, 18, CAST(N'2012-03-12' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (40, 59, 7, 18, CAST(N'2018-06-13' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (41, 30, 31, 2, CAST(N'2017-11-05' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (42, 16, 38, 1, CAST(N'2016-02-26' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (43, 90, 29, 8, CAST(N'2010-06-20' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (44, 7, 28, 12, CAST(N'2015-06-23' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (45, 33, 14, 3, CAST(N'2013-01-24' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (46, 9, 13, 5, CAST(N'2015-02-28' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (47, 18, 42, 14, CAST(N'2019-07-05' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (48, 92, 40, 6, CAST(N'2014-03-06' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (49, 94, 31, 5, CAST(N'2017-05-01' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (50, 51, 26, 15, CAST(N'2015-01-17' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (51, 82, 15, 7, CAST(N'2018-04-14' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (52, 94, 18, 14, CAST(N'2014-12-12' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (53, 40, 17, 16, CAST(N'2015-03-28' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (54, 13, 41, 15, CAST(N'2017-11-24' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (55, 11, 46, 10, CAST(N'2019-06-27' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (56, 87, 29, 2, CAST(N'2014-06-04' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (57, 57, 43, 11, CAST(N'2019-03-18' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (58, 13, 42, 8, CAST(N'2015-09-12' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (59, 59, 47, 13, CAST(N'2012-01-02' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (60, 9, 24, 12, CAST(N'2011-02-01' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (61, 24, 33, 17, CAST(N'2016-10-07' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (62, 91, 4, 1, CAST(N'2017-06-07' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (63, 47, 5, 14, CAST(N'2016-02-26' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (64, 47, 2, 5, CAST(N'2013-11-09' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (65, 9, 40, 14, CAST(N'2015-07-01' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (66, 58, 32, 6, CAST(N'2015-08-27' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (67, 59, 23, 15, CAST(N'2013-08-27' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (68, 61, 19, 2, CAST(N'2013-05-10' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (69, 53, 24, 19, CAST(N'2013-12-01' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (70, 70, 15, 16, CAST(N'2011-06-11' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (71, 25, 2, 16, CAST(N'2019-05-24' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (72, 47, 46, 1, CAST(N'2017-04-02' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (73, 29, 3, 10, CAST(N'2013-04-08' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (74, 51, 50, 20, CAST(N'2019-08-16' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (75, 80, 46, 5, CAST(N'2011-12-26' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (76, 25, 21, 19, CAST(N'2016-07-19' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (77, 19, 44, 1, CAST(N'2014-03-17' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (78, 12, 16, 13, CAST(N'2011-06-14' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (79, 76, 29, 13, CAST(N'2017-05-20' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (80, 53, 1, 6, CAST(N'2010-04-13' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (81, 12, 1, 9, CAST(N'2019-10-15' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (82, 48, 43, 20, CAST(N'2019-10-08' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (83, 33, 21, 8, CAST(N'2018-04-08' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (84, 30, 34, 2, CAST(N'2012-06-14' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (85, 62, 28, 3, CAST(N'2012-04-23' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (86, 61, 27, 6, CAST(N'2015-08-17' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (87, 51, 29, 7, CAST(N'2016-09-14' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (88, 6, 4, 15, CAST(N'2012-03-23' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (89, 55, 38, 5, CAST(N'2010-11-17' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (90, 37, 40, 13, CAST(N'2016-11-17' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (91, 24, 44, 19, CAST(N'2010-05-03' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (92, 15, 12, 1, CAST(N'2019-03-06' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (93, 16, 24, 20, CAST(N'2017-10-14' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (94, 80, 50, 3, CAST(N'2017-02-08' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (95, 25, 13, 3, CAST(N'2017-08-02' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (96, 82, 8, 18, CAST(N'2017-03-09' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (97, 33, 39, 18, CAST(N'2017-11-13' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (98, 30, 39, 19, CAST(N'2015-12-02' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (99, 27, 9, 19, CAST(N'2011-06-14' AS Date))
GO
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (100, 63, 1, 16, CAST(N'2014-08-14' AS Date))
SET IDENTITY_INSERT [dbo].[SellHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[Workshop] ON 

INSERT [dbo].[Workshop] ([WorkshopId], [WorkshopName]) VALUES (1, N'10')
INSERT [dbo].[Workshop] ([WorkshopId], [WorkshopName]) VALUES (2, N'1')
INSERT [dbo].[Workshop] ([WorkshopId], [WorkshopName]) VALUES (3, N'12')
INSERT [dbo].[Workshop] ([WorkshopId], [WorkshopName]) VALUES (4, N'9')
INSERT [dbo].[Workshop] ([WorkshopId], [WorkshopName]) VALUES (5, N'6')
INSERT [dbo].[Workshop] ([WorkshopId], [WorkshopName]) VALUES (6, N'2')
INSERT [dbo].[Workshop] ([WorkshopId], [WorkshopName]) VALUES (7, N'7')
INSERT [dbo].[Workshop] ([WorkshopId], [WorkshopName]) VALUES (8, N'4')
INSERT [dbo].[Workshop] ([WorkshopId], [WorkshopName]) VALUES (9, N'8')
INSERT [dbo].[Workshop] ([WorkshopId], [WorkshopName]) VALUES (10, N'3')
INSERT [dbo].[Workshop] ([WorkshopId], [WorkshopName]) VALUES (11, N'11')
INSERT [dbo].[Workshop] ([WorkshopId], [WorkshopName]) VALUES (12, N'5')
SET IDENTITY_INSERT [dbo].[Workshop] OFF
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agents_AgentTypes] FOREIGN KEY([AgentTypeId])
REFERENCES [dbo].[AgentType] ([AgentTypeId])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agents_AgentTypes]
GO
ALTER TABLE [dbo].[AgentPoint]  WITH CHECK ADD  CONSTRAINT [FK_AgentPoints_Agents] FOREIGN KEY([AgentId])
REFERENCES [dbo].[Agent] ([AgentId])
GO
ALTER TABLE [dbo].[AgentPoint] CHECK CONSTRAINT [FK_AgentPoints_Agents]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Materials_MaterialTypes] FOREIGN KEY([MaterialTypeId])
REFERENCES [dbo].[MaterialType] ([MaterialTypeId])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Materials_MaterialTypes]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Materials_UnitTypes] FOREIGN KEY([UnitTypeId])
REFERENCES [dbo].[UnitType] ([UnitTypeId])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Materials_UnitTypes]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSuppliers_Materials] FOREIGN KEY([MaterialId])
REFERENCES [dbo].[Material] ([MaterialId])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSuppliers_Materials]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSuppliers_Suppliers] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Supplier] ([SupplierId])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSuppliers_Suppliers]
GO
ALTER TABLE [dbo].[MaterialWarehouse]  WITH CHECK ADD  CONSTRAINT [FK_MaterialWarehouse_Materials1] FOREIGN KEY([MaterialId])
REFERENCES [dbo].[Material] ([MaterialId])
GO
ALTER TABLE [dbo].[MaterialWarehouse] CHECK CONSTRAINT [FK_MaterialWarehouse_Materials1]
GO
ALTER TABLE [dbo].[MaterialWarehouse]  WITH CHECK ADD  CONSTRAINT [FK_MaterialWarehouse_OperationTypes] FOREIGN KEY([OperationTypeId])
REFERENCES [dbo].[OperationType] ([OperationTypeId])
GO
ALTER TABLE [dbo].[MaterialWarehouse] CHECK CONSTRAINT [FK_MaterialWarehouse_OperationTypes]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Agents] FOREIGN KEY([AgentId])
REFERENCES [dbo].[Agent] ([AgentId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Orders_Agents]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProducts_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProducts_Products]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_Sell_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_Sell_Orders]
GO
ALTER TABLE [dbo].[PriceHistory]  WITH CHECK ADD  CONSTRAINT [FK_AgentProducts_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[PriceHistory] CHECK CONSTRAINT [FK_AgentProducts_Products]
GO
ALTER TABLE [dbo].[PriorityHistory]  WITH CHECK ADD  CONSTRAINT [FK_PriorityHistories_Agents] FOREIGN KEY([AgentId])
REFERENCES [dbo].[Agent] ([AgentId])
GO
ALTER TABLE [dbo].[PriorityHistory] CHECK CONSTRAINT [FK_PriorityHistories_Agents]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductTypes] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductType] ([ProductTypeId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Products_ProductTypes]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Products_Workshops] FOREIGN KEY([WorkshopId])
REFERENCES [dbo].[Workshop] ([WorkshopId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Products_Workshops]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterials_Materials] FOREIGN KEY([MaterialId])
REFERENCES [dbo].[Material] ([MaterialId])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterials_Materials]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterials_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterials_Products]
GO
ALTER TABLE [dbo].[SellHistory]  WITH CHECK ADD  CONSTRAINT [FK_SellHistories_Agents] FOREIGN KEY([AgentId])
REFERENCES [dbo].[Agent] ([AgentId])
GO
ALTER TABLE [dbo].[SellHistory] CHECK CONSTRAINT [FK_SellHistories_Agents]
GO
ALTER TABLE [dbo].[SellHistory]  WITH CHECK ADD  CONSTRAINT [FK_SellHistories_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[SellHistory] CHECK CONSTRAINT [FK_SellHistories_Products]
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD  CONSTRAINT [FK_Suppliers_SupplierTypes] FOREIGN KEY([SupplierTypeId])
REFERENCES [dbo].[SupplierType] ([SupplierTypeId])
GO
ALTER TABLE [dbo].[Supplier] CHECK CONSTRAINT [FK_Suppliers_SupplierTypes]
GO
ALTER TABLE [dbo].[Worker]  WITH CHECK ADD  CONSTRAINT [FK_Workers_Specialities] FOREIGN KEY([SpecialityId])
REFERENCES [dbo].[Speciality] ([SpecialityId])
GO
ALTER TABLE [dbo].[Worker] CHECK CONSTRAINT [FK_Workers_Specialities]
GO
ALTER TABLE [dbo].[WorkerDoor]  WITH CHECK ADD  CONSTRAINT [FK_WorkerDoors_Doors] FOREIGN KEY([DoorId])
REFERENCES [dbo].[Door] ([DoorId])
GO
ALTER TABLE [dbo].[WorkerDoor] CHECK CONSTRAINT [FK_WorkerDoors_Doors]
GO
ALTER TABLE [dbo].[WorkerDoor]  WITH CHECK ADD  CONSTRAINT [FK_WorkerDoors_Worker] FOREIGN KEY([WorkerId])
REFERENCES [dbo].[Worker] ([WorkerId])
GO
ALTER TABLE [dbo].[WorkerDoor] CHECK CONSTRAINT [FK_WorkerDoors_Worker]
GO
ALTER TABLE [dbo].[WorkerWorkshop]  WITH CHECK ADD  CONSTRAINT [FK_WorkerWorkshops_Worker] FOREIGN KEY([WorkerId])
REFERENCES [dbo].[Worker] ([WorkerId])
GO
ALTER TABLE [dbo].[WorkerWorkshop] CHECK CONSTRAINT [FK_WorkerWorkshops_Worker]
GO
ALTER TABLE [dbo].[WorkerWorkshop]  WITH CHECK ADD  CONSTRAINT [FK_WorkerWorkshops_Workshops] FOREIGN KEY([WorkshopId])
REFERENCES [dbo].[Workshop] ([WorkshopId])
GO
ALTER TABLE [dbo].[WorkerWorkshop] CHECK CONSTRAINT [FK_WorkerWorkshops_Workshops]
GO
USE [master]
GO
ALTER DATABASE [user1] SET  READ_WRITE 
GO
