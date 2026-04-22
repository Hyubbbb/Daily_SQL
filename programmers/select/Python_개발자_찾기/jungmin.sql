SELECT
    id,
    email,
    first_name,
    last_name
FROM developer_infos
WHERE 1=1
    AND 'python' IN (skill_1, skill_2, skill_3)
ORDER BY id;
