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


-- What is the most common recruitement source and how does 
-- recruitement source affect salary and EmpSatisfaction?
SELECT
	RecruitmentSource,
    AVG(Salary) as avg_salary,
	COUNT(RecruitmentSource) AS count
FROM HR_data
GROUP BY RecruitmentSource
ORDER BY avg_salary DESC;


-- What is the categorization count for EmploymentStatus?
SELECT 
	*,
    ROW_NUMBER() OVER(PARTITION BY Department ORDER BY Department DESC) AS status_rank
FROM(SELECT
	Department,
    EmploymentStatus,
    COUNT(EmploymentStatus) AS status
FROM HR_data
GROUP BY Department, EmploymentStatus
ORDER BY Department, status DESC) AS subquery;

-- What is the average salary based on department?
SELECT
	Department,
    AVG(Salary) AS avg_salary
FROM HR_data
GROUP BY Department
ORDER BY avg_salary DESC;

-- Which state has the most paid salary?
SELECT
	State,
    AVG(Salary) AS avg_salary
FROM HR_data
GROUP BY State
ORDER BY avg_salary DESC;


-- What is the most common reason for termination?
SELECT 
	TermReason,
    COUNT(TermReason) AS count
FROM HR_data
GROUP BY TermReason
ORDER BY count DESC;

-- What is the most common reason for termination by race?
SELECT
	RaceDesc,
	TermReason,
    COUNT(TermReason) AS count
FROM HR_data
GROUP BY TermReason, RaceDesc
ORDER BY RaceDesc, count DESC;

-- What is the most common EmploymentStatus?
SELECT
	EmploymentStatus,
    COUNT(EmploymentStatus) AS count
FROM HR_data
GROUP BY EmploymentStatus
ORDER BY count DESC;

-- Which recruitment source give employees with best performance score?
SELECT
	RecruitmentSource,
    PerformanceScore,
    COUNT(PerformanceScore) AS perf_cnt
FROM HR_data
GROUP BY RecruitmentSource, PerformanceScore
ORDER BY RecruitmentSource, PerformanceScore;


-- Which department has the most absenties?
SELECT
	Department,
    SUM(Absences) AS absence_cnt
FROM HR_data
GROUP BY Department
ORDER BY absence_cnt DESC;