-- 정규표현식 제대로 알아보좌...
SELECT id,
       REGEXP_SUBSTR(log_entry, '^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}') AS ip_address,
       REGEXP_SUBSTR(log_entry, '\[[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}\]') AS timestamp,
       REGEXP_SUBSTR(log_entry, '" [0-9]{3} ') AS status_code
FROM access_logs;