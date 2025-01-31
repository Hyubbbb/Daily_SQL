-- 부서별 평균 연봉 조회하기
SELECT A.dept_id, dept_name_en, round(avg_sal, 0) as avg_sal
FROM hr_department as A join (SELECT dept_id, avg(sal) as AVG_SAL
                             FROM hr_employees
                             GROUP BY dept_id) as B on A.dept_id=B.dept_id
order by avg_sal desc
