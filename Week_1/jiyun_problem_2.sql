-- ㅠㅠ 이건 아니지

SELECT S1.submission_date,
        (SELECT COUNT(DISTINCT hacker_id) FROM submissions S2
            WHERE S1.submission_date = s2.submission_date
                AND (SELECT COUNT(DISTINCT submission_date) FROM submissions S3 
                        WHERE S3.submission_date < S1.submission_date AND S2.hacker_id = S3.hacker_id) 
                    = DATEDIFF(S1.submission_date,'2016-03-01')) as unique_hacker,
                    -- 특정 행의 submission_date 이전에 매일 제출했어야 하니까 특정 행의 날짜에서 시작날짜(2016-03-01)을 뺀 값이 지금까지 제출했던 날짜수와 동일해야 함
        (SELECT hacker_id FROM submissions S2
            WHERE S2.submission_date = S1.submission_date
            GROUP BY hacker_id
            ORDER BY COUNT(submission_id) DESC, hakcer_id ASC LIMIT 1 ) AS HID,
                                                    -- 이때 LIMIT가 각 날짜별로 상위 1개를 반환
        (SELECT name FROM hackers hac
            WHERE HID = hac.hacker_id )      

FROM (SELECT DISTINCT submission_date FROM submissions) S1
GROUP BY submission_date
ORDER BY submission_date
