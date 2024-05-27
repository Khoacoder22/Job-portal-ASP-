USE jobPortal

CREATE TABLE [User](
	UserId INT IDENTITY(1,1) NOT NULL,
UserName VARCHAR(100) NULL,
Password VARCHAR(50) NULL,
Name VARCHAR(50) NULL,
Email VARCHAR(50) NULL,
Mobile INT NULL,
GraduationGrade VARCHAR(50) NULL,
Phd VARCHAR(50) NULL,
WordsOn VARCHAR(50) NULL,
Experience VARCHAR(50) NULL,
Resume VARCHAR(50) NULL,
Address VARCHAR(MAX) NULL,
Country VARCHAR(50) NULL
)


CREATE TABLE Jobs(
JobId INT IDENTITY(1,1) NOT NULL,
Title VARCHAR(MAX) NULL,
Position INT NULL,
Description VARCHAR(MAX) NULL,
Qualification VARCHAR(MAX) NULL,
Experience VARCHAR(MAX) NULL,
Salary VARCHAR(MAX) NULL,
LastDate DATE NULL,
CompanyName VARCHAR(MAX) NULL,
CompanyImage VARCHAR(MAX) NULL,
Email VARCHAR(MAX) NULL,
JobType VARCHAR(50) NULL,
Address VARCHAR(MAX) NULL
)

CREATE TABLE Country (
    CountryId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    CountryName VARCHAR(MAX)
);

CREATE TABLE Contact (
    ContactId int IDENTITY(1,1) NOT NULL,
    Name varchar(50) NULL,
    Email varchar(50) NULL,
    Subject varchar(100) NULL,
    Message varchar(max) NULL
)

