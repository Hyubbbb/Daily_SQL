SELECT
    member_id,
    member_name,
    gender,
    date_of_birth
FROM member_profile
WHERE 1=1
    AND MONTH(date_of_birth) = 3
    AND gender = 'w'
    AND tlno IS NOT NULL
ORDER BY member_id;
