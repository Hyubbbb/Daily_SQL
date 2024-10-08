/* 프로그래머스 PCSQL 모의고사 2번 가장 많이 출제된 알고리즘 유형
https://campus.programmers.co.kr/tryouts/145420/challenges */

SELECT GR.ALGORITHM_TYPE
FROM (
    SELECT ALGORITHM_TYPE, COUNT(ALGORITHM_TYPE) AS CNT
    FROM PROBLEMS
    GROUP BY ALGORITHM_TYPE
    ORDER BY CNT DESC, ALGORITHM_TYPE
) AS GR
LIMIT 1