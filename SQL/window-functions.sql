
-- SQL Window Functions Practice
-- Assumed table: employees
-- Columns: employee_id, employee_name, department, salary

-- 1. Assign a row number to each employee
SELECT
    employee_name,
    department,
    salary,
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
FROM employees;

-- 2. Rank employees by salary
SELECT
    employee_name,
    salary,
    RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

-- 3. Rank employees without skipping rank numbers
SELECT
    employee_name,
    salary,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

-- 4. Rank employees within each department
SELECT
    employee_name,
    department,
    salary,
    DENSE_RANK() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS department_rank
FROM employees;

-- 5. Calculate the average salary for each department
-- while keeping every employee row
SELECT
    employee_name,
    department,
    salary,
    AVG(salary) OVER (
        PARTITION BY department
    ) AS department_avg_salary
FROM employees;

-- 6. Calculate a running total of salaries
SELECT
    employee_name,
    salary,
    SUM(salary) OVER (
        ORDER BY employee_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_salary_total
FROM employees;

-- 7. Compare each employee's salary with the previous row
SELECT
    employee_name,
    salary,
    LAG(salary) OVER (
        ORDER BY employee_id
    ) AS previous_salary
FROM employees;

-- 8. Compare each employee's salary with the next row
SELECT
    employee_name,
    salary,
    LEAD(salary) OVER (
        ORDER BY employee_id
    ) AS next_salary
FROM employees;

-- 9. Find the highest-paid employee in each department
WITH ranked_employees AS (
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
FROM ranked_employees
WHERE salary_rank = 1;
