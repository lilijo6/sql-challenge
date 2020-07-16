--List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT e.emp_no AS "employee number", 
e.last_name AS "last name",
e.first_name AS "first name",
e.sex AS "sex",
s.salary AS "salary"
FROM Employees AS e
INNER JOIN salaries AS s
ON e.emp_no=s.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.

SELECT 
	first_name AS "first name",
	last_name AS "last name",
	hire_date AS "hire date"
FROM employees
WHERE date_part('year',hire_date)=1986;

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT 
	d.dept_no AS "department number",
	d.dept_name AS "department name",
	dm.emp_no AS "manager employee number",
	e.last_name AS "last name",
	e.first_name AS "first name"
FROM Employees AS e
INNER JOIN dept_manager AS dm
ON e.emp_no=dm.emp_no
INNER JOIN departments AS d
ON d.dept_no=dm.dept_no;
	
--List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT 
	de.emp_no AS "employee number",
	e.last_name AS "last name",
	e.first_name AS "first name",
	d.dept_name AS "department name"
FROM Employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no=de.emp_no
INNER JOIN departments AS d
ON d.dept_no=de.dept_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT 
	first_name AS "First name",
	last_name AS "Last name",
	sex AS "Sex"
FROM Employees
WHERE (INITCAP(first_name)='Hercules' AND INITCAP(last_name) LIKE 'B%');

--List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT 
	de.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	d.dept_name AS "Department Name"
FROM employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no=de.emp_no
INNER JOIN departments AS d
ON d.dept_no=de.dept_no
where lower(d.dept_name)='sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT 
	de.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	d.dept_name AS "Department Name"
FROM employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no=de.emp_no
INNER JOIN departments AS d
ON d.dept_no=de.dept_no
WHERE LOWER(d.dept_name) IN ('sales','development');


--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT 
	last_name AS "Last name",
COUNT(*) AS "Count" 
FROM employees
GROUP BY last_name 
ORDER BY COUNT (*) DESC;