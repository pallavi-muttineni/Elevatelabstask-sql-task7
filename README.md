# 📊 Creating Views — SQL Developer Internship

## 🧠 Objective
Learn how to create and use SQL views for improved abstraction, security, and reusability of logic.

## 🛠️ Tools Used
- MySQL Workbench / DB Browser for SQLite

## 📁 Deliverables
- SQL view definitions (`.sql` or included in this README)
- Example queries using views
- Optional screenshots of output (if applicable)

---

## 🏗️ What Are Views?
A **view** is a virtual table based on the result-set of an SQL statement. It encapsulates complex queries, helps enforce security, and simplifies code reuse.

---

## 🧾 View Creation Syntax
```sql
CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;
CREATE VIEW high_scorers AS
SELECT s.student_id, s.name, SUM(m.marks) AS total_marks
FROM students s
JOIN marks m ON s.student_id = m.student_id
GROUP BY s.student_id, s.name
HAVING total_marks > 250;
SELECT * FROM high_scorers;
