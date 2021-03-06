USE [master]
GO
/****** Object:  Database [BGEnqiry]    Script Date: 03/14/2018 7:42:31 AM ******/
CREATE DATABASE [BGEnqiry]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BGEnqiry', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BGEnqiry.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BGEnqiry_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BGEnqiry_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BGEnqiry] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BGEnqiry].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BGEnqiry] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BGEnqiry] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BGEnqiry] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BGEnqiry] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BGEnqiry] SET ARITHABORT OFF 
GO
ALTER DATABASE [BGEnqiry] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BGEnqiry] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BGEnqiry] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BGEnqiry] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BGEnqiry] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BGEnqiry] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BGEnqiry] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BGEnqiry] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BGEnqiry] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BGEnqiry] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BGEnqiry] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BGEnqiry] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BGEnqiry] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BGEnqiry] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BGEnqiry] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BGEnqiry] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BGEnqiry] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BGEnqiry] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BGEnqiry] SET  MULTI_USER 
GO
ALTER DATABASE [BGEnqiry] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BGEnqiry] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BGEnqiry] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BGEnqiry] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BGEnqiry] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BGEnqiry]
GO
/****** Object:  Table [dbo].[home]    Script Date: 03/14/2018 7:42:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[home](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[Remarks] [nvarchar](800) NULL,
	[Email] [nvarchar](50) NULL,
	[locDubaiBusines] [bit] NOT NULL DEFAULT ((0)),
	[locDubaiSilicon] [bit] NOT NULL DEFAULT ((0)),
	[Budget400K700K] [bit] NOT NULL DEFAULT ((0)),
	[Budget700K1000K] [bit] NOT NULL DEFAULT ((0)),
	[Budget1000K1250K] [bit] NOT NULL DEFAULT ((0)),
	[Budget1250K1500K] [bit] NOT NULL DEFAULT ((0)),
	[Studio] [bit] NOT NULL DEFAULT ((0)),
	[OneBed] [bit] NOT NULL DEFAULT ((0)),
	[TwoBed] [bit] NOT NULL DEFAULT ((0)),
	[Retail] [bit] NOT NULL DEFAULT ((0)),
	[Immed] [bit] NOT NULL DEFAULT ((0)),
	[Months3to6] [bit] NOT NULL DEFAULT ((0)),
	[Months6to12] [bit] NOT NULL DEFAULT ((0)),
	[Months12to18] [bit] NOT NULL DEFAULT ((0)),
	[TimeStamp] [datetime] NULL CONSTRAINT [DF_home_TimeStamp]  DEFAULT (getdate()),
	[SourceID] [tinyint] NULL CONSTRAINT [DF_home_SourceID]  DEFAULT ((1)),
 CONSTRAINT [PK_home] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[locations]    Script Date: 03/14/2018 7:42:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[locations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_locationId] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[loginDB]    Script Date: 03/14/2018 7:42:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[loginDB](
	[id] [int] NOT NULL,
	[userName] [varchar](20) NOT NULL,
	[pswrd] [varchar](20) NULL,
	[isActive] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sources]    Script Date: 03/14/2018 7:42:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sources](
	[SourceID] [tinyint] NOT NULL,
	[SourceName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Sources] PRIMARY KEY CLUSTERED 
(
	[SourceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[home] ON 

INSERT [dbo].[home] ([Id], [firstName], [Mobile], [Remarks], [Email], [locDubaiBusines], [locDubaiSilicon], [Budget400K700K], [Budget700K1000K], [Budget1000K1250K], [Budget1250K1500K], [Studio], [OneBed], [TwoBed], [Retail], [Immed], [Months3to6], [Months6to12], [Months12to18], [TimeStamp], [SourceID]) VALUES (28, N'Atteya', N'052525252', N'aaaa', N'a@a.com', 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, CAST(N'2018-03-13 17:02:22.540' AS DateTime), 1)
INSERT [dbo].[home] ([Id], [firstName], [Mobile], [Remarks], [Email], [locDubaiBusines], [locDubaiSilicon], [Budget400K700K], [Budget700K1000K], [Budget1000K1250K], [Budget1250K1500K], [Studio], [OneBed], [TwoBed], [Retail], [Immed], [Months3to6], [Months6to12], [Months12to18], [TimeStamp], [SourceID]) VALUES (29, N'Atteya', N'052525252', N'aaaa', N'a@a.com', 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, CAST(N'2018-03-13 17:02:22.540' AS DateTime), 1)
INSERT [dbo].[home] ([Id], [firstName], [Mobile], [Remarks], [Email], [locDubaiBusines], [locDubaiSilicon], [Budget400K700K], [Budget700K1000K], [Budget1000K1250K], [Budget1250K1500K], [Studio], [OneBed], [TwoBed], [Retail], [Immed], [Months3to6], [Months6to12], [Months12to18], [TimeStamp], [SourceID]) VALUES (30, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT [dbo].[home] ([Id], [firstName], [Mobile], [Remarks], [Email], [locDubaiBusines], [locDubaiSilicon], [Budget400K700K], [Budget700K1000K], [Budget1000K1250K], [Budget1250K1500K], [Studio], [OneBed], [TwoBed], [Retail], [Immed], [Months3to6], [Months6to12], [Months12to18], [TimeStamp], [SourceID]) VALUES (31, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[home] OFF
SET IDENTITY_INSERT [dbo].[locations] ON 

INSERT [dbo].[locations] ([Id], [Name]) VALUES (1, N'DUBAI SILICON OASIS')
INSERT [dbo].[locations] ([Id], [Name]) VALUES (2, N'BUSINESS BAY DUBAI')
SET IDENTITY_INSERT [dbo].[locations] OFF
INSERT [dbo].[Sources] ([SourceID], [SourceName]) VALUES (1, N'CityScape Global 2018 - Abu Dhabi')
ALTER TABLE [dbo].[loginDB] ADD  DEFAULT ((1)) FOR [isActive]
GO
USE [master]
GO
ALTER DATABASE [BGEnqiry] SET  READ_WRITE 
GO
