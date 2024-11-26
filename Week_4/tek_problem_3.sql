/* LeetCode 1280. Students and Examinations
https://leetcode.com/problems/students-and-examinations/description/?envType=study-plan-v2&envId=top-sql-50 */


-- select DISTINCT e.student_id, stu.student_name, e.subject_name
-- --  COUNT(stu.student_name) OVER (partition by stu.student_name)
-- from Students as stu
-- left join Examinations as e
--     on stu.student_id = e.student_id
-- -- left join Subjects as sub
-- --     on e.subject_name = sub.subject_name

select j.student_id, j.student_name, j.subject_name, IFNULL(ee.attended_exams, 0) as attended_exams
from (
    select distinct *
    from subjects as sub
    cross join students as stu
) as j
left join (
    select e.student_id, e.subject_name, count(e.student_id) as attended_exams
    from examinations as e
    group by e.student_id, e.subject_name
) ee
on j.student_id = ee.student_id and j.subject_name = ee.subject_name
order by j.student_id, j.subject_name
