-- https://solvesql.com/problems/good-days-for-a-seoulforest-picnic/
SELECT
    measured_at AS good_day
FROM measurements
WHERE 1=1
    AND pm2_5 <= 9
    AND measured_at >= '2022-12-01'
    AND measured_at <= '2022-12-31'
ORDER BY good_day;
