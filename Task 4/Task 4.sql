# Create an SQL stored procedure that will allow you to obtain the average male and female salary 
# per department within a certain salary range. Let this range be defined by two values the user can insert 
# when calling the procedure.

# First checking out min and max salary
SELECT MIN(salary) FROM t_salaries;

SELECT MAX(salary) FROM t_salaries;

DROP PROCEDURE IF EXISTS filter_salary;

DELIMITER $$
CREATE PROCEDURE filter_salary (IN p_min_salary FLOAT, IN p_max_salary FLOAT)
BEGIN 
SELECT 
	e.gender, 
    AVG(s.salary) AS avg_salary,
    d.dept_name
FROM
	t_salaries s
		JOIN
	t_employees e ON s.emp_no = e.emp_no
        JOIN
	t_dept_emp de ON e.emp_no = de.emp_no
        JOIN
	t_departments d ON de.dept_no = d.dept_no
	WHERE s.salary BETWEEN p_min_salary AND p_max_salary
GROUP BY d.dept_no, e.gender; 
END $$

DELIMITER ;

CALL filter_salary(50000, 90000);