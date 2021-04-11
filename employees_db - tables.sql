--Drop Tables
DROP TABLE departments;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE employees;
DROP TABLE salaries;
DROP TABLE titles;

--Import all CSV File into tables
Create Table "departments"(
"dept_no" VARCHAR NOT NULL,
"dept_name" VARCHAR NOT NULL,
PRIMARY KEY ("dept_no"));

Create Table "dept_emp"(
"emp_no" INT NOT NULL,
"dept_no" VARCHAR NOT NULL,
FOREIGN KEY ("emp_no")
REFERENCES employees ("emp_no"),
FOREIGN KEY ("dept_no")
REFERENCES "departments" ("dept_no"));

Create Table "dept_manager"(
"dept_no" VARCHAR NOT NULL,
"emp_no" INT NOT NULL,
FOREIGN KEY ("dept_no")
REFERENCES "departments" ("dept_no"),
FOREIGN KEY ("emp_no")
REFERENCES "employees" ("emp_no"));

CREATE TABLE "employees"(
"emp_no" INT NOT NULL,
"emp_title_id" VARCHAR NOT NULL,
"birth_date" DATE NOT NULL DEFAULT CURRENT_DATE,
"first_name" VARCHAR NOT NULL,
"last_name" VARCHAR NOT NULL,
"sex" VARCHAR NOT NULL,
"hire_date" DATE NOT NULL DEFAULT CURRENT_DATE,
PRIMARY KEY ("emp_no"),
FOREIGN KEY ("emp_title_id")
REFERENCES "titles" ("title_id"));

Create Table "salaries"(
"emp_no" INT NOT NULL,
"salary" INT NOT NULL,
FOREIGN KEY ("emp_no")
REFERENCES "employees" ("emp_no"));

Create Table "titles"(
"title_id" VARCHAR NOT NULL,
"title" VARCHAR NOT NULL,
PRIMARY KEY ("title_id"));

-- Confirming query to get table data
Select * from departments;
Select * from dept_emp;
Select * from dept_manager;
Select * from employees;
Select * from salaries;
Select * from titles;
