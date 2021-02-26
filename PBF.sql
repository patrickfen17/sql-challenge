-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no AS "Employee Number", employees.last_name AS "Last Name", 
employees.first_name AS "First Name", employees.sex AS "Sex", salaries.salary AS "Salary" 
FROM employees
JOIN salaries on employees.emp_no=salaries.emp_no 

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name AS "First Name", last_name AS "Last Name", hire_date
FROM employees
WHERE hire_date >= '19860101' AND hire_date < '19861231';

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
SELECT dm.dept_no AS "Department Number", d.dept_name AS "Department Name", 
dm.emp_no as "Managers Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name"
FROM employees AS e
JOIN dept_manager AS dm 
ON (e.emp_no=dm.emp_no)
	JOIN departments AS d
	ON (dm.dept_no=d.dept_no);

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no as "Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name", d.dept_name AS "Department Name"
FROM employees AS e
JOIN dept_emp AS de 
ON (e.emp_no=de.emp_no)
	JOIN departments AS d
	ON (de.dept_no=d.dept_no);

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name AS "First Name", last_name AS "Last Name", sex AS "Sex"
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no as "Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name", d.dept_name AS "Department Name"
FROM employees AS e
JOIN dept_emp AS de 
ON (e.emp_no=de.emp_no)
	JOIN departments AS d
	ON (de.dept_no=d.dept_no)
WHERE d.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, 
-- and department name.
SELECT e.emp_no as "Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name", d.dept_name AS "Department Name"
FROM employees AS e
JOIN dept_emp AS de 
ON (e.emp_no=de.emp_no)
	JOIN departments AS d
	ON (de.dept_no=d.dept_no)
WHERE d.dept_name IN ('Sales', 'Development');

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name AS "Last Name", COUNT(last_name) AS "count" 
FROM employees
GROUP BY last_name 
ORDER BY "count" DESC;

