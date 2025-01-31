-- 물고기 종류 별 대어 찾기
SELECT ID, FISH_NAME, LENGTH
FROM ( SELECT ID, A.fish_type, length
        FROM (SELECT max(length) as max_len , fish_type
                FROM fish_info
                WHERE length is not null
                group by fish_type) as T, fish_info as A
        WHERE T.max_len=A.length and T.fish_type=A.fish_type) as T join fish_name_info as A on T.fish_type=A.fish_type
ORDER BY ID

