USE [master]
GO
/****** Object:  Database [MyGarageAPP]    Script Date: 08.10.2020 13:29:46 ******/
CREATE DATABASE [MyGarageAPP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyGarageAPP', FILENAME = N'C:\Users\Виктор\Documents\My Repos\EPAM_XT_.NET-WEB_FINAL\EPAM_XT_Final\DATA\MyGarageAPP' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MyGarageAPP_log', FILENAME = N'C:\Users\Виктор\Documents\My Repos\EPAM_XT_.NET-WEB_FINAL\EPAM_XT_Final\DATA\MyGarageAPPlog' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MyGarageAPP] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyGarageAPP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyGarageAPP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyGarageAPP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyGarageAPP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyGarageAPP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyGarageAPP] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyGarageAPP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyGarageAPP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyGarageAPP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyGarageAPP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyGarageAPP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyGarageAPP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyGarageAPP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyGarageAPP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyGarageAPP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyGarageAPP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MyGarageAPP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyGarageAPP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyGarageAPP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyGarageAPP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyGarageAPP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyGarageAPP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyGarageAPP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyGarageAPP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MyGarageAPP] SET  MULTI_USER 
GO
ALTER DATABASE [MyGarageAPP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyGarageAPP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyGarageAPP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyGarageAPP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyGarageAPP] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MyGarageAPP] SET QUERY_STORE = OFF
GO
USE [MyGarageAPP]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [MyGarageAPP]
GO
/****** Object:  Table [dbo].[CarReferences]    Script Date: 08.10.2020 13:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarReferences](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[vendor] [nvarchar](50) NOT NULL,
	[model] [nvarchar](50) NOT NULL,
	[oilRefreshRate] [int] NOT NULL,
	[engineResource] [int] NOT NULL,
	[timingDriveResource] [int] NOT NULL,
	[suspensionResource] [int] NOT NULL,
	[gearboxResource] [int] NOT NULL,
	[steeringResource] [int] NOT NULL,
	[brakesResource] [int] NOT NULL,
 CONSTRAINT [PK_CarReferences] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 08.10.2020 13:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ownerId] [int] NOT NULL,
	[referenceId] [int] NOT NULL,
	[nextOilRefresh] [int] NOT NULL,
	[remainingEngineRes] [int] NOT NULL,
	[remainingTimingDriveRes] [int] NOT NULL,
	[remainingSuspensionRes] [int] NOT NULL,
	[remainingGearboxRes] [int] NOT NULL,
	[remainingSteeringRes] [int] NOT NULL,
	[remainingBrakesRes] [int] NOT NULL,
	[totalMileage] [int] NOT NULL,
 CONSTRAINT [PK_Cars] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 08.10.2020 13:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CarReferences] ON 

INSERT [dbo].[CarReferences] ([id], [vendor], [model], [oilRefreshRate], [engineResource], [timingDriveResource], [suspensionResource], [gearboxResource], [steeringResource], [brakesResource]) VALUES (1, N'VAZ', N'NIVA', 10000, 100000, 100000, 30000, 80000, 150000, 50000)
INSERT [dbo].[CarReferences] ([id], [vendor], [model], [oilRefreshRate], [engineResource], [timingDriveResource], [suspensionResource], [gearboxResource], [steeringResource], [brakesResource]) VALUES (2, N'VAZ', N'VESTA', 15000, 200000, 180000, 80000, 150000, 150000, 50000)
INSERT [dbo].[CarReferences] ([id], [vendor], [model], [oilRefreshRate], [engineResource], [timingDriveResource], [suspensionResource], [gearboxResource], [steeringResource], [brakesResource]) VALUES (1003, N'Skoda', N'Octavia', 15000, 250000, 120000, 100000, 200000, 250000, 80000)
INSERT [dbo].[CarReferences] ([id], [vendor], [model], [oilRefreshRate], [engineResource], [timingDriveResource], [suspensionResource], [gearboxResource], [steeringResource], [brakesResource]) VALUES (1004, N'Skoda', N'Rapid', 15000, 250000, 120000, 100000, 200000, 250000, 80000)
INSERT [dbo].[CarReferences] ([id], [vendor], [model], [oilRefreshRate], [engineResource], [timingDriveResource], [suspensionResource], [gearboxResource], [steeringResource], [brakesResource]) VALUES (1005, N'Volkswagen', N'Jetta', 15000, 250000, 120000, 100000, 200000, 250000, 80000)
INSERT [dbo].[CarReferences] ([id], [vendor], [model], [oilRefreshRate], [engineResource], [timingDriveResource], [suspensionResource], [gearboxResource], [steeringResource], [brakesResource]) VALUES (1006, N'Huyndai', N'Solaris', 15000, 150000, 100000, 75000, 150000, 150000, 75000)
INSERT [dbo].[CarReferences] ([id], [vendor], [model], [oilRefreshRate], [engineResource], [timingDriveResource], [suspensionResource], [gearboxResource], [steeringResource], [brakesResource]) VALUES (1007, N'Toyota', N'RAV4', 10000, 450000, 250000, 100000, 250000, 180000, 50000)
SET IDENTITY_INSERT [dbo].[CarReferences] OFF
SET IDENTITY_INSERT [dbo].[Cars] ON 

INSERT [dbo].[Cars] ([id], [ownerId], [referenceId], [nextOilRefresh], [remainingEngineRes], [remainingTimingDriveRes], [remainingSuspensionRes], [remainingGearboxRes], [remainingSteeringRes], [remainingBrakesRes], [totalMileage]) VALUES (5, 1, 1003, 0, 50000, 0, 0, 0, 50000, 0, 300000)
INSERT [dbo].[Cars] ([id], [ownerId], [referenceId], [nextOilRefresh], [remainingEngineRes], [remainingTimingDriveRes], [remainingSuspensionRes], [remainingGearboxRes], [remainingSteeringRes], [remainingBrakesRes], [totalMileage]) VALUES (6, 1, 1, 3000, 50000, 30000, 25000, 45000, 34000, 23000, 40000)
INSERT [dbo].[Cars] ([id], [ownerId], [referenceId], [nextOilRefresh], [remainingEngineRes], [remainingTimingDriveRes], [remainingSuspensionRes], [remainingGearboxRes], [remainingSteeringRes], [remainingBrakesRes], [totalMileage]) VALUES (1002, 1, 1005, 10000, 245000, 115000, 95000, 195000, 245000, 75000, 5000)
INSERT [dbo].[Cars] ([id], [ownerId], [referenceId], [nextOilRefresh], [remainingEngineRes], [remainingTimingDriveRes], [remainingSuspensionRes], [remainingGearboxRes], [remainingSteeringRes], [remainingBrakesRes], [totalMileage]) VALUES (1003, 1, 1006, 14700, 149700, 99700, 74700, 149700, 149700, 74700, 300)
INSERT [dbo].[Cars] ([id], [ownerId], [referenceId], [nextOilRefresh], [remainingEngineRes], [remainingTimingDriveRes], [remainingSuspensionRes], [remainingGearboxRes], [remainingSteeringRes], [remainingBrakesRes], [totalMileage]) VALUES (1005, 1, 1007, 9975, 449975, 249975, 99975, 249975, 179975, 49975, 25)
INSERT [dbo].[Cars] ([id], [ownerId], [referenceId], [nextOilRefresh], [remainingEngineRes], [remainingTimingDriveRes], [remainingSuspensionRes], [remainingGearboxRes], [remainingSteeringRes], [remainingBrakesRes], [totalMileage]) VALUES (1006, 1, 1, 9556, 99556, 99556, 29556, 79556, 149556, 49556, 444)
INSERT [dbo].[Cars] ([id], [ownerId], [referenceId], [nextOilRefresh], [remainingEngineRes], [remainingTimingDriveRes], [remainingSuspensionRes], [remainingGearboxRes], [remainingSteeringRes], [remainingBrakesRes], [totalMileage]) VALUES (1009, 1, 2, 14999, 199999, 179999, 79999, 149999, 149999, 49999, 1)
INSERT [dbo].[Cars] ([id], [ownerId], [referenceId], [nextOilRefresh], [remainingEngineRes], [remainingTimingDriveRes], [remainingSuspensionRes], [remainingGearboxRes], [remainingSteeringRes], [remainingBrakesRes], [totalMileage]) VALUES (1010, 1, 1005, 14552, 249552, 119552, 99552, 199552, 249552, 79552, 448)
INSERT [dbo].[Cars] ([id], [ownerId], [referenceId], [nextOilRefresh], [remainingEngineRes], [remainingTimingDriveRes], [remainingSuspensionRes], [remainingGearboxRes], [remainingSteeringRes], [remainingBrakesRes], [totalMileage]) VALUES (2002, 1, 1004, 14888, 249888, 119888, 99888, 199888, 249888, 79888, 112)
INSERT [dbo].[Cars] ([id], [ownerId], [referenceId], [nextOilRefresh], [remainingEngineRes], [remainingTimingDriveRes], [remainingSuspensionRes], [remainingGearboxRes], [remainingSteeringRes], [remainingBrakesRes], [totalMileage]) VALUES (3002, 1, 1, 0, 0, 0, 0, 0, 0, 0, 200000)
INSERT [dbo].[Cars] ([id], [ownerId], [referenceId], [nextOilRefresh], [remainingEngineRes], [remainingTimingDriveRes], [remainingSuspensionRes], [remainingGearboxRes], [remainingSteeringRes], [remainingBrakesRes], [totalMileage]) VALUES (3003, 1002, 1, 0, 85, 85, 0, 0, 50085, 0, 100000)
INSERT [dbo].[Cars] ([id], [ownerId], [referenceId], [nextOilRefresh], [remainingEngineRes], [remainingTimingDriveRes], [remainingSuspensionRes], [remainingGearboxRes], [remainingSteeringRes], [remainingBrakesRes], [totalMileage]) VALUES (3004, 1002, 1004, 0, 0, 0, 0, 0, 0, 0, 10000000)
SET IDENTITY_INSERT [dbo].[Cars] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [username], [password]) VALUES (1, N'ViCDroboviC', 1508494276)
INSERT [dbo].[Users] ([id], [username], [password]) VALUES (2, N'testname', 1508494276)
INSERT [dbo].[Users] ([id], [username], [password]) VALUES (3, N'testname2', 1508494276)
INSERT [dbo].[Users] ([id], [username], [password]) VALUES (4, N'testname 3', 1508494276)
INSERT [dbo].[Users] ([id], [username], [password]) VALUES (5, N'testname 4', 1508494276)
INSERT [dbo].[Users] ([id], [username], [password]) VALUES (1002, N'Хрбша', 1849190365)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_CarReferences] FOREIGN KEY([referenceId])
REFERENCES [dbo].[CarReferences] ([id])
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_CarReferences]
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_Users] FOREIGN KEY([ownerId])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_Users]
GO
/****** Object:  StoredProcedure [dbo].[CarReferences_GetById]    Script Date: 08.10.2020 13:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[CarReferences_GetById] 
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TOP 1
	vendor, model, oilRefreshRate, engineResource, timingDriveResource, suspensionResource, gearboxResource,
	steeringResource, brakesResource
	FROM CarReferences
	WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[Cars_Add]    Script Date: 08.10.2020 13:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Cars_Add] 
	@ownerId int,
	@refId int,
	@nextOilRefresh int,
	@remainingEngineRes int,
	@remainingTimingDriveRes int,
	@remainingSuspensionRes int,
	@remainingGearboxRes int,
	@remainingSteeringRes int,
	@remainingBrakesRes int,
	@totalMileage int
AS
BEGIN

	SET NOCOUNT ON;

	INSERT INTO Cars(ownerId, referenceId, nextOilRefresh, remainingEngineRes, remainingTimingDriveRes,
	remainingSuspensionRes, remainingGearboxRes, remainingSteeringRes, remainingBrakesRes, totalMileage)
	VALUES(@ownerId, @refId, @nextOilRefresh, @remainingEngineRes, @remainingTimingDriveRes, @remainingSuspensionRes,
	@remainingGearboxRes, @remainingSteeringRes, @remainingBrakesRes, @totalMileage)
END
GO
/****** Object:  StoredProcedure [dbo].[Cars_DeleteById]    Script Date: 08.10.2020 13:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Cars_DeleteById]
	@id int
AS
BEGIN

	SET NOCOUNT ON;
	DELETE FROM Cars
	WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[Cars_GetByUserId]    Script Date: 08.10.2020 13:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Cars_GetByUserId]
	@userId int
AS
BEGIN

	SET NOCOUNT ON;

	SELECT 
	id, referenceId, nextOilRefresh, remainingEngineRes, remainingTimingDriveRes, remainingSuspensionRes,
	remainingGearboxRes, remainingSteeringRes, remainingBrakesRes, totalMileage
	FROM Cars
	WHERE ownerId = @userId
END
GO
/****** Object:  StoredProcedure [dbo].[Cars_Refresh]    Script Date: 08.10.2020 13:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Cars_Refresh]
	@id int,
	@nextOilRefresh int,
	@remainingEngineRes int,
	@remainingTimingDriveRes int,
	@remainingSuspensionRes int,
	@remainingGearboxRes int,
	@remainingSteeringRes int,
	@remainingBrakesRes int,
	@totalMileage int
AS
BEGIN

	SET NOCOUNT ON;

	UPDATE Cars
	SET nextOilRefresh = @nextOilRefresh,
		remainingEngineRes = @remainingEngineRes,
		remainingTimingDriveRes = @remainingTimingDriveRes,
		remainingSuspensionRes = @remainingSuspensionRes,
		remainingGearboxRes = @remainingGearboxRes,
		remainingSteeringRes = @remainingSteeringRes,
		remainingBrakesRes = @remainingBrakesRes,
		totalMileage =@totalMileage
	WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[GetAll]    Script Date: 08.10.2020 13:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAll]

AS
BEGIN

	SET NOCOUNT ON;

	SELECT 
	id, vendor, model, oilRefreshRate, engineResource, timingDriveResource, suspensionResource,
	gearboxResource, steeringResource, brakesResource
	FROM CarReferences
END
GO
/****** Object:  StoredProcedure [dbo].[Users_Add]    Script Date: 08.10.2020 13:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Users_Add]
	@username nvarchar(50),
	@password int
AS
BEGIN

	SET NOCOUNT ON;

	INSERT INTO Users(username, password)
	VALUES(@username, @password)
END
GO
/****** Object:  StoredProcedure [dbo].[Users_GetAllNicknames]    Script Date: 08.10.2020 13:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Users_GetAllNicknames] 

AS
BEGIN

	SELECT username
	FROM Users
END
GO
/****** Object:  StoredProcedure [dbo].[Users_GetByUserName]    Script Date: 08.10.2020 13:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Users_GetByUserName]
	@userName nvarChar(50)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT TOP 1
	id, username, password
	FROM Users
	WHERE username = @userName
END
GO
USE [master]
GO
ALTER DATABASE [MyGarageAPP] SET  READ_WRITE 
GO
