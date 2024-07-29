-- [PROGRAMMERS] GROUP BY > 조건에 맞는 사원 정보 조회하기

-- LIMIT을 사용하지 않은 풀이
SELECT s.SCORE, e.EMP_NO, e.EMP_NAME, e.POSITION, e.EMAIL
FROM HR_EMPLOYEES e,
     (SELECT EMP_NO, SUM(SCORE) SCORE
      FROM HR_GRADE
      WHERE YEAR = 2022
      GROUP BY EMP_NO) s
WHERE e.EMP_NO = s.EMP_NO
  AND s.SCORE = (SELECT MAX(m.SCORE)
                 FROM (SELECT EMP_NO, SUM(SCORE) SCORE
                       FROM HR_GRADE
                       WHERE YEAR = 2022
                       GROUP BY EMP_NO) m);

-- LIMIT을 사용한 풀이
SELECT s.SCORE, e.EMP_NO, e.EMP_NAME, e.POSITION, e.EMAIL
FROM HR_EMPLOYEES e, (SELECT EMP_NO, SUM(SCORE) SCORE
                      FROM HR_GRADE
                      WHERE YEAR = 2022
                      GROUP BY EMP_NO) s
WHERE e.EMP_NO = s.EMP_NO
ORDER BY 1 DESC LIMIT 1;
