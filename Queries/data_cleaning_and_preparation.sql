--Check for NULL values
SELECT
COUNT (*) as blank_cust_record
FROM `AML_Analysis.AML_USD` 
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
FROM `AML_Analysis.AML_USD` 
GROUP BY
  Time,
  Date,
  Sender_account,
  Receiver_account,
  Amount
HAVING COUNT(*) > 1;


