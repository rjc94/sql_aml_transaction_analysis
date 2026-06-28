SELECT
  Date,
  Receiver_account,
  COUNT(DISTINCT Sender_account) as senders_account_unique,
  COUNT(*) as total_deposits_received,
  SUM(usd_received) as total_funds_collected,
  MAX(Is_laundering) as actual_fraud_flag
FROM `sql-master-492623.AML_Analysis.AML_USD`
GROUP BY Date, Receiver_account
HAVING COUNT(DISTINCT Sender_account) >= 3
ORDER BY senders_account_unique DESC;
