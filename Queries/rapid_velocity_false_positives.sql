-- Query to determine amount of Total Alerts vs. actual fraud instances captured
-- Shows results for 5, 10, and 20 transaction thresholds. 
SELECT
    '5+ Transactions' as threshold_level,
    COUNT(CASE WHEN transaction_count >= 5 THEN 1 END) as total_alerts,
    COUNT(CASE WHEN transaction_count >= 5 AND actual_fraud_flag = 1 THEN 1 END) as true_positives,
    COUNT(CASE WHEN transaction_count >= 5 AND actual_fraud_flag = 0 THEN 1 END) as false_positives
FROM (
    SELECT Date, Sender_account, COUNT(*) as transaction_count, MAX(Is_laundering) as actual_fraud_flag
    FROM `AML_Analysis.AML_USD`
    GROUP BY Date, Sender_account
)
UNION ALL
SELECT
    '10+ Transactions' as threshold_level,
    COUNT(CASE WHEN transaction_count >= 10 THEN 1 END) as total_alerts,
    COUNT(CASE WHEN transaction_count >= 10 AND actual_fraud_flag = 1 THEN 1 END) as true_positives,
    COUNT(CASE WHEN transaction_count >= 10 AND actual_fraud_flag = 0 THEN 1 END) as false_positives
FROM (
    SELECT Date, Sender_account, COUNT(*) as transaction_count, MAX(Is_laundering) as actual_fraud_flag
    FROM `AML_Analysis.AML_USD`
    GROUP BY Date, Sender_account
)
UNION ALL
SELECT
    '20+ Transactions' as threshold_level,
    COUNT(CASE WHEN transaction_count >= 20 THEN 1 END) as total_alerts,
    COUNT(CASE WHEN transaction_count >= 20 AND actual_fraud_flag = 1 THEN 1 END) as true_positives,
    COUNT(CASE WHEN transaction_count >= 20 AND actual_fraud_flag = 0 THEN 1 END) as false_positives
FROM (
    SELECT Date, Sender_account, COUNT(*) as transaction_count, MAX(Is_laundering) as actual_fraud_flag
    FROM `AML_Analysis.AML_USD`
    GROUP BY Date, Sender_account
)
ORDER BY true_positives DESC;
