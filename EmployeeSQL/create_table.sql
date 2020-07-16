-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE titles (
    title_id VARCHAR(30)   NOT NULL,
    title VARCHAR(30)   NOT NULL,
    CONSTRAINT pk_titles PRIMARY KEY (
        title_id
     )
);

CREATE TABLE Departments (
    dept_no VARCHAR(30)   NOT NULL,
    dept_name VARCHAR(30)   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE Employees (
    emp_no INTEGER   NOT NULL,
    emp_title_id VARCHAR   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date DATE   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE Salaries (
    emp_no INTEGER   NOT NULL,
    salary NUMERIC(10,2)   NOT NULL,
    CONSTRAINT pk_Salaries PRIMARY KEY (
        emp_no
     )
);


CREATE TABLE dept_manager (
    dept_no VARCHAR(30)   NOT NULL,
    emp_no INTEGER   NOT NULL,
    CONSTRAINT pk_dept_manager PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE dept_emp (
    emp_no INTEGER   NOT NULL,
    dept_no VARCHAR(30)   NOT NULL,
    CONSTRAINT pk_dept_emp PRIMARY KEY (
        emp_no,dept_no
     )
);




ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY (dept_no) 
REFERENCES Departments (dept_no);

ALTER TABLE Employees ADD CONSTRAINT fk_Employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES  titles (title_id);



