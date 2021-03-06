USE [SignelRDB]
GO
/****** Object:  StoredProcedure [dbo].[SqlQueryNotificationStoredProcedure-b5974bad-fc6e-4242-822d-43539d73b8a3]    Script Date: 9/9/2014 1:44:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SqlQueryNotificationStoredProcedure-b5974bad-fc6e-4242-822d-43539d73b8a3] AS BEGIN BEGIN TRANSACTION; RECEIVE TOP(0) conversation_handle FROM [SqlQueryNotificationService-b5974bad-fc6e-4242-822d-43539d73b8a3]; IF (SELECT COUNT(*) FROM [SqlQueryNotificationService-b5974bad-fc6e-4242-822d-43539d73b8a3] WHERE message_type_name = 'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer') > 0 BEGIN if ((SELECT COUNT(*) FROM sys.services WHERE name = 'SqlQueryNotificationService-b5974bad-fc6e-4242-822d-43539d73b8a3') > 0)   DROP SERVICE [SqlQueryNotificationService-b5974bad-fc6e-4242-822d-43539d73b8a3]; if (OBJECT_ID('SqlQueryNotificationService-b5974bad-fc6e-4242-822d-43539d73b8a3', 'SQ') IS NOT NULL)   DROP QUEUE [SqlQueryNotificationService-b5974bad-fc6e-4242-822d-43539d73b8a3]; DROP PROCEDURE [SqlQueryNotificationStoredProcedure-b5974bad-fc6e-4242-822d-43539d73b8a3]; END COMMIT TRANSACTION; END
GO
/****** Object:  Table [dbo].[JobInfo]    Script Date: 9/9/2014 1:44:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JobInfo](
	[JobID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[LastExecutionDate] [datetime] NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_JobInfo] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 9/9/2014 1:44:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[MessageID] [uniqueidentifier] NOT NULL,
	[MessageText] [nvarchar](max) NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[IsSent] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[JobInfo] ([JobID], [Name], [LastExecutionDate], [Status]) VALUES (1, N'Soft', CAST(0x0000A43300000000 AS DateTime), N'yes')
INSERT [dbo].[JobInfo] ([JobID], [Name], [LastExecutionDate], [Status]) VALUES (2, N'ware', CAST(0x0000A45200000000 AS DateTime), N'yes')
INSERT [dbo].[JobInfo] ([JobID], [Name], [LastExecutionDate], [Status]) VALUES (3, N'asdf', CAST(0x0000A43400000000 AS DateTime), N'no')
INSERT [dbo].[JobInfo] ([JobID], [Name], [LastExecutionDate], [Status]) VALUES (4, N'asdfghjkl', CAST(0x0000A48F00000000 AS DateTime), N'yes')
INSERT [dbo].[JobInfo] ([JobID], [Name], [LastExecutionDate], [Status]) VALUES (5, N'New Job', CAST(0x0000A04800000000 AS DateTime), N'maybe')
