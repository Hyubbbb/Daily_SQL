/*
Leetcode 3421. Find Students Who Improved
https://leetcode.com/problems/find-students-who-improved/description/
*/

SELECT s1.student_id, s1.subject, s1.first_score, s2.latest_score
FROM (
    SELECT DISTINCT ON (student_id, subject)
        student_id, subject, score as first_score, exam_date as first_exam
    FROM Scores
    ORDER BY student_id, subject, exam_date
) as s1
INNER JOIN (
    SELECT DISTINCT ON (student_id, subject)
        student_id, subject, score as latest_score, exam_date as last_exam
    FROM Scores
    ORDER BY student_id, subject, exam_date DESC
) as s2
    ON s1.student_id = s2.student_id AND s1.subject = s2.subject
WHERE s2.latest_score > s1.first_score

-- with t1 as(select student_id, subject,
-- first_value(score) over (partition by student_id, subject order by exam_date) as first_score,
-- first_value(score) over (partition by student_id, subject order by exam_date desc) as latest_score
-- from Scores)

-- select distinct * from t1
-- where first_score < latest_score
-- order by student_id, subject