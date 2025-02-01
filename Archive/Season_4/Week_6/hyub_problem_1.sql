-- https://solvesql.com/problems/flow-and-stock/
-- 연도별로 새롭게 소장하게 된 작품의 수와, 연도별 누적 소장 작품 수를 계산하는 쿼리
  -- 저량 지표에 변화가 없는 연도는 출력X, 소장 년도 정보가 없는 작품은 집계에서 제외

WITH TMP AS (
  SELECT
      strftime('%Y', acquisition_date) AS y
    , COUNT(*) AS f
  FROM artworks
  WHERE strftime('%Y', acquisition_date) IS NOT NULL
  GROUP BY strftime('%Y', acquisition_date))


SELECT
    y AS 'Acquisition year'
  , f AS 'New acquisitions this year (Flow)'
  , SUM(f) OVER (ORDER BY y) AS 'Total collection size (Stock)'
FROM TMP
ORDER BY 1 ASC
