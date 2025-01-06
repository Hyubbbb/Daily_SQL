WITH sales_TB AS(
SELECT developer_id,
      platform_id,
      SUM(sales_eu+sales_jp+sales_na+sales_other) AS sales
FROM games
GROUP BY developer_id, platform_id)

SELECT C.name AS developer,
      P.name AS platform,
      S.sales  
FROM sales_TB S
JOIN (SELECT developer_id, platform_id, MAX(sales) AS sales
      FROM sales_TB
      GROUP BY developer_id) SMAX
    ON S.developer_id=SMAX.developer_id AND S.sales= SMAX.sales
JOIN companies C ON S.developer_id=C.company_id
JOIN platforms P ON S.platform_id=P.platform_id
