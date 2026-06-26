--Check for NULL values
SELECT
COUNT (*) as blank_cust_record
FROM `sql-master-492623.AML_Analysis.Raw_CSV` 
WHERE Sender_account IS NULL
  OR Receiver_account IS NULL
  OR Amount IS NULL
  OR Date IS NULL;


--Check for duplicate entries
SELECT
  Time,
  Date,
  Sender_account,
  Receiver_account,
  Amount,
  COUNT(*) as instances
FROM `sql-master-492623.AML_Analysis.Raw_CSV` 
GROUP BY
  Time,
  Date,
  Sender_account,
  Receiver_account,
  Amount
HAVING COUNT(*) > 1;


