SELECT 
   COUNT(*) AS users
FROM user_info AS ui
WHERE 1=1
   ui.age IS NULL
