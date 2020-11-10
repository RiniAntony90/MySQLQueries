/* Average salary of a department */

select b.dept_no, b.dept_name, b.avg_sal, b.rank_sal from
(select a.emp_no, a.dept_no, a.dept_name, a.avg_sal, dense_rank()over(order BY a.avg_sal DESC) AS rank_sal from
(select s.emp_no,d.dept_no, d.dept_name, AVG(s.salary)OVER(partition BY d.dept_name) AS avg_sal FROM 
salaries s JOIN dept_emp de ON s.emp_no=de.emp_no 
JOIN departments d ON de.dept_no=d.dept_no
WHERE YEAR(s.to_date)='9999' AND YEAR(de.to_date)='9999'
ORDER BY avg_sal DESC)a)b
GROUP BY b.dept_name; 