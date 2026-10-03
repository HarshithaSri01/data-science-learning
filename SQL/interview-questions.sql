
-- SQL Interview Questions and Solutions
-- Assumed table: employees
-- Columns: employee_id, employee_name, department, salary

-- Q1. Find the second-highest distinct salary.
SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees);

-- Q2. Find duplicate salaries and their counts.
SELECT salary, COUNT(*) AS occurrence_count
FROM employees
GROUP BY salary
HAVING COUNT(*) > 1;

-- Q3. Find the highest-paid employee in each department.
SELECT employee_name, department, salary
FROM (
    SELECT employee_name, department, salary,
           DENSE_RANK() OVER (
               PARTITION BY department
               ORDER BY salary DESC
           ) AS salary_rank
    FROM employees
) AS ranked
WHERE salary_rank = 1;

-- Q4. Count employees in each department.
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department;

-- Q5. Find employees earning more than the overall average.
SELECT employee_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- Q6. Find the top 3 distinct salary levels.
WITH salary_ranking AS (
    SELECT salary,
           DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
    FROM employees
)
SELECT DISTINCT salary
FROM salary_ranking
WHERE salary_rank <= 3
ORDER BY salary DESC;

-- Q7. Find departments with an average salary above 50000.
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 50000;

-- Q8. Find employees whose salary is above their department average.
SELECT employee_name, department, salary
FROM employees AS e
WHERE salary > (
    SELECT AVG(e2.salary)
    FROM employees AS e2
    WHERE e2.department = e.department
);

-- Q9. Find employees who earn the same salary.
SELECT e1.employee_name, e1.salary
FROM employees AS e1
WHERE EXISTS (
    SELECT 1
    FROM employees AS e2
    WHERE e2.salary = e1.salary
      AND e2.employee_id <> e1.employee_id
);

-- Q10. Calculate a running total of salaries by employee ID.
SELECT employee_id, employee_name, salary,
       SUM(salary) OVER (
           ORDER BY employee_id
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS running_total
FROM employees;

-- Q11. Find the third-highest distinct salary.
SELECT MAX(salary) AS third_highest_salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM employees
    )
);

-- Q12. Count employees earning more than 40000.
SELECT COUNT(*) AS employee_count
FROM employees
WHERE salary > 40000;
