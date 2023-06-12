CREATE DATABASE IF NOT EXISTS HRData;


CREATE TABLE IF NOT EXISTS HT_data(
    Employee_Name VARCHAR(100) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    Position VARCHAR(100) NOT NULL,
    State VARCHAR(100) NOT NULL,
    DOB DATE NOT NULL,
    Sex VARCHAR(1),
    MaritalDesc VARCHAR(100) NOT NULL,
    CitizenDesc VARCHAR(100) NOT NULL,
    HispanicLatino VARCHAR(10) NOT NULL,
    RaceDesc VARCHAR(30) NOT NULL,
    DateofHire DATE NOT NULL,
    DateofTermination DATE NULL,
    TermReason VARCHAR(100) NOT NULL,
    EmploymentStatus VARCHAR(100) NOT NULL,
    Department VARCHAR(100) NOT NULL,
    ManagerName VARCHAR(100) NOT NULL,
    ManagerID INT NOT NULL,
    RecruitmentSource VARCHAR(100) NOT NULL,
    PerformanceScore VARCHAR(100) NOT NULL,
    EngagementSurvey FLOAT NOT NULL,
    EmpSatisfaction INT NOT NULL,
    SpecialProjectsCount INT NOT NULL,
    LastPerformanceReview_Date DATE NOT NULL,
    DaysLateLast30 INT NOT NULL,
    Absences INT NOT NULL
);
