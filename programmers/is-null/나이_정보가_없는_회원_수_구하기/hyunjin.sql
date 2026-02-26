--- 나이 정보가 없는 회원 수 구하기
SELECT 
   COUNT(*) AS users
FROM user_info AS ui
WHERE 1=1
   ui.age IS NULL

