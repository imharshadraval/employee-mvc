USE [master]
GO
/****** Object:  Database [Employee]    Script Date: 15-03-2021 11:17:33 PM ******/
CREATE DATABASE [Employee] ON  PRIMARY 
( NAME = N'Employee', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLSERVER\MSSQL\DATA\Employee.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Employee_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLSERVER\MSSQL\DATA\Employee_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Employee].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Employee] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Employee] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Employee] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Employee] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Employee] SET ARITHABORT OFF 
GO
ALTER DATABASE [Employee] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Employee] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Employee] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Employee] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Employee] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Employee] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Employee] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Employee] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Employee] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Employee] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Employee] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Employee] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Employee] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Employee] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Employee] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Employee] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Employee] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Employee] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Employee] SET  MULTI_USER 
GO
ALTER DATABASE [Employee] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Employee] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Employee', N'ON'
GO
USE [Employee]
GO
/****** Object:  Table [dbo].[Department_tbl]    Script Date: 15-03-2021 11:17:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department_tbl](
	[Dept_Id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Dept_Name] [nvarchar](100) NOT NULL,
	[Dept_Status] [int] NOT NULL,
 CONSTRAINT [PK_Department_tbl] PRIMARY KEY CLUSTERED 
(
	[Dept_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentType_tbl]    Script Date: 15-03-2021 11:17:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentType_tbl](
	[DocType_Id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[DocType_Name] [nvarchar](100) NOT NULL,
	[DocType_Status] [int] NOT NULL,
 CONSTRAINT [PK_DocumentType_tbl] PRIMARY KEY CLUSTERED 
(
	[DocType_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee_tbl]    Script Date: 15-03-2021 11:17:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_tbl](
	[Emp_Id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Emp_Name] [nvarchar](100) NOT NULL,
	[Emp_DOB] [datetime] NOT NULL,
	[Emp_Department] [numeric](18, 0) NOT NULL,
	[Emp_Status] [int] NOT NULL,
 CONSTRAINT [PK_Employee_tbl] PRIMARY KEY CLUSTERED 
(
	[Emp_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeDocument_tbl]    Script Date: 15-03-2021 11:17:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeDocument_tbl](
	[EmpDoc_Id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[EmpDoc_Employee] [numeric](18, 0) NOT NULL,
	[EmpDoc_Type] [numeric](18, 0) NOT NULL,
	[EmpDoc_File] [nvarchar](500) NOT NULL,
	[EmpDoc_Status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmpDoc_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeSalary_tbl]    Script Date: 15-03-2021 11:17:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeSalary_tbl](
	[EmpSal_Id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[EmpSal_Employee] [numeric](18, 0) NOT NULL,
	[EmpSal_Salary] [numeric](18, 2) NOT NULL,
	[EmpSal_StartDate] [datetime] NOT NULL,
	[EmpSal_EndDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmpSal_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Department_tbl] ON 

INSERT [dbo].[Department_tbl] ([Dept_Id], [Dept_Name], [Dept_Status]) VALUES (CAST(1 AS Numeric(18, 0)), N'IT', 1)
INSERT [dbo].[Department_tbl] ([Dept_Id], [Dept_Name], [Dept_Status]) VALUES (CAST(2 AS Numeric(18, 0)), N'Marketing', 1)
INSERT [dbo].[Department_tbl] ([Dept_Id], [Dept_Name], [Dept_Status]) VALUES (CAST(3 AS Numeric(18, 0)), N'Accounting', 1)
INSERT [dbo].[Department_tbl] ([Dept_Id], [Dept_Name], [Dept_Status]) VALUES (CAST(4 AS Numeric(18, 0)), N'Support', 1)
INSERT [dbo].[Department_tbl] ([Dept_Id], [Dept_Name], [Dept_Status]) VALUES (CAST(5 AS Numeric(18, 0)), N'Production', 1)
INSERT [dbo].[Department_tbl] ([Dept_Id], [Dept_Name], [Dept_Status]) VALUES (CAST(6 AS Numeric(18, 0)), N'R&D', 1)
INSERT [dbo].[Department_tbl] ([Dept_Id], [Dept_Name], [Dept_Status]) VALUES (CAST(7 AS Numeric(18, 0)), N'HR', 1)
SET IDENTITY_INSERT [dbo].[Department_tbl] OFF
GO
SET IDENTITY_INSERT [dbo].[DocumentType_tbl] ON 

INSERT [dbo].[DocumentType_tbl] ([DocType_Id], [DocType_Name], [DocType_Status]) VALUES (CAST(1 AS Numeric(18, 0)), N'Photograph', 1)
INSERT [dbo].[DocumentType_tbl] ([DocType_Id], [DocType_Name], [DocType_Status]) VALUES (CAST(2 AS Numeric(18, 0)), N'Signature', 1)
INSERT [dbo].[DocumentType_tbl] ([DocType_Id], [DocType_Name], [DocType_Status]) VALUES (CAST(3 AS Numeric(18, 0)), N'PAN Card', 1)
INSERT [dbo].[DocumentType_tbl] ([DocType_Id], [DocType_Name], [DocType_Status]) VALUES (CAST(4 AS Numeric(18, 0)), N'Aadhar Card', 1)
INSERT [dbo].[DocumentType_tbl] ([DocType_Id], [DocType_Name], [DocType_Status]) VALUES (CAST(5 AS Numeric(18, 0)), N'Voter Id', 1)
INSERT [dbo].[DocumentType_tbl] ([DocType_Id], [DocType_Name], [DocType_Status]) VALUES (CAST(6 AS Numeric(18, 0)), N'Driving Licence', 1)
INSERT [dbo].[DocumentType_tbl] ([DocType_Id], [DocType_Name], [DocType_Status]) VALUES (CAST(7 AS Numeric(18, 0)), N'Passport', 1)
SET IDENTITY_INSERT [dbo].[DocumentType_tbl] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee_tbl] ON 

INSERT [dbo].[Employee_tbl] ([Emp_Id], [Emp_Name], [Emp_DOB], [Emp_Department], [Emp_Status]) VALUES (CAST(1 AS Numeric(18, 0)), N'Harshad Raval', CAST(N'1992-07-30T00:00:00.000' AS DateTime), CAST(1 AS Numeric(18, 0)), 1)
INSERT [dbo].[Employee_tbl] ([Emp_Id], [Emp_Name], [Emp_DOB], [Emp_Department], [Emp_Status]) VALUES (CAST(2 AS Numeric(18, 0)), N'Mahesh Raval', CAST(N'1986-05-18T00:00:00.000' AS DateTime), CAST(3 AS Numeric(18, 0)), 1)
SET IDENTITY_INSERT [dbo].[Employee_tbl] OFF
GO
SET IDENTITY_INSERT [dbo].[EmployeeDocument_tbl] ON 

INSERT [dbo].[EmployeeDocument_tbl] ([EmpDoc_Id], [EmpDoc_Employee], [EmpDoc_Type], [EmpDoc_File], [EmpDoc_Status]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'~/Uploads/Documents/14032021050449PM_Photo.png', 1)
INSERT [dbo].[EmployeeDocument_tbl] ([EmpDoc_Id], [EmpDoc_Employee], [EmpDoc_Type], [EmpDoc_File], [EmpDoc_Status]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'~/Uploads/Documents/14032021050554PM_Sign.png', 1)
INSERT [dbo].[EmployeeDocument_tbl] ([EmpDoc_Id], [EmpDoc_Employee], [EmpDoc_Type], [EmpDoc_File], [EmpDoc_Status]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), N'~/Uploads/Documents/14032021050616PM_Doc.png', 1)
INSERT [dbo].[EmployeeDocument_tbl] ([EmpDoc_Id], [EmpDoc_Employee], [EmpDoc_Type], [EmpDoc_File], [EmpDoc_Status]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(7 AS Numeric(18, 0)), N'~/Uploads/Documents/14032021050628PM_Doc.png', 1)
SET IDENTITY_INSERT [dbo].[EmployeeDocument_tbl] OFF
GO
SET IDENTITY_INSERT [dbo].[EmployeeSalary_tbl] ON 

INSERT [dbo].[EmployeeSalary_tbl] ([EmpSal_Id], [EmpSal_Employee], [EmpSal_Salary], [EmpSal_StartDate], [EmpSal_EndDate]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(45000.00 AS Numeric(18, 2)), CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2020-12-31T00:00:00.000' AS DateTime))
INSERT [dbo].[EmployeeSalary_tbl] ([EmpSal_Id], [EmpSal_Employee], [EmpSal_Salary], [EmpSal_StartDate], [EmpSal_EndDate]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(50000.00 AS Numeric(18, 2)), CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2021-12-31T00:00:00.000' AS DateTime))
INSERT [dbo].[EmployeeSalary_tbl] ([EmpSal_Id], [EmpSal_Employee], [EmpSal_Salary], [EmpSal_StartDate], [EmpSal_EndDate]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(35000.00 AS Numeric(18, 2)), CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2020-12-31T00:00:00.000' AS DateTime))
INSERT [dbo].[EmployeeSalary_tbl] ([EmpSal_Id], [EmpSal_Employee], [EmpSal_Salary], [EmpSal_StartDate], [EmpSal_EndDate]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(42500.00 AS Numeric(18, 2)), CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2021-12-31T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[EmployeeSalary_tbl] OFF
GO
/****** Object:  StoredProcedure [dbo].[AddEmployee_sp]    Script Date: 15-03-2021 11:17:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddEmployee_sp]
(
	@Emp_Name nvarchar(100),
	@Emp_DOB datetime,
	@Emp_Department numeric(18,0),
	@Emp_Status int
)
AS
BEGIN
	
	INSERT INTO Employee_tbl VALUES (@Emp_Name, @Emp_DOB, @Emp_Department, @Emp_Status)

	SELECT SCOPE_IDENTITY()

END
GO
/****** Object:  StoredProcedure [dbo].[AddEmployeeDocument_sp]    Script Date: 15-03-2021 11:17:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddEmployeeDocument_sp]
(
	@EmpDoc_Employee numeric(18,0),
	@EmpDoc_Type numeric(18,0),
	@EmpDoc_File nvarchar(500),
	@EmpDoc_Status int
)
AS
BEGIN
	
	INSERT INTO EmployeeDocument_tbl VALUES (@EmpDoc_Employee, @EmpDoc_Type, @EmpDoc_File, @EmpDoc_Status)
	
	SELECT SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[AddEmployeeSalary_sp]    Script Date: 15-03-2021 11:17:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddEmployeeSalary_sp]
(
	@EmpSal_Employee numeric(18,0),
	@EmpSal_Salary numeric(18,2),
	@EmpSal_StartDate datetime,
	@EmpSal_EndDate datetime
)
AS
BEGIN
	
	INSERT INTO EmployeeSalary_tbl VALUES (@EmpSal_Employee, @EmpSal_Salary, @EmpSal_StartDate, @EmpSal_EndDate)
	
	SELECT SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteEmployee_sp]    Script Date: 15-03-2021 11:17:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteEmployee_sp]
(
	@Emp_Id numeric(18,0)
)
AS
BEGIN
	
	DELETE FROM Employee_tbl WHERE Emp_Id = @Emp_Id

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteEmployeeDocument_sp]    Script Date: 15-03-2021 11:17:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteEmployeeDocument_sp]
(
	@EmpDoc_Id numeric(18,0)
)
AS
BEGIN
	
	DELETE FROM EmployeeDocument_tbl WHERE EmpDoc_Id = @EmpDoc_Id

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteEmployeeDocumentByEmployee_sp]    Script Date: 15-03-2021 11:17:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteEmployeeDocumentByEmployee_sp]
(
	@EmpDoc_Employee numeric(18,0)
)
AS
BEGIN
	
	DELETE FROM EmployeeDocument_tbl WHERE EmpDoc_Employee = @EmpDoc_Employee

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteEmployeeSalary_sp]    Script Date: 15-03-2021 11:17:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteEmployeeSalary_sp]
(
	@EmpSal_Id numeric(18,0)
)
AS
BEGIN
	
	DELETE FROM EmployeeSalary_tbl WHERE EmpSal_Id = @EmpSal_Id

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteEmployeeSalaryByEmployee_sp]    Script Date: 15-03-2021 11:17:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteEmployeeSalaryByEmployee_sp]
(
	@EmpSal_Employee numeric(18,0)
)
AS
BEGIN
	
	DELETE FROM EmployeeSalary_tbl WHERE EmpSal_Employee = @EmpSal_Employee

END
GO
/****** Object:  StoredProcedure [dbo].[FindEmployee_sp]    Script Date: 15-03-2021 11:17:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[FindEmployee_sp]
(
	@Emp_Id numeric(18,0)
)
AS
BEGIN
	
	SELECT 
		*,
		ISNULL((SELECT Dept_Name FROM Department_tbl WHERE Dept_Id = Emp_Department),'') AS Emp_DepartmentName
	FROM 
		Employee_tbl 
	WHERE 
		Emp_Id = @Emp_Id

END
GO
/****** Object:  StoredProcedure [dbo].[FindEmployeeDocument_sp]    Script Date: 15-03-2021 11:17:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[FindEmployeeDocument_sp]
(
	@EmpDoc_Id numeric(18,0)
)
AS
BEGIN
	
	SELECT 
		*,
		ISNULL((SELECT Emp_Name FROM Employee_tbl WHERE Emp_Id = EmpDoc_Employee),'') AS EmpDoc_EmployeeName,
		ISNULL((SELECT DocType_Name FROM DocumentType_tbl WHERE DocType_Id = EmpDoc_Type),'') AS EmpDoc_TypeName
	FROM
		EmployeeDocument_tbl
	WHERE
		EmpDoc_Id = @EmpDoc_Id
END
GO
/****** Object:  StoredProcedure [dbo].[FindEmployeeDocumentByEmployee_sp]    Script Date: 15-03-2021 11:17:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[FindEmployeeDocumentByEmployee_sp]
(
	@EmpDoc_Employee numeric(18,0)
)
AS
BEGIN
	
	SELECT 
		*,
		ISNULL((SELECT Emp_Name FROM Employee_tbl WHERE Emp_Id = EmpDoc_Employee),'') AS EmpDoc_EmployeeName,
		ISNULL((SELECT DocType_Name FROM DocumentType_tbl WHERE DocType_Id = EmpDoc_Type),'') AS EmpDoc_TypeName
	FROM 
		EmployeeDocument_tbl
	WHERE 
		EmpDoc_Employee = @EmpDoc_Employee

END
GO
/****** Object:  StoredProcedure [dbo].[FindEmployeeSalary_sp]    Script Date: 15-03-2021 11:17:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FindEmployeeSalary_sp]
(
	@EmpSal_Id numeric(18,0)
)
AS
BEGIN
	
	SELECT 
		*,
		ISNULL((SELECT Emp_Name FROM Employee_tbl WHERE Emp_Id = EmpSal_Employee),'') AS EmpSal_EmployeeName
	FROM
		EmployeeSalary_tbl
	WHERE
		EmpSal_Id = @EmpSal_Id
END
GO
/****** Object:  StoredProcedure [dbo].[FindEmployeeSalaryByEmployee_sp]    Script Date: 15-03-2021 11:17:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FindEmployeeSalaryByEmployee_sp]
(
	@EmpSal_Employee numeric(18,0)
)
AS
BEGIN
	
	SELECT 
		*,
		ISNULL((SELECT Emp_Name FROM Employee_tbl WHERE Emp_Id = EmpSal_Employee),'') AS EmpSal_EmployeeName
	FROM 
		EmployeeSalary_tbl
	WHERE 
		EmpSal_Employee = @EmpSal_Employee

END
GO
/****** Object:  StoredProcedure [dbo].[ListEmployee_sp]    Script Date: 15-03-2021 11:17:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ListEmployee_sp]
(
	@Status int
)
AS
BEGIN
	
	SELECT 
		*,
		ISNULL((SELECT Dept_Name FROM Department_tbl WHERE Dept_Id = Emp_Department),'') AS Emp_DepartmentName
	FROM
		Employee_tbl 
	WHERE 
		(@Status != 2 AND Emp_Status = @Status) 
		OR 
		(@Status = 2 AND 1=1)

END
GO
/****** Object:  StoredProcedure [dbo].[ListEmployeeDocument_sp]    Script Date: 15-03-2021 11:17:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ListEmployeeDocument_sp]
AS
BEGIN
	
	SELECT 
		*,
		ISNULL((SELECT Emp_Name FROM Employee_tbl WHERE Emp_Id = EmpDoc_Employee),'') AS EmpDoc_EmployeeName,
		ISNULL((SELECT DocType_Name FROM DocumentType_tbl WHERE DocType_Id = EmpDoc_Type),'') AS EmpDoc_TypeName
	FROM
		EmployeeDocument_tbl
END
GO
/****** Object:  StoredProcedure [dbo].[ListEmployeeSalary_sp]    Script Date: 15-03-2021 11:17:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListEmployeeSalary_sp]
AS
BEGIN
	
	SELECT 
		*,
		ISNULL((SELECT Emp_Name FROM Employee_tbl WHERE Emp_Id = EmpSal_Employee),'') AS EmpSal_EmployeeName
	FROM
		EmployeeSalary_tbl
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateEmployee_sp]    Script Date: 15-03-2021 11:17:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateEmployee_sp]
(
	@Emp_Id numeric(18,0),
	@Emp_Name nvarchar(100),
	@Emp_DOB datetime,
	@Emp_Department numeric(18,0),
	@Emp_Status int
)
AS
BEGIN
	
	UPDATE
		Employee_tbl 
	SET
		Emp_Name = @Emp_Name, 
		Emp_DOB = @Emp_DOB, 
		Emp_Department = @Emp_Department, 
		Emp_Status = @Emp_Status
	WHERE
		Emp_Id = @Emp_Id

END
GO
/****** Object:  StoredProcedure [dbo].[UpdateEmployeeDocument_sp]    Script Date: 15-03-2021 11:17:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateEmployeeDocument_sp]
(
	@EmpDoc_Id numeric(18,0),
	@EmpDoc_Employee numeric(18,0),
	@EmpDoc_Type numeric(18,0),
	@EmpDoc_File nvarchar(500),
	@EmpDoc_Status int
)
AS
BEGIN
	
	UPDATE
		EmployeeDocument_tbl
	SET
		EmpDoc_Employee = @EmpDoc_Employee,
		EmpDoc_Type = @EmpDoc_Type,
		EmpDoc_File = @EmpDoc_File,
		EmpDoc_Status = @EmpDoc_Status
	WHERE
		EmpDoc_Id = @EmpDoc_Id
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateEmployeeSalary_sp]    Script Date: 15-03-2021 11:17:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateEmployeeSalary_sp]
(
	@EmpSal_Id numeric(18,0),
	@EmpSal_Employee numeric(18,0),
	@EmpSal_Salary numeric(18,2),
	@EmpSal_StartDate datetime,
	@EmpSal_EndDate datetime
)
AS
BEGIN
	
	UPDATE
		EmployeeSalary_tbl
	SET
		EmpSal_Employee = @EmpSal_Employee,
		EmpSal_Salary = @EmpSal_Salary,
		EmpSal_StartDate = @EmpSal_StartDate,
		EmpSal_EndDate = @EmpSal_EndDate
	WHERE
		EmpSal_Id = @EmpSal_Id
END
GO
USE [master]
GO
ALTER DATABASE [Employee] SET  READ_WRITE 
GO
