SELECT
  Date,
  Sender_account,
-- Provides a count of each transaction with a unique date and sender account.
COUNT(*) as total_transfer_under_threshold,
  SUM(Amount) as total_days_transfers,
-- MAX used to apply fraud flag for senders with multiple transactions, if any one of them is '1' for fraud flag, result is a 1. 
MAX(Is_laundering) as actual_fraud_flag
FROM `sql-master-492623.AML_Analysis.Raw_CSV`
-- Scans for transfers just under the Federal reporting limits
WHERE Amount >= 9000 AND Amount < 10000
GROUP BY Date, Sender_account
-- only flags accounts with 2 or more transactions under the threshold.
HAVING COUNT(*) >= 2
ORDER BY total_transfer_under_threshold DESC;
