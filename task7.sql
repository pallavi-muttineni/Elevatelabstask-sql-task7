mysql> create database task7;
Query OK, 1 row affected (0.276 sec)

mysql> use task7;
Database changed
mysql> -- Create Employees Table
Query OK, 0 rows affected (0.004 sec)

mysql> CREATE TABLE Employees (
    ->     employee_id INT PRIMARY KEY,
    ->     first_name VARCHAR(50) NOT NULL,
    ->     last_name VARCHAR(50) NOT NULL,
    ->     email VARCHAR(100) UNIQUE,
    ->     phone_number VARCHAR(20),
    ->     hire_date DATE NOT NULL,
    ->     job_id VARCHAR(50),
    ->     salary DECIMAL(10, 2),
    ->     department_id INT
    -> );
Query OK, 0 rows affected (0.472 sec)

mysql>
mysql> -- Create Departments Table
Query OK, 0 rows affected (0.001 sec)

mysql> CREATE TABLE Departments (
    ->     department_id INT PRIMARY KEY,
    ->     department_name VARCHAR(50) NOT NULL,
    ->     location VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.136 sec)

mysql>
mysql> -- Insert Sample Data into Departments
Query OK, 0 rows affected (0.001 sec)

mysql> INSERT INTO Departments (department_id, department_name, location) VALUES
    -> (10, 'Human Resources', 'New York'),
    -> (20, 'Engineering', 'San Francisco'),
    -> (30, 'Sales', 'Chicago'),
    -> (40, 'Marketing', 'New York');
Query OK, 4 rows affected (0.099 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql>
mysql> -- Insert Sample Data into Employees
Query OK, 0 rows affected (0.001 sec)

mysql> INSERT INTO Employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, department_id) VALUES
    -> (1, 'Alice', 'Smith', 'alice.s@example.com', '111-222-3333', '2020-01-15', 'HR_REP', 60000.00, 10),
    -> (2, 'Bob', 'Johnson', 'bob.j@example.com', '444-555-6666', '2019-03-20', 'SW_ENG', 90000.00, 20),
    -> (3, 'Charlie', 'Brown', 'charlie.b@example.com', '777-888-9999', '2021-06-01', 'SALES_MGR', 85000.00, 30),
    -> (4, 'Diana', 'Prince', 'diana.p@example.com', '000-111-2222', '2018-11-10', 'SW_ENG', 95000.00, 20),
    -> (5, 'Eve', 'Davis', 'eve.d@example.com', '333-444-5555', '2022-02-28', 'MARKETER', 55000.00, 40),
    -> (6, 'Frank', 'White', 'frank.w@example.com', '666-777-8888', '2020-09-01', 'HR_MGR', 75000.00, 10);
Query OK, 6 rows affected (0.028 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql>
mysql>
mysql> -- 2. View Definitions
Query OK, 0 rows affected (0.001 sec)

mysql>
mysql> -- View for Abstraction: EmployeeDetailsView
Query OK, 0 rows affected (0.001 sec)

mysql> CREATE VIEW EmployeeDetailsView AS
    -> SELECT
    ->     e.employee_id,
    ->     e.first_name,
    ->     e.last_name,
    ->     e.email,
    ->     e.phone_number,
    ->     e.hire_date,
    ->     e.job_id,
    ->     e.salary,
    ->     d.department_name,
    ->     d.location
    -> FROM
    ->     Employees AS e
    -> JOIN
    ->     Departments AS d ON e.department_id = d.department_id
    -> WHERE
    ->     e.salary > 50000; -- Adding a complex SELECT condition
Query OK, 0 rows affected (0.068 sec)

mysql>
mysql> -- View for Security/Abstraction: PublicEmployeeInfoView
Query OK, 0 rows affected (0.001 sec)

mysql> CREATE VIEW PublicEmployeeInfoView AS
    -> SELECT
    ->     e.employee_id,
    ->     e.first_name,
    ->     e.last_name,
    ->     e.job_id,
    ->     d.department_name
    -> FROM
    ->     Employees AS e
    -> JOIN
    ->     Departments AS d ON e.department_id = d.department_id;
Query OK, 0 rows affected (0.046 sec)

mysql>
mysql>
mysql> -- 3. Usage Examples
Query OK, 0 rows affected (0.001 sec)

mysql>
mysql> -- Using EmployeeDetailsView
Query OK, 0 rows affected (0.001 sec)

mysql> -- Select all columns from EmployeeDetailsView
Query OK, 0 rows affected (0.001 sec)

mysql> SELECT *
    -> FROM EmployeeDetailsView;
+-------------+------------+-----------+-----------------------+--------------+------------+-----------+----------+-----------------+---------------+
| employee_id | first_name | last_name | email                 | phone_number | hire_date  | job_id    | salary   | department_name | location      |
+-------------+------------+-----------+-----------------------+--------------+------------+-----------+----------+-----------------+---------------+
|           1 | Alice      | Smith     | alice.s@example.com   | 111-222-3333 | 2020-01-15 | HR_REP    | 60000.00 | Human Resources | New York      |
|           2 | Bob        | Johnson   | bob.j@example.com     | 444-555-6666 | 2019-03-20 | SW_ENG    | 90000.00 | Engineering     | San Francisco |
|           3 | Charlie    | Brown     | charlie.b@example.com | 777-888-9999 | 2021-06-01 | SALES_MGR | 85000.00 | Sales           | Chicago       |
|           4 | Diana      | Prince    | diana.p@example.com   | 000-111-2222 | 2018-11-10 | SW_ENG    | 95000.00 | Engineering     | San Francisco |
|           5 | Eve        | Davis     | eve.d@example.com     | 333-444-5555 | 2022-02-28 | MARKETER  | 55000.00 | Marketing       | New York      |
|           6 | Frank      | White     | frank.w@example.com   | 666-777-8888 | 2020-09-01 | HR_MGR    | 75000.00 | Human Resources | New York      |
+-------------+------------+-----------+-----------------------+--------------+------------+-----------+----------+-----------------+---------------+
6 rows in set (0.051 sec)

mysql>
mysql> -- Select specific columns and apply filters
Query OK, 0 rows affected (0.002 sec)

mysql> SELECT
    ->     first_name,
    ->     last_name,
    ->     department_name,
    ->     salary
    -> FROM
    ->     EmployeeDetailsView
    -> WHERE
    ->     location = 'New York';
+------------+-----------+-----------------+----------+
| first_name | last_name | department_name | salary   |
+------------+-----------+-----------------+----------+
| Alice      | Smith     | Human Resources | 60000.00 |
| Eve        | Davis     | Marketing       | 55000.00 |
| Frank      | White     | Human Resources | 75000.00 |
+------------+-----------+-----------------+----------+
3 rows in set (0.043 sec)

mysql>
mysql> -- Using PublicEmployeeInfoView
Query OK, 0 rows affected (0.001 sec)

mysql> -- Select all columns from PublicEmployeeInfoView
Query OK, 0 rows affected (0.001 sec)

mysql> SELECT *
    -> FROM PublicEmployeeInfoView;
+-------------+------------+-----------+-----------+-----------------+
| employee_id | first_name | last_name | job_id    | department_name |
+-------------+------------+-----------+-----------+-----------------+
|           1 | Alice      | Smith     | HR_REP    | Human Resources |
|           2 | Bob        | Johnson   | SW_ENG    | Engineering     |
|           3 | Charlie    | Brown     | SALES_MGR | Sales           |
|           4 | Diana      | Prince    | SW_ENG    | Engineering     |
|           5 | Eve        | Davis     | MARKETER  | Marketing       |
|           6 | Frank      | White     | HR_MGR    | Human Resources |
+-------------+------------+-----------+-----------+-----------------+
6 rows in set (0.020 sec)

mysql>
mysql> -- Select specific columns and apply filters
Query OK, 0 rows affected (0.003 sec)

mysql> SELECT
    ->     first_name,
    ->     last_name
    -> FROM
    ->     PublicEmployeeInfoView
    -> WHERE
    ->     department_name = 'Engineering';
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Bob        | Johnson   |
| Diana      | Prince    |
+------------+-----------+
2 rows in set (0.006 sec)

mysql>
mysql>
mysql> -- 4. Dropping Views (Optional)
Query OK, 0 rows affected (0.001 sec)

mysql>
mysql> -- DROP VIEW EmployeeDetailsView;
Query OK, 0 rows affected (0.001 sec)

mysql> -- DROP VIEW PublicEmployeeInfoView;
Query OK, 0 rows affected (0.001 sec)

mysql>