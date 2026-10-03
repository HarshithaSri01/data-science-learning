
-- SQL Subqueries Practice
-- A subquery is a query written inside another SQL query.

-- Assume an employees table with:
-- employee_id, employee_name, department, salary

-- 1. Find employees earning more than the average salary
SELECT employee_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

-- 2. Find employees earning the highest salary
SELECT employee_name, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);

-- 3. Find employees working in the IT department
SELECT employee_name, department
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE department_name = 'IT'
);

-- 4. Find employees earning more than the average salary
-- of their own department
SELECT employee_name, department, salary
FROM employees AS e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department
);

-- 5. Find departments that have at least one employee
-- earning more than 60000
SELECT department
FROM employees AS e
WHERE EXISTS (
    SELECT 1
    FROM employees
    WHERE department = e.department
      AND salary > 60000
);

-- 6. Find the second-highest distinct salary
SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);

-- 7. Find employees whose salary matches
-- the highest salary in their department
SELECT employee_name, department, salary
FROM employees AS e
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE department = e.department
);
