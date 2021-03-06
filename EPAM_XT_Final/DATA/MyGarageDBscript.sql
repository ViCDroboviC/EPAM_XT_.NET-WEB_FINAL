USE [master]
GO
/****** Object:  Database [MyGarageAPP]    Script Date: 01.11.2020 20:44:02 ******/
CREATE DATABASE [MyGarageAPP]
 CONTAINMENT = NONE

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
/****** Object:  Table [dbo].[Manufacturers]    Script Date: 01.11.2020 20:44:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[manufacturer] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.Manufacturers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarReferences]    Script Date: 01.11.2020 20:44:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarReferences](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[manufacturer] [int] NOT NULL,
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
/****** Object:  View [dbo].[CarRefsView]    Script Date: 01.11.2020 20:44:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CarRefsView]
AS
SELECT        dbo.CarReferences.id, dbo.Manufacturers.manufacturer, dbo.CarReferences.model, dbo.CarReferences.oilRefreshRate, dbo.CarReferences.engineResource, dbo.CarReferences.timingDriveResource, 
                         dbo.CarReferences.suspensionResource, dbo.CarReferences.gearboxResource, dbo.CarReferences.steeringResource, dbo.CarReferences.brakesResource
FROM            dbo.CarReferences INNER JOIN
                         dbo.Manufacturers ON dbo.CarReferences.manufacturer = dbo.Manufacturers.id
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 01.11.2020 20:44:02 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 01.11.2020 20:44:02 ******/
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
GO
INSERT [dbo].[CarReferences] ([id], [manufacturer], [model], [oilRefreshRate], [engineResource], [timingDriveResource], [suspensionResource], [gearboxResource], [steeringResource], [brakesResource]) VALUES (1, 1, N'NIVA', 10000, 100000, 100000, 30000, 80000, 150000, 50000)
GO
INSERT [dbo].[CarReferences] ([id], [manufacturer], [model], [oilRefreshRate], [engineResource], [timingDriveResource], [suspensionResource], [gearboxResource], [steeringResource], [brakesResource]) VALUES (2, 1, N'VESTA', 15000, 200000, 180000, 80000, 150000, 150000, 50000)
GO
INSERT [dbo].[CarReferences] ([id], [manufacturer], [model], [oilRefreshRate], [engineResource], [timingDriveResource], [suspensionResource], [gearboxResource], [steeringResource], [brakesResource]) VALUES (1003, 2, N'Octavia', 15000, 250000, 120000, 100000, 200000, 250000, 80000)
GO
INSERT [dbo].[CarReferences] ([id], [manufacturer], [model], [oilRefreshRate], [engineResource], [timingDriveResource], [suspensionResource], [gearboxResource], [steeringResource], [brakesResource]) VALUES (1004, 2, N'Rapid', 15000, 250000, 120000, 100000, 200000, 250000, 80000)
GO
INSERT [dbo].[CarReferences] ([id], [manufacturer], [model], [oilRefreshRate], [engineResource], [timingDriveResource], [suspensionResource], [gearboxResource], [steeringResource], [brakesResource]) VALUES (1005, 3, N'Jetta', 15000, 250000, 120000, 100000, 200000, 250000, 80000)
GO
INSERT [dbo].[CarReferences] ([id], [manufacturer], [model], [oilRefreshRate], [engineResource], [timingDriveResource], [suspensionResource], [gearboxResource], [steeringResource], [brakesResource]) VALUES (1006, 4, N'Solaris', 15000, 150000, 100000, 75000, 150000, 150000, 75000)
GO
INSERT [dbo].[CarReferences] ([id], [manufacturer], [model], [oilRefreshRate], [engineResource], [timingDriveResource], [suspensionResource], [gearboxResource], [steeringResource], [brakesResource]) VALUES (1007, 5, N'RAV4', 10000, 450000, 250000, 100000, 250000, 180000, 50000)
GO
SET IDENTITY_INSERT [dbo].[CarReferences] OFF
GO
SET IDENTITY_INSERT [dbo].[Cars] ON 
GO
INSERT [dbo].[Cars] ([id], [ownerId], [referenceId], [nextOilRefresh], [remainingEngineRes], [remainingTimingDriveRes], [remainingSuspensionRes], [remainingGearboxRes], [remainingSteeringRes], [remainingBrakesRes], [totalMileage]) VALUES (5, 1, 1003, 0, 0, 0, 0, 0, 0, 0, 500000)
GO
INSERT [dbo].[Cars] ([id], [ownerId], [referenceId], [nextOilRefresh], [remainingEngineRes], [remainingTimingDriveRes], [remainingSuspensionRes], [remainingGearboxRes], [remainingSteeringRes], [remainingBrakesRes], [totalMileage]) VALUES (1002, 1, 1005, 10000, 245000, 115000, 95000, 195000, 245000, 75000, 5000)
GO
INSERT [dbo].[Cars] ([id], [ownerId], [referenceId], [nextOilRefresh], [remainingEngineRes], [remainingTimingDriveRes], [remainingSuspensionRes], [remainingGearboxRes], [remainingSteeringRes], [remainingBrakesRes], [totalMileage]) VALUES (1003, 1, 1006, 14700, 149700, 99700, 74700, 149700, 149700, 74700, 300)
GO
INSERT [dbo].[Cars] ([id], [ownerId], [referenceId], [nextOilRefresh], [remainingEngineRes], [remainingTimingDriveRes], [remainingSuspensionRes], [remainingGearboxRes], [remainingSteeringRes], [remainingBrakesRes], [totalMileage]) VALUES (1005, 1, 1007, 9975, 449975, 249975, 99975, 249975, 179975, 49975, 25)
GO
INSERT [dbo].[Cars] ([id], [ownerId], [referenceId], [nextOilRefresh], [remainingEngineRes], [remainingTimingDriveRes], [remainingSuspensionRes], [remainingGearboxRes], [remainingSteeringRes], [remainingBrakesRes], [totalMileage]) VALUES (1006, 1, 1, 9556, 99556, 99556, 29556, 79556, 149556, 49556, 444)
GO
INSERT [dbo].[Cars] ([id], [ownerId], [referenceId], [nextOilRefresh], [remainingEngineRes], [remainingTimingDriveRes], [remainingSuspensionRes], [remainingGearboxRes], [remainingSteeringRes], [remainingBrakesRes], [totalMileage]) VALUES (1009, 1, 2, 14999, 199999, 179999, 79999, 149999, 149999, 49999, 1)
GO
INSERT [dbo].[Cars] ([id], [ownerId], [referenceId], [nextOilRefresh], [remainingEngineRes], [remainingTimingDriveRes], [remainingSuspensionRes], [remainingGearboxRes], [remainingSteeringRes], [remainingBrakesRes], [totalMileage]) VALUES (1010, 1, 1005, 14552, 249552, 119552, 99552, 199552, 249552, 79552, 448)
GO
INSERT [dbo].[Cars] ([id], [ownerId], [referenceId], [nextOilRefresh], [remainingEngineRes], [remainingTimingDriveRes], [remainingSuspensionRes], [remainingGearboxRes], [remainingSteeringRes], [remainingBrakesRes], [totalMileage]) VALUES (2002, 1, 1004, 14888, 249888, 119888, 99888, 199888, 249888, 79888, 112)
GO
INSERT [dbo].[Cars] ([id], [ownerId], [referenceId], [nextOilRefresh], [remainingEngineRes], [remainingTimingDriveRes], [remainingSuspensionRes], [remainingGearboxRes], [remainingSteeringRes], [remainingBrakesRes], [totalMileage]) VALUES (3003, 1002, 1, 0, 85, 85, 0, 0, 50085, 0, 100000)
GO
INSERT [dbo].[Cars] ([id], [ownerId], [referenceId], [nextOilRefresh], [remainingEngineRes], [remainingTimingDriveRes], [remainingSuspensionRes], [remainingGearboxRes], [remainingSteeringRes], [remainingBrakesRes], [totalMileage]) VALUES (3004, 1002, 1004, 0, 0, 0, 0, 0, 0, 0, 10000000)
GO
INSERT [dbo].[Cars] ([id], [ownerId], [referenceId], [nextOilRefresh], [remainingEngineRes], [remainingTimingDriveRes], [remainingSuspensionRes], [remainingGearboxRes], [remainingSteeringRes], [remainingBrakesRes], [totalMileage]) VALUES (5002, 2002, 1003, 0, 115000, 0, 0, 65000, 0, 0, 250000)
GO
INSERT [dbo].[Cars] ([id], [ownerId], [referenceId], [nextOilRefresh], [remainingEngineRes], [remainingTimingDriveRes], [remainingSuspensionRes], [remainingGearboxRes], [remainingSteeringRes], [remainingBrakesRes], [totalMileage]) VALUES (6002, 1, 1, 0, 70000, 70000, 0, 50000, 120000, 20000, 30000)
GO
SET IDENTITY_INSERT [dbo].[Cars] OFF
GO
SET IDENTITY_INSERT [dbo].[Manufacturers] ON 
GO
INSERT [dbo].[Manufacturers] ([id], [manufacturer]) VALUES (1, N'VAZ')
GO
INSERT [dbo].[Manufacturers] ([id], [manufacturer]) VALUES (2, N'Skoda')
GO
INSERT [dbo].[Manufacturers] ([id], [manufacturer]) VALUES (3, N'Volkswagen')
GO
INSERT [dbo].[Manufacturers] ([id], [manufacturer]) VALUES (4, N'Hundai')
GO
INSERT [dbo].[Manufacturers] ([id], [manufacturer]) VALUES (5, N'Toyota')
GO
SET IDENTITY_INSERT [dbo].[Manufacturers] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([id], [username], [password]) VALUES (1, N'ViCDroboviC', 1508494276)
GO
INSERT [dbo].[Users] ([id], [username], [password]) VALUES (2, N'testname', 1508494276)
GO
INSERT [dbo].[Users] ([id], [username], [password]) VALUES (3, N'testname2', 1508494276)
GO
INSERT [dbo].[Users] ([id], [username], [password]) VALUES (4, N'testname 3', 1508494276)
GO
INSERT [dbo].[Users] ([id], [username], [password]) VALUES (5, N'testname 4', 1508494276)
GO
INSERT [dbo].[Users] ([id], [username], [password]) VALUES (1002, N'Хрбша', 1849190365)
GO
INSERT [dbo].[Users] ([id], [username], [password]) VALUES (2002, N'myav', -1185026328)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[CarReferences]  WITH CHECK ADD  CONSTRAINT [FK_CarReferences_Manufacturers] FOREIGN KEY([manufacturer])
REFERENCES [dbo].[Manufacturers] ([id])
GO
ALTER TABLE [dbo].[CarReferences] CHECK CONSTRAINT [FK_CarReferences_Manufacturers]
GO
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
/****** Object:  StoredProcedure [dbo].[CarReferences_GetAll]    Script Date: 01.11.2020 20:44:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 

CREATE PROCEDURE [dbo].[CarReferences_GetAll]
AS
BEGIN

	SET NOCOUNT ON;
	SELECT
	id, manufacturer, model, oilRefreshRate, engineResource, timingDriveResource, suspensionResource, gearboxResource,
	steeringResource, brakesResource
	FROM CarRefsView
END
GO
/****** Object:  StoredProcedure [dbo].[CarReferences_GetById]    Script Date: 01.11.2020 20:44:02 ******/
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
	manufacturer, model, oilRefreshRate, engineResource, timingDriveResource, suspensionResource, gearboxResource,
	steeringResource, brakesResource
	FROM CarReferences
	WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[Cars_Add]    Script Date: 01.11.2020 20:44:02 ******/
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
/****** Object:  StoredProcedure [dbo].[Cars_DeleteById]    Script Date: 01.11.2020 20:44:02 ******/
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
/****** Object:  StoredProcedure [dbo].[Cars_GetByUserId]    Script Date: 01.11.2020 20:44:02 ******/
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
/****** Object:  StoredProcedure [dbo].[Cars_Refresh]    Script Date: 01.11.2020 20:44:02 ******/
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
/****** Object:  StoredProcedure [dbo].[manufacturers_GetById]    Script Date: 01.11.2020 20:44:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[manufacturers_GetById]
	@id int
AS
BEGIN

	SET NOCOUNT ON;
	SELECT manufacturer
	FROM Manufacturers
	WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[Users_Add]    Script Date: 01.11.2020 20:44:02 ******/
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
/****** Object:  StoredProcedure [dbo].[Users_GetAllNicknames]    Script Date: 01.11.2020 20:44:02 ******/
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
/****** Object:  StoredProcedure [dbo].[Users_GetByUserName]    Script Date: 01.11.2020 20:44:02 ******/
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
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CarReferences"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 263
               Right = 304
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Manufacturers"
            Begin Extent = 
               Top = 4
               Left = 453
               Bottom = 221
               Right = 688
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1905
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CarRefsView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CarRefsView'
GO
USE [master]
GO
ALTER DATABASE [MyGarageAPP] SET  READ_WRITE 
GO
