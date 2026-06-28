CREATE OR REPLACE TABLE `AML_Analysis.AML_USD` AS
SELECT *,
-- Convert received currency to USD for standardized queries going forward. Used exchange rates from July 2023 per the datasets date range. 
  amount * CASE Received_currency
  WHEN 'UK pounds' THEN 1.2871
        WHEN 'Dirham' THEN 0.2722
        WHEN 'Naira' THEN 0.0013
        WHEN 'Mexican Peso' THEN 0.0591
        WHEN 'Indian rupee' THEN 0.0122
        WHEN 'Swiss franc' THEN 1.1492
        WHEN 'Pakistani rupee' THEN 0.0035
        WHEN 'Moroccan dirham' THEN 0.0995
        WHEN 'Euro' THEN 1.1039
        WHEN 'Yen' THEN 0.0071
        WHEN 'Albanian lek' THEN 0.0105
        WHEN 'US dollar' THEN 1.0000
        WHEN 'Turkish lira' THEN 0.0377
        ELSE 1.0000
-- created usd_received column for further queries. 
      END AS usd_received
FROM sql-master-492623.AML_Analysis.Raw_CSV;
