SQL Views Demonstration
This repository contains SQL scripts demonstrating the creation and usage of database views for abstraction and security purposes. The scripts are compatible with SQLite and MySQL databases.

Objective
The primary objective of this project is to illustrate how to:

Define views using complex SELECT statements.

Utilize views to achieve data abstraction, simplifying complex queries.

Implement views for enhanced data security by restricting access to sensitive information.

Tools
To run these SQL scripts, you will need a database management tool that supports SQLite or MySQL. Recommended tools include:

DB Browser for SQLite: A lightweight, open-source tool for SQLite databases.

MySQL Workbench: A comprehensive visual tool for MySQL development and administration.

Deliverables
View Definitions: SQL statements for creating various views.

Usage Examples: SQL queries demonstrating how to interact with the defined views.

Getting Started
Follow these steps to set up and run the SQL scripts:

1. Database Setup
First, you need to create the necessary tables (Employees and Departments) and populate them with sample data.

-- Create Employees Table
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(20),
    hire_date DATE NOT NULL,
    job_id VARCHAR(50),
    salary DECIMAL(10, 2),
    department_id INT
);

-- Create Departments Table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL,
    location VARCHAR(50)
);

-- Insert Sample Data into Departments
INSERT INTO Departments (department_id, department_name, location) VALUES
(10, 'Human Resources', 'New York'),
(20, 'Engineering', 'San Francisco'),
(30, 'Sales', 'Chicago'),
(40, 'Marketing', 'New York');

-- Insert Sample Data into Employees
INSERT INTO Employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, department_id) VALUES
(1, 'Alice', 'Smith', 'alice.s@example.com', '111-222-3333', '2020-01-15', 'HR_REP', 60000.00, 10),
(2, 'Bob', 'Johnson', 'bob.j@example.com', '444-555-6666', '2019-03-20', 'SW_ENG', 90000.00, 20),
(3, 'Charlie', 'Brown', 'charlie.b@example.com', '777-888-9999', '2021-06-01', 'SALES_MGR', 85000.00, 30),
(4, 'Diana', 'Prince', 'diana.p@example.com', '000-111-2222', '2018-11-10', 'SW_ENG', 95000.00, 20),
(5, 'Eve', 'Davis', 'eve.d@example.com', '333-444-5555', '2022-02-28', 'MARKETER', 55000.00, 40),
(6, 'Frank', 'White', 'frank.w@example.com', '666-777-8888', '2020-09-01', 'HR_MGR', 75000.00, 10);

2. View Definitions
After setting up the tables, you can create the views.

EmployeeDetailsView (Abstraction)
This view combines employee and department information, simplifying queries for detailed employee data.

CREATE VIEW EmployeeDetailsView AS
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.email,
    e.phone_number,
    e.hire_date,
    e.job_id,
    e.salary,
    d.department_name,
    d.location
FROM
    Employees AS e
JOIN
    Departments AS d ON e.department_id = d.department_id
WHERE
    e.salary > 50000;

PublicEmployeeInfoView (Security & Abstraction)
This view exposes only non-sensitive employee information, useful for scenarios where full data access is not required.

CREATE VIEW PublicEmployeeInfoView AS
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.job_id,
    d.department_name
FROM
    Employees AS e
JOIN
    Departments AS d ON e.department_id = d.department_id;

3. Usage Examples
Once the views are created, you can query them like regular tables.

Using EmployeeDetailsView
-- Select all columns from EmployeeDetailsView
SELECT *
FROM EmployeeDetailsView;

-- Select specific columns and apply filters
SELECT
    first_name,
    last_name,
    department_name,
    salary
FROM
    EmployeeDetailsView
WHERE
    location = 'New York';

Using PublicEmployeeInfoView
-- Select all columns from PublicEmployeeInfoView
SELECT *
FROM PublicEmployeeInfoView;

-- Select specific columns and apply filters
SELECT
    first_name,
    last_name
FROM
    PublicEmployeeInfoView
WHERE
    department_name = 'Engineering';

4. Dropping Views (Optional)
If you need to remove the views, use the DROP VIEW statements:

DROP VIEW EmployeeDetailsView;
DROP VIEW PublicEmployeeInfoView;
