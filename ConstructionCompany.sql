CREATE DATABASE ConstructionCompany;
GO

USE ConstructionCompany;
GO
-- ������� �������������
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    UserName NVARCHAR(100),
    Role NVARCHAR(50)
);

-- ������� ������
CREATE TABLE Teams (
    TeamID INT PRIMARY KEY IDENTITY(1,1),
    TeamName NVARCHAR(100),
    ForemanID INT,
    FOREIGN KEY (ForemanID) REFERENCES Users(UserID)
);

-- ������� ����������
CREATE TABLE Workers (
    WorkerID INT PRIMARY KEY IDENTITY(1,1),
    TeamID INT,
    WorkerName NVARCHAR(100),
    Position NVARCHAR(50),
    FOREIGN KEY (TeamID) REFERENCES Teams(TeamID)
);

-- ������� ��������
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY IDENTITY(1,1),
    ProjectName NVARCHAR(100),
    Deadline DATE,
    Status NVARCHAR(50)
);

-- ������� ����������� �����
CREATE TABLE CompletedWorks (
    WorkID INT PRIMARY KEY IDENTITY(1,1),
    ProjectID INT,
    TeamID INT,
    WorkDate DATE,
    Description NVARCHAR(255),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
    FOREIGN KEY (TeamID) REFERENCES Teams(TeamID)
);
GO
-- ���������� ������� �������������
INSERT INTO Users (UserName, Role)
VALUES ('�������', '�������������'),
       ('����', '�������� �� ��������'),
       ('������', '�������'),
       ('�������', '������'),
       ('�����', '���������');

-- ���������� ������� ������
INSERT INTO Teams (TeamName, ForemanID)
VALUES ('������� 1', 4),  -- ������
       ('������� 2', 4);

-- ���������� ������� ����������
INSERT INTO Workers (TeamID, WorkerName, Position)
VALUES (1, '����', '�������'),
       (1, '��������', '�������'),
       (2, '������', '�������'),
       (2, '��������', '�������');

-- ���������� ������� ��������
INSERT INTO Projects (ProjectName, Deadline, Status)
VALUES ('������������� ����', '2024-12-31', '� ��������'),
       ('������ �����', '2024-06-30', '��������');

-- ���������� ������� ����������� �����
INSERT INTO CompletedWorks (ProjectID, TeamID, WorkDate, Description)
VALUES (1, 1, '2024-01-15', '��������� ����������'),
       (1, 1, '2024-02-20', '�����'),
       (2, 2, '2024-05-15', '�������� ����');
GO
-- ������ ������������ ������
CREATE VIEW TeamList AS
SELECT T.TeamID, T.TeamName, W.WorkerName, W.Position
FROM Teams T
JOIN Workers W ON T.TeamID = W.TeamID;

-- ����������� ������ �� ������ ������� �� �������� �������� �������
CREATE VIEW CompletedWorksReport AS
SELECT P.ProjectName, T.TeamName, CW.WorkDate, CW.Description
FROM CompletedWorks CW
JOIN Projects P ON CW.ProjectID = P.ProjectID
JOIN Teams T ON CW.TeamID = T.TeamID;
GO