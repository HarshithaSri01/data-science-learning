
-- SQL Common Table Expressions (CTEs) Practice
-- Assumed table: employees
-- Columns: employee_id, employee_name, department, salary

-- 1. Find employees earning more than 50000
WITH high_salary_employees AS (
    SELECT employee_id, employee_name, department, salary
    FROM employees
    WHERE salary > 50000
)
SELECT *
FROM high_salary_employees;

-- 2. Calculate average salary by department
WITH department_salary AS (
    SELECT department, AVG(salary) AS average_salary
    FROM employees
    GROUP BY department
)
SELECT *
FROM department_salary;

-- 3. Find employees earning more than their department's average
WITH department_average AS (
    SELECT department, AVG(salary) AS average_salary
    FROM employees
    GROUP BY department
)
SELECT e.employee_name, e.department, e.salary
FROM employees AS e
JOIN department_average AS d
    ON e.department = d.department
WHERE e.salary > d.average_salary;

-- 4. Find the second-highest distinct salary
WITH salary_ranking AS (
    SELECT
        salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
    FROM employees
)
SELECT DISTINCT salary
FROM salary_ranking
WHERE salary_rank = 2;

-- 5. Find the highest-paid employee in each department
WITH employee_ranking AS (
    SELECT
        employee_name,
        department,
        salary,
        DENSE_RANK() OVER (
            PARTITION BY department
            ORDER BY salary DESC
        ) AS salary_rank
    FROM employees
)
SELECT employee_name, department, salary
FROM employee_ranking
WHERE salary_rank = 1;

-- 6. Use multiple CTEs to compare department salaries
WITH department_average AS (
    SELECT department, AVG(salary) AS average_salary
    FROM employees
    GROUP BY department
),
department_maximum AS (
    SELECT department, MAX(salary) AS maximum_salary
    FROM employees
    GROUP BY department
)
SELECT
    a.department,
    a.average_salary,
    m.maximum_salary
FROM department_average AS a
JOIN department_maximum AS m
    ON a.department = m.department;

-- 7. Count employees in each department and
-- return only departments with at least 3 employees
WITH department_counts AS (
    SELECT department, COUNT(*) AS employee_count
    FROM employees
    GROUP BY department
)
SELECT department, employee_count
FROM department_counts
WHERE employee_count >= 3;
