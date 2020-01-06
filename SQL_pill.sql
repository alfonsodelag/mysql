-- Insert 15 new employees:
INSERT INTO `employees` (`emp_no`, `birth_date`, `first_name`, `last_name`, `gender`, `hire_date`) VALUES
('1', '2000-01-01', 'Juan', 'De La Guardia', 'M', '2020-01-01'),
('2', '2000-01-01', 'Juan', 'De La Guardia', 'M', '2020-01-01'),
('3', '2000-01-01', 'Juan', 'De La Guardia', 'M', '2020-01-01'),
('4', '2000-01-01', 'Sara', 'De La Guardia', 'F', '2020-01-01'),
('5', '2000-01-01', 'Laura', 'De La Guardia', 'F', '2020-01-01'),
('6', '2000-01-01', 'Alfonso', 'De La Guardia', 'M', '2020-01-01'),
('7', '2000-01-01', 'Alfonso', 'De La Guardia', 'M', '2020-01-01'),
('8', '2000-01-01', 'Pedro', 'De La Guardia', 'M', '2020-01-01'),
('9', '2000-01-01', 'Juan', 'De La Guardia', 'M', '2020-01-01'),
('10', '2000-01-01', 'Camilo', 'De La Guardia', 'M', '2020-01-01'),
('11', '2000-01-01', 'Claudio', 'De La Guardia', 'M', '2020-01-01'),
('12', '2000-01-01', 'Isaac', 'De La Guardia', 'M', '2020-01-01'),
('13', '2000-01-01', 'Kevin', 'De La Guardia', 'M', '2020-01-01'),
('14', '2000-01-01', 'Jose', 'De La Guardia', 'M', '2020-01-01'),
('15', '2000-01-01', 'Erick', 'De La Guardia', 'M', '2020-01-01');

UPDATE `employees` SET first_name = LOWER( first_name), last_name = LOWER( last_name )

-- Insert 15 new employees salary:
INSERT INTO `titles` (`emp_no`, `title`, `from_date`, `to_date`) VALUES ('1', 'Business', '2016-11-01', NULL);
INSERT INTO `titles` (`emp_no`, `title`, `from_date`, `to_date`) VALUES ('2', 'Business', '2016-06-01', NULL);
INSERT INTO `titles` (`emp_no`, `title`, `from_date`, `to_date`) VALUES ('3', 'Business', '2016-11-01', NULL);
INSERT INTO `titles` (`emp_no`, `title`, `from_date`, `to_date`) VALUES ('4', 'Psychology', '2019-11-01', NULL);
INSERT INTO `titles` (`emp_no`, `title`, `from_date`, `to_date`) VALUES ('5', 'Business', '2016-08-01', NULL);
INSERT INTO `titles` (`emp_no`, `title`, `from_date`, `to_date`) VALUES ('6', 'Finance', '2016-11-01', NULL);
INSERT INTO `titles` (`emp_no`, `title`, `from_date`, `to_date`) VALUES ('7', 'Business', '2019-10-01', NULL);
INSERT INTO `titles` (`emp_no`, `title`, `from_date`, `to_date`) VALUES ('8', 'Psychology', '2016-11-01', NULL);
INSERT INTO `titles` (`emp_no`, `title`, `from_date`, `to_date`) VALUES ('9', 'Business', '2016-11-01', NULL);
INSERT INTO `titles` (`emp_no`, `title`, `from_date`, `to_date`) VALUES ('10', 'Programming', '2016-11-01', NULL);
INSERT INTO `titles` (`emp_no`, `title`, `from_date`, `to_date`) VALUES ('11', 'Business', '2019-11-01', NULL);
INSERT INTO `titles` (`emp_no`, `title`, `from_date`, `to_date`) VALUES ('12', 'Programming', '2016-11-01', NULL);
INSERT INTO `titles` (`emp_no`, `title`, `from_date`, `to_date`) VALUES ('13', 'Business', '2019-11-01', NULL);
INSERT INTO `titles` (`emp_no`, `title`, `from_date`, `to_date`) VALUES ('14', 'Psychology', '2016-11-01', NULL);
INSERT INTO `titles` (`emp_no`, `title`, `from_date`, `to_date`) VALUES ('15', 'Finance', '2019-11-01', NULL);

-- Insert 3 new departments
INSERT INTO `departments` (`dept_no`, `dept_name`) VALUES
('1', 'Accounting'),
('2', 'Human Resources'),
('3', 'Sales');

-- Change name of an employee
UPDATE employees SET first_name = 'Michael' WHERE first_name = 'Camilo' AND last_name = 'De La Guardia' AND birth_date = '2000-01-01';

-- Change all departments name
UPDATE departments SET dept_name = 'Business Strategy' WHERE dept_no = '1';
UPDATE departments SET dept_name = 'Finance' WHERE dept_no = '2';
UPDATE departments SET dept_name = 'Marketing' WHERE dept_no = '3';

-- Select all employees with a salary greater than 20,000
SELECT employees.*, salaries.salary 
FROM employees INNER JOIN salaries 
ON salaries.emp_no = employees.emp_no 
WHERE salaries.salary > 20000

-- Select all employees with a salary below 10,000
SELECT employees.*, salaries.salary 
FROM employees INNER JOIN salaries 
ON salaries.emp_no = employees.emp_no 
WHERE salaries.salary < 10000

-- Select all employees who have a salary between 14.00 and 50,000
SELECT employees.*, salaries.salary 
FROM employees INNER JOIN salaries 
ON salaries.emp_no = employees.emp_no 
WHERE salaries.salary > 14000 AND salaries.salary < 50000

-- Select TOTAL number of employees
SELECT COUNT( * ) AS total FROM employees

-- Select the titles of the year 2019
SELECT * FROM `titles` WHERE from_date >= '2019-01-01'

-- Change the first letter of first_name to Capital
SELECT CONCAT(UPPER( SUBSTRING( LOWER(first_name), 1, 1 ) ), SUBSTRING( LOWER(first_name), 2 )) AS Name FROM `employees`

-- Select the name, surname and name of the current department of each employee
SELECT 
	employees.first_name, 
    employees.last_name, 
    departments.dept_name
FROM `employees` 
INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no;

-- Select the name without any being repeated
SELECT DISTINCT employees.first_name FROM `employees`;

--Select the name, surname and number of times the employee has worked as a manager
SELECT first_name, last_name, COUNT( dept_manager.emp_no ) AS TIMES FROM `employees` INNER JOIN dept_manager ON dept_manager.emp_no = employees.emp_no GROUP BY dept_manager.emp_no;

-- Select the total number of employees who have worked in more than one department
SELECT COUNT( * ) AS TotalUser FROM (
	SELECT COUNT( * ) AS Times
	FROM `employees`
	INNER JOIN dept_manager
		ON dept_manager.emp_no = employees.emp_no
	GROUP BY dept_manager.emp_no
	HAVING COUNT( dept_manager.emp_no ) > 1
) AS TotalUser;

-- Eliminate all employees with a salary greater than 20,000
DELETE FROM employees 
WHERE employees.emp_no 
IN (
	SELECT employees.emp_no
	FROM employees
	INNER JOIN salaries
		ON salaries.emp_no = employees.emp_no
	WHERE salaries.salary > 20000
);

-- Remove the department that has more employees
DELETE
FROM departments
WHERE departments.dept_no IN (
    SELECT
        dept_no
    FROM `dept_emp`
    GROUP BY dept_no
    ORDER BY COUNT( * ) DESC
    LIMIT 1
);
