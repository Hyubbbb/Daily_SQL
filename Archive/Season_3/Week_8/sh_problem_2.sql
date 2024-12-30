-- 입양 시각 구하기(1)
SELECT hours as hour, count(hours)
FROM (SELECT hour(datetime) as hours
        FROM animal_outs
        WHERE hour(datetime)>=9 and hour(datetime)<20) as T
group by hours
order by hour asc