SELECT id, name, phone,
       CASE 
           WHEN phone REGEXP '^02-[0-9]{3,4}-[0-9]{4}$' THEN 
               CONCAT('02-', 
                     LPAD(REGEXP_SUBSTR(phone, '[0-9]{3,4}', 1, 1), 4, '0'),
                     '-',
                     REGEXP_SUBSTR(phone, '[0-9]{4}$'))
           WHEN phone REGEXP '^0[0-9]{1,2}-[0-9]{3,4}-[0-9]{4}$' THEN phone
           ELSE '형식 오류'
       END AS normalized_phone
FROM customer_data;