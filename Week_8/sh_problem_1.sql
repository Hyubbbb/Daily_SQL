-- datetime에서 date로 형변환
SELECT animal_id, name, date_format(datetime, '%Y-%m-%d')
FROM animal_ins