# Financial Crime Analytics: AML Transaction Monitoring
## Project Overview
This project is the Capstone project for my Google Data Analytics Certificate course. It demonstrates my ability to apply the full data analysis lifecycle to address complex operational risks for fintechs and financial institutions.
* **Objective:** Build transaction monitoring solutions to detect common risk indicators.
* **Core Skills:** Cloud Data Uploading, SQL Data Cleaning, Anomaly Detection, BI Dashboarding.
* **Tech Stack:** Google BigQuery (SQL), Microsoft Excel, Tableau.
* **Data Source:** [Anti Money Laundering Transaction Data](https://www.kaggle.com/datasets/berkanoztas/synthetic-transaction-monitoring-dataset-aml?resource=download)
***

## Problem Statement & Business Objective
Financial institutions process millions of daily transactions, making manual oversight of financial crime impossible. Unchecked illicit activity leads to severe regulatory penalties, operational inefficiencies, and financial loss. 

To mitigate this operational risk, I developed automation ready transaction monitoring solutions using SQL and Tableau to detect three critical indicators of money laundering and fraud and display these findings:
1. **Structuring (Smurfing):** Intentionally breaking large transactions into increments under $10,000 to evade CTR reporting thresholds.
2. **Rapid Velocity:** High-frequency transfers indicating automated fraud or immediate layering of illicit funds.
3. **Transaction Networks:** Interconnected webs of accounts routing funds through single nodes to hide source ownership.

**The Business Value:** This project bridges technical data analysis with financial operational compliance. I transformed raw ledger data into prioritized, actionable alerts for back-office investigative teams.
***

## Data Upload, Cloud Architecture, and Data Cleaning:
* **Data Sourcing:** I downloaded the raw transactional dataset from Kaggle to serve as the baseline simulation database.
* **Data Preparation:** Unzipped .csv file, uploaded to Google Cloud folder, and loaded the dataset into BigQuery (SQL). File too large to load into BigQuery with standard upload, and would not load as a .zip, so used Google Cloud as a workaround. Formatted Schema to skip header row and saved table to query. 
* **SQL:** [Data Cleaning and Validation Queries](Queries/data_cleaning_and_preparation.sql) - check for NULL values and duplicate entries in the dataset.
* **Currency Conversion:** Amounts sent and received were listed under different currencies for this dataset. I ran this query in SQL to create a table with a new row for USD Received to ensure further queries could be compared with accuracy.
* **SQL:** [Currency Conversion](Queries/convert_to_usd.sql)
***

## Structuring Analysis
* **SQL:** [Structuring Query](Queries/aml_structuring.sql)
* **Logic:** Queries for money transfers sent between $9,000 and $10,000 USD to flag attempts to evade the Federal reporting limits. Isolates Sender Accounts who sent 2 or more deposits within this threshold.

## Rapid Velocity Analysis
* **SQL:** [Rapid Velocity Query](Queries/rapid_velocity_query.sql)
* **Logic:** Flags accounts with 10 or more transactions daily as high-velocity accounts which should be monitored. Rapid transfers in succession could indicate fraudulent behavior.
* **SQL:** [Rapid Velocity False Positives](Queries/rapid_velocity_false_positives.sql)
* **Logic:** Determines the number of total accounts flagged vs. cases of confirmed fraud captured in these groups. Used to show the effectiveness of the query when using different trigger amounts for total daily transfers. 

## Transaction Networks Analysis
* **SQL:** [Transaction Networks Query](Queries/transactional_networks_query)
* **Logic:** Flags accounts receiving deposits from 3 or more different sources in a day. Flags recipients for review as potential shell accounts.
***

## Dashboard View



***
## Final Findings and Analysis: 







