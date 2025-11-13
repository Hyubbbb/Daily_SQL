WITH available_cars AS (
    SELECT 
        c.car_id, 
        c.car_type,
        # 대여 가능 차량의 요금들을 미리 계산
        FLOOR(c.daily_fee *30 * (1 - dp.discount_rate / 100)) AS fee
    
    FROM car_rental_company_car AS c
        # 대여기간(30일)에 대한 정보 있는 것들만 조인
        INNER JOIN car_rental_company_discount_plan AS dp
            ON dp.car_type = c.car_type
            AND dp.duration_type = '30일 이상'
    
        LEFT JOIN car_rental_company_rental_history AS h
            ON h.car_id = c.car_id
            # 대여 가능한 날짜들 조건 걸기
                AND h.end_date >= '2022-11-01'
                AND h.start_date <= '2022-11-30'
    
    WHERE 1=1
        AND c.car_type IN ('세단','SUV')
        AND h.history_id IS NULL # 대여기록 없는 차들 대여하기 위함
)

# with 구문에서 계산된 결과로 최종 금액 범위 구하기 
SELECT 
    ac.car_id, 
    ac.car_type, 
    ac.fee
FROM available_cars AS ac
WHERE 1=1
    AND ac.fee >= 500000 # 50만원 이상일 경우
    AND ac.fee < 2000000 # 200만원 이하일 경우
ORDER BY ac.fee DESC, ac.car_type ASC, ac.car_id DESC;
