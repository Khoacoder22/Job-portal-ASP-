-- tạo bảng
Create database JobPortal
-- dùng bảng 
use JobPortal

-- tạo tabe Applied job
CREATE TABLE AppliedJobs ( 
    AppliedJobsId INT PRIMARY KEY IDENTITY(1,1),
    JobId INT,
    UserId INT,
    FOREIGN KEY (JobId) REFERENCES Jobs(JobId),
    FOREIGN KEY (UserId) REFERENCES [User](UserId)
);

-- Contact 
CREATE TABLE Contact (
   ContactId INT PRIMARY KEY IDENTITY(1,1),
   Name VARCHAR(50) NOT NULL,
   Email VARCHAR(50) NOT NULL,
   Subject VARCHAR(50) NOT NULL,
   Message VARCHAR(50) NOT NULL

);

-- Country 
CREATE TABLE Country (
    CountryId INT PRIMARY KEY IDENTITY(1,1),
    CountryName VARCHAR(50) NOT NULL
);


select * from [user]

-- User 
CREATE TABLE [User] (
UserId INT PRIMARY KEY IDENTITY(1,1),
UserName VARCHAR(100),
Password VARCHAR(100),
Name VARCHAR(100),
Email VARCHAR(100),
Mobile int,
GraduationGrade varchar(50),
Phd varchar(50),
WordsOn varchar(50),
Experience varchar(50),
Resume varchar(50),
Address varchar(MAX),
Country varchar(50),
ContactId int,
FOREIGN KEY (ContactId) REFERENCES Contact(ContactId), 
);

-- Jobs
CREATE TABLE Jobs (
    JobId INT PRIMARY KEY IDENTITY(1,1),
    Title varchar(MAX),
    Position char(10),
    Description VARCHAR(MAX),
    Qualification varchar(MAX),
    Experience varchar(MAX),
    LastDate DATE,
    Salary varchar(MAX),
    JobType VARCHAR(50),
    CompanyName varchar(MAX),
    CompanyImage varchar(MAX),                                                                                                                                                                                                                                                                                                                                             
    Email varchar(MAX),
    Address VARCHAR(MAX),
);


-- Country Name
INSERT INTO Country (CountryName) VALUES ('Indonesia');
INSERT INTO Country (CountryName) VALUES ('China');
INSERT INTO Country (CountryName) VALUES ('Viet Nam');
INSERT INTO Country (CountryName) VALUES ('USA');

-- Procedure 
CREATE PROCEDURE InsertContact
    @Name NVARCHAR(100),
    @Email NVARCHAR(100),
    @Subject NVARCHAR(100),
    @Message NVARCHAR(MAX)
AS
BEGIN
    INSERT INTO Contact (Name, Email, Subject, Message)
    VALUES (@Name, @Email, @Subject, @Message)
END

--2
CREATE PROCEDURE GetUserProfile
    @UserName NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT UserId, UserName, Name, Email, Mobile, Country, Address, Resume
    FROM [User]
    WHERE UserName = @UserName;
END

--3 view resume 
CREATE PROCEDURE GetAppliedJobs
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        ROW_NUMBER() OVER (ORDER BY (SELECT 1)) AS [Sr.No],
        aj.AppliedJobsId,
        j.CompanyName,
        aj.JobId,
        j.Title,
        u.Mobile,
        u.Name,
        u.Email,
        u.Resume,
        j.LastDate
    FROM 
        AppliedJobs aj
    INNER JOIN 
        [User] u ON aj.UserId = u.UserId 
    INNER JOIN 
        Jobs j ON aj.JobId = j.JobId;
END