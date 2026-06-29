# Financial Crime Analytics: AML Transaction Monitoring
## Project Overview
This project is the Capstone project for my Google Data Analytics Certificate course. It demonstrates my ability to apply the full data analysis lifecycle to address complex operational risks for fintechs and financial institutions.
* **Objective:** Build transaction monitoring solutions to detect common risk indicators.
* **Core Skills:** Cloud Data Uploading, SQL Data Cleaning, Anomaly Detection, BI Dashboarding.
* **Tech Stack:** Google BigQuery (SQL), Microsoft Excel, Tableau.
* **Data Source:** [Anti Money Laundering Transaction Data](https://www.kaggle.com/datasets/berkanoztas/synthetic-transaction-monitoring-dataset-aml?resource=download)
***

## Problem Statement & Business Objective (Ask Phase)
Financial institutions process millions of daily transactions, making manual oversight of financial crime impossible. Unchecked illicit activity leads to severe regulatory penalties, operational inefficiencies, and financial loss. 

To mitigate this operational risk, I developed automation ready transaction monitoring solutions using SQL and Tableau to detect three critical indicators of money laundering and fraud and display these findings:
1. **Structuring (Smurfing):** Intentionally breaking large transactions into increments under $10,000 to evade CTR reporting thresholds.
2. **Rapid Velocity:** High-frequency transfers indicating automated fraud or immediate layering of illicit funds.
3. **Transaction Networks:** Interconnected webs of accounts routing funds through single nodes to hide source ownership.

**The Business Value:** This project bridges technical data analysis with financial operational compliance. I transformed raw ledger data into prioritized, actionable alerts for back-office investigative teams.
***

## Data Ingestion and Cloud Architecture (Prepare)
* **Data Sourcing:** I downloaded the raw transactional dataset from Kaggle to serve as the baseline simulation database.
* **Data Preparation:** Unzipped .csv file, uploaded to Google Cloud folder, and loaded the dataset into BigQuery (SQL). File too large to load into BigQuery with standard upload, and would not load as a .zip, so used Google Cloud as a workaround. Formatted Schema to skip header row and saved table to query. 
* **Data Cleaning and Validation in SQL:** [Query 1 + 2: Cleaning](Queries/data_cleaning_and_preparation) - check for NULL values and duplicate entries in the dataset.

## Structuring Analysis


