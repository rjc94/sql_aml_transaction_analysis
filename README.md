# Financial Crime Analytics: AML Transaction Monitoring
## Project Overview
This project demonstrates my ability to apply the full data analysis lifecycle to address complex operational risks for fintechs and financial institutions.
* **Objective:** Build transaction monitoring solutions to detect common risk indicators.
* **Core Skills:** Cloud Data Uploading, SQL Data Cleaning, Anomaly Detection, BI Dashboarding.
* **Tech Stack:** Google BigQuery (SQL), Microsoft Excel, Tableau.
* **Data Source:** [Anti Money Laundering Transaction Data](https://www.kaggle.com/datasets/berkanoztas/synthetic-transaction-monitoring-dataset-aml?resource=download)
* **Visualizations:** [Tableau Dashboard](https://public.tableau.com/views/AML_Analysis/StructuredDeposits?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
***

## Problem Statement & Business Objective
Financial Institutions must monitor millions of transactions and flag illicit activity to avoid penalties, financial loss, and reputational damage. 

To mitigate this operational risk, I developed automation-ready transaction monitoring solutions using SQL and Tableau to detect three critical indicators of money laundering and fraud and display these findings:
1. **Structuring (Smurfing):** Intentionally breaking large transactions into increments under $10,000 to evade CTR reporting thresholds.
2. **Rapid Velocity:** High-frequency transfers indicating automated fraud or immediate layering of illicit funds.
3. **Transaction Networks:** Interconnected webs of accounts routing funds through single nodes to hide source ownership.

**The Business Value:** This project is comprised of both technical data analysis and financial operational compliance. I transformed raw ledger data into prioritized, actionable alerts for back-office investigative teams.
***

## Data Upload, Cloud Architecture, and Data Cleaning:
* **Data Sourcing:** I downloaded the raw transactional dataset from Kaggle to serve as the simulated transaction dataset modeling real-world transactions and patterns.
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
* **Dashboard:** [Tableau Dashboard](https://public.tableau.com/views/AML_Analysis/StructuredDeposits?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
***
## Final Findings and Analysis: 
* **Structuring:**
    * *Detection Criteria:* Flagged accounts that sent 2+ transfers between $9,000 - $9,999 in a single day.
    * *Key Findings:* $3,381,470,630 in total deposits flagged. Average transfer within this range was $9,492. Despite the large volume of transactions flagged only a small number were actual fraud occurences.
    * *Recommendations:* Need to layer on additional filtering criteria to further discern legitamate transactions by institutions vs. actual fraud behaviors. We could query for sender/receiver bank location, frequency of transfers daily, or even amend the 2+ transaction threshold. Trial and error will be needed to determine optimal screening criteria without allowing actual fraud occourences to slip through the cracks.

* **Rapid Velocity:**
    * *Detection Criteria:* Flagged accounts that sent 10+ transfers daily to review for high velocity money movement.
    * *Key Findings:* $50,842,544,574 in total transactions flagged. Confirmed the average number of transactions for this group was 25.07 with the average transactions of a confirmed fraudster at 79.62. Alert precision only 0.008% but changing parameters to screen for a larger number of transactions per day allows multiple confirmed fraud cases to go undetected.
    * *Recommendations:* Additional criteria are needed to filter out false positives and reduce alert fatigue. This query could be paired with other factors to further narrow the scope of the flagged transactions.
 
* **Transaction Networks:**
    * *Detection Criteria:* Flagged accounts that received deposits from 3 or more different sources in a single day as potential Shell Accounts worth investigating further. Also ran query to determine the optimal threshold for number of deposits received (5, 10, and 20) and resulting flagged accounts vs. confirmed fraudsters detected. 
    * *Key Findings:* Targeting 5+ deposits received provides a very large number of 'false positives' but also captures the most confirmed fraud occurences (157). Raising this threshold to 10+ does very little to reduce false positives but negatively impacts the number of confirmed fraud that was flagged. The largest single recipient received $4,754,757 in deposits from 22 different sources.
    * *Recommendations:* Keep threshold at 5+ for number of deposits received to prevent confirmed fraud cases from slipping through the cracks. Different criteria must be used to filter futher when attempting to reduce false positives. Simply raising the threshold of deposits received is not plausable because of the number of confirmed fraud instances this would allow to go undetected.






