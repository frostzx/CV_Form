USE [master]
GO
/****** Object:  Database [CV_Form_BPJSTK]    Script Date: 20/11/2024 00:24:19 ******/
CREATE DATABASE [CV_Form_BPJSTK]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CV_Form_BPJSTK', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CV_Form_BPJSTK.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CV_Form_BPJSTK_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CV_Form_BPJSTK_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CV_Form_BPJSTK] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CV_Form_BPJSTK].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CV_Form_BPJSTK] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CV_Form_BPJSTK] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CV_Form_BPJSTK] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CV_Form_BPJSTK] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CV_Form_BPJSTK] SET ARITHABORT OFF 
GO
ALTER DATABASE [CV_Form_BPJSTK] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CV_Form_BPJSTK] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CV_Form_BPJSTK] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CV_Form_BPJSTK] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CV_Form_BPJSTK] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CV_Form_BPJSTK] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CV_Form_BPJSTK] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CV_Form_BPJSTK] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CV_Form_BPJSTK] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CV_Form_BPJSTK] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CV_Form_BPJSTK] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CV_Form_BPJSTK] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CV_Form_BPJSTK] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CV_Form_BPJSTK] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CV_Form_BPJSTK] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CV_Form_BPJSTK] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CV_Form_BPJSTK] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CV_Form_BPJSTK] SET RECOVERY FULL 
GO
ALTER DATABASE [CV_Form_BPJSTK] SET  MULTI_USER 
GO
ALTER DATABASE [CV_Form_BPJSTK] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CV_Form_BPJSTK] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CV_Form_BPJSTK] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CV_Form_BPJSTK] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CV_Form_BPJSTK] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CV_Form_BPJSTK] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CV_Form_BPJSTK', N'ON'
GO
ALTER DATABASE [CV_Form_BPJSTK] SET QUERY_STORE = ON
GO
ALTER DATABASE [CV_Form_BPJSTK] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CV_Form_BPJSTK]
GO
/****** Object:  Table [dbo].[Education]    Script Date: 20/11/2024 00:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Education](
	[EducationID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[School] [varchar](255) NULL,
	[Degree] [varchar](255) NULL,
	[StartDate] [varchar](50) NULL,
	[EndDate] [varchar](50) NULL,
	[City] [varchar](255) NULL,
	[Description] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[EducationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmploymentHistory]    Script Date: 20/11/2024 00:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmploymentHistory](
	[EmploymentID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[JobTitle] [varchar](255) NULL,
	[Employer] [varchar](255) NULL,
	[StartDate] [varchar](50) NULL,
	[EndDate] [varchar](50) NULL,
	[City] [varchar](255) NULL,
	[Description] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmploymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonalDetails]    Script Date: 20/11/2024 00:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonalDetails](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[WantedJobTitle] [varchar](255) NULL,
	[Photo] [varchar](255) NULL,
	[FirstName] [varchar](255) NULL,
	[LastName] [varchar](255) NULL,
	[Email] [varchar](255) NULL,
	[Phone] [varchar](255) NULL,
	[Country] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[PostalCode] [varchar](20) NULL,
	[DrivingLicense] [varchar](50) NULL,
	[Nationality] [varchar](50) NULL,
	[PlaceOfBirth] [varchar](255) NULL,
	[DateOfBirth] [datetime] NULL,
	[ProfessionalSummary] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skills]    Script Date: 20/11/2024 00:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skills](
	[SkillID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[SkillName] [varchar](255) NULL,
	[SkillLevel] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[SkillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Education]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[PersonalDetails] ([UserID])
GO
ALTER TABLE [dbo].[EmploymentHistory]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[PersonalDetails] ([UserID])
GO
ALTER TABLE [dbo].[Skills]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[PersonalDetails] ([UserID])
GO
/****** Object:  StoredProcedure [dbo].[InsertCompleteCV]    Script Date: 20/11/2024 00:24:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertCompleteCV]
    -- Personal Details
    @WantedJobTitle VARCHAR(255),
    @Photo VARCHAR(255),
    @FirstName VARCHAR(255),
    @LastName VARCHAR(255),
    @Email VARCHAR(255),
    @Phone VARCHAR(255),
    @Country VARCHAR(255),
    @City VARCHAR(255),
    @Address VARCHAR(255),
    @PostalCode VARCHAR(20),
    @DrivingLicense VARCHAR(50),
    @Nationality VARCHAR(50),
    @PlaceOfBirth VARCHAR(255),
    @DateOfBirth DATETIME,
    @ProfessionalSummary VARCHAR(MAX),

    -- Employment History
    @EmploymentHistory NVARCHAR(MAX), -- JSON array

    -- Education
    @Education NVARCHAR(MAX), -- JSON array

    -- Skills
    @Skills NVARCHAR(MAX) -- JSON array
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert into PersonalDetails
    DECLARE @NewUserID INT;
    INSERT INTO PersonalDetails (
        WantedJobTitle, Photo, FirstName, LastName, Email, Phone,
        Country, City, Address, PostalCode, DrivingLicense, Nationality,
        PlaceOfBirth, DateOfBirth, ProfessionalSummary
    )
    VALUES (
        @WantedJobTitle, @Photo, @FirstName, @LastName, @Email, @Phone,
        @Country, @City, @Address, @PostalCode, @DrivingLicense, @Nationality,
        @PlaceOfBirth, @DateOfBirth, @ProfessionalSummary
    );
    SET @NewUserID = SCOPE_IDENTITY();

    -- Insert into EmploymentHistory
    IF @EmploymentHistory IS NOT NULL
    BEGIN
        INSERT INTO EmploymentHistory (UserID, JobTitle, Employer, StartDate, EndDate, City, Description)
        SELECT @NewUserID, JSON_VALUE(value, '$.JobTitle'), JSON_VALUE(value, '$.Employer'),
               JSON_VALUE(value, '$.StartDate'), JSON_VALUE(value, '$.EndDate'),
               JSON_VALUE(value, '$.City'), JSON_VALUE(value, '$.Description')
        FROM OPENJSON(@EmploymentHistory);
    END

    -- Insert into Education
    IF @Education IS NOT NULL
    BEGIN
        INSERT INTO Education (UserID, School, Degree, StartDate, EndDate, City, Description)
        SELECT @NewUserID, JSON_VALUE(value, '$.School'), JSON_VALUE(value, '$.Degree'),
               JSON_VALUE(value, '$.StartDate'), JSON_VALUE(value, '$.EndDate'),
               JSON_VALUE(value, '$.City'), JSON_VALUE(value, '$.Description')
        FROM OPENJSON(@Education);
    END

    -- Insert into Skills
    IF @Skills IS NOT NULL
    BEGIN
        INSERT INTO Skills (UserID, SkillName, SkillLevel)
        SELECT @NewUserID, JSON_VALUE(value, '$.SkillName'), JSON_VALUE(value, '$.SkillLevel')
        FROM OPENJSON(@Skills);
    END

    -- Return the new UserID
    SELECT @NewUserID AS UserID;
END;
GO
USE [master]
GO
ALTER DATABASE [CV_Form_BPJSTK] SET  READ_WRITE 
GO
