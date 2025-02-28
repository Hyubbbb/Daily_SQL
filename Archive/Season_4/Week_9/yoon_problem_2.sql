UPDATE 급여지급 T 
    SET T.월급여 = (
            SELECT S.월급여
            FROM 사원 S
            WHERE S.사원번호 = T.사원번호
            )
WHERE T.급여월 = '201101'
AND EXISTS (
        SELECT 1
        FROM 사원 S
        WHERE S.사원번호 = T.사원번호
        AND S.부서코드 = '30'
        )
