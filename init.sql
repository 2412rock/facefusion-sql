-- Check if the database exists, if not, create it
IF NOT EXISTS (SELECT 1 FROM sys.databases WHERE name = 'FaceFusionDB')
BEGIN
    CREATE DATABASE FaceFusionDB;
END;
GO

-- Switch to the FfhubDB
USE FaceFusionDB;
GO

CREATE TABLE Users (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Email NVARCHAR(50) UNIQUE NOT NULL,
    Password NVARCHAR(255) NOT NULL,
    Credit INT NOT NULL
);
GO

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'UserSessions')
BEGIN
    CREATE TABLE UserSessions (
    SessionId INT PRIMARY KEY IDENTITY,
    Email NVARCHAR(50) NOT NULL,
    SessionToken NVARCHAR(255) NOT NULL,
    LastActiveTime DATETIME NOT NULL,
    IsActive BIT NOT NULL,
);
END;

GO