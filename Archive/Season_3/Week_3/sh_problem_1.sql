-- 조건에 맞는 사원 정보 조회하기
select t.total_score as score, t.emp_no, b.emp_name, b.position, b.email
from hr_department as a left join hr_employees as b on a.dept_id=b.dept_id left join 
(SELECT emp_no, sum(score) as total_score
FROM hr_grade
WHERE year=2022
group by emp_no) as t on b.emp_no=t.emp_no
where t.total_score in (select max(total_score) as max_score from 
(SELECT emp_no, sum(score) as total_score
FROM hr_grade
WHERE year=2022
group by emp_no) as t)
