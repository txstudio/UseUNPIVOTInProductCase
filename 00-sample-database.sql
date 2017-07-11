--
--使用下列 T-SQL 指令碼建立範例資料庫與資料表內容
--	請確認擁有足夠權限
--
CREATE DATABASE [UnPivotSampleDb]
GO

USE [UnPivotSampleDb]
GO

--
--商品尺寸資料表
--
CREATE TABLE [dbo].[Sizes]
(
	[No]		INT,
	[Code]		VARCHAR(10) UNIQUE,
	[Name]		NVARCHAR(20),

	[Size01]	NVARCHAR(5),
	[Size02]	NVARCHAR(5),
	[Size03]	NVARCHAR(5),
	[Size04]	NVARCHAR(5),
	[Size05]	NVARCHAR(5),
	[Size06]	NVARCHAR(5),
	[Size07]	NVARCHAR(5),
	[Size08]	NVARCHAR(5),
	[Size09]	NVARCHAR(5),
	[Size10]	NVARCHAR(5),

	PRIMARY KEY ([No])
)
GO

INSERT INTO [dbo].[Sizes] ([No],[Code],[Name],[Size01],[Size02],[Size03],[Size04],[Size05],[Size06],[Size07],[Size08],[Size09],[Size10])
	VALUES (1,'US',N'US',N'7.5',N'8',N'8.5',N'9',N'9.5',N'10',N'10.5',N'11',N'11.5',N'12')
INSERT INTO [dbo].[Sizes] ([No],[Code],[Name],[Size01],[Size02],[Size03],[Size04],[Size05],[Size06],[Size07],[Size08],[Size09],[Size10])
	VALUES (2,'UK',N'UK',N'7',N'7.5',N'8',N'8.5',N'9',N'9.5',N'10',N'10.5',N'11',N'11.5')
INSERT INTO [dbo].[Sizes] ([No],[Code],[Name],[Size01],[Size02],[Size03],[Size04],[Size05],[Size06],[Size07],[Size08],[Size09],[Size10])
	VALUES (3,'CM',N'CM',N'25.5',N'26',N'26.5',N'27',N'27.5',N'28',N'28.5',N'29',N'29.5',N'30')
INSERT INTO [dbo].[Sizes] ([No],[Code],[Name],[Size01],[Size02],[Size03],[Size04],[Size05],[Size06],[Size07],[Size08],[Size09],[Size10])
	VALUES (4,'WEAR',N'上衣',N'S',N'M',N'L',N'XL',N'2XL',N'3XL',NULL,NULL,NULL,NULL)
INSERT INTO [dbo].[Sizes] ([No],[Code],[Name],[Size01],[Size02],[Size03],[Size04],[Size05],[Size06],[Size07],[Size08],[Size09],[Size10])
	VALUES (5,'PCS',N'件',N'件',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
GO

--
--商品主檔案資料表
--
CREATE TABLE [dbo].[Products]
(
	[No]		INT,
	[Code]		VARCHAR(25) UNIQUE,
	[Name]		NVARCHAR(100) NOT NULL,

	PRIMARY KEY ([No])
)
GO

INSERT INTO [dbo].[Products] ([No],[Code],[Name]) VALUES (1,'B019DECZPG',N'Performance Men''s Goletto V FG Soccer Shoe')
INSERT INTO [dbo].[Products] ([No],[Code],[Name]) VALUES (2,'B019DECZPH',N'Messi 16.3 Tf Soccer Shoe')
INSERT INTO [dbo].[Products] ([No],[Code],[Name]) VALUES (3,'B019DECZPI',N'X 16.3 FG Cleat Men''s Soccer Shoe')
INSERT INTO [dbo].[Products] ([No],[Code],[Name]) VALUES (4,'B019DECZPJ',N'Messi 15.1 FG/AG Soccer Cleats Soccer Shoe')
INSERT INTO [dbo].[Products] ([No],[Code],[Name]) VALUES (5,'SWER2DDCEE',N'棉彈性長袖襯衫-男-藍')
INSERT INTO [dbo].[Products] ([No],[Code],[Name]) VALUES (6,'SWER2DDCBL',N'彈性府綢長袖襯衫-男-黑')
INSERT INTO [dbo].[Products] ([No],[Code],[Name]) VALUES (7,'BER2DDCBLA',N'無暇的程式碼番外篇')
GO

--
--商品庫存資料表
--
CREATE TABLE [dbo].[ProductStorages]
(
	[ProductNo]	INT,
	[SizeNo]	INT,

	[Storage01]	INT,
	[Storage02]	INT,
	[Storage03]	INT,
	[Storage04]	INT,
	[Storage05]	INT,
	[Storage06]	INT,
	[Storage07]	INT,
	[Storage08]	INT,
	[Storage09]	INT,
	[Storage10]	INT,

	PRIMARY KEY ([ProductNo],[SizeNo]),

	FOREIGN KEY ([ProductNo]) 
		REFERENCES [dbo].[Products]([No]) ON DELETE CASCADE,
	FOREIGN KEY ([SizeNo])
		REFERENCES [dbo].[Sizes]([No]) ON DELETE NO ACTION
)
GO

INSERT INTO [dbo].[ProductStorages]([ProductNo],[SizeNo],[Storage01],[Storage02],[Storage03],[Storage04],[Storage05],[Storage06],[Storage07],[Storage08],[Storage09],[Storage10])
	VALUES (1,2,0,0,1,0,2,1,0,1,0,0)
INSERT INTO [dbo].[ProductStorages]([ProductNo],[SizeNo],[Storage01],[Storage02],[Storage03],[Storage04],[Storage05],[Storage06],[Storage07],[Storage08],[Storage09],[Storage10])
	VALUES (2,2,1,0,0,0,0,0,0,0,1,0)
INSERT INTO [dbo].[ProductStorages]([ProductNo],[SizeNo],[Storage01],[Storage02],[Storage03],[Storage04],[Storage05],[Storage06],[Storage07],[Storage08],[Storage09],[Storage10])
	VALUES (3,2,1,1,1,0,0,0,0,1,0,0)
INSERT INTO [dbo].[ProductStorages]([ProductNo],[SizeNo],[Storage01],[Storage02],[Storage03],[Storage04],[Storage05],[Storage06],[Storage07],[Storage08],[Storage09],[Storage10])
	VALUES (4,2,2,0,1,0,0,0,0,1,2,0)
INSERT INTO [dbo].[ProductStorages]([ProductNo],[SizeNo],[Storage01],[Storage02],[Storage03],[Storage04],[Storage05],[Storage06],[Storage07],[Storage08],[Storage09],[Storage10])
	VALUES (5,4,0,1,1,0,0,1,NULL,NULL,NULL,NULL)
INSERT INTO [dbo].[ProductStorages]([ProductNo],[SizeNo],[Storage01],[Storage02],[Storage03],[Storage04],[Storage05],[Storage06],[Storage07],[Storage08],[Storage09],[Storage10])
	VALUES (6,4,0,0,0,0,2,1,NULL,NULL,NULL,NULL)
INSERT INTO [dbo].[ProductStorages]([ProductNo],[SizeNo],[Storage01],[Storage02],[Storage03],[Storage04],[Storage05],[Storage06],[Storage07],[Storage08],[Storage09],[Storage10])
	VALUES (7,5,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
GO
