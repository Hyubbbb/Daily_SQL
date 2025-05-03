-- 지난 24시간 동안 실패한 작업과 오류 패턴 분석
SELECT
    job_name,
    COUNT(*) as failure_count,
    MAX(start_time) as last_failure,
    STRING_AGG(DISTINCT error_message, ' | ') as error_messages
FROM etl_job_runs
WHERE status = 'FAILED'
  AND start_time > NOW() - INTERVAL '24 hours'
GROUP BY job_name
ORDER BY failure_count DESC;
