-- D 1

SELECT e.emp_no, 
       e.first_name, 
	   e.last_name,
	   ti.title,
	   ti.from_date,
	   ti.to_date
INTO retirement_titles
FROM employees AS e
LEFT JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (r.emp_no) r.emp_no, r.first_name, r.last_name, r.title
-- INTO unique_titles
FROM retirement_titles AS r
ORDER BY r.emp_no, r.to_date DESC;

SELECT COUNT (u.title), u.title
INTO retiring_titles
FROM unique_titles AS u
GROUP BY u.title
ORDER BY count(u.title) DESC;

-- D 2
SELECT DISTINCT ON (e.emp_no)
       e.emp_no,
       e.first_name, 
	   e.last_name,
	   e.birth_date,
	   de.from_date,
	   de.to_date,
	   ti.title
-- INTO birth_date
FROM employees AS e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS ti
ON (de.emp_no = ti.emp_no)
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-01-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;
