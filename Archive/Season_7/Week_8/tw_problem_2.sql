SELECT
  DATE_FORMAT(trans_date, '%Y-%m') AS month,
  country,
  COUNT(id) AS trans_count,
  SUM(amount) AS trans_total_amount,
  SUM(state = 'approved') AS approved_count,
  SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM Transactions
GROUP BY month, country

-- SELECT문 "안에서" 바로바로 CASE WHEN 사용 가능한 사실 자꾸 잊지말자
