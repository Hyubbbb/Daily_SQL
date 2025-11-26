-- 입소/퇴소의 중성화 상태가 바뀐 동물만 추출
-- 중성화는 되돌릴 수 없고, 성별은 바뀌지 않아 WHERE 절에서 != 으로 변경된 값만 찾음
SELECT 
    ai.animal_id,
    ai.animal_type,
    ai.name
FROM animal_ins AS ai
    JOIN animal_outs AS ao
        ON ai.animal_id = ao.animal_id
WHERE 1=1
    AND ai.sex_upon_intake != ao.sex_upon_outcome
ORDER BY ai.animal_id;
