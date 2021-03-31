# Task 01: Create a visualization that provides a breakdown between the male and female 
# employees working in the company each year, starting from 1990. 

# We will choose from_date instead of hire_date because an employee could have changed
# his/her dept during their career. 
SELECT 
	emp_no, from_date, to_date
FROM 
	t_dept_emp;

SELECT distinct
	emp_no, from_date, to_date
FROM 
	t_dept_emp;

# The steps to check if there are any multipale record of same value
# As it can be seen that both yeild for "331725 rows"

SELECT
	YEAR(de.from_date) AS Calendar_Year,
	e.gender,
    COUNT(e.emp_no) AS number_of_employees
FROM
	t_employees e
		JOIN
	t_dept_emp de ON de.emp_no = e.emp_no
GROUP BY Calendar_Year, e.gender
HAVING Calendar_year >= 1990; 
