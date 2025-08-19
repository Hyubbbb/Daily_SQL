-- 상품 설명이 NULL이거나 빈값인 경우 기본 문구로 대체
SELECT 
    product_name,
    price,
    -- NULLIF로 빈 문자열을 NULL로 변환 후 COALESCE 적용
    COALESCE(NULLIF(TRIM(description), ''), '상품 설명이 준비중입니다') as clean_description,
    
    -- 또는 CASE로 처리
    CASE 
        WHEN description IS NULL OR TRIM(description) = '' THEN '상품 설명이 준비중입니다'
        ELSE description 
    END as description_case
FROM products;