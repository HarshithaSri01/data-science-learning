-- SQL JOIN Practice
-- Topic: INNER JOIN, LEFT JOIN, RIGHT JOIN

-- Sample Tables
--
-- employees
-- employee_id | employee_name | department_id
--
-- departments
-- department_id | department_name


-- 1. INNER JOIN
-- Returns only employees who have a matching department.

SELECT
    e.employee_id,
    e.employee_name,
    d.department_name
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id;


-- 2. LEFT JOIN
-- Returns all employees, including employees
-- who do not have a matching department.

SELECT
    e.employee_id,
    e.employee_name,
    d.department_name
FROM employees e
LEFT JOIN departments d
    ON e.department_id = d.department_id;


-- 3. Find employees who do not belong to a department.

SELECT
    e.employee_id,
    e.employee_name
FROM employees e
LEFT JOIN departments d
    ON e.department_id = d.department_id
WHERE d.department_id IS NULL;


-- 4. Count employees in each department.

SELECT
    d.department_name,
    COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
GROUP BY d.department_name;


-- 5. Find departments with more than 5 employees.

SELECT
    d.department_name,
    COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING COUNT(e.employee_id) > 5;
