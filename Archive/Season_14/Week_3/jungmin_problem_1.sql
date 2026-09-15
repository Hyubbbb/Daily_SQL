-- https://datalemur.com/questions/laptop-mobile-viewership
SELECT
    SUM(CASE
            WHEN device_type = 'laptop'
                THEN 1
        END) AS laptop_views,
    SUM(CASE
            WHEN device_type IN ('tablet', 'phone')
                THEN 1
        END) AS mobile_views
FROM viewership;
