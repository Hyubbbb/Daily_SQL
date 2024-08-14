-- 코드를 작성해주세요

select id, email, first_name, last_name
From DEVELOPER_INFOS
where skill_1 = 'Python' or skill_2 = 'Python' or skill_3 = 'Python'
order by id;
