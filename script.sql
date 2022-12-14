USE [master]
GO
/****** Object:  Database [Game_web]    Script Date: 26.09.2022 17:10:52 ******/
CREATE DATABASE [Game_web]
GO
USE [Game_web]
GO
/****** Object:  User [sus]    Script Date: 26.09.2022 17:10:52 ******/
CREATE USER [sus] FOR LOGIN [sus] WITH DEFAULT_SCHEMA=[sus]
GO
/****** Object:  Schema [sus]    Script Date: 26.09.2022 17:10:52 ******/
CREATE SCHEMA [sus]
GO
/****** Object:  Table [dbo].[donat services]    Script Date: 26.09.2022 17:10:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[donat services](
	[Producid] [int] NOT NULL,
	[Category] [int] NOT NULL,
	[ProductName] [varchar](100) NULL,
	[Price] [money] NOT NULL,
	[ID] [int] NOT NULL,
 CONSTRAINT [PK_donat services] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paymant]    Script Date: 26.09.2022 17:10:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paymant](
	[Номер телефона] [int] NOT NULL,
	[Кредитная карта] [bigint] NULL,
	[ID user] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 26.09.2022 17:10:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[login] [text] NOT NULL,
	[password] [text] NOT NULL,
	[ID user] [int] NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[ID user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ИсторияПокупок]    Script Date: 26.09.2022 17:10:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ИсторияПокупок](
	[ID] [int] NOT NULL,
	[ID users] [int] NOT NULL,
	[time] [date] NOT NULL,
	[ID donat] [int] NOT NULL,
	[ID order] [int] NOT NULL,
 CONSTRAINT [PK_ИсторияПокупок] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Paymant]  WITH CHECK ADD  CONSTRAINT [Оплата и пользователь] FOREIGN KEY([ID user])
REFERENCES [dbo].[user] ([ID user])
GO
ALTER TABLE [dbo].[Paymant] CHECK CONSTRAINT [Оплата и пользователь]
GO
ALTER TABLE [dbo].[ИсторияПокупок]  WITH CHECK ADD  CONSTRAINT [FK_ИсторияПокупок_donat services] FOREIGN KEY([ID donat])
REFERENCES [dbo].[donat services] ([ID])
GO
ALTER TABLE [dbo].[ИсторияПокупок] CHECK CONSTRAINT [FK_ИсторияПокупок_donat services]
GO
ALTER TABLE [dbo].[ИсторияПокупок]  WITH CHECK ADD  CONSTRAINT [Пользователь-продукт] FOREIGN KEY([ID users])
REFERENCES [dbo].[user] ([ID user])
GO
ALTER TABLE [dbo].[ИсторияПокупок] CHECK CONSTRAINT [Пользователь-продукт]
GO
USE [master]
GO

