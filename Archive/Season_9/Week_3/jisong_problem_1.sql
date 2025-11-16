https://school.programmers.co.kr/learn/courses/30/lessons/131124

SELECT MEMBER_NAME
     , REVIEW_TEXT
     , DATE_FORMAT(REVIEW_DATE, '%Y-%m-%d') AS "REVIEW_DATE"
FROM REST_REVIEW r
INNER JOIN MEMBER_PROFILE m
ON r.MEMBER_ID = m.MEMBER_ID
WHERE r.MEMBER_ID = (SELECT MEMBER_ID
                     FROM REST_REVIEW
                     GROUP BY MEMBER_ID
                     ORDER BY COUNT(REVIEW_SCORE) DESC
                     LIMIT 1)
ORDER BY REVIEW_DATE, REVIEW_TEXT
출처: https://shuu.tistory.com/202 [All about IT:티스토리]
