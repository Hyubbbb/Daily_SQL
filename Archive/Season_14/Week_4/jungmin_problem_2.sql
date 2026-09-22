-- https://datalemur.com/questions/duplicate-job-listings
WITH job_cnt AS (
    SELECT
        company_id,
        title,
        description,
        COUNT(job_id) AS job_count
    FROM job_listings
    GROUP BY company_id, title, description
)

SELECT COUNT(company_id) AS duplicate_companies
FROM job_cnt
WHERE 1=1
    AND job_count > 1;
