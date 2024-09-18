--//List the employee number, last name, first name, sex, and salary of each employee//---
SELECT 
  t1.emp_no             AS "Employee number",
  t1.last_name          AS "Last Name",
  t1.first_name         AS "First Name",
  t1.sex                AS "Sex",
  t2.salary             AS "Salary"
  
  FROM employees              t1
  INNER JOIN salaries         t2
  ON t2.emp_no = t1.emp_no
  ORDER BY t1.emp_no

  --//List the first name, last name, and hire date for the employees who were hired in 1986//--

SELECT 
  t1.first_name         AS "First Name",
  t1.last_name          AS "Last Name",
  t1.hire_date          AS "Hire Date"
 
  FROM employees              t1
  WHERE t1.hire_date BETWEEN '1986-01-01' AND '1986-12-31'
  ORDER BY t1.hire_date


--//List the manager of each department along with their department number, department name, 
--employee number, last name, and first name// ---
  
SELECT 
 
  t1.first_name             AS "Manager Name",
  t1.last_name              AS "Last Name",
  t1.emp_no                 AS "Employee number",
  t2.dept_no                AS "Department number",
  t3.dept_name              AS "Department name"
 
 FROM employees                   t1
  INNER JOIN dept_manager         t2
  ON t2.emp_no = t1.emp_no
  RIGHT JOIN departments          t3 
  ON t3.dept_no = t2.dept_no
  WHERE t1.emp_title_id = 'm0001'
  ORDER BY t1.first_name

  --//List the department number for each employee along with that employee’s employee number, 
  --last name, first name, and department name//--------

  SELECT 
  
  t2.dept_no                AS "Department number",
  t1.emp_no                 AS "Employee number",
  t1.last_name              AS "Last Name",
  t1.first_name             AS "Employee Name",
  t3.dept_name              AS "Department Name"
 
 FROM employees                   t1
  INNER JOIN dept_manager         t2
  ON t2.emp_no = t1.emp_no
  RIGHT JOIN departments          t3 
  ON t3.dept_no = t2.dept_no
  ORDER BY t2.dept_no

-- // List first name, last name, and sex of each employee whose first name is Hercules and
--whose last name begins with the letter B//
  SELECT 

  t1.first_name             AS "Employee Name",
  t1.last_name              AS "Last Name",
  t1.sex                    As "Sex"
 
  FROM employees                   t1
 
  WHERE t1.first_name = 'Hercules' AND t1.last_name like 'B%'
  ORDER BY  t1.first_name 

  --//List each employee in the Sales department, including their employee number, 
  --last name, and first name //
  SELECT 

  t1.emp_no                 AS "Employee Number",
  t1.last_name              AS "Last Name",
  t1.first_name             As "Employee Name"
 
  FROM employees                   t1
  INNER JOIN dept_manager          t2
  ON t2.emp_no = t1.emp_no
  RIGHT JOIN departments           t3 
  ON t3.dept_no = t2.dept_no

  WHERE t3.dept_name = 'Sales' 
  ORDER BY  t1.emp_no 

-- //List each employee in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name // ----

SELECT 

  t1.emp_no                 AS "Employee Number",
  t1.last_name              AS "Last Name",
  t3.dept_name             As "Department Name"
 
  FROM employees                   t1
  INNER JOIN dept_manager          t2
  ON t2.emp_no = t1.emp_no
  RIGHT JOIN departments           t3 
  ON t3.dept_no = t2.dept_no

  WHERE t3.dept_name = 'Sales' OR t3.dept_name = 'Development'
  ORDER BY  t1.emp_no 

-- //List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name) // ----

SELECT 

  t1.last_name, COUNT(*)AS "Counts"
  FROM employees                   t1
  GROUP BY t1.last_name
  ORDER BY  "Counts" DESC





  