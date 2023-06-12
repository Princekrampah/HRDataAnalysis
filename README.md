## HR Data Analysis Project

### About Data


### Objectives Of Analysis

**The main purpose of this analysis is to answer the following questions to gain a deeper understanding of the data.**

1. To understand the most paid career?
2. What is the average salary of each category?
3. How does gender affect the salary of an employee
4. How does race(white/black/Asian...) affect the salary of an employee
5. How does employee status affect salary of the employee.
6. How does absence affect the salary of an individual
7. What is the most common recruitement source and how does recruitement source affect salary and `EmpSatisfaction`
8. What is the categorization count for `EmploymentStatus`.
9. What is the average salary based on department.


### Procedures Followed

1.  #### Data Cleaning

    1. Delete unwanted columns, the following columns will be deleted as they will not be important in the analysis project.

    1. `EmpID`
    2. `MarriedID`
    3. `MaritalStatusID`
    4. `GenderID`
    5. `EmpStatusID`
    6. `DeptID`
    7. `PerfScoreID`
    8. `FromDiversityJobFairID`
    9. `Employee_Name`
    10. `ManagerName`
    11. `ManagerID`
    12. `Zip`
    13. `PositionID`
    14. `Zip`

2. #### Database creation

    1. Drop all the unwanted columns listed above. This should be done in the CSV file.
    2. Create a database with the remaing columns:

| Column Name      | Column Datatype |
| :---        |    :----:   |
| Employee_Name      |   VARCHAR(100)     |
| Salary      | DECIMAL(10, 2)       |
| Position   | VARCHAR(100)        |
| State   | VARCHAR(100)        |
| DOB   | DATE        |
| Sex   | VARCHAR(1)        |
| MaritalDesc   | VARCHAR(100)        |
| CitizenDesc   | VARCHAR(100)        |
| HispanicLatino   | VARCHAR(10)        |
| RaceDesc   | VARCHAR(30)        |
| DateofHire   | DATE        |
| DateofTermination   | DATE & NULL        |
| TermReason   | VARCHAR(100)        |
| EmploymentStatus   | VARCHAR(100)        |
| Department   | VARCHAR(100)        |
| ManagerName   | VARCHAR(100)        |
| ManagerID   | INT        |
| RecruitmentSource   | VARCHAR(100)        |
| PerformanceScore   | VARCHAR(100)        |
| EngagementSurvey   | FLOAT        |
| EmpSatisfaction   | INT        |
| SpecialProjectsCount   | INT        |
| LastPerformanceReview_Date   | DATE        |
| DaysLateLast30   | INT        |
| Absences   | INT        |


