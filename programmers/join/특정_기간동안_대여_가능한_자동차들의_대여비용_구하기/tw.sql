-- 1) 종류 = "세단" or "SUV" | 테이블1, 테이블3
-- 2) 대여 가능 기간: 2022-11-01 ~ 2022-11-30 | 테이블2
-- 3) 50만원 <= (30일 대여 금액) < 200만원 | 테이블1, 테이블3
WITH condition1 AS (
    SELECT *
    FROM car_rental_company_car
    WHERE 1=1
        AND car_type = "세단"
        OR car_type = "SUV"
), condition2 AS (
    SELECT
        c1.car_id,
        c1.car_type,
        c1.daily_fee,
        -- c1.options,
        c2.history_id,
        c2.start_date,
        c2.end_date
    FROM condition1 AS c1
        LEFT JOIN car_rental_company_rental_history AS c2
            ON c1.car_id = c2.car_id
    WHERE 1=1
        AND c1.car_id NOT IN ( 
            SELECT car_id
            FROM car_rental_company_rental_history
            WHERE 1=1
                AND end_date >= '2022-11-01'
                AND start_date <= '2022-12-01'
            )
    GROUP BY c1.car_id 
    ORDER BY 1
), condition3 AS (
    SELECT
        c2.car_id,
        c2.car_type,
        c2.daily_fee,
        -- c2.history_id,
        c3.plan_id,
        -- c3.car_type,
        c3.duration_type,
        c3.discount_rate,
        (daily_fee * (1 - discount_rate / 100) * 30) AS "fee"
    FROM condition2 AS c2
        JOIN car_rental_company_discount_plan AS c3
            ON c2.car_type = c3.car_type
    WHERE 1=1
        AND duration_type = '30일 이상'
    ORDER BY 1, 6
)

SELECT
    car_id,
    car_type,
    ROUND(fee, 0) AS 'fee'
FROM condition3
WHERE 1=1
    AND fee BETWEEN 500000 AND 2000000
ORDER BY fee DESC, car_type ASC, car_id DESC;
