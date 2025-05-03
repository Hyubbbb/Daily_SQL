-- 사용자별 데이터 액세스 패턴을 분석하는 쿼리
SELECT
    user_name,
    table_accessed,
    access_type,
    COUNT(*) as access_count,
    MIN(access_time) as first_access,
    MAX(access_time) as last_access
FROM database_access_logs
WHERE access_time > CURRENT_DATE - INTERVAL '30 days'
GROUP BY user_name, table_accessed, access_type
ORDER BY user_name, access_count DESC;
