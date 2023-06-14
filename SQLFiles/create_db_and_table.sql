CREATE DATABASE IF NOT EXISTS HRData;


CREATE TABLE IF NOT EXISTS HR_data(
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
    DateofTermination DATE DEFAULT NULL,
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

-- To understand the most paid career
SELECT 
	Department,
    SUM(Salary) AS sum_salary
FROM HR_data
GROUP BY Department
ORDER BY sum_salary DESC;


-- What is the average salary of each category?
SELECT 
	Department,
    AVG(Salary) AS avg_salary
FROM HR_data
GROUP BY Department
ORDER BY avg_salary DESC;


-- How does gender affect the salary of an employee
SELECT 
	Department,
    Sex,
    AVG(Salary) AS avg_salary
FROM HR_data
GROUP BY Department, Sex
ORDER BY Department, RaceDesc;

-- How does race(white/black/Asian...) affect the salary of an employee
WITH CTE_tbl1 AS (SELECT 
	Department,
    RaceDesc,
    AVG(Salary) AS avg_salary
FROM HR_data
GROUP BY Department, RaceDesc)
SELECT
	*,
    ROW_NUMBER() OVER(PARTITION BY Department ORDER BY Department, avg_salary DESC) AS position
FROM CTE_tbl1;

-- How does race(white/black/Asian...) affect employee position?
WITH cte_tbl AS (SELECT 
	Position,
    RaceDesc,
    COUNT(Position) AS cnt_pos
FROM HR_data
GROUP BY Position, RaceDesc)
SELECT 
	*,
    ROW_NUMBER() OVER(PARTITION BY Position ORDER BY cnt_pos DESC) AS rank_position
FROM cte_tbl;
