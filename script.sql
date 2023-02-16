USE [TaskManagement]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 2/16/2023 8:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[TaskID] [int] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[CreatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Emotion]    Script Date: 2/16/2023 8:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emotion](
	[ID] [nchar](10) NOT NULL,
	[CommentID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Like] [bit] NOT NULL,
 CONSTRAINT [PK_Emotion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2/16/2023 8:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Describe] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Section]    Script Date: 2/16/2023 8:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Section](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WorkSpaceID] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Describe] [nvarchar](max) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Section] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task]    Script Date: 2/16/2023 8:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SectionID] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Describe] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[TaskTo] [datetime] NULL,
	[TaskFrom] [datetime] NULL,
	[PinTask] [bit] NOT NULL,
	[Tag] [nvarchar](20) NULL,
	[Attachment] [nvarchar](max) NULL,
 CONSTRAINT [PK_Task] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2/16/2023 8:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](16) NOT NULL,
	[Password] [nvarchar](16) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[DateOfBirth] [datetime] NULL,
	[Phone] [nvarchar](10) NULL,
	[Email] [nvarchar](50) NULL,
	[Work] [nvarchar](50) NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_User_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserSectionRole]    Script Date: 2/16/2023 8:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSectionRole](
	[UserID] [int] NOT NULL,
	[SectionID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_UserSectionRole] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[SectionID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTaskRole]    Script Date: 2/16/2023 8:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTaskRole](
	[UserID] [int] NOT NULL,
	[TaskID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_UserTaskRole] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[TaskID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserWorkSpaceRole]    Script Date: 2/16/2023 8:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserWorkSpaceRole](
	[UserID] [int] NOT NULL,
	[WorkSpaceID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_UserWorkSpaceRole] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[WorkSpaceID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkSpace]    Script Date: 2/16/2023 8:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkSpace](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Describe] [nvarchar](50) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_WorkSpace] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [DateOfBirth], [Phone], [Email], [Work], [Image]) VALUES (1, N'NuocFTraiK', N'123456', N'Vuong', NULL, NULL, NULL, NULL, N'/images/285627750_1431295704007669_6915610949146302308_n.jpg')
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [DateOfBirth], [Phone], [Email], [Work], [Image]) VALUES (3, N'vcl', N'123456', N'rtyuio', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'string', N'string', N'string', N'/images/154509565_854781471735350_3510557787089984372_o.jpg')
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [DateOfBirth], [Phone], [Email], [Work], [Image]) VALUES (4, N'ehehe', N'123456', N'string', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'string', N'string', N'string', N'')
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [DateOfBirth], [Phone], [Email], [Work], [Image]) VALUES (5, N'vcl', N'123456', N'string', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'string', N'string', N'string', N'')
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [DateOfBirth], [Phone], [Email], [Work], [Image]) VALUES (6, N'vcl', N'123456', N'string', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'string', N'string', N'string', N'')
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [DateOfBirth], [Phone], [Email], [Work], [Image]) VALUES (7, N'ehehe', N'123456', NULL, NULL, NULL, NULL, NULL, N'/images/285627750_1431295704007669_6915610949146302308_n.jpg')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Task] FOREIGN KEY([TaskID])
REFERENCES [dbo].[Task] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Task]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User]
GO
ALTER TABLE [dbo].[Emotion]  WITH CHECK ADD  CONSTRAINT [FK_Emotion_Comment] FOREIGN KEY([CommentID])
REFERENCES [dbo].[Comment] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Emotion] CHECK CONSTRAINT [FK_Emotion_Comment]
GO
ALTER TABLE [dbo].[Section]  WITH CHECK ADD  CONSTRAINT [FK_Section_WorkSpace1] FOREIGN KEY([WorkSpaceID])
REFERENCES [dbo].[WorkSpace] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Section] CHECK CONSTRAINT [FK_Section_WorkSpace1]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_Section1] FOREIGN KEY([SectionID])
REFERENCES [dbo].[Section] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_Section1]
GO
ALTER TABLE [dbo].[UserSectionRole]  WITH CHECK ADD  CONSTRAINT [FK_UserSectionRole_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[UserSectionRole] CHECK CONSTRAINT [FK_UserSectionRole_Role]
GO
ALTER TABLE [dbo].[UserSectionRole]  WITH CHECK ADD  CONSTRAINT [FK_UserSectionRole_Section1] FOREIGN KEY([SectionID])
REFERENCES [dbo].[Section] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserSectionRole] CHECK CONSTRAINT [FK_UserSectionRole_Section1]
GO
ALTER TABLE [dbo].[UserSectionRole]  WITH CHECK ADD  CONSTRAINT [FK_UserSectionRole_User1] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[UserSectionRole] CHECK CONSTRAINT [FK_UserSectionRole_User1]
GO
ALTER TABLE [dbo].[UserTaskRole]  WITH CHECK ADD  CONSTRAINT [FK_UserTaskRole_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[UserTaskRole] CHECK CONSTRAINT [FK_UserTaskRole_Role]
GO
ALTER TABLE [dbo].[UserTaskRole]  WITH CHECK ADD  CONSTRAINT [FK_UserTaskRole_Task1] FOREIGN KEY([TaskID])
REFERENCES [dbo].[Task] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserTaskRole] CHECK CONSTRAINT [FK_UserTaskRole_Task1]
GO
ALTER TABLE [dbo].[UserTaskRole]  WITH CHECK ADD  CONSTRAINT [FK_UserTaskRole_User1] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[UserTaskRole] CHECK CONSTRAINT [FK_UserTaskRole_User1]
GO
ALTER TABLE [dbo].[UserWorkSpaceRole]  WITH CHECK ADD  CONSTRAINT [FK_UserWorkSpaceRole_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[UserWorkSpaceRole] CHECK CONSTRAINT [FK_UserWorkSpaceRole_Role]
GO
ALTER TABLE [dbo].[UserWorkSpaceRole]  WITH CHECK ADD  CONSTRAINT [FK_UserWorkSpaceRole_User1] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[UserWorkSpaceRole] CHECK CONSTRAINT [FK_UserWorkSpaceRole_User1]
GO
ALTER TABLE [dbo].[UserWorkSpaceRole]  WITH CHECK ADD  CONSTRAINT [FK_UserWorkSpaceRole_WorkSpace1] FOREIGN KEY([WorkSpaceID])
REFERENCES [dbo].[WorkSpace] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserWorkSpaceRole] CHECK CONSTRAINT [FK_UserWorkSpaceRole_WorkSpace1]
GO
