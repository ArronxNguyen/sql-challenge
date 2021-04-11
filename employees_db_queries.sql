--Analysis Section - Once you have a complete database, do the following:

--List the following details of each employee: employee number, last name, first name, sex, and salary.
Select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
From employees
INNER JOIN salaries on employees.emp_no = salaries.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
--Need to fix the date issue in employees
Select first_name, last_name, hire_date
From employees
Where hire_date BETWEEN '01/01/1986' AND '01/01/1987';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
Select departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name 
From departments
INNER JOIN dept_manager on departments.dept_no = dept_manager.dept_no
INNER JOIN employees on dept_manager.emp_no = employees.emp_no;


--List the department of each employee with the following information: employee number, last name, first name, and department name.
Select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
From dept_emp
INNER JOIN employees on dept_emp.emp_no = employees.emp_no
INNER JOIN departments on departments.dept_no = dept_emp.dept_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
Select first_name, last_name
From employees
WHERE first_name = 'Hercules'
And last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
Select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
From dept_emp
INNER JOIN employees on dept_emp.emp_no = employees.emp_no
INNER JOIN departments on departments.dept_no = dept_emp.dept_no
Where
departments.dept_name ='Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
Select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
From dept_emp
INNER JOIN employees on dept_emp.emp_no = employees.emp_no
INNER JOIN departments on departments.dept_no = dept_emp.dept_no
Where
departments.dept_name ='Sales' 
OR 
departments.dept_name ='Development' 

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name,
COUNT (last_name) as "Last Name Frequency"
FROM employees
GROUP BY last_name
ORDER BY COUNT (last_name) DESC;

-- BONUS SECTION: Create a view to be used for the BONUS section in Jupyter Notebook
Create view combined as
Select salaries.emp_no, salaries.salary, titles.title_id, titles.title, employees.emp_title_id	
from salaries
INNER JOIN employees on salaries.emp_no = employees.emp_no
INNER JOIN titles on employees.emp_title_id = titles.title_id;

--Check view
Select * from combined;




