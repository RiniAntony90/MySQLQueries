/*Sum of salary across departments for year 2010*/

select a.dept_no, a.sum_sal, rank()over(order by a.sum_sal desc) as rank_sal from (select de.dept_no, sum(s.salary) as sum_sal
 from salaries s JOIN dept_emp de ON 
s.emp_no=de.emp_no
where YEAR(s.from_date) <2010 AND 2010<YEAR(s.to_date) AND YEAR(de.from_date) <2010 AND 2010<YEAR(de.to_date)
GROUP BY de.dept_no
ORDER BY sum(s.salary) DESC) a;