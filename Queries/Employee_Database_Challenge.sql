-- Deliverable 1
-- Retirement Titles
-- Retrieve the emp_no, first_name, and last_name from Employees table
-- Retrieve the title, from_date, and to_date columns from Titles table
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
-- Create new INTO clause
INTO retirement_titles
FROM employees AS e
RIGHT JOIN titles AS t
ON (e.emp_no = t.emp_no)
-- Filter data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then order by employee number
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Retrieve the employee number, first and last name, and title columns from the Retirement Titles table
-- Use DISTINCT ON statement to retrieve the first occurence of the employee number for each set of rows
SELECT DISTINCT ON (rt.emp_no)
	rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
-- Create Unique Titles table using the INTO clause
INTO unique_titles
FROM retirement_titles AS rt
-- Exclude employees that have already left the company
WHERE (rt.to_date = '9999-01-01')
-- Sort Unique Titles table in ascending order by employee number and descending order by the last date of the most recent title
ORDER BY (rt.emp_no), (rt.to_date) DESC;

-- Retrieve the number of titles from the Unique titles table
SELECT COUNT(ut.title), ut.title
-- Create a Retiring Titles table to hold the required information
INTO retiring_titles
FROM unique_titles AS ut
-- Group the table by title
GROUP BY ut.title
-- Sort the Count column in descending order
ORDER BY COUNT(ut.title) DESC

-- Deliverable 2
-- Retrieve the emp_no, first_name, last_name, and birth_date columns from the employees table
-- Retrieve the from_date and to_date columns from the dept_emp table
-- Retrieve the title from the titles table
SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
-- Create new table using INTO
INTO mentoship_eligibility
FROM employees AS e
-- Join employees and dept_emp tables on the primary key
FULL JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
-- Join employees and titles tables on the primary key
FULL JOIN titles AS t
ON (e.emp_no = t.emp_no)
-- Filter the data to all current employees
WHERE (de.to_date = '9999-01-01')
-- Filter the data on the birth date
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
--Order the table by employee number
ORDER BY e.emp_no;