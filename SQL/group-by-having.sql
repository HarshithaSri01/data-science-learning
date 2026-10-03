-- SQL GROUP BY and HAVING Practice
-- Topic: Aggregation and filtering grouped data

-- Sample table: employees
-- employee_id | employee_name | department | salary

-- 1. Count employees in each department

SELECT
    department,
    COUNT(*) AS employee_count
FROM employees
GROUP BY department;


-- 2. Calculate the average salary for each department

SELECT
    department,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department;


-- 3. Find the maximum salary in each department

SELECT
    department,
    MAX(salary) AS highest_salary
FROM employees
GROUP BY department;


-- 4. Find departments with more than 5 employees

SELECT
    department,
    COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 5;


-- 5. Find departments whose average salary exceeds 50000

SELECT
    department,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 50000;


-- 6. Count employees in each department
-- Include only employees earning more than 30000

SELECT
    department,
    COUNT(*) AS employee_count
FROM employees
WHERE salary > 30000
GROUP BY department;


-- 7. Find departments with at least 3 employees
-- whose salary exceeds 40000

SELECT
    department,
    COUNT(*) AS employee_count
FROM employees
WHERE salary > 40000
GROUP BY department
HAVING COUNT(*) >= 3;
