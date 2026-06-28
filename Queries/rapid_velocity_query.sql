SELECT
  Date,
  Sender_account,
  COUNT(*) as transaction_count_daily,
  SUM(usd_received) as total_volume_moved_daily,
  MAX(Is_laundering) as actual_fraud_flag
FROM `sql-master-492623.AML_Analysis.AML_USD`
GROUP BY Date, Sender_account
  -- filters for accounts with 10+ transactions in a single day
HAVING COUNT(*) >= 10
ORDER BY transaction_count_daily DESC;
