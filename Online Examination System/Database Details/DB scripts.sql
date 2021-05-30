---Create Users

CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](30) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Fname] [nvarchar](50) NOT NULL,
	[Lname] [nvarchar](50) NOT NULL,
	[Role] [nvarchar](20) NOT NULL,
	[Mobile] [bigint] NOT NULL,
	[Status] [nvarchar](30) NOT NULL,
	[Gender] [nvarchar](10) NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[Percentage] [int] NULL,
	[Qualification] [nvarchar](30) NULL,
	[Branch] [nvarchar](30) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NULL,
	[Marks] [int] NULL,
	[Examname] [nvarchar](50) NULL,
	[Yearofpass] [int] NULL,
	[Fathername] [nvarchar](50) NULL,
	[Mailstatus] [nvarchar](20) NULL,
	[Experience] [int] NULL,
	[Result] [nvarchar](20) NULL,
	[Totalquestions] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IN_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [fk_UserExam] FOREIGN KEY([Examname])
REFERENCES [dbo].[Exampattern] ([Examname])
GO

ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [fk_UserExam]
GO

--Employee

CREATE TABLE [dbo].[Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[EmailID] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
--- Exampattern

CREATE TABLE [dbo].[Exampattern](
	[Examid] [int] IDENTITY(1,1) NOT NULL,
	[Examname] [nvarchar](50) NOT NULL,
	[Time] [int] NULL,
	[PassMarks] [int] NULL,
	[NumberofQuestions] [int] NULL,
 CONSTRAINT [pk_ExmName] PRIMARY KEY CLUSTERED 
(
	[Examname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



-- Questions


CREATE TABLE [dbo].[Questions](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[Examname] [nvarchar](50) NOT NULL,
	[Question] [varchar](5000) NOT NULL,
	[Option1] [nvarchar](max) NOT NULL,
	[Option2] [nvarchar](max) NOT NULL,
	[Option3] [nvarchar](max) NOT NULL,
	[Option4] [nvarchar](max) NOT NULL,
	[Answer] [nvarchar](max) NOT NULL,
	[Status] [varchar](20) NULL DEFAULT ('Active'),
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Questions] UNIQUE NONCLUSTERED 
(
	[Question] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Examname] FOREIGN KEY([Examname])
REFERENCES [dbo].[Exampattern] ([Examname])
GO

ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_Examname]
GO

-- User Questions

CREATE TABLE [dbo].[UserQuestions](
	[Userid] [int] NOT NULL,
	[Questionid] [int] NOT NULL,
	[Useranswer] [nvarchar](max) NULL,
	[Actualanswer] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[UserQuestions]  WITH CHECK ADD  CONSTRAINT [FK_questid] FOREIGN KEY([Questionid])
REFERENCES [dbo].[Questions] ([QuestionId])
GO

ALTER TABLE [dbo].[UserQuestions] CHECK CONSTRAINT [FK_questid]
GO

ALTER TABLE [dbo].[UserQuestions]  WITH CHECK ADD  CONSTRAINT [FK_Usersid] FOREIGN KEY([Userid])
REFERENCES [dbo].[Users] ([UserId])
GO

ALTER TABLE [dbo].[UserQuestions] CHECK CONSTRAINT [FK_Usersid]
GO


