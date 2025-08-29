-- 동점자 처리 방식의 차이
SELECT 
    student_name,
    score,
    RANK() OVER (ORDER BY score DESC) as rank_with_tie,
    ROW_NUMBER() OVER (ORDER BY score DESC) as row_number_unique,
    DENSE_RANK() OVER (ORDER BY score DESC) as dense_rank_continuous
FROM exam_results
ORDER BY score DESC;