-- NULL 처리하기
SELECT animal_type, IFNULL(name,"No name"), sex_upon_intake
FROM animal_ins
