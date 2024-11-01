SELECT start_date, IFNULL(date3, end_date) AS date3
FROM (SELECT start_date, end_date, date2, LEAD(date2) OVER (ORDER BY date2) AS date3
        FROM (SELECT start_date, end_date, LAG(end_date) OVER (ORDER BY end_date) AS date2
                FROM projects) p
        WHERE date2 is NULL OR start_date != date2) p2
ORDER BY DATEDIFF(IFNULL(date3, end_date), start_date), start_date;
