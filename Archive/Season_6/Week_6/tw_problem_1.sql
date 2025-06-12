-- 캐치했어야 하는 원리:
-- End_Date에 하나도 겹치지 않는 Start_Date = 프로젝트의 시작일
-- Start_Date에 하나도 겹치지 않는 End_Date = 프로젝트의 종료일 (단, 최솟값을 찾아줘야 프로젝트 성립)

SELECT Start_Date, MIN(End_Date)
FROM (SELECT Start_Date
      FROM Projects
      WHERE Start_Date NOT IN (SELECT End_Date FROM Projects)) a CROSS JOIN
     (SELECT End_Date
      FROM Projects
      WHERE End_Date NOT IN (SELECT Start_Date FROM Projects)) b
WHERE Start_Date < End_Date
GROUP BY Start_Date
ORDER BY DATEDIFF(MIN(End_Date), Start_Date), Start_Date
